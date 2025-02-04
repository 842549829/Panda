﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using ConcurrentCollections;
using Microsoft.Extensions.Logging;
using WorkflowCore.Interface;
using WorkflowCore.Models;

namespace WorkflowCore.Services.BackgroundTasks
{
    internal abstract class QueueConsumer : IBackgroundTask
    {
        protected abstract QueueType Queue { get; }
        protected virtual int MaxConcurrentItems => Math.Max(Environment.ProcessorCount, 2);
        protected virtual bool EnableSecondPasses => false;

        protected readonly IQueueProvider QueueProvider;
        protected readonly ILogger Logger;
        protected readonly WorkflowOptions Options;
        protected Task DispatchTask;
        private CancellationTokenSource _cancellationTokenSource;

        protected QueueConsumer(IQueueProvider queueProvider, ILoggerFactory loggerFactory, WorkflowOptions options)
        {
            QueueProvider = queueProvider;
            Options = options;
            Logger = loggerFactory.CreateLogger(GetType());
        }

        protected abstract Task ProcessItem(string itemId, CancellationToken cancellationToken);

        public virtual void Start()
        {
            if (DispatchTask != null)
            {
                throw new InvalidOperationException();
            }

            _cancellationTokenSource = new CancellationTokenSource();

            DispatchTask = new Task(Execute, TaskCreationOptions.LongRunning);
            DispatchTask.Start();
        }

        public virtual void Stop()
        {
            _cancellationTokenSource.Cancel();
            DispatchTask.Wait();
            DispatchTask = null;
        }

        private async void Execute()
        {
            var cancelToken = _cancellationTokenSource.Token;
            var activeTasks = new Dictionary<string, Task>();
            var secondPasses = new ConcurrentHashSet<string>();

            while (!cancelToken.IsCancellationRequested)
            {
                try
                {
                    var activeCount = 0;
                    lock (activeTasks)
                    {
                        activeCount = activeTasks.Count;
                    }
                    if (activeCount >= MaxConcurrentItems)
                    {
                        await Task.Delay(Options.IdleTime);
                        continue;
                    }

                    var item = await QueueProvider.DequeueWork(Queue, cancelToken);

                    if (item == null)
                    {
                        if (!QueueProvider.IsDequeueBlocking)
                            await Task.Delay(Options.IdleTime, cancelToken);
                        continue;
                    }

                    var hasTask = false;
                    lock (activeTasks)
                    {
                        hasTask = activeTasks.ContainsKey(item);
                    }
                    if (hasTask)
                    {
                        secondPasses.Add(item);
                        if (!EnableSecondPasses)
                            await QueueProvider.QueueWork(item, Queue);
                        continue;
                    }

                    secondPasses.TryRemove(item);

                    var task = new Task(async (object data) =>
                    {
                        try
                        {
                            await ExecuteItem((string)data);
                            while (EnableSecondPasses && secondPasses.Contains(item))
                            {
                                secondPasses.TryRemove(item);
                                await ExecuteItem((string)data);
                            }
                        }
                        finally
                        {
                            lock (activeTasks)
                            {
                                activeTasks.Remove((string)data);
                            }
                        }
                    }, item);
                    lock (activeTasks)
                    {
                        activeTasks.Add(item, task);
                    }

                    task.Start();
                }
                catch (OperationCanceledException)
                {
                }
                catch (Exception ex)
                {
                    Logger.LogError(new EventId(999), ex, ex.Message);
                }
            }

            List<Task> toComplete;
            lock (activeTasks)
            {
                toComplete = activeTasks.Values.ToList();
            }

            foreach (var task in toComplete)
                task.Wait();
        }

        private async Task ExecuteItem(string itemId)
        {
            try
            {
                await ProcessItem(itemId, _cancellationTokenSource.Token);
            }
            catch (OperationCanceledException)
            {
                Logger.LogInformation($"Operation cancelled while processing {itemId}");
            }
            catch (Exception ex)
            {
                Logger.LogError(default(EventId), ex, $"Error executing item {itemId} - {ex.Message}");
            }
        }
    }
}

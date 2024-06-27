﻿using System.Collections.Generic;
using System.Threading.Tasks;
using WorkflowCore.Models;

namespace WorkflowCore.Interface.Persistence
{
    public interface IPersistenceProvider : IWorkflowRepository, ISubscriptionRepository, IEventRepository
    {        

        Task PersistErrors(IEnumerable<ExecutionError> errors);

        void EnsureStoreExists();

    }
}

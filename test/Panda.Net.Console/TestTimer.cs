namespace Panda.Net.Console;

public static class TestTimer
{
    public static void Test()
    {
        /*
         *public Timer(TimerCallback callback, object state, int dueTime, int period);
         *callback委托将会在period时间间隔内重复执行，state参数可以传入想在callback委托中处理的对象，dueTime标识多久后callback开始执行，period标识多久执行一次callback。
         */
        var timer = new Timer(a =>
            {
                System.Console.WriteLine("Timer Callback");
            }, null, Timeout.Infinite,
            Timeout.Infinite);
        timer.Change(5000, Timeout.Infinite);
    }
}
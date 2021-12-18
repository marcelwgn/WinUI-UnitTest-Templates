using Microsoft.UI.Xaml.Controls;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.AppContainer;

namespace $safeprojectname$
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Assert.AreEqual(0, 0);
        }

        [UITestMethod]
        public void TestMethod2()
        {
            var button = new Button();

            Assert.IsNotNull(button);
        }

        [AssemblyCleanup]
        public static void Cleanup()
        {
            // Cleaning up the application's window since the test runner in VS otherwise would leave it open
            App.Window.DispatcherQueue.TryEnqueue(() =>
            {
                App.Window.Close();
            });
        }
    }
}

using System.Web.Optimization;

namespace SignalRDemo
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/deck").Include(
                "~/Scripts/deck.core.js",
                "~/Scripts/deck.hash.js"));

            bundles.Add(new ScriptBundle("~/bundles/signalr").Include(
                "~/Scripts/jquery.signalR-1.0.0-rc2.js"));

            bundles.Add(new ScriptBundle("~/bundles/demo").Include(
                "~/Scripts/shake.js",
                "~/Scripts/demo.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/bootstrap.css", 
                "~/Content/deck.core.css",
                "~/Content/deck.hash.css",
                "~/Content/web-2.0.css",
                "~/Content/horizontal-slide.css",
                "~/Content/site.css"));
        }
    }
}
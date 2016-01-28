using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IAGWeb.Startup))]
namespace IAGWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

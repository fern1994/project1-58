using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AntiDrugWeb4.Startup))]
namespace AntiDrugWeb4
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

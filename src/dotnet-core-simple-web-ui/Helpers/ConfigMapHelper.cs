
using Microsoft.Extensions.Configuration;
using System.IO;

namespace dotnet_core_simple_web_ui.Helpers
{
    public class ConfigMapHelper
    {

        public string _configMapContent;

        public string ConfigMapContent
        {
            get
            {
                return _configMapContent;
            }
        }

        public ConfigMapHelper(IConfiguration configuration)
        {
            _configMapContent
                = configuration.GetSection("ConfigMaps").GetSection("IdentityProviderClientId").Value;
        }
    }
}
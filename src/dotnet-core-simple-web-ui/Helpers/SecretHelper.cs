using Microsoft.Extensions.Configuration;
using System.IO;

namespace dotnet_core_simple_web_ui.Helpers
{
    public class SecretHelper
    {
       
        public string _secretContent;

        public string SecretContent
        {
            get
            {
                return _secretContent;
            }
        }

        public SecretHelper(IConfiguration configuration)
        {
            _secretContent 
                = configuration.GetSection("Secrets").GetSection("IdentityProviderSecret").Value;
        }
    }
}
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace dotnet_core_simple_web_ui
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                 .ConfigureAppConfiguration((hostingContext, config) =>
                 {
                     config.AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                             .AddJsonFile("Configuration/Secrets/appsettings.secrets.json", optional: true, reloadOnChange: true)
                             .AddJsonFile("Configuration/ConfigMaps/appsettings.configmaps.json", optional: true, reloadOnChange: true);                    
                 })
                .Build();
    }
}

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using dotnet_core_simple_web_ui.Models;
using dotnet_core_simple_web_ui.Helpers;

namespace dotnet_core_simple_web_ui.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var secretHelper = new SecretHelper();
            var homeModel = new HomeModel();
            homeModel.Secret = secretHelper.FileContent;

            return View(homeModel);
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

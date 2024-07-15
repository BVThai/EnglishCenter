using DA_Framewrok.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DA_Framewrok.Controllers
{
    public class HomeController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Toiec()
        {
            return View();
        }
        public IActionResult Ielts()
        {
            return View();
        }
        public IActionResult GetTeacher()
        {
            var teacher = db.Giaoviens.ToList();    
            return View(teacher);   
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
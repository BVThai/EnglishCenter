using Microsoft.AspNetCore.Mvc;

namespace DA_Framewrok.Controllers
{
    public class ToeicController: Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;

namespace DA_Framewrok.Controllers
{
    public class TeacherController: Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

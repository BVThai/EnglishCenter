using DA_Framewrok.Models;
using Microsoft.AspNetCore.Mvc;

namespace DA_Framewrok.Areas.Admin.Controllers
{
    public class AccessAdminController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [HttpGet]
        public IActionResult LoginAdmin()
        {
            if(HttpContext.Session.GetString("UserNameAdmin") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index"); 
            }
            
        }
        
        
    }
}

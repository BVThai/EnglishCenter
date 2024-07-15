using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    
    public class CauhoithithuController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Index()
        {
            var allQuestions = db.Cauhoithithus.ToList();
            var randomQuestions = GetRandomElements(allQuestions, 20);

            return View(randomQuestions);
        }
        private static Random random = new Random();
        [Authentication]
        private List<Cauhoithithu> GetRandomElements(List<Cauhoithithu> list, int count)
        {
            return list.OrderBy(x => random.Next()).Take(count).ToList();
        }
    }
}

using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Runtime.InteropServices;

namespace DA_Framewrok.Controllers
{
    public class HocvienthuoclophocController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Index()
        {
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            var lichhoc = db.Hocvienthuoclophocs.Where(h => h.Mahocvien == maHocVien && h.MalophocNavigation.Tinhtranglophoc == "Da bat dau").Include(h => h.MalophocNavigation).ToList();           
            return View(lichhoc);
        }
    }
}

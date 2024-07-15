using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Numerics;

namespace DA_Framewrok.Controllers
{
    public class LayGiaovienController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult TatCaGiaoVien()
        {
            var giaovien = db.Giaoviens.ToList();
            return View(giaovien);
        }
        [Authentication]
        public IActionResult laylophoc()
        {
            int maGiaoVien = HttpContext.Session.GetInt32("SEMaGiaoVien") ?? 0;
          

            var lophoc = db.Lophocs.Where(l=>l.Magiaovien == maGiaoVien && l.Tinhtranglophoc == "Da bat dau").Include(l=>l.MakhoahocNavigation).ToList();  
            return View(lophoc);
        }
        public IActionResult laylophocdaday()
        {
            int maGiaoVien = HttpContext.Session.GetInt32("SEMaGiaoVien") ?? 0;


            var lophoc = db.Lophocs.Where(l => l.Magiaovien == maGiaoVien && l.Tinhtranglophoc == "Da ket thuc").Include(l => l.MakhoahocNavigation).ToList();
            return View(lophoc);
        }
        [Authentication]
        public IActionResult Chitietlop(int malophoc)
        {
            HttpContext.Session.SetInt32("SEMaLopHoc", malophoc);

            var chitiet = db.Lichhoccualops.Where(l=>l.Malophoc == malophoc).Include(l=>l.MalophocNavigation).ToList();
            return View(chitiet);
        }
        [Authentication]
        public IActionResult XemToanBoLichDay()
        {
            int maGiaoVien = HttpContext.Session.GetInt32("SEMaGiaoVien") ?? 0;
            var lichDay = db.Lophocs
               .Include(l => l.Lichhoccualops).Include(l=>l.MakhoahocNavigation)
               .Where(l => l.Magiaovien == maGiaoVien && l.Tinhtranglophoc !="Da ket thuc")
               .ToList();
            return View(lichDay);
        }

    }
    
}

using DA_Framewrok.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class HoconlineController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ThemBuoiHoc(string domain, string options)
        {

            int maxBuoiHoc = db.Buoihocs.Max(h => (int?)h.Mabuoihoc) ?? 0;
            TimeOnly currentTime = TimeOnly.FromDateTime(DateTime.Now);
            DateOnly currentDate = DateOnly.FromDateTime(DateTime.Now);
            int maLopHoc = HttpContext.Session.GetInt32("SEMaLopHoc") ?? 0;
            Buoihoc bh = new Buoihoc();
            bh.Mabuoihoc = maxBuoiHoc + 1;
            bh.Domain = domain;
            bh.Options = options;
            bh.Malophoc = maLopHoc;
            bh.Ngaytao = currentDate;
            bh.Thoigian = currentTime;
            db.Buoihocs.Add(bh);
            db.SaveChanges();
            return Ok();

        }
        public IActionResult ThamGiaBuoiHoc(int malophoc)
        {
            DateOnly currentDate = DateOnly.FromDateTime(DateTime.Now);
            TimeOnly currentTime = TimeOnly.FromDateTime(DateTime.Now);
            int maLopHoc = HttpContext.Session.GetInt32("SEMaLopHoc") ?? 0;
            var tgbh = db.Buoihocs.Where(l=>l.Malophoc == malophoc && l.Ngaytao == currentDate && l.Thoigian < currentTime).Max(b => (int?)b.Mabuoihoc);
            if (tgbh.HasValue)
            {
                var buoihoc1 = db.Buoihocs.Include(l=>l.MalophocNavigation).Where(l=>l.Mabuoihoc == tgbh).FirstOrDefault();
                return View(buoihoc1);
            }
            else
            {
                TempData["ChuaBatDau"] = "Lớp học chưa bắt đầu";
                return RedirectToAction("Khoahocdamua", "Course");
            }
        }
    }
}

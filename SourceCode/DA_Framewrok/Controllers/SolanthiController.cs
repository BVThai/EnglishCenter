using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata.Ecma335;

namespace DA_Framewrok.Controllers
{

    public class SolanthiController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Index()
        {
            DateOnly currentDate = DateOnly.FromDateTime(DateTime.Now);
            Solanthi solanthi = new();
            int maxSoLanThi = db.Solanthis.Max(h => (int?)h.Malanthi) ?? 0;
            var soLanThiadd = maxSoLanThi + 1;
            solanthi.Malanthi = soLanThiadd;
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            solanthi.Mahocvien = maHocVien;
            solanthi.Socaudung = 0;
            solanthi.Ngaythi = currentDate;
            HttpContext.Session.SetInt32("SESoLanThi", soLanThiadd);
            db.Solanthis.Add(solanthi);
            db.SaveChanges();
            return RedirectToAction("Index", "Cauhoithithu");
        }
        [Authentication]
        public IActionResult Details()
        {
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            var laychitiet = db.Solanthis.Where(sl => sl.Mahocvien == maHocVien);
            return View(laychitiet);
        }
        [Authentication]
        public IActionResult SoSanhChiTiet(int malanthi)
        {
            var dapan = db.Cautralois.Where(ct=>ct.Malanthi == malanthi).Include(ct=>ct.MacauhoiNavigation).Include(ct=>ct.MalanthiNavigation).ToList();
            return View(dapan);
        }
    }
}

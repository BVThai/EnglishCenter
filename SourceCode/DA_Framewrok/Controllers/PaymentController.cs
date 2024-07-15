using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class PaymentController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Index()
        {
            return View();
        }
        [Route("GetPayment")]
        [HttpGet]
        [Authentication]
        public IActionResult GetPayment(int makhoahoc) 
        {
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            var thongtinhv = db.Hocviens.Find(maHocVien);
            var thongtinkh = db.Khoahocs.Find(makhoahoc);
            var thongtinlop = db.Lophocs
                    .Include(l => l.Lichhoccualops) // Include the schedules for each class
                    .Where(l => l.Makhoahoc == makhoahoc)
                    .ToList();// Retrieve a collection of classes          
            var viewModel = new PaymentViewModel
            {
                ThongTinHocVien = thongtinhv,
                ThongTinKhoaHoc = thongtinkh,
                ThongTinLopHoc = thongtinlop,
               
            };
            return View(viewModel);
        }
        [Authentication]
        public IActionResult ProcessPayment(int makhoahoc, int malophoc, float giakhoahoc)
        {
            Console.WriteLine(giakhoahoc);
            int maxMaThanhToan = db.Thanhtoans.Max(h => (int?)h.Mathanhtoan) ?? 0;       
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            var thantoan = new Thanhtoan
            {
                Mathanhtoan = maxMaThanhToan + 1,
                Makhoahoc = makhoahoc,
                Mahocvien = maHocVien,
                Tongtienthanhtoan = giakhoahoc,
                Thoigianthanhtoan = DateTime.Now,
                Malophoc = malophoc,
            };
            db.Thanhtoans.Add(thantoan);
            db.SaveChanges();
            var addhocvienvaolop = new Hocvienthuoclophoc
            {
                Mahocvien = maHocVien,
                Malophoc = malophoc,
                Makhoahoc = makhoahoc,       
            };
            db.Hocvienthuoclophocs.Add(addhocvienvaolop);
            db.SaveChanges();
            var lophc = db.Lophocs.Find(malophoc);
            lophc.Siso += 1;
            db.Entry(lophc).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Course");

        }





    }
}

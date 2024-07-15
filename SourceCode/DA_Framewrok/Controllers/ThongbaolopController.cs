using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DA_Framewrok.Controllers
{
    public class ThongbaolopController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Thongtinlop(int malophoc)
        {
            int maLopHoc = HttpContext.Session.GetInt32("SEMaLopHoc") ?? 0;

            var chitiet = db.Thongtinlophocs.Where(l => l.Malophoc == maLopHoc).Include(l=>l.MalophocNavigation).ToList();
            return View(chitiet);
        }
        [HttpGet]
        [Authentication]
        public IActionResult ThemThongBao()
        {
            return View();
        }
        [HttpPost]
        [Authentication]
        public IActionResult ThemThongBao(Thongtinlophoc thongbao, IFormFile? Tendinhkem) 
        {
            int maLopHoc = HttpContext.Session.GetInt32("SEMaLopHoc") ?? 0;

            DateOnly currentDate = DateOnly.FromDateTime(DateTime.Now);
            if (ModelState.IsValid)
            {
                if (Tendinhkem != null && Tendinhkem.Length > 0)
                {
                    string fileName = Path.GetFileName(Tendinhkem.FileName);
                    string uploadPath = Path.Combine("Upload", "Document");

                    // Đường dẫn lưu trữ trong wwwroot/Upload/Teacher
                    string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        Tendinhkem.CopyTo(stream);
                    }

                    thongbao.Tendinhkem = Path.Combine(uploadPath, fileName); // Lưu đường dẫn tương đối vào cơ sở dữ liệu
                }
                else
                {
                    thongbao.Tendinhkem = null;
                }

                int maxMathongbao = db.Thongtinlophocs.Max(h => (int?)h.Mathongtin) ?? 0;
                thongbao.Mathongtin = maxMathongbao + 1;
                thongbao.Ngaytao = currentDate;
                thongbao.Malophoc = maLopHoc;
                db.Thongtinlophocs.Add(thongbao);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm thông báo thành công!";

                return RedirectToAction("Thongtinlop");
            }
            return View(thongbao);
        }
        [Authentication]
        public IActionResult Xoathongbao(int mathongtin)
        {
            db.Remove(db.Thongtinlophocs.Find(mathongtin));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin thành công!";

            return RedirectToAction("Thongtinlop");
        }
    }
}

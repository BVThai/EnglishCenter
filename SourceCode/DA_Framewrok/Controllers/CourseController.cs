using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class CourseController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult index()
        {
            var ielts = db.Khoahocs.Where(kh => kh.Loaikhoahoc == "Ielts").ToList();
            var toeic = db.Khoahocs.Where(kh => kh.Loaikhoahoc == "Toeic").ToList();

            var viewModel = new CourseViewModel
            {
                IeltsCourses = ielts,
                ToeicCourses = toeic
            };

            return View(viewModel);
        }
        [Authentication]
        [Route("LayChiTietKhoaHoc")]
        [HttpGet]
        [Authentication]
        public IActionResult LayChiTietKhoaHoc( int makhoahoc) 
        {
            var kh = db.Khoahocs.Find(makhoahoc);
            return View(kh);
        }
    
        [Route("Khoahocdamua")]
        [Authentication]
        public IActionResult Khoahocdamua()
        {
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;
            Console.WriteLine(maHocVien);
            var khoahocdang = db.Hocvienthuoclophocs.Where(hv => hv.Mahocvien == maHocVien).Include(hv => hv.MalophocNavigation).Include(hv => hv.MakhoahocNavigation).ToList();
            return View(khoahocdang);
        }
        [Authentication]
        public IActionResult XemThongBao (int malophoc)
        {
            var thongbao = db.Thongtinlophocs.Where(l=>l.Malophoc == malophoc).Include(l=>l.MalophocNavigation).ToList();
            return View(thongbao);
        }

    }
}

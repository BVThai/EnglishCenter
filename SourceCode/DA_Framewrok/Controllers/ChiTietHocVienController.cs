using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class ChiTietHocVienController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult DanhSachHocVien(int malophoc)
        {
            var thongtin = db.Hocvienthuoclophocs.Where(l=>l.Malophoc == malophoc).Include(l=>l.MahocvienNavigation).ToList();
            return View(thongtin);
        }
        [Authentication]
        public IActionResult LayThongTinLop(int malophoc)
        {
            var thongbaolop = db.Thongtinlophocs.Where(l=>l.Malophoc == malophoc).Include(l=>l.MalophocNavigation).ToList();
            return View(thongbaolop);
        }

    }
}

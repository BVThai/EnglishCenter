using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class GetscheduleController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Authentication]
        public IActionResult Schedule()
        {
            int maHocVien = HttpContext.Session.GetInt32("SEMaHocVien") ?? 0;

            var hocvienlopList = db.Hocvienthuoclophocs
                .Where(hv => hv.Mahocvien == maHocVien)
                .Include(hc => hc.MalophocNavigation)
                .Include(hc => hc.MakhoahocNavigation)
                .ToList();

            var malopList = hocvienlopList.Select(hv => hv.Malophoc).ToList();

            var lichhocList = db.Lichhoccualops
                .Where(lh => malopList.Contains(lh.Malophoc ?? 0))
                .ToList();

            var thongtinlichhochv = new GetscheduleViewModel
            {
                hocvienthuoclophocs = hocvienlopList,
                ClassSchedule = lichhocList,
            };

            return View(thongtinlichhochv);
        }
    }
}

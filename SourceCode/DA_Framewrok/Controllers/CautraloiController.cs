using DA_Framewrok.Models;
using DA_Framewrok.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Controllers
{
    public class CautraloiController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authentication]
        public IActionResult ThemTraLoi(IEnumerable<Cautraloi> cauTraLoiList)
        {
            int Malanthi = HttpContext.Session.GetInt32("SESoLanThi") ?? 0;
          
            foreach (var cautraloi in cauTraLoiList)
            {
                // Gán Malanthi cho từng câu trả lời
                cautraloi.Malanthi = Malanthi;
                db.Cautralois.Add(cautraloi);
                var dapandung = db.Cauhoithithus.Find(cautraloi.Macauhoi);
                if (dapandung != null && cautraloi.Cautraloi1 == dapandung.Dapan) 
                {
                    var solanthi = db.Solanthis.Find(Malanthi);
                    if (solanthi!= null)
                    {
                        solanthi.Socaudung++;
                    }
                }
                
            }

            db.SaveChanges();
            // Lưu toàn bộ thay đổi vào cơ sở dữ liệu
            
            return RedirectToAction("Details", "Solanthi");
        }       
    }
}

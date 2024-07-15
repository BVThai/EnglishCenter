using DA_Framewrok.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using System.ComponentModel.Design;
using System.Composition.Convention;

namespace DA_Framewrok.Controllers
{
    public class AccessController : Controller
    {
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index","Course");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(Hocvien hocvien) 
        {
            if (TempData.ContainsKey("SignUpSuccessMessage"))
            {
                ViewBag.SignUpSuccessMessage = TempData["SignUpSuccessMessage"].ToString();
            }
            if (HttpContext.Session.GetString("Username") == null)
            {
                var u = db.Hocviens.Where(hv => hv.Email.Equals(hocvien.Email) && hv.Matkhau.Equals(hocvien.Matkhau)).FirstOrDefault();
                if (u != null) 
                {
                    HttpContext.Session.SetString("Username", u.Tenhocvien.ToString());
                    HttpContext.Session.SetInt32("SEMaHocVien", u.Mahocvien);                  
                    return RedirectToAction("Index", "Course");
                }
                else
                {
                    var gv = db.Giaoviens.Where(gv=>gv.Email.Equals(hocvien.Email) && gv.Matkhau.Equals(hocvien.Matkhau)).FirstOrDefault();
                    if (gv != null)
                    {
                        HttpContext.Session.SetString("Username", gv.Tengiaovien.ToString());
                        HttpContext.Session.SetInt32("SEMaGiaoVien", gv.Magiaovien);
                        ViewBag.AnhGiaoVienPath = gv.Anhdaidien;
                        return RedirectToAction("TatCaGiaoVien","LayGiaoVien");
                    }
                    var ad = db.Quantriviens.Where(a => a.Taikhoan.Equals(hocvien.Email) && a.Matkhau.Equals(hocvien.Matkhau)).FirstOrDefault();
                    if (ad != null)
                    {
                        HttpContext.Session.SetString("QuantrivienSE", ad.Taikhoan.ToString());
                       
                        
                        return RedirectToAction("Index", "HomeAdmin", new { area = "Admin" });
                    }
                }
            }
            return View();
            
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("Username");
            HttpContext.Session.Remove("QuantrivienSE");
            return RedirectToAction("Login", "Access");
        }
        [HttpGet]
        public IActionResult Sigup()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Sigup (Hocvien hocvien)
        {
            if (ModelState.IsValid)
            {

                int maxMahocvien = db.Hocviens.Max(h => (int?)h.Mahocvien) ?? 0;
                hocvien.Mahocvien = maxMahocvien + 1;
                hocvien.Tinhtrang = "Active";
                db.Hocviens.Add(hocvien);
                db.SaveChanges();
                TempData["SignUpSuccessMessage"] = "Đăng ký thành công!";
                return RedirectToAction("Login", "Access");
            }
            else
                return View();
        }
       

    }
}

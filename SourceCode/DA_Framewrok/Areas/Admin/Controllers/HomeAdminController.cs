using DA_Framewrok.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Reflection.Metadata;
using Microsoft.AspNetCore.Authentication.OAuth.Claims;
namespace DA_Framewrok.Areas.Admin.Controllers
{
    [Area("admin")]

    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        private readonly IWebHostEnvironment _webHostEnvironment;

        public HomeAdminController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }
        TrungtamtienganhContext db = new TrungtamtienganhContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("DanhSachHocVien")]
        public IActionResult DanhSachHocVien()
        {

            var dshv = db.Hocviens.ToList();
            return View(dshv);
        }
        [Route("ThemHocVien")]
        [HttpGet]
        public IActionResult ThemHocvien()
        {
            return View();
        }
        [Route("ThemHocVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemHocVien(Hocvien hocvien)
        {
            if (ModelState.IsValid)
            {
                int maxMahocvien = db.Hocviens.Max(h => (int?)h.Mahocvien) ?? 0;

                // Tăng mã học viên lên 1 để có giá trị mới cho học viên mới
                hocvien.Mahocvien = maxMahocvien + 1;
                hocvien.Tenhocvien =  hocvien.Tenhocvien;
                db.Hocviens.Add(hocvien);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm học viên thành công!";
                
                return RedirectToAction("ThemHocVien");

              
            }
            return View(hocvien);
        }
        [Route("SuaHocVien")]
        [HttpGet]
        public IActionResult SuaHocVien(int mahocvien)
        {
            var hocvien = db.Hocviens.Find(mahocvien);
            return View(hocvien);
        }
        [Route("SuaHocVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaHocVien(Hocvien hocvien)
        {
            if (ModelState.IsValid)
            {

                db.Entry(hocvien).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin học viên thành công!";
                return RedirectToAction("DanhSachHocVien");


            }
            return View(hocvien);
        }
        [HttpGet]
        [Route("XoaHocVien")]
        public IActionResult XoaHocVien(int mahocvien)
        {
            db.Remove(db.Hocviens.Find(mahocvien));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin học viên thành công!";

            return RedirectToAction("DanhSachHocVien");
        }
        // giáo viên--------------------------------------------------------------------------------
        [Route("DanhSachGiaoVien")]
        public IActionResult DanhSachGiaoVien()
        {
            var dsgv = db.Giaoviens.ToList();
            return View(dsgv);
        }
        [Route("ThemGiaoVien")]
        [HttpGet]
        public IActionResult ThemGiaoVien()
        {
            return View();
        }
        [Route("ThemGiaoVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]

        public IActionResult ThemGiaoVien(Giaovien giaovien, IFormFile Anhdaidien)
        {
            if (ModelState.IsValid)
            {
                if (Anhdaidien != null && Anhdaidien.Length > 0)
                {
                    string fileName = Path.GetFileName(Anhdaidien.FileName);
                    string uploadPath = Path.Combine("Upload", "Teacher");

                    // Đường dẫn lưu trữ trong wwwroot/Upload/Teacher
                    string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        Anhdaidien.CopyTo(stream);
                    }

                    giaovien.Anhdaidien = Path.Combine(uploadPath, fileName); // Lưu đường dẫn tương đối vào cơ sở dữ liệu
                }

                int maxMagiaovien = db.Giaoviens.Max(h => (int?)h.Magiaovien) ?? 0;
                giaovien.Magiaovien = maxMagiaovien + 1;

                db.Giaoviens.Add(giaovien);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm giáo viên thành công!";

                return RedirectToAction("ThemGiaoVien");
            }

            return View(giaovien);
        }
        [Route("SuaGiaoVien")]
        [HttpGet]
        public IActionResult SuaGiaoVien(int magiaovien)
        {
            var giaovien = db.Giaoviens.Find(magiaovien);
            return View(giaovien);
        }
        [Route("SuaGiaoVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaGiaoVien(Giaovien giaovien, IFormFile? Anhdaidien)
        {
            if (ModelState.IsValid)
            {
                if (Anhdaidien != null && Anhdaidien.Length > 0)
                {
                    string fileName = Path.GetFileName(Anhdaidien.FileName);
                    string uploadPath = Path.Combine("Upload", "Teacher");

                    // Đường dẫn lưu trữ trong wwwroot/Upload/Teacher
                    string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        Anhdaidien.CopyTo(stream);
                    }

                    giaovien.Anhdaidien = Path.Combine(uploadPath, fileName); // Lưu đường dẫn tương đối vào cơ sở dữ liệu
                }
                if (giaovien.Anhdaidien == null)
                {
                    giaovien.Anhdaidien = db.Giaoviens.AsNoTracking().FirstOrDefault(g => g.Magiaovien == giaovien.Magiaovien)?.Anhdaidien;
                }

                db.Entry(giaovien).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin giáo viên thành công!";
                return RedirectToAction("DanhSachGiaoVien");


            }
            return View(giaovien);
        }
        [HttpGet]
        [Route("XoaGiaoVien")]
        public IActionResult XoaGiaoVien(int magiaovien)
        {
            db.Remove(db.Giaoviens.Find(magiaovien));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin giáo viên thành công!";

            return RedirectToAction("DanhSachGiaoVien");
        }
        // khóa học ---------------------------------------------------------------------------------
        [Route("DanhSachKhoaHoc")]
        public IActionResult DanhSachKhoaHoc()
        {
            var dskh = db.Khoahocs.ToList();
            return View(dskh);
        }
        [Route("ThemKhoaHoc")]
        [HttpGet]
        public IActionResult ThemKhoaHoc()
        {
            return View();
        }
        [Route("ThemKhoaHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]

        public IActionResult ThemKhoaHoc(Khoahoc khoahoc, IFormFile Anhkhoahoc)
        {
            if (ModelState.IsValid)
            {
                if (Anhkhoahoc != null && Anhkhoahoc.Length > 0)
                {
                    string fileName = Path.GetFileName(Anhkhoahoc.FileName);
                    string uploadPath = Path.Combine("Upload", "Course");

                    // Đường dẫn lưu trữ trong wwwroot/Upload/Teacher
                    string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        Anhkhoahoc.CopyTo(stream);
                    }

                    khoahoc.Anhkhoahoc = Path.Combine(uploadPath, fileName); // Lưu đường dẫn tương đối vào cơ sở dữ liệu
                }

                int maxMakhoahoc = db.Khoahocs.Max(h => (int?)h.Makhoahoc) ?? 0;
                khoahoc.Makhoahoc = maxMakhoahoc + 1;

                db.Khoahocs.Add(khoahoc);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm giáo viên thành công!";

                return RedirectToAction("ThemKhoaHoc");
            }

            return View(khoahoc);
        }
        [Route("SuaKhoaHoc")]
        [HttpGet]
        public IActionResult SuaKhoaHoc(int makhoahoc)
        {
            var khoahoc = db.Khoahocs.Find(makhoahoc);
            return View(khoahoc);
        }
        [Route("SuaKhoaHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaKhoaHoc(Khoahoc khoahoc, IFormFile? Anhkhoahoc)
        {
            if (ModelState.IsValid)
            {
                if (Anhkhoahoc != null && Anhkhoahoc.Length > 0)
                {
                    string fileName = Path.GetFileName(Anhkhoahoc.FileName);
                    string uploadPath = Path.Combine("Upload", "Course");

                    // Đường dẫn lưu trữ trong wwwroot/Upload/Teacher
                    string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        Anhkhoahoc.CopyTo(stream);
                    }

                    khoahoc.Anhkhoahoc = Path.Combine(uploadPath, fileName); // Lưu đường dẫn tương đối vào cơ sở dữ liệu
                }
                if (Anhkhoahoc == null)
                {
                    khoahoc.Anhkhoahoc = db.Khoahocs.AsNoTracking().FirstOrDefault(k => k.Makhoahoc == khoahoc.Makhoahoc)?.Anhkhoahoc;
                }

                db.Entry(khoahoc).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin khóa học thành công!";
                return RedirectToAction("DanhSachKhoaHoc");


            }
            return View(khoahoc);
        }
        [HttpGet]
        [Route("XoaKhoaHoc")]
        public IActionResult XoaKhoaHoc(int makhoahoc)
        {
            db.Remove(db.Khoahocs.Find(makhoahoc));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin khóa học thành công!";

            return RedirectToAction("DanhSachKhoaHoc");
        }
        // lop hoc-----------------------------------------------------------------------------------
        [Route("DanhSachLopHoc")]
        public IActionResult DanhSachLopHoc()
        {

            var dslh = db.Lophocs.Include(l=>l.MagiaovienNavigation).Include(l=>l.MakhoahocNavigation).ToList();
            foreach (var lichhoc in dslh)
            {
                if (lichhoc.Thoigianbatdau > DateOnly.FromDateTime(DateTime.Now))
                {
                    // Nếu thời gian bắt đầu lớn hơn thời gian hiện tại, cập nhật là "Chưa bắt đầu"
                    lichhoc.Tinhtranglophoc = "Chua bat dau";
                }
                else if (lichhoc.Thoigianbatdau <= DateOnly.FromDateTime(DateTime.Now) && lichhoc.Thoigianbatdau >= DateOnly.FromDateTime(DateTime.Now))
                {
                    // Nếu thời gian bắt đầu bằng thời gian hiện tại, cập nhật là "Chưa bắt đầu"
                    lichhoc.Tinhtranglophoc = "Da bat dau";
                    // Nếu cần, thực hiện lưu cập nhật vào cơ sở dữ liệu tại đây
                    // Ví dụ: db.SaveChanges();
                }
                if(lichhoc.Thoigianketthuc < DateOnly.FromDateTime(DateTime.Now))
                {
                    lichhoc.Tinhtranglophoc = "Da ket thuc";
                }
                // Nếu thời gian bắt đầu đã qua, giữ nguyên giá trị hiện tại của thuộc tính "Thu"
                db.SaveChanges();
            }
            return View(dslh);
        }
        [Route("ThemLopHoc")]
        [HttpGet]
        public IActionResult ThemLopHoc()
        {
            ViewBag.Magiaovien = new SelectList(db.Giaoviens.ToList(), "Magiaovien", "Tengiaovien");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");

            return View();
        }
        [Route("ThemLopHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]

        public IActionResult ThemLopHoc(Lophoc lophoc)
        {
            if (ModelState.IsValid)
            {
                

                int maxMalophoc = db.Lophocs.Max(h => (int?)h.Malophoc) ?? 0;
                lophoc.Malophoc = maxMalophoc + 1;
                lophoc.Tinhtranglophoc = "Chưa bắt đầu";
                db.Lophocs.Add(lophoc);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm lớp học thành công!";

                return RedirectToAction("ThemLopHoc");
            }

            return View(lophoc);
        }
        [Route("SuaLopHoc")]
        [HttpGet]
        public IActionResult SuaLopHoc(int malophoc)
        {
            var lophoc = db.Lophocs.Find(malophoc);
            ViewBag.Magiaovien = new SelectList(db.Giaoviens.ToList(), "Magiaovien", "Tengiaovien");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");
            return View(lophoc);
        }
        [Route("SuaLopHoc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaLopHoc(Lophoc lophoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lophoc).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin lớp học thành công!";
                return RedirectToAction("DanhSachLopHoc");


            }
            return View(lophoc);
        }
        [HttpGet]
        [Route("XoaLopHoc")]
        public IActionResult XoaLopHoc(int malophoc)
        {
            db.Remove(db.Lophocs.Find(malophoc));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin lớp học thành công!";

            return RedirectToAction("DanhSachLopHoc");
        }
        //Chi tiet khoa hoc --------------------------------------------------------------------------------------------
        [Route("DanhSachChiTietKhoa")]
        public IActionResult DanhSachChiTietKhoa()
        {
            var dshv = db.Khoahocchitiets.Include(l => l.MakhoahocNavigation).ToList();
            return View(dshv);
        }
        [Route("ThemKhoaHocChiTiet")]
        [HttpGet]
        public IActionResult ThemKhoaHocChiTiet()
        {
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");

            return View();
        }
        [Route("ThemKhoaHocChiTiet")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemKhoaHocChiTiet(Khoahocchitiet khoahocchitiet)
        {
            var makhoahoc = db.Khoahocs.FirstOrDefault(l => l.Makhoahoc == khoahocchitiet.Makhoahoc);

            // Kiểm tra xem các navigation properties có tồn tại hay không
            if ( makhoahoc != null)
            {
                // Gán navigation properties cho hocvienthuoclophoc
                khoahocchitiet.MakhoahocNavigation = makhoahoc;
                

                // Thêm hocvienthuoclophoc vào DbContext và lưu thay đổi
                db.Khoahocchitiets.Add(khoahocchitiet);
                db.SaveChanges();

                TempData["SuccessMessage"] = "Bạn đã thêm học viên thành công!";
                return RedirectToAction("ThemHocVienThuocLop");
            }

            TempData["ErrorMessage"] = "Không thể thêm học viên. Một hoặc nhiều navigation properties không tồn tại!";
            return RedirectToAction("ThemHocVienThuocLop");
        }
        [Route("SuaKhoaHocChiTiet")]
        [HttpGet]
        public IActionResult SuaKhoaHocChiTiet(int makhoahoc)
        {
            var khoahochitiet = db.Khoahocchitiets.Find(makhoahoc);
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");
            return View(khoahochitiet);
        }
        [Route("SuaKhoaHocChiTiet")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaKhoaHocChiTiet(Khoahocchitiet khoahocchitiet)
        {                       
                db.Update(khoahocchitiet);
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin thành công!";
                return RedirectToAction("DanhSachChiTietKhoa");                      
        }
        [HttpGet]
        [Route("XoaKhoaHocChiTiet")]
        public IActionResult XoaKhoaHocChiTiet(int makhoahoc)
        {
            db.Remove(db.Khoahocchitiets.Find(makhoahoc));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa thông tin  thành công!";

            return RedirectToAction("DanhSachChiTietKhoa");
        }
        //quản trị viên --------------------------------------------------------------------------------------------------------
        [Route("DanhSachQuanTriVien")]
        public IActionResult DanhSachQuanTriVien()
        {
            var dshv = db.Quantriviens.ToList();
            return View(dshv);
        }
        [Route("ThemQuanTriVien")]
        [HttpGet]
        public IActionResult ThemQuanTriVien()
        {
            return View();
        }
        [Route("ThemQuanTriVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemQuanTriVien(Quantrivien quantrivien)
        {
            if (ModelState.IsValid)
            {
                int maxMahocvien = db.Quantriviens.Max(h => (int?)h.Maquantrivien) ?? 0;

                // Tăng mã học viên lên 1 để có giá trị mới cho học viên mới
                quantrivien.Maquantrivien = maxMahocvien + 1;

                db.Quantriviens.Add(quantrivien);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm tài khoản quản trị viên thành công!";

                return RedirectToAction("ThemHocVien");


            }
            return View(quantrivien);
        }
        [Route("SuaQuanTriVien")]
        [HttpGet]
        public IActionResult SuaQuanTriVien(int maquantrivien)
        {
            var quantrivien = db.Quantriviens.Find(maquantrivien);
            return View(quantrivien);
        }
        [Route("SuaQuanTriVien")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaQuanTriVien(Quantrivien quantrivien)
        {
            if (ModelState.IsValid)
            {

                db.Entry(quantrivien).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa thông tin học viên thành công!";
                return RedirectToAction("DanhSachQuanTriVien");


            }
            return View(quantrivien);
        }
        [HttpGet]
        [Route("XoaQuanTriVien")]
        public IActionResult XoaQuanTriVien(int maquantrivien)
        {
            db.Remove(db.Quantriviens.Find(maquantrivien));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa quản trị viên thành công!";

            return RedirectToAction("DanhSachQuanTriVien");
        }
        // học viên thuộc lớp----------------------------------------------------------------------------------------
        [Route("DanhSachHocVienThuocLop")]
        public IActionResult DanhSachHocVienThuocLop()
        {
            var dshv = db.Hocvienthuoclophocs.Include(l => l.MakhoahocNavigation).Include(l=>l.MalophocNavigation).Include(l=>l.MahocvienNavigation).ToList();
            return View(dshv);
        }
        [Route("ThemHocVienThuocLop")]
        [HttpGet]
        public IActionResult ThemHocVienThuocLop()
        {
            ViewBag.Malophoc = new SelectList(db.Lophocs.ToList(), "Malophoc", "Tenlophoc");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc"); 
            ViewBag.Mahocvien = new SelectList(db.Hocviens.ToList(), "Mahocvien", "Tenhocvien");
            return View();
        }
        [Route("ThemHocVienThuocLop")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemHocVienThuocLop(Hocvienthuoclophoc hocvienthuoclophoc)
        {
            var malophoc = db.Lophocs.FirstOrDefault(l => l.Malophoc == hocvienthuoclophoc.Malophoc);
            var mahocvien = db.Hocviens.FirstOrDefault(h => h.Mahocvien == hocvienthuoclophoc.Mahocvien);
            var makhoahoc = db.Khoahocs.FirstOrDefault(k => k.Makhoahoc == hocvienthuoclophoc.Makhoahoc);

            // Kiểm tra xem các navigation properties có tồn tại hay không
            if (malophoc != null && mahocvien != null && makhoahoc != null)
            {
                // Gán navigation properties cho hocvienthuoclophoc
                hocvienthuoclophoc.MalophocNavigation = malophoc;
                hocvienthuoclophoc.MahocvienNavigation = mahocvien;
                hocvienthuoclophoc.MakhoahocNavigation = makhoahoc;

                // Thêm hocvienthuoclophoc vào DbContext và lưu thay đổi
                db.Hocvienthuoclophocs.Add(hocvienthuoclophoc);
                db.SaveChanges();

                TempData["SuccessMessage"] = "Bạn đã thêm học viên thành công!";
                return RedirectToAction("ThemHocVienThuocLop");
            }

            TempData["ErrorMessage"] = "Không thể thêm học viên. Một hoặc nhiều navigation properties không tồn tại!";
            return RedirectToAction("ThemHocVienThuocLop");
        }
        [Route("SuaHocVienThuocLop")]
        [HttpGet]
        public IActionResult SuaHocVienThuocLop(int mahocvien, int makhoahoc, int malophoc)
        {
            ViewBag.Malophoc = new SelectList(db.Lophocs.ToList(), "Malophoc", "Tenlophoc");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");
            ViewBag.Mahocvien = new SelectList(db.Hocviens.ToList(), "Mahocvien", "Tenhocvien");
            var hvlop = db.Hocvienthuoclophocs.FirstOrDefault(hv => hv.Makhoahoc == makhoahoc && hv.Malophoc == malophoc && hv.Mahocvien == mahocvien);
            var hocVienToDelete = db.Hocvienthuoclophocs
                .Where(hv => hv.Makhoahoc == makhoahoc && hv.Malophoc == malophoc && hv.Mahocvien == mahocvien);

            db.Hocvienthuoclophocs.RemoveRange(hocVienToDelete);
            db.SaveChanges();
            return View(hvlop);
           
        }
        [Route("SuaHocVienThuocLop")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaHocVienThuocLop(Hocvienthuoclophoc hocvienthuoclophoc)
        {

            var malophoc = db.Lophocs.FirstOrDefault(l => l.Malophoc == hocvienthuoclophoc.Malophoc);
            var mahocvien = db.Hocviens.FirstOrDefault(h => h.Mahocvien == hocvienthuoclophoc.Mahocvien);
            var makhoahoc = db.Khoahocs.FirstOrDefault(k => k.Makhoahoc == hocvienthuoclophoc.Makhoahoc);

            // Kiểm tra xem các navigation properties có tồn tại hay không
            if (malophoc != null && mahocvien != null && makhoahoc != null)
            {
                // Gán navigation properties cho hocvienthuoclophoc
                hocvienthuoclophoc.MalophocNavigation = malophoc;
                hocvienthuoclophoc.MahocvienNavigation = mahocvien;
                hocvienthuoclophoc.MakhoahocNavigation = makhoahoc;

                // Thêm hocvienthuoclophoc vào DbContext và lưu thay đổi
                db.Hocvienthuoclophocs.Add(hocvienthuoclophoc);
                db.SaveChanges();

                TempData["SuccessMessage"] = "Bạn đã thêm học viên thành công!";
                return RedirectToAction("ThemHocVienThuocLop");
            }

            TempData["ErrorMessage"] = "Không thể thêm học viên. Một hoặc nhiều navigation properties không tồn tại!";
            return RedirectToAction("ThemHocVienThuocLop");
        }
        [HttpGet]
        [Route("XoaHocVienThuocLop")]
        public IActionResult XoaHocVienThuocLop(int mahocvien, int makhoahoc, int malophoc)
        {

            var hocVienToDelete = db.Hocvienthuoclophocs
                .Where(hv => hv.Makhoahoc == makhoahoc && hv.Malophoc == malophoc && hv.Mahocvien == mahocvien);

            db.Hocvienthuoclophocs.RemoveRange(hocVienToDelete);
            db.SaveChanges();

            TempData["SuccessDeleteMessage"] = "Bạn đã xóa học viên thành công!";

            return RedirectToAction("DanhSachHocVienThuocLop");
        }
        // lịch học cua lớp========================================================================================
        [Route("DanhSachLichHocCuaLop")]
        public IActionResult DanhSachLichHocCuaLop()
        {
            var dslhcualop = db.Lichhoccualops.Include(l=>l.MakhoahocNavigation).Include(l=>l.MalophocNavigation).ToList();
            return View(dslhcualop);
        }
        [Route("ThemLichHocCuaLop")]
        [HttpGet]
        public IActionResult ThemLichHocCuaLop()
        {

            ViewBag.Malophoc = new SelectList(db.Lophocs.ToList(), "Malophoc", "Tenlophoc");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");
            return View();
        }
        [Route("ThemLichHocCuaLop")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemLichHocCuaLop(Lichhoccualop lichhoccualop)
        {
            if (ModelState.IsValid)
            {
                int maxlichhoc = db.Lichhoccualops.Max(h => (int?)h.Malichhoc) ?? 0;

                // Tăng mã học viên lên 1 để có giá trị mới cho học viên mới
                lichhoccualop.Malichhoc = maxlichhoc + 1;

                db.Lichhoccualops.Add(lichhoccualop);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Bạn đã thêm lịch học thành công!";

                return RedirectToAction("ThemLichHocCuaLop");


            }
            return View(lichhoccualop);
        }
        [Route("SuaLichHocCuaLop")]
        [HttpGet]
        public IActionResult SuaLichHocCuaLop(int malichhoc)
        {
            ViewBag.Malophoc = new SelectList(db.Lophocs.ToList(), "Malophoc", "Tenlophoc");
            ViewBag.Makhoahoc = new SelectList(db.Khoahocs.ToList(), "Makhoahoc", "Tenkhoahoc");
            var lichhoc = db.Lichhoccualops.Find(malichhoc);
            return View(lichhoc);
        }
        [Route("SuaLichHocCuaLop")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaLichHocCuaLop(Lichhoccualop lichhoccualop)
        {
            if (ModelState.IsValid)
            {

                db.Entry(lichhoccualop).State = EntityState.Modified;
                db.SaveChanges();
                TempData["SuccessUpdateMessage"] = "Bạn đã chỉnh sửa lịch học  thành công!";
                return RedirectToAction("DanhSachLichHocCuaLop");


            }
            return View(lichhoccualop);
        }
        [HttpGet]
        [Route("XoaLichHocCuaLop")]
        public IActionResult XoaLichHocCuaLop(int malichhoc)
        {
            db.Remove(db.Lichhoccualops.Find(malichhoc));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa lịch học thành công!";

            return RedirectToAction("DanhSachLichHocCuaLop");
        }
        // hóa đơn==================================================================
        [Route("DanhSachHoaDon")]
        public IActionResult DanhSachHoaDon()
        {
            var dshoadon = db.Thanhtoans.Include(l => l.MakhoahocNavigation).Include(l => l.MahocvienNavigation).Include(l=>l.MalophocNavigation).ToList();
            return View(dshoadon);
        }
        
        
        [HttpGet]
        [Route("XoaHoaDon")]
        public IActionResult XoaHoaDon(int mathanhtoan)
        {
            db.Remove(db.Thanhtoans.Find(mathanhtoan));
            db.SaveChanges();
            TempData["SuccessDeleteMessage"] = "Bạn đã xóa lịch học thành công!";

            return RedirectToAction("DanhSachHoaDon");
        }


    }
}

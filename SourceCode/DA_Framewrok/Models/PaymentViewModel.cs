namespace DA_Framewrok.Models
{
    public class PaymentViewModel
    {
        public Hocvien ThongTinHocVien { get; set; }
        public Khoahoc ThongTinKhoaHoc { get; set; }
        //public Lophoc ThongTinLopHoc { get; set; }
        public IEnumerable<Lophoc> ThongTinLopHoc { get; set; }
        public IEnumerable<Lichhoccualop> ClassSchedule { get; set; }
    }
}

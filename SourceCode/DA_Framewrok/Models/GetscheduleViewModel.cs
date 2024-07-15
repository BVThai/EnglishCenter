namespace DA_Framewrok.Models
{
    public class GetscheduleViewModel
    {     
        public IEnumerable<Hocvienthuoclophoc> hocvienthuoclophocs { get; set; }
        public IEnumerable<Lophoc> thongtinlop { get; set; }
        public IEnumerable<Lichhoccualop> ClassSchedule { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Lophoc
{
    public int Malophoc { get; set; }

    public string? Tenlophoc { get; set; }

    public DateOnly? Thoigianbatdau { get; set; }

    public DateOnly? Thoigianketthuc { get; set; }

    public int? Magiaovien { get; set; }

    public int? Makhoahoc { get; set; }

    public string? Tinhtranglophoc { get; set; }

    public int? Siso { get; set; }

    public virtual ICollection<Buoihoc> Buoihocs { get; set; } = new List<Buoihoc>();

    public virtual ICollection<Hocvienthuoclophoc> Hocvienthuoclophocs { get; set; } = new List<Hocvienthuoclophoc>();

    public virtual ICollection<Lichhoccualop> Lichhoccualops { get; set; } = new List<Lichhoccualop>();

    public virtual Giaovien? MagiaovienNavigation { get; set; }

    public virtual Khoahoc? MakhoahocNavigation { get; set; }

    public virtual ICollection<Thanhtoan> Thanhtoans { get; set; } = new List<Thanhtoan>();

    public virtual ICollection<Thongtinlophoc> Thongtinlophocs { get; set; } = new List<Thongtinlophoc>();
}

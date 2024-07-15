using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Khoahoc
{
    public int Makhoahoc { get; set; }

    public string? Tenkhoahoc { get; set; }

    public double? Giakhoahoc { get; set; }

    public string? Mota { get; set; }

    public string? Thoiluong { get; set; }

    public string? Trangthai { get; set; }

    public string? Anhkhoahoc { get; set; }

    public string? Loaikhoahoc { get; set; }

    public virtual ICollection<Hocvienthuoclophoc> Hocvienthuoclophocs { get; set; } = new List<Hocvienthuoclophoc>();

    public virtual Khoahocchitiet? Khoahocchitiet { get; set; }

    public virtual ICollection<Lichhoccualop> Lichhoccualops { get; set; } = new List<Lichhoccualop>();

    public virtual ICollection<Lophoc> Lophocs { get; set; } = new List<Lophoc>();

    public virtual ICollection<Thanhtoan> Thanhtoans { get; set; } = new List<Thanhtoan>();
}

using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Hocvien
{
    public int Mahocvien { get; set; }

    public string? Tenhocvien { get; set; }

    public DateOnly? Ngaysinh { get; set; }

    public string? Email { get; set; }

    public string? Sodienthoai { get; set; }

    public string? Matkhau { get; set; }

    public string? Tinhtrang { get; set; }

    public virtual ICollection<Hocvienthuoclophoc> Hocvienthuoclophocs { get; set; } = new List<Hocvienthuoclophoc>();

    public virtual ICollection<Solanthi> Solanthis { get; set; } = new List<Solanthi>();

    public virtual ICollection<Thanhtoan> Thanhtoans { get; set; } = new List<Thanhtoan>();
}

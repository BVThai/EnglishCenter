using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Giaovien
{
    public int Magiaovien { get; set; }

    public string? Tengiaovien { get; set; }

    public string? Diachi { get; set; }

    public DateOnly? Ngaysinh { get; set; }

    public string? Email { get; set; }

    public string? Sodienthoai { get; set; }

    public string? Quoctich { get; set; }

    public string? Anhdaidien { get; set; }

    public string? Matkhau { get; set; }

    public string? Tinhtrang { get; set; }

    public virtual ICollection<Lophoc> Lophocs { get; set; } = new List<Lophoc>();
}

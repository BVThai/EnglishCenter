using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Khoahocchitiet
{
    public int Makhoahoc { get; set; }

    public string? Doituong { get; set; }

    public string? Thoiluongkhoahoc { get; set; }

    public string? Muctieu { get; set; }

    public string? Noidung { get; set; }

    public virtual Khoahoc MakhoahocNavigation { get; set; } = null!;
}

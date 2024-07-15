using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Thanhtoan
{
    public int Mathanhtoan { get; set; }

    public int? Mahocvien { get; set; }

    public int? Makhoahoc { get; set; }

    public double? Tongtienthanhtoan { get; set; }

    public DateTime? Thoigianthanhtoan { get; set; }

    public int? Malophoc { get; set; }

    public virtual Hocvien? MahocvienNavigation { get; set; }

    public virtual Khoahoc? MakhoahocNavigation { get; set; }

    public virtual Lophoc? MalophocNavigation { get; set; }
}

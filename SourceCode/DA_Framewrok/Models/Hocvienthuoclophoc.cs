using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Hocvienthuoclophoc
{
    public int Mahocvien { get; set; }

    public int Malophoc { get; set; }

    public int Makhoahoc { get; set; }

    public virtual Hocvien MahocvienNavigation { get; set; } = null!;

    public virtual Khoahoc MakhoahocNavigation { get; set; } = null!;

    public virtual Lophoc MalophocNavigation { get; set; } = null!;
}

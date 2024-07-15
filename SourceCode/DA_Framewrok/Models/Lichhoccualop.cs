using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Lichhoccualop
{
    public int Malichhoc { get; set; }

    public int? Makhoahoc { get; set; }

    public int? Malophoc { get; set; }

    public string? Thu { get; set; }

    public TimeOnly? Giobatdau { get; set; }

    public TimeOnly? Gioketthuc { get; set; }

    public virtual Khoahoc? MakhoahocNavigation { get; set; }

    public virtual Lophoc? MalophocNavigation { get; set; }
}

using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Cautraloi
{
    public int Malanthi { get; set; }

    public int Macauhoi { get; set; }

    public string? Cautraloi1 { get; set; }

    public virtual Cauhoithithu MacauhoiNavigation { get; set; } = null!;

    public virtual Solanthi MalanthiNavigation { get; set; } = null!;
}

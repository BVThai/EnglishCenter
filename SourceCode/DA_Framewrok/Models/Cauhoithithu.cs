using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Cauhoithithu
{
    public int Macauhoi { get; set; }

    public string? De { get; set; }

    public string? Luachon1 { get; set; }

    public string? Luachon2 { get; set; }

    public string? Luachon3 { get; set; }

    public string? Luachon4 { get; set; }

    public string? Dapan { get; set; }

    public virtual ICollection<Cautraloi> Cautralois { get; set; } = new List<Cautraloi>();
}

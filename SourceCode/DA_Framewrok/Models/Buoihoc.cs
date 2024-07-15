using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Buoihoc
{
    public int Mabuoihoc { get; set; }

    public int? Malophoc { get; set; }

    public string? Domain { get; set; }

    public string? Options { get; set; }

    public DateOnly? Ngaytao { get; set; }

    public TimeOnly? Thoigian { get; set; }

    public virtual Lophoc? MalophocNavigation { get; set; }
}

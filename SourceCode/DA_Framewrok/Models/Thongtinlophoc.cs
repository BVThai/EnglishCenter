using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Thongtinlophoc
{
    public int Mathongtin { get; set; }

    public int? Malophoc { get; set; }

    public string? Noidungthong { get; set; }

    public string? Tendinhkem { get; set; }

    public string? Tieude { get; set; }

    public DateOnly? Ngaytao { get; set; }

    public virtual Lophoc? MalophocNavigation { get; set; }
}

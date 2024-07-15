using System;
using System.Collections.Generic;

namespace DA_Framewrok.Models;

public partial class Solanthi
{
    public int Malanthi { get; set; }

    public int? Mahocvien { get; set; }

    public int? Socaudung { get; set; }

    public DateOnly? Ngaythi { get; set; }

    public virtual ICollection<Cautraloi> Cautralois { get; set; } = new List<Cautraloi>();

    public virtual Hocvien? MahocvienNavigation { get; set; }
}

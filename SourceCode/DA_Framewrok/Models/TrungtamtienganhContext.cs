using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DA_Framewrok.Models;

public partial class TrungtamtienganhContext : DbContext
{
    public TrungtamtienganhContext()
    {
    }

    public TrungtamtienganhContext(DbContextOptions<TrungtamtienganhContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Buoihoc> Buoihocs { get; set; }

    public virtual DbSet<Cauhoithithu> Cauhoithithus { get; set; }

    public virtual DbSet<Cautraloi> Cautralois { get; set; }

    public virtual DbSet<Giaovien> Giaoviens { get; set; }

    public virtual DbSet<Hocvien> Hocviens { get; set; }

    public virtual DbSet<Hocvienthuoclophoc> Hocvienthuoclophocs { get; set; }

    public virtual DbSet<Khoahoc> Khoahocs { get; set; }

    public virtual DbSet<Khoahocchitiet> Khoahocchitiets { get; set; }

    public virtual DbSet<Lichhoccualop> Lichhoccualops { get; set; }

    public virtual DbSet<Lophoc> Lophocs { get; set; }

    public virtual DbSet<Quantrivien> Quantriviens { get; set; }

    public virtual DbSet<Solanthi> Solanthis { get; set; }

    public virtual DbSet<Thanhtoan> Thanhtoans { get; set; }

    public virtual DbSet<Thongtinlophoc> Thongtinlophocs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=RUA\\MSSQLSERVERRUA;Database=TRUNGTAMTIENGANH;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Buoihoc>(entity =>
        {
            entity.HasKey(e => e.Mabuoihoc).HasName("PK__BUOIHOC__83505C5952BB8F78");

            entity.ToTable("BUOIHOC");

            entity.Property(e => e.Mabuoihoc)
                .ValueGeneratedNever()
                .HasColumnName("MABUOIHOC");
            entity.Property(e => e.Domain).HasColumnName("DOMAIN");
            entity.Property(e => e.Malophoc).HasColumnName("MALOPHOC");
            entity.Property(e => e.Ngaytao).HasColumnName("NGAYTAO");
            entity.Property(e => e.Options).HasColumnName("OPTIONS");
            entity.Property(e => e.Thoigian).HasColumnName("thoigian");

            entity.HasOne(d => d.MalophocNavigation).WithMany(p => p.Buoihocs)
                .HasForeignKey(d => d.Malophoc)
                .HasConstraintName("fk_bhon_lh");
        });

        modelBuilder.Entity<Cauhoithithu>(entity =>
        {
            entity.HasKey(e => e.Macauhoi).HasName("PK__CAUHOITH__DCF1CAB7D1E32C12");

            entity.ToTable("CAUHOITHITHU");

            entity.Property(e => e.Macauhoi)
                .ValueGeneratedNever()
                .HasColumnName("MACAUHOI");
            entity.Property(e => e.Dapan)
                .HasColumnType("text")
                .HasColumnName("DAPAN");
            entity.Property(e => e.De)
                .HasColumnType("text")
                .HasColumnName("DE");
            entity.Property(e => e.Luachon1)
                .HasColumnType("text")
                .HasColumnName("LUACHON1");
            entity.Property(e => e.Luachon2)
                .HasColumnType("text")
                .HasColumnName("LUACHON2");
            entity.Property(e => e.Luachon3)
                .HasColumnType("text")
                .HasColumnName("LUACHON3");
            entity.Property(e => e.Luachon4)
                .HasColumnType("text")
                .HasColumnName("LUACHON4");
        });

        modelBuilder.Entity<Cautraloi>(entity =>
        {
            entity.HasKey(e => new { e.Malanthi, e.Macauhoi }).HasName("pk_ctl");

            entity.ToTable("CAUTRALOI");

            entity.Property(e => e.Malanthi).HasColumnName("MALANTHI");
            entity.Property(e => e.Macauhoi).HasColumnName("MACAUHOI");
            entity.Property(e => e.Cautraloi1)
                .HasColumnType("text")
                .HasColumnName("CAUTRALOI");

            entity.HasOne(d => d.MacauhoiNavigation).WithMany(p => p.Cautralois)
                .HasForeignKey(d => d.Macauhoi)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_tl_slt");

            entity.HasOne(d => d.MalanthiNavigation).WithMany(p => p.Cautralois)
                .HasForeignKey(d => d.Malanthi)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_tl_ch");
        });

        modelBuilder.Entity<Giaovien>(entity =>
        {
            entity.HasKey(e => e.Magiaovien).HasName("PK__GIAOVIEN__C509E6AD3FE69D86");

            entity.ToTable("GIAOVIEN");

            entity.Property(e => e.Magiaovien)
                .ValueGeneratedNever()
                .HasColumnName("MAGIAOVIEN");
            entity.Property(e => e.Anhdaidien)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("ANHDAIDIEN");
            entity.Property(e => e.Diachi).HasColumnName("DIACHI");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("EMAIL");
            entity.Property(e => e.Matkhau)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MATKHAU");
            entity.Property(e => e.Ngaysinh).HasColumnName("NGAYSINH");
            entity.Property(e => e.Quoctich).HasColumnName("QUOCTICH");
            entity.Property(e => e.Sodienthoai)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SODIENTHOAI");
            entity.Property(e => e.Tengiaovien).HasColumnName("TENGIAOVIEN");
            entity.Property(e => e.Tinhtrang)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("TINHTRANG");
        });

        modelBuilder.Entity<Hocvien>(entity =>
        {
            entity.HasKey(e => e.Mahocvien).HasName("PK__HOCVIEN__1A8447F180723113");

            entity.ToTable("HOCVIEN");

            entity.Property(e => e.Mahocvien)
                .ValueGeneratedNever()
                .HasColumnName("MAHOCVIEN");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("EMAIL");
            entity.Property(e => e.Matkhau)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MATKHAU");
            entity.Property(e => e.Ngaysinh).HasColumnName("NGAYSINH");
            entity.Property(e => e.Sodienthoai)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SODIENTHOAI");
            entity.Property(e => e.Tenhocvien).HasColumnName("TENHOCVIEN");
            entity.Property(e => e.Tinhtrang)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("TINHTRANG");
        });

        modelBuilder.Entity<Hocvienthuoclophoc>(entity =>
        {
            entity.HasKey(e => new { e.Mahocvien, e.Malophoc, e.Makhoahoc }).HasName("pk_hvtl");

            entity.ToTable("HOCVIENTHUOCLOPHOC");

            entity.Property(e => e.Mahocvien).HasColumnName("MAHOCVIEN");
            entity.Property(e => e.Malophoc).HasColumnName("MALOPHOC");
            entity.Property(e => e.Makhoahoc).HasColumnName("MAKHOAHOC");

            entity.HasOne(d => d.MahocvienNavigation).WithMany(p => p.Hocvienthuoclophocs)
                .HasForeignKey(d => d.Mahocvien)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_hvl_hv");

            entity.HasOne(d => d.MakhoahocNavigation).WithMany(p => p.Hocvienthuoclophocs)
                .HasForeignKey(d => d.Makhoahoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_hvl_khoahoc");

            entity.HasOne(d => d.MalophocNavigation).WithMany(p => p.Hocvienthuoclophocs)
                .HasForeignKey(d => d.Malophoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_hvl_lophoc");
        });

        modelBuilder.Entity<Khoahoc>(entity =>
        {
            entity.HasKey(e => e.Makhoahoc).HasName("PK__KHOAHOC__9E20788D254EC373");

            entity.ToTable("KHOAHOC");

            entity.Property(e => e.Makhoahoc)
                .ValueGeneratedNever()
                .HasColumnName("MAKHOAHOC");
            entity.Property(e => e.Anhkhoahoc)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("ANHKHOAHOC");
            entity.Property(e => e.Giakhoahoc).HasColumnName("GIAKHOAHOC");
            entity.Property(e => e.Loaikhoahoc)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("LOAIKHOAHOC");
            entity.Property(e => e.Mota).HasColumnName("MOTA");
            entity.Property(e => e.Tenkhoahoc)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("TENKHOAHOC");
            entity.Property(e => e.Thoiluong).HasColumnName("THOILUONG");
            entity.Property(e => e.Trangthai)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("TRANGTHAI");
        });

        modelBuilder.Entity<Khoahocchitiet>(entity =>
        {
            entity.HasKey(e => e.Makhoahoc).HasName("PK__KHOAHOCC__9E20788D0800ADF8");

            entity.ToTable("KHOAHOCCHITIET");

            entity.Property(e => e.Makhoahoc)
                .ValueGeneratedNever()
                .HasColumnName("MAKHOAHOC");
            entity.Property(e => e.Doituong)
                .HasColumnType("text")
                .HasColumnName("DOITUONG");
            entity.Property(e => e.Muctieu)
                .HasColumnType("text")
                .HasColumnName("MUCTIEU");
            entity.Property(e => e.Noidung)
                .HasColumnType("text")
                .HasColumnName("NOIDUNG");
            entity.Property(e => e.Thoiluongkhoahoc)
                .HasColumnType("text")
                .HasColumnName("THOILUONGKHOAHOC");

            entity.HasOne(d => d.MakhoahocNavigation).WithOne(p => p.Khoahocchitiet)
                .HasForeignKey<Khoahocchitiet>(d => d.Makhoahoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_khct_kh");
        });

        modelBuilder.Entity<Lichhoccualop>(entity =>
        {
            entity.HasKey(e => e.Malichhoc).HasName("PK__LICHHOCC__6D42C8F33A961049");

            entity.ToTable("LICHHOCCUALOP");

            entity.Property(e => e.Malichhoc)
                .ValueGeneratedNever()
                .HasColumnName("MALICHHOC");
            entity.Property(e => e.Giobatdau).HasColumnName("GIOBATDAU");
            entity.Property(e => e.Gioketthuc).HasColumnName("GIOKETTHUC");
            entity.Property(e => e.Makhoahoc).HasColumnName("MAKHOAHOC");
            entity.Property(e => e.Malophoc).HasColumnName("MALOPHOC");
            entity.Property(e => e.Thu)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("THU");

            entity.HasOne(d => d.MakhoahocNavigation).WithMany(p => p.Lichhoccualops)
                .HasForeignKey(d => d.Makhoahoc)
                .HasConstraintName("fk_lhcl_khoahoc");

            entity.HasOne(d => d.MalophocNavigation).WithMany(p => p.Lichhoccualops)
                .HasForeignKey(d => d.Malophoc)
                .HasConstraintName("fk_lhct_lophoc");
        });

        modelBuilder.Entity<Lophoc>(entity =>
        {
            entity.HasKey(e => e.Malophoc).HasName("PK__LOPHOC__3680BCE2EDE9B863");

            entity.ToTable("LOPHOC");

            entity.Property(e => e.Malophoc)
                .ValueGeneratedNever()
                .HasColumnName("MALOPHOC");
            entity.Property(e => e.Magiaovien).HasColumnName("MAGIAOVIEN");
            entity.Property(e => e.Makhoahoc).HasColumnName("MAKHOAHOC");
            entity.Property(e => e.Siso).HasColumnName("SISO");
            entity.Property(e => e.Tenlophoc)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("TENLOPHOC");
            entity.Property(e => e.Thoigianbatdau).HasColumnName("THOIGIANBATDAU");
            entity.Property(e => e.Thoigianketthuc).HasColumnName("THOIGIANKETTHUC");
            entity.Property(e => e.Tinhtranglophoc)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("TINHTRANGLOPHOC");

            entity.HasOne(d => d.MagiaovienNavigation).WithMany(p => p.Lophocs)
                .HasForeignKey(d => d.Magiaovien)
                .HasConstraintName("fk_lh_gv");

            entity.HasOne(d => d.MakhoahocNavigation).WithMany(p => p.Lophocs)
                .HasForeignKey(d => d.Makhoahoc)
                .HasConstraintName("fk_lh_kh");
        });

        modelBuilder.Entity<Quantrivien>(entity =>
        {
            entity.HasKey(e => e.Maquantrivien).HasName("PK__QUANTRIV__0D5638969AAE4A29");

            entity.ToTable("QUANTRIVIEN");

            entity.Property(e => e.Maquantrivien)
                .ValueGeneratedNever()
                .HasColumnName("MAQUANTRIVIEN");
            entity.Property(e => e.Matkhau)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("MATKHAU");
            entity.Property(e => e.Taikhoan)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("TAIKHOAN");
        });

        modelBuilder.Entity<Solanthi>(entity =>
        {
            entity.HasKey(e => e.Malanthi).HasName("PK__SOLANTHI__88DDE28F2EA4DD91");

            entity.ToTable("SOLANTHI");

            entity.Property(e => e.Malanthi)
                .ValueGeneratedNever()
                .HasColumnName("MALANTHI");
            entity.Property(e => e.Mahocvien).HasColumnName("MAHOCVIEN");
            entity.Property(e => e.Ngaythi).HasColumnName("NGAYTHI");
            entity.Property(e => e.Socaudung).HasColumnName("SOCAUDUNG");

            entity.HasOne(d => d.MahocvienNavigation).WithMany(p => p.Solanthis)
                .HasForeignKey(d => d.Mahocvien)
                .HasConstraintName("fk_slt_hv");
        });

        modelBuilder.Entity<Thanhtoan>(entity =>
        {
            entity.HasKey(e => e.Mathanhtoan).HasName("PK__THANHTOA__E5D8225CB730DDFA");

            entity.ToTable("THANHTOAN");

            entity.Property(e => e.Mathanhtoan)
                .ValueGeneratedNever()
                .HasColumnName("MATHANHTOAN");
            entity.Property(e => e.Mahocvien).HasColumnName("MAHOCVIEN");
            entity.Property(e => e.Makhoahoc).HasColumnName("MAKHOAHOC");
            entity.Property(e => e.Malophoc).HasColumnName("MALOPHOC");
            entity.Property(e => e.Thoigianthanhtoan)
                .HasColumnType("datetime")
                .HasColumnName("THOIGIANTHANHTOAN");
            entity.Property(e => e.Tongtienthanhtoan).HasColumnName("TONGTIENTHANHTOAN");

            entity.HasOne(d => d.MahocvienNavigation).WithMany(p => p.Thanhtoans)
                .HasForeignKey(d => d.Mahocvien)
                .HasConstraintName("fk_tt_hv");

            entity.HasOne(d => d.MakhoahocNavigation).WithMany(p => p.Thanhtoans)
                .HasForeignKey(d => d.Makhoahoc)
                .HasConstraintName("fk_tt_kh");

            entity.HasOne(d => d.MalophocNavigation).WithMany(p => p.Thanhtoans)
                .HasForeignKey(d => d.Malophoc)
                .HasConstraintName("fk_tt_lh");
        });

        modelBuilder.Entity<Thongtinlophoc>(entity =>
        {
            entity.HasKey(e => e.Mathongtin).HasName("PK__THONGTIN__3C716A34248787F3");

            entity.ToTable("THONGTINLOPHOC");

            entity.Property(e => e.Mathongtin)
                .ValueGeneratedNever()
                .HasColumnName("MATHONGTIN");
            entity.Property(e => e.Malophoc).HasColumnName("MALOPHOC");
            entity.Property(e => e.Ngaytao).HasColumnName("NGAYTAO");
            entity.Property(e => e.Noidungthong)
                .HasColumnType("text")
                .HasColumnName("NOIDUNGTHONG");
            entity.Property(e => e.Tendinhkem).HasColumnName("TENDINHKEM");
            entity.Property(e => e.Tieude).HasColumnName("TIEUDE");

            entity.HasOne(d => d.MalophocNavigation).WithMany(p => p.Thongtinlophocs)
                .HasForeignKey(d => d.Malophoc)
                .HasConstraintName("fk_ttl_lh");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DA_Framewrok.Migrations
{
    /// <inheritdoc />
    public partial class addTableToDB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CAUHOITHITHU",
                columns: table => new
                {
                    MACAUHOI = table.Column<int>(type: "int", nullable: false),
                    DE = table.Column<string>(type: "text", nullable: true),
                    LUACHON1 = table.Column<string>(type: "text", nullable: true),
                    LUACHON2 = table.Column<string>(type: "text", nullable: true),
                    LUACHON3 = table.Column<string>(type: "text", nullable: true),
                    LUACHON4 = table.Column<string>(type: "text", nullable: true),
                    DAPAN = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__CAUHOITH__DCF1CAB7D1E32C12", x => x.MACAUHOI);
                });

            migrationBuilder.CreateTable(
                name: "GIAOVIEN",
                columns: table => new
                {
                    MAGIAOVIEN = table.Column<int>(type: "int", nullable: false),
                    TENGIAOVIEN = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DIACHI = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NGAYSINH = table.Column<DateOnly>(type: "date", nullable: true),
                    EMAIL = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    SODIENTHOAI = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    QUOCTICH = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ANHDAIDIEN = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    MATKHAU = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    TINHTRANG = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__GIAOVIEN__C509E6AD3FE69D86", x => x.MAGIAOVIEN);
                });

            migrationBuilder.CreateTable(
                name: "HOCVIEN",
                columns: table => new
                {
                    MAHOCVIEN = table.Column<int>(type: "int", nullable: false),
                    TENHOCVIEN = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NGAYSINH = table.Column<DateOnly>(type: "date", nullable: true),
                    EMAIL = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    SODIENTHOAI = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    MATKHAU = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    TINHTRANG = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__HOCVIEN__1A8447F180723113", x => x.MAHOCVIEN);
                });

            migrationBuilder.CreateTable(
                name: "KHOAHOC",
                columns: table => new
                {
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: false),
                    TENKHOAHOC = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    GIAKHOAHOC = table.Column<double>(type: "float", nullable: true),
                    MOTA = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    THOILUONG = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TRANGTHAI = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    ANHKHOAHOC = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    LOAIKHOAHOC = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__KHOAHOC__9E20788D254EC373", x => x.MAKHOAHOC);
                });

            migrationBuilder.CreateTable(
                name: "QUANTRIVIEN",
                columns: table => new
                {
                    MAQUANTRIVIEN = table.Column<int>(type: "int", nullable: false),
                    TAIKHOAN = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    MATKHAU = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__QUANTRIV__0D5638969AAE4A29", x => x.MAQUANTRIVIEN);
                });

            migrationBuilder.CreateTable(
                name: "SOLANTHI",
                columns: table => new
                {
                    MALANTHI = table.Column<int>(type: "int", nullable: false),
                    MAHOCVIEN = table.Column<int>(type: "int", nullable: true),
                    SOCAUDUNG = table.Column<int>(type: "int", nullable: true),
                    NGAYTHI = table.Column<DateOnly>(type: "date", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__SOLANTHI__88DDE28F2EA4DD91", x => x.MALANTHI);
                    table.ForeignKey(
                        name: "fk_slt_hv",
                        column: x => x.MAHOCVIEN,
                        principalTable: "HOCVIEN",
                        principalColumn: "MAHOCVIEN");
                });

            migrationBuilder.CreateTable(
                name: "KHOAHOCCHITIET",
                columns: table => new
                {
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: false),
                    DOITUONG = table.Column<string>(type: "text", nullable: true),
                    THOILUONGKHOAHOC = table.Column<string>(type: "text", nullable: true),
                    MUCTIEU = table.Column<string>(type: "text", nullable: true),
                    NOIDUNG = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__KHOAHOCC__9E20788D0800ADF8", x => x.MAKHOAHOC);
                    table.ForeignKey(
                        name: "fk_khct_kh",
                        column: x => x.MAKHOAHOC,
                        principalTable: "KHOAHOC",
                        principalColumn: "MAKHOAHOC");
                });

            migrationBuilder.CreateTable(
                name: "LOPHOC",
                columns: table => new
                {
                    MALOPHOC = table.Column<int>(type: "int", nullable: false),
                    TENLOPHOC = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    THOIGIANBATDAU = table.Column<DateOnly>(type: "date", nullable: true),
                    THOIGIANKETTHUC = table.Column<DateOnly>(type: "date", nullable: true),
                    MAGIAOVIEN = table.Column<int>(type: "int", nullable: true),
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: true),
                    TINHTRANGLOPHOC = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    SISO = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__LOPHOC__3680BCE2EDE9B863", x => x.MALOPHOC);
                    table.ForeignKey(
                        name: "fk_lh_gv",
                        column: x => x.MAGIAOVIEN,
                        principalTable: "GIAOVIEN",
                        principalColumn: "MAGIAOVIEN");
                    table.ForeignKey(
                        name: "fk_lh_kh",
                        column: x => x.MAKHOAHOC,
                        principalTable: "KHOAHOC",
                        principalColumn: "MAKHOAHOC");
                });

            migrationBuilder.CreateTable(
                name: "CAUTRALOI",
                columns: table => new
                {
                    MALANTHI = table.Column<int>(type: "int", nullable: false),
                    MACAUHOI = table.Column<int>(type: "int", nullable: false),
                    CAUTRALOI = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_ctl", x => new { x.MALANTHI, x.MACAUHOI });
                    table.ForeignKey(
                        name: "fk_tl_ch",
                        column: x => x.MALANTHI,
                        principalTable: "SOLANTHI",
                        principalColumn: "MALANTHI");
                    table.ForeignKey(
                        name: "fk_tl_slt",
                        column: x => x.MACAUHOI,
                        principalTable: "CAUHOITHITHU",
                        principalColumn: "MACAUHOI");
                });

            migrationBuilder.CreateTable(
                name: "BUOIHOC",
                columns: table => new
                {
                    MABUOIHOC = table.Column<int>(type: "int", nullable: false),
                    MALOPHOC = table.Column<int>(type: "int", nullable: true),
                    DOMAIN = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OPTIONS = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NGAYTAO = table.Column<DateOnly>(type: "date", nullable: true),
                    thoigian = table.Column<TimeOnly>(type: "time", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__BUOIHOC__83505C5952BB8F78", x => x.MABUOIHOC);
                    table.ForeignKey(
                        name: "fk_bhon_lh",
                        column: x => x.MALOPHOC,
                        principalTable: "LOPHOC",
                        principalColumn: "MALOPHOC");
                });

            migrationBuilder.CreateTable(
                name: "HOCVIENTHUOCLOPHOC",
                columns: table => new
                {
                    MAHOCVIEN = table.Column<int>(type: "int", nullable: false),
                    MALOPHOC = table.Column<int>(type: "int", nullable: false),
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_hvtl", x => new { x.MAHOCVIEN, x.MALOPHOC, x.MAKHOAHOC });
                    table.ForeignKey(
                        name: "fk_hvl_hv",
                        column: x => x.MAHOCVIEN,
                        principalTable: "HOCVIEN",
                        principalColumn: "MAHOCVIEN");
                    table.ForeignKey(
                        name: "fk_hvl_khoahoc",
                        column: x => x.MAKHOAHOC,
                        principalTable: "KHOAHOC",
                        principalColumn: "MAKHOAHOC");
                    table.ForeignKey(
                        name: "fk_hvl_lophoc",
                        column: x => x.MALOPHOC,
                        principalTable: "LOPHOC",
                        principalColumn: "MALOPHOC");
                });

            migrationBuilder.CreateTable(
                name: "LICHHOCCUALOP",
                columns: table => new
                {
                    MALICHHOC = table.Column<int>(type: "int", nullable: false),
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: true),
                    MALOPHOC = table.Column<int>(type: "int", nullable: true),
                    THU = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    GIOBATDAU = table.Column<TimeOnly>(type: "time", nullable: true),
                    GIOKETTHUC = table.Column<TimeOnly>(type: "time", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__LICHHOCC__6D42C8F33A961049", x => x.MALICHHOC);
                    table.ForeignKey(
                        name: "fk_lhcl_khoahoc",
                        column: x => x.MAKHOAHOC,
                        principalTable: "KHOAHOC",
                        principalColumn: "MAKHOAHOC");
                    table.ForeignKey(
                        name: "fk_lhct_lophoc",
                        column: x => x.MALOPHOC,
                        principalTable: "LOPHOC",
                        principalColumn: "MALOPHOC");
                });

            migrationBuilder.CreateTable(
                name: "THANHTOAN",
                columns: table => new
                {
                    MATHANHTOAN = table.Column<int>(type: "int", nullable: false),
                    MAHOCVIEN = table.Column<int>(type: "int", nullable: true),
                    MAKHOAHOC = table.Column<int>(type: "int", nullable: true),
                    TONGTIENTHANHTOAN = table.Column<double>(type: "float", nullable: true),
                    THOIGIANTHANHTOAN = table.Column<DateTime>(type: "datetime", nullable: true),
                    MALOPHOC = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__THANHTOA__E5D8225CB730DDFA", x => x.MATHANHTOAN);
                    table.ForeignKey(
                        name: "fk_tt_hv",
                        column: x => x.MAHOCVIEN,
                        principalTable: "HOCVIEN",
                        principalColumn: "MAHOCVIEN");
                    table.ForeignKey(
                        name: "fk_tt_kh",
                        column: x => x.MAKHOAHOC,
                        principalTable: "KHOAHOC",
                        principalColumn: "MAKHOAHOC");
                    table.ForeignKey(
                        name: "fk_tt_lh",
                        column: x => x.MALOPHOC,
                        principalTable: "LOPHOC",
                        principalColumn: "MALOPHOC");
                });

            migrationBuilder.CreateTable(
                name: "THONGTINLOPHOC",
                columns: table => new
                {
                    MATHONGTIN = table.Column<int>(type: "int", nullable: false),
                    MALOPHOC = table.Column<int>(type: "int", nullable: true),
                    NOIDUNGTHONG = table.Column<string>(type: "text", nullable: true),
                    TENDINHKEM = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TIEUDE = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NGAYTAO = table.Column<DateOnly>(type: "date", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__THONGTIN__3C716A34248787F3", x => x.MATHONGTIN);
                    table.ForeignKey(
                        name: "fk_ttl_lh",
                        column: x => x.MALOPHOC,
                        principalTable: "LOPHOC",
                        principalColumn: "MALOPHOC");
                });

            migrationBuilder.CreateIndex(
                name: "IX_BUOIHOC_MALOPHOC",
                table: "BUOIHOC",
                column: "MALOPHOC");

            migrationBuilder.CreateIndex(
                name: "IX_CAUTRALOI_MACAUHOI",
                table: "CAUTRALOI",
                column: "MACAUHOI");

            migrationBuilder.CreateIndex(
                name: "IX_HOCVIENTHUOCLOPHOC_MAKHOAHOC",
                table: "HOCVIENTHUOCLOPHOC",
                column: "MAKHOAHOC");

            migrationBuilder.CreateIndex(
                name: "IX_HOCVIENTHUOCLOPHOC_MALOPHOC",
                table: "HOCVIENTHUOCLOPHOC",
                column: "MALOPHOC");

            migrationBuilder.CreateIndex(
                name: "IX_LICHHOCCUALOP_MAKHOAHOC",
                table: "LICHHOCCUALOP",
                column: "MAKHOAHOC");

            migrationBuilder.CreateIndex(
                name: "IX_LICHHOCCUALOP_MALOPHOC",
                table: "LICHHOCCUALOP",
                column: "MALOPHOC");

            migrationBuilder.CreateIndex(
                name: "IX_LOPHOC_MAGIAOVIEN",
                table: "LOPHOC",
                column: "MAGIAOVIEN");

            migrationBuilder.CreateIndex(
                name: "IX_LOPHOC_MAKHOAHOC",
                table: "LOPHOC",
                column: "MAKHOAHOC");

            migrationBuilder.CreateIndex(
                name: "IX_SOLANTHI_MAHOCVIEN",
                table: "SOLANTHI",
                column: "MAHOCVIEN");

            migrationBuilder.CreateIndex(
                name: "IX_THANHTOAN_MAHOCVIEN",
                table: "THANHTOAN",
                column: "MAHOCVIEN");

            migrationBuilder.CreateIndex(
                name: "IX_THANHTOAN_MAKHOAHOC",
                table: "THANHTOAN",
                column: "MAKHOAHOC");

            migrationBuilder.CreateIndex(
                name: "IX_THANHTOAN_MALOPHOC",
                table: "THANHTOAN",
                column: "MALOPHOC");

            migrationBuilder.CreateIndex(
                name: "IX_THONGTINLOPHOC_MALOPHOC",
                table: "THONGTINLOPHOC",
                column: "MALOPHOC");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BUOIHOC");

            migrationBuilder.DropTable(
                name: "CAUTRALOI");

            migrationBuilder.DropTable(
                name: "HOCVIENTHUOCLOPHOC");

            migrationBuilder.DropTable(
                name: "KHOAHOCCHITIET");

            migrationBuilder.DropTable(
                name: "LICHHOCCUALOP");

            migrationBuilder.DropTable(
                name: "QUANTRIVIEN");

            migrationBuilder.DropTable(
                name: "THANHTOAN");

            migrationBuilder.DropTable(
                name: "THONGTINLOPHOC");

            migrationBuilder.DropTable(
                name: "SOLANTHI");

            migrationBuilder.DropTable(
                name: "CAUHOITHITHU");

            migrationBuilder.DropTable(
                name: "LOPHOC");

            migrationBuilder.DropTable(
                name: "HOCVIEN");

            migrationBuilder.DropTable(
                name: "GIAOVIEN");

            migrationBuilder.DropTable(
                name: "KHOAHOC");
        }
    }
}

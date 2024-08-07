USE [master]
GO
/****** Object:  Database [TRUNGTAMTIENGANH]    Script Date: 01/11/2024 3:53:59 PM ******/
CREATE DATABASE [TRUNGTAMTIENGANH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRUNGTAMTIENGANH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLTRAM\MSSQL\DATA\TRUNGTAMTIENGANH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRUNGTAMTIENGANH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLTRAM\MSSQL\DATA\TRUNGTAMTIENGANH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRUNGTAMTIENGANH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET RECOVERY FULL 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET  MULTI_USER 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRUNGTAMTIENGANH', N'ON'
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET QUERY_STORE = ON
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TRUNGTAMTIENGANH]
GO
/****** Object:  Table [dbo].[BUOIHOC]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUOIHOC](
	[MABUOIHOC] [int] NOT NULL,
	[MALOPHOC] [int] NULL,
	[DOMAIN] [nvarchar](max) NULL,
	[OPTIONS] [nvarchar](max) NULL,
	[NGAYTAO] [date] NULL,
	[thoigian] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MABUOIHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAUHOITHITHU]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAUHOITHITHU](
	[MACAUHOI] [int] NOT NULL,
	[DE] [text] NULL,
	[LUACHON1] [text] NULL,
	[LUACHON2] [text] NULL,
	[LUACHON3] [text] NULL,
	[LUACHON4] [text] NULL,
	[DAPAN] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MACAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAUTRALOI]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAUTRALOI](
	[MALANTHI] [int] NOT NULL,
	[MACAUHOI] [int] NOT NULL,
	[CAUTRALOI] [text] NULL,
 CONSTRAINT [pk_ctl] PRIMARY KEY CLUSTERED 
(
	[MALANTHI] ASC,
	[MACAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MAGIAOVIEN] [int] NOT NULL,
	[TENGIAOVIEN] [nvarchar](max) NULL,
	[DIACHI] [nvarchar](max) NULL,
	[NGAYSINH] [date] NULL,
	[EMAIL] [varchar](50) NULL,
	[SODIENTHOAI] [varchar](50) NULL,
	[QUOCTICH] [nvarchar](max) NULL,
	[ANHDAIDIEN] [varchar](40) NULL,
	[MATKHAU] [varchar](50) NULL,
	[TINHTRANG] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAGIAOVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCVIEN]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVIEN](
	[MAHOCVIEN] [int] NOT NULL,
	[TENHOCVIEN] [nvarchar](max) NULL,
	[NGAYSINH] [date] NULL,
	[EMAIL] [varchar](50) NULL,
	[SODIENTHOAI] [varchar](50) NULL,
	[MATKHAU] [varchar](50) NULL,
	[TINHTRANG] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHOCVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCVIENTHUOCLOPHOC]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVIENTHUOCLOPHOC](
	[MAHOCVIEN] [int] NOT NULL,
	[MALOPHOC] [int] NOT NULL,
	[MAKHOAHOC] [int] NOT NULL,
 CONSTRAINT [pk_hvtl] PRIMARY KEY CLUSTERED 
(
	[MAHOCVIEN] ASC,
	[MALOPHOC] ASC,
	[MAKHOAHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOAHOC]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOAHOC](
	[MAKHOAHOC] [int] NOT NULL,
	[TENKHOAHOC] [varchar](255) NULL,
	[GIAKHOAHOC] [float] NULL,
	[MOTA] [nvarchar](max) NULL,
	[THOILUONG] [nvarchar](max) NULL,
	[TRANGTHAI] [varchar](40) NULL,
	[ANHKHOAHOC] [varchar](100) NULL,
	[LOAIKHOAHOC] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKHOAHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOAHOCCHITIET]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOAHOCCHITIET](
	[MAKHOAHOC] [int] NOT NULL,
	[DOITUONG] [text] NULL,
	[THOILUONGKHOAHOC] [text] NULL,
	[MUCTIEU] [text] NULL,
	[NOIDUNG] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKHOAHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICHHOCCUALOP]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHHOCCUALOP](
	[MALICHHOC] [int] NOT NULL,
	[MAKHOAHOC] [int] NULL,
	[MALOPHOC] [int] NULL,
	[THU] [varchar](30) NULL,
	[GIOBATDAU] [time](7) NULL,
	[GIOKETTHUC] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALICHHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPHOC]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPHOC](
	[MALOPHOC] [int] NOT NULL,
	[TENLOPHOC] [varchar](255) NULL,
	[THOIGIANBATDAU] [date] NULL,
	[THOIGIANKETTHUC] [date] NULL,
	[MAGIAOVIEN] [int] NULL,
	[MAKHOAHOC] [int] NULL,
	[TINHTRANGLOPHOC] [varchar](40) NULL,
	[SISO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOPHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANTRIVIEN]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANTRIVIEN](
	[MAQUANTRIVIEN] [int] NOT NULL,
	[TAIKHOAN] [varchar](40) NULL,
	[MATKHAU] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAQUANTRIVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOLANTHI]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOLANTHI](
	[MALANTHI] [int] NOT NULL,
	[MAHOCVIEN] [int] NULL,
	[SOCAUDUNG] [int] NULL,
	[NGAYTHI] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MALANTHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANHTOAN]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHTOAN](
	[MATHANHTOAN] [int] NOT NULL,
	[MAHOCVIEN] [int] NULL,
	[MAKHOAHOC] [int] NULL,
	[TONGTIENTHANHTOAN] [float] NULL,
	[THOIGIANTHANHTOAN] [datetime] NULL,
	[MALOPHOC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MATHANHTOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THONGTINLOPHOC]    Script Date: 01/11/2024 3:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINLOPHOC](
	[MATHONGTIN] [int] NOT NULL,
	[MALOPHOC] [int] NULL,
	[NOIDUNGTHONG] [text] NULL,
	[TENDINHKEM] [nvarchar](max) NULL,
	[TIEUDE] [nvarchar](max) NULL,
	[NGAYTAO] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MATHONGTIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (1, 1, NULL, NULL, CAST(N'2023-12-26' AS Date), NULL)
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (2, 1, NULL, NULL, CAST(N'2023-12-26' AS Date), NULL)
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (3, 1, N'meet.jit.si', N'IM61NHVj5MJwU2nD1ZFIbPa3lW5pZV', CAST(N'2023-12-26' AS Date), NULL)
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (4, 1, N'meet.jit.si', N'f5NAuXogys718rjV13j6nNwKmUm377', CAST(N'2023-12-26' AS Date), NULL)
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (5, 1, N'meet.jit.si', N'EZVEEw2PWNqZtgUaGmTXqeHz0AtjpI', CAST(N'2023-12-26' AS Date), CAST(N'15:30:18.7907012' AS Time))
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (6, 1, N'meet.jit.si', N'dcsD9DQ3zcuBRfdDsbwe2K2YQ1XUU8', CAST(N'2023-12-26' AS Date), CAST(N'15:40:43.1806992' AS Time))
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (7, 1, N'meet.jit.si', N'trXZfLSGXz1465Bdiv8JkPgOdC8QdT', CAST(N'2023-12-27' AS Date), CAST(N'08:12:02.8668979' AS Time))
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (8, 1, N'meet.jit.si', N'NYVRQy4sQC7PL4BKgdDEMijJPdnuB8', CAST(N'2023-12-27' AS Date), CAST(N'08:13:11.9798344' AS Time))
INSERT [dbo].[BUOIHOC] ([MABUOIHOC], [MALOPHOC], [DOMAIN], [OPTIONS], [NGAYTAO], [thoigian]) VALUES (9, 1, N'meet.jit.si', N'CiwO9kcodrV8OUxfRmJvE5zo7Wxwds', CAST(N'2023-12-27' AS Date), CAST(N'10:32:49.5178876' AS Time))
GO
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (1, N'Because the peer performance review surveys will be conducted —–, employees are encouraged to provide honest feedback on their colleagues’ work.', N'anonymously', N'excessively', N'perceptively', N'descriptively', N'perceptively')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (4, N'Evan Automobile’s new green energy system was —– acclaimed by industry experts at the expo.', N'unfortunately', N'universally', N'embarrassingly', N'extremely', N'embarrassingly')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (5, N'He''s very short: ________ sisters are taller.', N'both of them', N'his both', N'both his', N'the two both his', N'both his')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (6, N'When ________ dinner.', N'have you', N'do you have', N'you have', N'you are having', N'you are having')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (7, N'Kate is the best ________ the three.', N'in', N'from', N'than', N'of', N'of')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (8, N'- Are you ready? - ________.', N'Already not', N'Quite not', N'Yet not', N'Not yet', N'Not yet')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (9, N'Leave your dirty shoes ________ the door.', N'out from', N'out', N'outside', N'out of', N'outside')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (10, N'He ________ swim very well.', N'not can', N'cannot', N'doesn''t can', N'don''t can', N'cannot')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (11, N'Peter works in London. ________.', N'He goes there by train.', N'He there goes by train.', N'He goes by train there.', N'There goes he by train.', N'He goes there by train.')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (12, N'Yeuk Yee had her house painted white yesterday.', N'She had to paint her house white yesterday.', N'Her house was not blue last week.', N'They painted her house white for her yesterday.', N'She painted her house yesterday.', N'They painted her house white for her yesterday.')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (13, N'The hotel is ________.', N'sell', N'for sale', N'for sell', N'sale', N'for sale')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (14, N'- Can we begin the test? - We can''t unless the teacher ________ so.', N'will say', N'is saying', N'shall say', N'says', N'says')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (15, N'\"You are late\" he said. \"I think the bus ________ already.\"', N'went', N'was going', N'has gone', N'goes', N'has gone')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (16, N'We wondered who was going to pay for the ________ window.', N'broken', N'breaking', N'broke', N'break', N'broken')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (17, N'The pond near your house is full ________ white lilies.', N'with', N'of', N'to', N'zero', N'of')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (18, N'His landlady doesn''t ________ of his having parties.', N'appreciate', N'support', N'approve', N'agree', N'approve')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (19, N'I drink ________ coffee than you.', N'little', N'few', N'less', N'fewer', N'less')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (20, N'I bought her a new pencil sharpener ________.', N'it is very expensive', N'which was very expensive', N'whose colour was black', N'it will be vey expensive', N'which was very expensive')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (21, N'The news ________ as soon as possible.', N'release', N'will release', N'will have been released', N'will be released', N'will be released')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (22, N'This book is ________.', N'belonged to Som', N'belong to Som', N'Som''s', N'of Som', N'belong to Som')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (23, N'Suda told ________ the whole story.', N'to me', N'me', N'I', N'my', N'me')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (24, N'It''s a small shop, and you may have some difficulty ________ it.', N'to find', N'of finding', N'in finding', N'to be finding', N'in finding')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (25, N'He has been very interested in doing research on _______ since he was at high school.', N'biology', N'biological', N'biologist', N'biologically', N'biology')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (26, N'Are you sure that boys are more _______ than girls?', N'act', N'active', N'action', N'activity', N'active')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (27, N'You are old enough to take _______ for what you have done.', N'responsible', N'responsibility', N'responsibly', N'irresponsible', N'responsibility')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (28, N'These quick and easy _______ can be effective in the short term, but they have a cost.', N'solve', N'solvable', N'solutions', N'solvability', N'solutions')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (29, N'He was looking at his parents _______, waiting for recommendations.', N'obey', N'obedience', N'obedient', N'obediently', N'obediently')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (30, N'The interviews with parents showed that the vast majority were _______ of teachers.', N'support', N'supportive', N'supporter', N'supporting', N'supportive')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (31, N'It is _________ of you to leave the medicine where the children could get it.', N'care', N'caring', N'careless', N'careful', N'careless')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (32, N'For ________ reasons, passengers are requested not to leave any luggage unattended.', N'secure', N'securely', N'security', N'securing', N'security')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (33, N'The leader of the explorers had the great _______ in his native guide.', N'confident', N'confidence', N'confidential', N'confidentially', N'confidence')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (34, N'We are impressed by his _________ to help us with the hard mission.', N'will', N'willing', N'willingness', N'willingly', N'willingness')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (35, N'John cannot make a __ to get married to Mary or stay single until he can afford a house and a car.', N'decide', N'decision', N'decisive', N'decisively', N'decision')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (36, N'My mother used to be a woman of great _______, but now she gets old and looks pale.', N'beauty', N'beautiful', N'beautifully', N'beautify', N'beauty')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (37, N'Although they are twins, they have almost the same appearance but they are seldom in _______.', N'agree', N'agreeable', N'agreement', N'agreeably', N'agreement')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (38, N'The more _______ and positive you look, the better you will feel.', N'confide', N'confident', N'confidently', N'confidence', N'confidence')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (39, N'My parents will have celebrated 30 years of _______ by next week.', N'marry', N'married', N'marriageable', N'marriage', N'marriage')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (40, N'Many Vietnamese people ______ their lives for the revolutionary cause of the nation', N'sacrifice', N'sacrificed', N'sacrificial', N'sacrificially', N'sacrificed')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (41, N'They had a _______ candlelit dinner last night and she accepted his proposal of marriage.', N'romance', N'romantic', N'romantically', N'romanticize', N'romantic')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (42, N'Are there any _____, between Vietnamese and American culture?', N'differences', N'different', N'differently', N'differential', N'differences')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (43, N'Some people are concerned with physical _______when choosing a wife or husband.', N'attractive', N'attraction', N'attractiveness', N'attractively', N'attractiveness')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (44, N'What could be more ________ than a wedding on a tropical island?', N'romance', N'romantic', N'romanticizing', N'romanticism', N'romanticism')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (45, N'In my hometown, many people still believe in_______ marriage.', N'contract', N'contractual', N'contracts', N'contracting', N'contractual')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (46, N'_____ women are responsible for the chores in the house and taking care of the children.', N'With tradition', N'On tradition', N'Traditional', N'Traditionally', N'Traditional')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (47, N'Though their performance was not perfect yet, the students held the audience''s____ until the end.', N'attentive', N'attention', N'attentively', N'attentiveness', N'attention')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (48, N'The survey will cover various ways of ___________ the different attitudes toward love and marriage of today''s youth.', N'determination', N'determine', N'determined', N'determining', N'determining')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (49, N'Both Asian and Western students seem ___ about how to answer the questionnaire of the survey.', N'confusedly', N'confused', N'confusing', N'confusion', N'confused')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (50, N'She was__ unaware of the embarrassing situation due to her different cultural background.', N'complete', N'completed', N'completing', N'completely', N'completely')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (51, N'What is more important to you, intelligence or___________________?', N'attraction', N'attractiveness', N'attractive', N'attracted', N'attractiveness')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (52, N'The family has a very important role in_____________ children.', N'social', N'socialist', N'socializing', N'socialism', N'socializing')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (53, N'In U.S. schools, teachers don''t mind their students''___________ them during the lectures.', N'interrupt', N'interrupted', N'interrupting', N'to interrupt', N'interrupting')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (54, N'His achievements were partly due to the____________ of his wife.', N'assist', N'assistant', N'assisted', N'assistance', N'assistance')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (55, N'By working day and night, they succeeded____________ their work in time.', N'finished', N'to finish', N'finishing', N'in finishing', N'in finishing')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (56, N'They started, as ___ gatherings but they have become increasingly formalized in the last few years.', N'informal', N'informally', N'informalize', N'informality', N'informal')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (57, N'Children who are isolated and lonely seem to have poor language and _________.', N'communicate', N'communication', N'communicative', N'communicator', N'communication')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (58, N'The lecturer explained the problem very clearly and is always ____in response to questions.', N'attention', N'attentive', N'attentively', N'attentiveness', N'attentive')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (59, N'I make no __________ for encouraging my children to succeed in school.', N'apologize', N'apologetic', N'apologies', N'apoplectic', N'apologies')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (60, N'It was very more __________of a chat than an interview.', N'formal', N'informal', N'formality', N'informality', N'informal')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (61, N'As an _______, Mr. Pike is very worried about the increasing of juvenile delinquency.', N'educate', N'education', N'educator', N'educative', N'educator')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (62, N'In England, primary education is provided by state schools run by the government and by _______ fee-paying schools.', N'independent', N'independently', N'depended', N'independence', N'independent')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (63, N'He did not do well at school and left with few _______ qualifications.', N'academic', N'academy', N'academician', N'academically', N'academic')
INSERT [dbo].[CAUHOITHITHU] ([MACAUHOI], [DE], [LUACHON1], [LUACHON2], [LUACHON3], [LUACHON4], [DAPAN]) VALUES (64, N'The Minister of the Education and Training Department appeared on TV last night to------- his new policy.', N'public', N'publicly', N'publicize', N'publicizing', N'publicize')
GO
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 6, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 8, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 9, N'out of')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 10, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 14, N'is saying')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 16, N'broken')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 20, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 23, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 24, N'in finding')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 34, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 35, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 39, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 44, N'romance')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 49, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 54, N'assist')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 58, N'attention')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 60, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 62, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 63, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (17, 64, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 1, N'descriptively')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 4, N'unfortunately')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 5, N'both his')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 11, N'There goes he by train.')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 14, N'shall say')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 15, N'went')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 16, N'broke')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 18, N'appreciate')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 19, N'less')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 22, N'belong to Som')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 25, N'biology')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 28, N'solve')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 33, N'confidential')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 37, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 41, N'romance')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 45, N'contractual')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 46, N'With tradition')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 48, N'determination')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 50, N'complete')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (20, 51, N'attraction')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 4, N'extremely')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 6, N'you have')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 10, N'doesn''t can')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 12, N'They painted her house white for her yesterday.')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 17, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 20, N'it is very expensive')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 21, N'will have been released')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 25, N'biologically')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 27, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 32, N'securing')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 37, N'agreement')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 43, N'attractive')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 50, N'complete')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 55, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 56, N'informally')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 57, N'communicator')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 59, N'apologetic')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 60, N'informality')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 63, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (22, 64, N'public')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 6, N'you are having')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 7, N'from')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 15, N'went')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 18, N'support')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 19, N'less')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 20, N'whose colour was black')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 21, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 24, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 30, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 34, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 37, N'agreeable')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 39, N'marriage')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 40, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 43, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 46, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 49, N'confused')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 51, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 53, N'interrupting')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 57, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (26, 59, N'apologetic')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 4, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 5, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 8, N'Already not')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 9, N'out of')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 13, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 14, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 16, N'broken')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 20, N'which was very expensive')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 24, N'to find')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 25, N'biology')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 28, N'solutions')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 33, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 34, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 36, N'beautify')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 39, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 46, N'With tradition')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 47, NULL)
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 57, N'communicator')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 59, N'apoplectic')
INSERT [dbo].[CAUTRALOI] ([MALANTHI], [MACAUHOI], [CAUTRALOI]) VALUES (28, 64, NULL)
GO
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (1, N'Hồ Văn Đạt', N'226,HCM', CAST(N'1999-01-01' AS Date), N'hoa@zenlish.tearcher.com', N'09898776', N'Venezuela', N'Upload\Teacher\pic4.jpg', N'123445', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (2, N'Nguyễn Thị Ngọc', N'226,HCM', CAST(N'2000-01-01' AS Date), N'bht@zenlish.teacher.com', N'09898776', N'Djibouti', N'Upload\Teacher\teacher1.png', N'123445', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (3, N'Mai Thị Thúy', N'789 Ðu?ng MNO, Qu?n 3, TP.HCM', CAST(N'1998-01-01' AS Date), N'nvc@zenlish.teacher.com', N'09898776', N'Uganda', N'Upload\Teacher\teacher-2.webp', N'123445', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (4, N'Nguyễn Văn Đức', N'226,HCM', CAST(N'1999-01-01' AS Date), N'nve@zenlish.teacher.com', N'09898776', N'Belice', N'Upload\Teacher\person-3.jpg', N'123445', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (5, N'Phạm Văn Tùng', N'226,HCM', CAST(N'2024-01-01' AS Date), N'haa@zenlish.teacher.com', N'09898776', N'Djibouti', N'Upload\Teacher\about.jpg', N'123445', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (10, N'Trần Văn Cường', N'123 Đường ABC, TP.HCM', CAST(N'1985-01-01' AS Date), N'cuong.tran@gmail.com', N'0978123456', N'Việt Nam', N'Upload\Teacher\person-1.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (11, N'Nguyễn Thị Hằng', N'456 Đường XYZ, Hà Nội', CAST(N'1987-01-01' AS Date), N'hang.nguyen@gmail.com', N'0989234567', N'Việt Nam', N'Upload\Teacher\person-3.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (12, N'Lê Văn Tuấn', N'789 Đường MNO, Đà Nẵng', CAST(N'1990-01-01' AS Date), N'tuan.le@gmail.com', N'0967345678', N'Việt Nam', N'Upload\Teacher\avatar-1.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (18, N'Lý Văn Hùng', N'456 Đường QRS, Bắc Ninh', CAST(N'2005-01-01' AS Date), N'hung.ly@gmail.com', N'0967345678', N'Việt Nam', N'Upload\Teacher\avatar-4.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (19, N'Bùi Thị Loan', N'789 Đường TUV, Hải Phòng', CAST(N'2008-01-01' AS Date), N'loan.bui@gmail.com', N'0909876543', N'Việt Nam', N'Upload\Teacher\avatar-3.jpg', N'123456', N'Inactive')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (20, N'Mai Văn Thắng', N'987 Đường WXY, Nam Định', CAST(N'2010-01-01' AS Date), N'thang.mai@gmail.com', N'0912345678', N'Việt Nam', N'Upload\Teacher\person-2.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (21, N'Trần Văn Cường', N'123 Đường ABC, TP.HCM', CAST(N'1985-01-01' AS Date), N'cuong.tran@gmail.com', N'0978123456', N'Việt Nam', N'Upload\Teacher\avatar-3.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (22, N'Nguyễn Thị Hằng', N'456 Đường XYZ, Hà Nội', CAST(N'1987-01-01' AS Date), N'hang.nguyen@gmail.com', N'0989234567', N'Việt Nam', N'Upload\Teacher\about.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (23, N'Lê Văn Tuấn', N'789 Đường MNO, Đà Nẵng', CAST(N'1990-01-01' AS Date), N'tuan.le@gmail.com', N'0967345678', N'Việt Nam', N'Upload\Teacher\avatar-6.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (24, N'Phạm Thị Thảo', N'147 Đường KLM, Nha Trang', CAST(N'1992-01-01' AS Date), N'thao.pham@gmail.com', N'0909876543', N'Việt Nam', N'Upload\Teacher\avatar-5.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (25, N'Hoàng Văn Hòa', N'258 Đường DEF, Cần Thơ', CAST(N'1995-01-01' AS Date), N'hoa.hoang@gmail.com', N'0912345678', N'Việt Nam', N'Upload\Teacher\person-2.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (26, N'Mai Thị Anh', N'369 Đường GHI, Vũng Tàu', CAST(N'1998-01-01' AS Date), N'anh.mai@gmail.com', N'0987654321', N'Việt Nam', N'Upload\Teacher\person-1.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (27, N'Trịnh Văn Bình', N'159 Đường JKL, Huế', CAST(N'2000-01-01' AS Date), N'binh.trinh@gmail.com', N'0978123456', N'Việt Nam', N'Upload\Teacher\avatar-4.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (28, N'Nguyễn Thị Thủy', N'357 Đường NOP, Quảng Ngãi', CAST(N'2003-01-01' AS Date), N'thuy.nguyen@gmail.com', N'0989234567', N'Việt Nam', N'Upload\Teacher\pic4.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (29, N'Lý Văn Hùng', N'456 Đường QRS, Bắc Ninh', CAST(N'2005-01-01' AS Date), N'hung.ly@gmail.com', N'0967345678', N'Việt Nam', N'Upload\Teacher\avatar-3.jpg', N'123456', N'Active')
INSERT [dbo].[GIAOVIEN] ([MAGIAOVIEN], [TENGIAOVIEN], [DIACHI], [NGAYSINH], [EMAIL], [SODIENTHOAI], [QUOCTICH], [ANHDAIDIEN], [MATKHAU], [TINHTRANG]) VALUES (30, N'Bùi Thị Loan', N'789 Đường TUV, Hải Phòng', CAST(N'2008-01-01' AS Date), N'loan.bui@gmail.com', N'0909876543', N'Việt Nam', N'Upload\Teacher\teacher-2.webp', N'123456', N'Active')
GO
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (1, N'Nguyễn Van A', CAST(N'2023-01-01' AS Date), N'hóa@gmail.com', N'09898776', N'123456789', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (2, N'Nguyễn Văn B', CAST(N'2023-01-01' AS Date), N'zcsdf', N'09898776', N'123445', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (5, N'Hồ Toàn Đặng', CAST(N'2023-01-01' AS Date), N'hoa@gmail.com', N'09898776', N'123445', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (26, N'Phan Thị Bình', CAST(N'1995-02-28' AS Date), N'binh.phan@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (27, N'Vũ Đức Thịnh', CAST(N'1995-07-15' AS Date), N'thinh.vu@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (28, N'Trần Thị Hồng', CAST(N'1995-12-22' AS Date), N'hong.tran@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (29, N'Lê Thị Tuyết', CAST(N'1996-05-05' AS Date), N'tuyet.le@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (30, N'Nguyễn Văn Tuấn', CAST(N'1996-10-10' AS Date), N'tuan.nguyen@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (31, N'Mai Thị Lan', CAST(N'1997-03-18' AS Date), N'lan.mai@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (32, N'Đỗ Văn Hải', CAST(N'1997-08-25' AS Date), N'hai.do@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (33, N'Phạm Thị Quỳnh Anh', CAST(N'1998-01-30' AS Date), N'anh.pham@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (34, N'Lý Thị Thanh', CAST(N'1998-06-07' AS Date), N'thanh.ly@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (35, N'Chu Văn Tú', CAST(N'1998-11-15' AS Date), N'tu.chu@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (36, N'Mai Thị Diệu Linh', CAST(N'1999-04-22' AS Date), N'linh.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (37, N'Vũ Thị Mai Anh', CAST(N'1999-09-29' AS Date), N'anh.vu@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (38, N'Trần Văn Quang', CAST(N'2000-03-05' AS Date), N'quang.tran@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (39, N'Lê Thị Hương', CAST(N'2000-08-12' AS Date), N'huong.le@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (40, N'Nguyễn Văn Hoàng', CAST(N'2000-12-18' AS Date), N'hoang.nguyen@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (41, N'Phan Thị Trang', CAST(N'2001-05-25' AS Date), N'trang.phan@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (42, N'Đỗ Thị Hà', CAST(N'2001-10-01' AS Date), N'ha.do@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (43, N'Trịnh Văn Duy', CAST(N'2002-03-10' AS Date), N'duy.trinh@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (44, N'Hoàng Thị Ngọc', CAST(N'2002-08-15' AS Date), N'ngoc.hoang@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (45, N'Lương Văn Khánh', CAST(N'2002-12-22' AS Date), N'khanh.luong@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (46, N'Phạm Thị Hương Giang', CAST(N'2003-05-01' AS Date), N'giang.pham@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (47, N'Nguyễn Văn Tùng', CAST(N'2003-10-08' AS Date), N'tung.nguyen@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (48, N'Bùi Thị Lan Anh', CAST(N'2004-03-15' AS Date), N'anh.bui@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (49, N'Lê Văn Khánh', CAST(N'2004-08-22' AS Date), N'khanh.le@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (50, N'Phan Thị Ngọc Ánh', CAST(N'2005-01-29' AS Date), N'anh.phan@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (51, N'Dương Văn Hòa', CAST(N'2005-07-07' AS Date), N'hoa.duong@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (52, N'Trần Thị Thảo', CAST(N'2005-12-14' AS Date), N'thao.tran@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (53, N'Mai Văn Bình', CAST(N'2006-05-21' AS Date), N'binh.mai@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (54, N'Đỗ Thị Hồng', CAST(N'2006-10-28' AS Date), N'hong.do@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (55, N'Lý Văn Đại', CAST(N'2007-04-06' AS Date), N'dai.ly@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (56, N'Nguyễn Thị Thu Hà', CAST(N'2007-09-13' AS Date), N'ha.nguyen@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (57, N'Phạm Văn Hùng', CAST(N'2008-02-19' AS Date), N'hung.pham@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (58, N'Trần Thị Hương', CAST(N'2008-07-28' AS Date), N'huong.tran@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (59, N'Lê Văn Đăng', CAST(N'2009-01-04' AS Date), N'dang.le@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (60, N'Mai Thị Dung', CAST(N'2009-06-13' AS Date), N'dung.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (61, N'Nguyễn Thị Thu Hương', CAST(N'2010-01-20' AS Date), N'huong.nguyen@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (62, N'Phan Văn Hòa', CAST(N'2010-06-27' AS Date), N'hoa.phan@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (63, N'Trương Thị Thảo', CAST(N'2010-12-04' AS Date), N'thao.truong@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (64, N'Trần Văn Bảo', CAST(N'1995-02-28' AS Date), N'bao.tran@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (65, N'Nguyễn Thị Hương', CAST(N'1995-07-15' AS Date), N'huong.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (66, N'Đỗ Văn Hùng', CAST(N'1995-12-22' AS Date), N'hung.do@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (67, N'Phạm Văn Tùng', CAST(N'1996-05-05' AS Date), N'tung.pham@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (68, N'Mai Thị Bích', CAST(N'1996-10-10' AS Date), N'bich.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (69, N'Lê Thị Hà', CAST(N'1997-03-18' AS Date), N'ha.le@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (70, N'Trịnh Văn Hòa', CAST(N'1997-08-25' AS Date), N'hoa.trinh@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (71, N'Nguyễn Thị Nhung', CAST(N'1998-01-30' AS Date), N'nhung.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (72, N'Vũ Thị Thảo', CAST(N'1998-06-07' AS Date), N'thao.vu@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (73, N'Phan Văn Tâm', CAST(N'1998-11-15' AS Date), N'tam.phan@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (74, N'Hoàng Thị Loan', CAST(N'1999-04-22' AS Date), N'loan.hoang@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (75, N'Trần Văn Hoàng', CAST(N'1999-09-29' AS Date), N'hoang.tran@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (76, N'Lê Thị Thủy', CAST(N'2000-03-05' AS Date), N'thuy.le@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (77, N'Nguyễn Văn Hải', CAST(N'2000-08-12' AS Date), N'hai.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (78, N'Đỗ Thị Quỳnh', CAST(N'2000-12-18' AS Date), N'quynh.do@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (79, N'Mai Văn Trung', CAST(N'2001-05-25' AS Date), N'trung.mai@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (80, N'Phạm Thị Lan Anh', CAST(N'2001-10-01' AS Date), N'anh.pham@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (81, N'Lý Thị Thu Hà', CAST(N'2002-03-10' AS Date), N'ha.ly@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (82, N'Chu Văn Hòa', CAST(N'2002-08-15' AS Date), N'hoa.chu@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (83, N'Nguyễn Thị Ngọc', CAST(N'2002-12-22' AS Date), N'ngoc.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (84, N'Trần Thị Phương', CAST(N'2003-05-01' AS Date), N'phuong.tran@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (85, N'Nguyễn Văn Đức', CAST(N'2003-10-08' AS Date), N'duc.nguyen@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (86, N'Mai Thị Thúy', CAST(N'2004-03-15' AS Date), N'thuy.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (87, N'Phan Văn Minh', CAST(N'2004-08-22' AS Date), N'minh.phan@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (88, N'Đỗ Thị Thu Hà', CAST(N'2005-01-29' AS Date), N'ha.do@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (89, N'Nguyễn Văn Đức', CAST(N'2005-07-07' AS Date), N'duc.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (90, N'Trần Thị Thanh', CAST(N'2005-12-14' AS Date), N'thanh.tran@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (91, N'Bùi Thị Hà', CAST(N'2006-05-21' AS Date), N'ha.bui@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (92, N'Mai Thị Hồng', CAST(N'2006-10-28' AS Date), N'hong.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (93, N'Lê Thị Loan', CAST(N'2007-04-06' AS Date), N'loan.le@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (94, N'Nguyễn Văn Hải', CAST(N'2007-09-13' AS Date), N'hai.nguyen@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (95, N'Nguyễn Thị Thảo', CAST(N'2008-02-19' AS Date), N'thao.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (96, N'Đỗ Thị Hương', CAST(N'2008-07-28' AS Date), N'huong.do@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (97, N'Phạm Văn Đăng', CAST(N'2009-01-04' AS Date), N'dang.pham@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (98, N'Nguyễn Thị Dung', CAST(N'2009-06-13' AS Date), N'dung.nguyen@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (99, N'Nguyễn Văn Thịnh', CAST(N'2010-01-20' AS Date), N'thinh.nguyen@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (100, N'Lê Thị Hương', CAST(N'2010-06-27' AS Date), N'huong.le@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (101, N'Trần Văn Bảo', CAST(N'1995-02-28' AS Date), N'bao.tran@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (102, N'Nguyễn Thị Hương', CAST(N'1995-07-15' AS Date), N'huong.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (103, N'Đỗ Văn Hùng', CAST(N'1995-12-22' AS Date), N'hung.do@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (104, N'Phạm Văn Tùng', CAST(N'1996-05-05' AS Date), N'tung.pham@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (105, N'Mai Thị Bích', CAST(N'1996-10-10' AS Date), N'bich.mai@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (106, N'Lê Thị Hà', CAST(N'1997-03-18' AS Date), N'ha.le@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (107, N'Trịnh Văn Hòa', CAST(N'1997-08-25' AS Date), N'hoa.trinh@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (108, N'Nguyễn Thị Nhung', CAST(N'1998-01-30' AS Date), N'nhung.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (109, N'Vũ Thị Thảo', CAST(N'1998-06-07' AS Date), N'thao.vu@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (110, N'Phan Văn Tâm', CAST(N'1998-11-15' AS Date), N'tam.phan@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (111, N'Hoàng Thị Loan', CAST(N'1999-04-22' AS Date), N'loan.hoang@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (112, N'Trần Văn Hoàng', CAST(N'1999-09-29' AS Date), N'hoang.tran@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (113, N'Lê Thị Thủy', CAST(N'2000-03-05' AS Date), N'thuy.le@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (114, N'Nguyễn Văn Hải', CAST(N'2000-08-12' AS Date), N'hai.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (115, N'Đỗ Thị Quỳnh', CAST(N'2000-12-18' AS Date), N'quynh.do@gmail.com', N'0967345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (116, N'Mai Văn Trung', CAST(N'2001-05-25' AS Date), N'trung.mai@gmail.com', N'0909876543', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (117, N'Phạm Thị Lan Anh', CAST(N'2001-10-01' AS Date), N'anh.pham@gmail.com', N'0912345678', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (118, N'Lý Thị Thu Hà', CAST(N'2002-03-10' AS Date), N'ha.ly@gmail.com', N'0987654321', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (119, N'Chu Văn Hòa', CAST(N'2002-08-15' AS Date), N'hoa.chu@gmail.com', N'0978123456', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (120, N'Nguyễn Thị Ngọc', CAST(N'2002-12-22' AS Date), N'ngoc.nguyen@gmail.com', N'0989234567', N'123456', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (121, N'Hà Văn A', CAST(N'2023-06-12' AS Date), N'intailieu1710@gmail.com', N'09898776', N'123', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (122, N'Nguyễn Văn d', CAST(N'2023-05-12' AS Date), N'abcd@gmail.com', N'031231212', N'1234', N'Active')
GO
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (123, N'Nguyễn Văn A', CAST(N'2023-11-29' AS Date), N'anh123@gmail.com', N'0987654321', N'123445', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (124, N'chế duy khang', CAST(N'2013-05-12' AS Date), N'tomvip7418529630@gmail.com', N'09662323', N'123', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (126, N'aee', CAST(N'2013-05-12' AS Date), N'sadasdas', N'014568687', N'123', N'Active')
INSERT [dbo].[HOCVIEN] ([MAHOCVIEN], [TENHOCVIEN], [NGAYSINH], [EMAIL], [SODIENTHOAI], [MATKHAU], [TINHTRANG]) VALUES (127, N'nguyen van a', CAST(N'2013-05-12' AS Date), N'asd', N'0142422', N'123', N'Active')
GO
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (2, 1, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (2, 2, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (5, 1, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (5, 2, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (5, 16, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (5, 20, 6)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (26, 1, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (26, 2, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (26, 4, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (26, 16, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (27, 4, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (27, 16, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (28, 4, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (28, 17, 5)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (29, 4, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (29, 17, 5)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (30, 5, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (30, 18, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (31, 5, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (31, 18, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (32, 5, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (32, 16, 4)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (32, 18, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (33, 6, 5)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (33, 19, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (34, 6, 5)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (34, 19, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (35, 6, 5)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (36, 8, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (37, 8, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (37, 15, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (38, 9, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (39, 9, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (40, 10, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (41, 10, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (42, 10, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (43, 11, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (44, 11, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (45, 11, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (46, 12, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (47, 12, 7)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (48, 13, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (49, 13, 8)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (50, 14, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (51, 14, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (52, 14, 9)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (53, 15, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (54, 15, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (55, 15, 3)
INSERT [dbo].[HOCVIENTHUOCLOPHOC] ([MAHOCVIEN], [MALOPHOC], [MAKHOAHOC]) VALUES (56, 16, 4)
GO
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (3, N'IELTS - Foundation', 1000000, N'Dành cho những học viên mất gốc hoàn toàn hoặc mới bắt đầu tiếp cận với tiếng Anh xây dựng nền tảng vững chắc kiến thức.', N'6 tháng', N'Show', N'Upload\Course\content-writer-187.jpg', N'Ielts')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (4, N'IELTS - Initial', 2000000, N'Dành cho học viên có nền tảng cơ bản, ngữ pháp khá, từ vựng hạn chế, nghe, đọc, nói và viết chưa đủ kỹ năng, nâng cao kỹ năng cơ bản.', N'6 tháng', N'Show', N'Upload\Course\eac900e1-ba33-4a61-ae06-85a9a7c5bc2289.jpg', N'Ielts')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (5, N'IELTS - Intermediate', 3000000, N'Dành cho học viên có kiến thức vững ở trình độ 4.5, đã có tư duy học IELTS, từ vựng và ngữ pháp khá, kĩ năng viết và nói trung bình.', N'6 tháng', N'Show', N'Upload\Course\image_870x_64fc386a296eb91.jpg', N'Ielts')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (6, N'IELTS - Ultimate', 4000000, N'Dành cho học viên có kiến thức vững vàng ở trình độ 6.0, khả năng từ vựng và ngữ pháp tốt, đã thực hành ôn luyện đề thi IELTS.', N'6 tháng', N'Show', N'Upload\Course\94d89481-2ec0-4e5c-a8ea-d99956276ea856.jpg', N'Ielts')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (7, N'TOEIC - Foundation', 1000000, N'Dành cho những học viên mất gốc hoàn toàn hoặc mới bắt đầu tiếp cận với tiếng Anh xây dựng nền tảng vững chắc kiến thức.', N'60 ngày', N'Show', N'Upload\Course\chung-chi-toeic-nhung-thong-tin-ban-can-biet12.jpg', N'Toeic')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (8, N'TOEIC - Initial', 2000000, N'Dành cho học viên có nền tảng cơ bản, ngữ pháp khá, từ vựng hạn chế, nghe, đọc, nói và viết chưa đủ kỹ năng. Nâng cao kỹ năng cơ bản', N'60 ngày', N'Show', N'Upload\Course\logo-TOEIC-217.jpg', N'Toeic')
INSERT [dbo].[KHOAHOC] ([MAKHOAHOC], [TENKHOAHOC], [GIAKHOAHOC], [MOTA], [THOILUONG], [TRANGTHAI], [ANHKHOAHOC], [LOAIKHOAHOC]) VALUES (9, N'TOEIC - Intermediate', 2000000, N'Dành cho học viên có khả năng sử dụng tiếng Anh trong các tình huống giao tiếp nhưng hạn chế. Nâng cao kỹ năng cơ bản.', N'60 ngày', N'Show', N'Upload\Course\Toeic65.jpg', N'Toeic')
GO
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (1, 3, 1, N'Thu hai', CAST(N'23:10:00' AS Time), CAST(N'00:10:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (2, 3, 1, N'Thu tu', CAST(N'12:11:00' AS Time), CAST(N'20:16:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (3, 3, 2, N'Thu hai', CAST(N'09:24:00' AS Time), CAST(N'09:24:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (4, 3, 2, N'Thu tu', CAST(N'02:24:00' AS Time), CAST(N'03:19:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (5, 3, 4, N'Thu hai', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (6, 3, 4, N'Thu tu', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (7, 4, 5, N'Thu hai', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (8, 4, 5, N'Thu tu', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (9, 5, 6, N'Thu hai', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (10, 5, 6, N'Thu tu', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (11, 7, 8, N'Thu hai', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (12, 7, 8, N'Thu tu', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (13, 8, 9, N'Thu tu', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (14, 8, 9, N'Thu sau', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (15, 9, 10, N'Thu tu', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (16, 9, 10, N'Thu sau', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (17, 3, 11, N'Thu tu', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (18, 3, 11, N'Thu sau', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (19, 7, 12, N'Thu ba', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (20, 7, 12, N'Thu nam', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (21, 8, 13, N'Thu ba', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (22, 8, 13, N'Thu nam', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (23, 9, 14, N'Thu ba', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (24, 9, 14, N'Thu nam', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (25, 3, 15, N'Thu nam', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (26, 3, 15, N'Thu bay', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (27, 4, 16, N'Thu nam', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (28, 4, 16, N'Thu bay', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (29, 5, 17, N'Thu nam', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (30, 5, 17, N'Thu bay', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (31, 7, 18, N'Thu tu', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (32, 7, 18, N'Thu bay', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (33, 8, 19, N'Thu tu', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (34, 8, 19, N'Thu bay', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (35, 6, 20, N'Thu hai', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[LICHHOCCUALOP] ([MALICHHOC], [MAKHOAHOC], [MALOPHOC], [THU], [GIOBATDAU], [GIOKETTHUC]) VALUES (36, 6, 20, N'Thu sau', CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (1, N'Ielts_Foundation_2_4_c1', CAST(N'2023-12-20' AS Date), CAST(N'2023-12-31' AS Date), 1, 3, N'Da bat dau', 1)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (2, N'Ielts_Foundation_2_4_c2', CAST(N'2023-12-21' AS Date), CAST(N'2023-12-21' AS Date), 2, 3, N'Da ket thuc', 1)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (3, N'Ielts_Foundation_2_4_c3', CAST(N'2023-12-22' AS Date), CAST(N'2023-12-28' AS Date), 25, 4, N'Da bat dau', 30)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (4, N'Ielts_Foundation_3_7_c4', CAST(N'2023-01-10' AS Date), CAST(N'2023-07-10' AS Date), 10, 3, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (5, N'Ielts_Initial_2_4_c1', CAST(N'2023-01-10' AS Date), CAST(N'2023-07-10' AS Date), 11, 4, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (6, N'Ielts_Intermediate_2_4_c1', CAST(N'2023-01-10' AS Date), CAST(N'2023-07-10' AS Date), 12, 5, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (7, N'Ielts_Ultimate_2_4_c2', CAST(N'2023-01-10' AS Date), CAST(N'2023-07-10' AS Date), 11, 6, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (8, N'Toeic_Foundation_2_4_c2', CAST(N'2023-01-10' AS Date), CAST(N'2023-03-10' AS Date), 21, 7, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (9, N'Toeic_Initial_4_6_c2', CAST(N'2023-01-10' AS Date), CAST(N'2023-03-10' AS Date), 22, 8, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (10, N'Toeic_Intermediate_2_5_c2', CAST(N'2023-01-10' AS Date), CAST(N'2023-03-10' AS Date), 23, 9, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (11, N'Ielts_Foundation_3_6_c3', CAST(N'2023-02-10' AS Date), CAST(N'2023-08-10' AS Date), 25, 3, N'Da ket thuc', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (12, N'Toeic_Foundation_4_6_c3', CAST(N'2024-02-14' AS Date), CAST(N'2024-04-14' AS Date), 25, 7, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (13, N'Toeic_Initial_3_7_c3', CAST(N'2024-02-17' AS Date), CAST(N'2024-04-17' AS Date), 23, 8, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (14, N'Toeic_Intermediate_3_5_c3', CAST(N'2024-02-20' AS Date), CAST(N'2024-04-20' AS Date), 24, 9, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (15, N'Ielts_Foundation_4_6_c7', CAST(N'2024-02-27' AS Date), CAST(N'2024-04-27' AS Date), 26, 3, N'Chua bat dau', 1)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (16, N'Ielts_Initial_3_5_c4', CAST(N'2024-03-01' AS Date), CAST(N'2024-05-01' AS Date), 18, 4, N'Chua bat dau', 2)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (17, N'Ielts_Intermediate_2_4_c4', CAST(N'2024-03-04' AS Date), CAST(N'2024-05-04' AS Date), 19, 5, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (18, N'Toeic_Foundation_4_5_c4', CAST(N'2024-03-10' AS Date), CAST(N'2024-05-10' AS Date), 24, 7, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (19, N'Toeic_Initial_3_6_c5', CAST(N'2024-03-12' AS Date), CAST(N'2024-05-12' AS Date), 25, 8, N'Chua bat dau', 0)
INSERT [dbo].[LOPHOC] ([MALOPHOC], [TENLOPHOC], [THOIGIANBATDAU], [THOIGIANKETTHUC], [MAGIAOVIEN], [MAKHOAHOC], [TINHTRANGLOPHOC], [SISO]) VALUES (20, N'Ielts_Ultimate_4_7_c3', CAST(N'2024-03-12' AS Date), CAST(N'2024-05-12' AS Date), 25, 6, N'Chua bat dau', 0)
GO
INSERT [dbo].[QUANTRIVIEN] ([MAQUANTRIVIEN], [TAIKHOAN], [MATKHAU]) VALUES (1, N'admin1', N'1234')
INSERT [dbo].[QUANTRIVIEN] ([MAQUANTRIVIEN], [TAIKHOAN], [MATKHAU]) VALUES (2, N'1', N'1')
GO
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (0, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (1, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (2, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (3, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (4, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (5, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (6, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (7, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (8, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (9, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (10, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (11, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (12, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (13, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (14, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (15, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (16, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (17, 5, 2, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (18, 5, 0, NULL)
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (19, 5, 0, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (20, 5, 5, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (21, 5, 0, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (22, 26, 2, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (23, 5, 0, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (24, 5, 0, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (25, 5, 0, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (26, 37, 5, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (27, 37, 0, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[SOLANTHI] ([MALANTHI], [MAHOCVIEN], [SOCAUDUNG], [NGAYTHI]) VALUES (28, 37, 4, CAST(N'2023-12-27' AS Date))
GO
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (1, 2, 3, 0, CAST(N'2023-12-21T10:27:46.030' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (2, 2, 3, 0, CAST(N'2023-12-21T10:29:51.633' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (3, 2, 3, 1000000, CAST(N'2023-12-21T10:30:44.310' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (4, 2, 3, 1000000, CAST(N'2023-12-21T11:04:35.950' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (5, 2, 3, 1000000, CAST(N'2023-12-21T11:05:09.757' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (6, 2, 3, 1000000, CAST(N'2023-12-22T09:18:49.537' AS DateTime), 2)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (7, 5, 3, 1000000, CAST(N'2023-12-22T09:33:15.283' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (8, 5, 3, 1000000, CAST(N'2023-12-24T09:19:58.410' AS DateTime), 2)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (9, 26, 3, 1000000, CAST(N'2023-12-26T14:15:06.373' AS DateTime), 2)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (10, 26, 3, 1000000, CAST(N'2023-12-26T14:17:42.820' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (11, 32, 4, 2000000, CAST(N'2023-12-26T16:27:47.220' AS DateTime), 16)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (12, 5, 4, 2000000, CAST(N'2023-12-27T08:10:24.317' AS DateTime), 16)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (13, 5, 4, 2000000, CAST(N'2023-12-27T10:27:38.590' AS DateTime), 16)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (14, 5, 3, 1000000, CAST(N'2023-12-27T10:28:11.770' AS DateTime), 1)
INSERT [dbo].[THANHTOAN] ([MATHANHTOAN], [MAHOCVIEN], [MAKHOAHOC], [TONGTIENTHANHTOAN], [THOIGIANTHANHTOAN], [MALOPHOC]) VALUES (15, 37, 3, 1000000, CAST(N'2023-12-27T10:29:00.583' AS DateTime), 15)
GO
INSERT [dbo].[THONGTINLOPHOC] ([MATHONGTIN], [MALOPHOC], [NOIDUNGTHONG], [TENDINHKEM], [TIEUDE], [NGAYTAO]) VALUES (1, 1, N'abc', N'Upload\Document\De2.pdf', N'acbd', CAST(N'2023-12-25' AS Date))
INSERT [dbo].[THONGTINLOPHOC] ([MATHONGTIN], [MALOPHOC], [NOIDUNGTHONG], [TENDINHKEM], [TIEUDE], [NGAYTAO]) VALUES (2, 1, N'abc', N'Upload\Document\CuoiKy_2021_IS207.L22.TM-VN.pdf', N'acbd', CAST(N'2023-12-25' AS Date))
INSERT [dbo].[THONGTINLOPHOC] ([MATHONGTIN], [MALOPHOC], [NOIDUNGTHONG], [TENDINHKEM], [TIEUDE], [NGAYTAO]) VALUES (5, 1, N'<p>ádasdasd</p>', NULL, N'adasd', CAST(N'2023-12-25' AS Date))
INSERT [dbo].[THONGTINLOPHOC] ([MATHONGTIN], [MALOPHOC], [NOIDUNGTHONG], [TENDINHKEM], [TIEUDE], [NGAYTAO]) VALUES (6, 1, N'<p>sdasdasd</p>', NULL, N'Nguyễn văn a', CAST(N'2023-12-25' AS Date))
GO
ALTER TABLE [dbo].[BUOIHOC]  WITH CHECK ADD  CONSTRAINT [fk_bhon_lh] FOREIGN KEY([MALOPHOC])
REFERENCES [dbo].[LOPHOC] ([MALOPHOC])
GO
ALTER TABLE [dbo].[BUOIHOC] CHECK CONSTRAINT [fk_bhon_lh]
GO
ALTER TABLE [dbo].[CAUTRALOI]  WITH CHECK ADD  CONSTRAINT [fk_tl_ch] FOREIGN KEY([MALANTHI])
REFERENCES [dbo].[SOLANTHI] ([MALANTHI])
GO
ALTER TABLE [dbo].[CAUTRALOI] CHECK CONSTRAINT [fk_tl_ch]
GO
ALTER TABLE [dbo].[CAUTRALOI]  WITH CHECK ADD  CONSTRAINT [fk_tl_slt] FOREIGN KEY([MACAUHOI])
REFERENCES [dbo].[CAUHOITHITHU] ([MACAUHOI])
GO
ALTER TABLE [dbo].[CAUTRALOI] CHECK CONSTRAINT [fk_tl_slt]
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_hvl_hv] FOREIGN KEY([MAHOCVIEN])
REFERENCES [dbo].[HOCVIEN] ([MAHOCVIEN])
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC] CHECK CONSTRAINT [fk_hvl_hv]
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_hvl_khoahoc] FOREIGN KEY([MAKHOAHOC])
REFERENCES [dbo].[KHOAHOC] ([MAKHOAHOC])
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC] CHECK CONSTRAINT [fk_hvl_khoahoc]
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_hvl_lophoc] FOREIGN KEY([MALOPHOC])
REFERENCES [dbo].[LOPHOC] ([MALOPHOC])
GO
ALTER TABLE [dbo].[HOCVIENTHUOCLOPHOC] CHECK CONSTRAINT [fk_hvl_lophoc]
GO
ALTER TABLE [dbo].[KHOAHOCCHITIET]  WITH CHECK ADD  CONSTRAINT [fk_khct_kh] FOREIGN KEY([MAKHOAHOC])
REFERENCES [dbo].[KHOAHOC] ([MAKHOAHOC])
GO
ALTER TABLE [dbo].[KHOAHOCCHITIET] CHECK CONSTRAINT [fk_khct_kh]
GO
ALTER TABLE [dbo].[LICHHOCCUALOP]  WITH CHECK ADD  CONSTRAINT [fk_lhcl_khoahoc] FOREIGN KEY([MAKHOAHOC])
REFERENCES [dbo].[KHOAHOC] ([MAKHOAHOC])
GO
ALTER TABLE [dbo].[LICHHOCCUALOP] CHECK CONSTRAINT [fk_lhcl_khoahoc]
GO
ALTER TABLE [dbo].[LICHHOCCUALOP]  WITH CHECK ADD  CONSTRAINT [fk_lhct_lophoc] FOREIGN KEY([MALOPHOC])
REFERENCES [dbo].[LOPHOC] ([MALOPHOC])
GO
ALTER TABLE [dbo].[LICHHOCCUALOP] CHECK CONSTRAINT [fk_lhct_lophoc]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_lh_gv] FOREIGN KEY([MAGIAOVIEN])
REFERENCES [dbo].[GIAOVIEN] ([MAGIAOVIEN])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [fk_lh_gv]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_lh_kh] FOREIGN KEY([MAKHOAHOC])
REFERENCES [dbo].[KHOAHOC] ([MAKHOAHOC])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [fk_lh_kh]
GO
ALTER TABLE [dbo].[SOLANTHI]  WITH CHECK ADD  CONSTRAINT [fk_slt_hv] FOREIGN KEY([MAHOCVIEN])
REFERENCES [dbo].[HOCVIEN] ([MAHOCVIEN])
GO
ALTER TABLE [dbo].[SOLANTHI] CHECK CONSTRAINT [fk_slt_hv]
GO
ALTER TABLE [dbo].[THANHTOAN]  WITH CHECK ADD  CONSTRAINT [fk_tt_hv] FOREIGN KEY([MAHOCVIEN])
REFERENCES [dbo].[HOCVIEN] ([MAHOCVIEN])
GO
ALTER TABLE [dbo].[THANHTOAN] CHECK CONSTRAINT [fk_tt_hv]
GO
ALTER TABLE [dbo].[THANHTOAN]  WITH CHECK ADD  CONSTRAINT [fk_tt_kh] FOREIGN KEY([MAKHOAHOC])
REFERENCES [dbo].[KHOAHOC] ([MAKHOAHOC])
GO
ALTER TABLE [dbo].[THANHTOAN] CHECK CONSTRAINT [fk_tt_kh]
GO
ALTER TABLE [dbo].[THANHTOAN]  WITH CHECK ADD  CONSTRAINT [fk_tt_lh] FOREIGN KEY([MALOPHOC])
REFERENCES [dbo].[LOPHOC] ([MALOPHOC])
GO
ALTER TABLE [dbo].[THANHTOAN] CHECK CONSTRAINT [fk_tt_lh]
GO
ALTER TABLE [dbo].[THONGTINLOPHOC]  WITH CHECK ADD  CONSTRAINT [fk_ttl_lh] FOREIGN KEY([MALOPHOC])
REFERENCES [dbo].[LOPHOC] ([MALOPHOC])
GO
ALTER TABLE [dbo].[THONGTINLOPHOC] CHECK CONSTRAINT [fk_ttl_lh]
GO
USE [master]
GO
ALTER DATABASE [TRUNGTAMTIENGANH] SET  READ_WRITE 
GO

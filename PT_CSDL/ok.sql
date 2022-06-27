create database test
USE [test]
GO

/****** Object:  Table [dbo].[CSKH]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSKH](
	[ID_NV] [nchar](10) NOT NULL,
	[Hotline] [nchar](15) NULL,
	[Email] [nvarchar](50) NULL,
	[BoxChat] [nvarchar](max) NULL,
 CONSTRAINT [PK_CSKH] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSKH_TaiKhoanKH]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSKH_TaiKhoanKH](
	[ID_NV] [nchar](10) NOT NULL,
	[ID_TaiKhoanKH] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CSKH_TaiKhoanKH] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC,
	[ID_TaiKhoanKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSKH_TaiKhoanNV]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSKH_TaiKhoanNV](
	[ID_NV] [nchar](10) NOT NULL,
	[ID_TaiKhoanNV] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CSKH_TaiKhoanNV] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC,
	[ID_TaiKhoanNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienVien]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienVien](
	[ID_DV] [nchar](10) NOT NULL,
	[HoDV] [nvarchar](50) NULL,
	[TenDV] [nvarchar](50) NULL,
 CONSTRAINT [PK_DienVien] PRIMARY KEY CLUSTERED 
(
	[ID_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatVe]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatVe](
	[ID_DonDatVe] [nchar](10) NOT NULL,
	[ID_KH] [nchar](10) NOT NULL,
	[ID_NV] [nchar](10) NOT NULL,
	[ID_TaiKhoanNV] [nchar](10) NOT NULL,
	[ID_RapPhim] [nchar](10) NOT NULL,
	[ThoiGianDatVe] [datetime] NULL,
	[PhuongThucThanhToan] [bit] NULL,
	[SoLuongVe] [int] NULL,
 CONSTRAINT [PK_DonDatVe] PRIMARY KEY CLUSTERED 
(
	[ID_DonDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatVe_Phim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatVe_Phim](
	[ID_DonDatVe] [nchar](10) NOT NULL,
	[ID_Phim] [nchar](10) NOT NULL,
	[TenPhim] [nvarchar](200) NULL,
	[NgayChieu] [date] NULL,
	[ThoiGianBatDau] [time](7) NULL,
	[ViTriNgoi] [int] NULL,
	[RapSo] [int] NULL,
 CONSTRAINT [PK_DonDatVe_Phim] PRIMARY KEY CLUSTERED 
(
	[ID_DonDatVe] ASC,
	[ID_Phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GheNgoi]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GheNgoi](
	[ID_GheNgoi] [nchar](10) NOT NULL,
	[ID_PhongChieu] [nchar](10) NOT NULL,
	[ID_LoaiGhe] [nchar](10) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[SoGhe] [int] NULL,
 CONSTRAINT [PK_GheNgoi] PRIMARY KEY CLUSTERED 
(
	[ID_GheNgoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangPhim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangPhim](
	[Id_HangPhim] [nvarchar](50) NOT NULL,
	[TenHangPhim] [nvarchar](200) NULL,
 CONSTRAINT [PK_HangPhim] PRIMARY KEY CLUSTERED 
(
	[Id_HangPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KH] [nchar](10) NOT NULL,
	[ID_LoaiKH] [nchar](10) NOT NULL,
	[HoKH] [nvarchar](100) NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [nchar](15) NULL,
	[CCCD] [nchar](20) NULL,
	[TheSV] [nchar](20) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[ID_LichChieu] [nchar](10) NOT NULL,
	[NgayChieu] [date] NULL,
 CONSTRAINT [PK_LichChieu] PRIMARY KEY CLUSTERED 
(
	[ID_LichChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu_Phim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu_Phim](
	[ID_LichChieu] [nchar](10) NOT NULL,
	[ID_Phim] [nchar](10) NOT NULL,
	[ThoiGianChieu] [time](7) NULL,
 CONSTRAINT [PK_LichChieu_Phim] PRIMARY KEY CLUSTERED 
(
	[ID_LichChieu] ASC,
	[ID_Phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu_PhongChieu]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu_PhongChieu](
	[ID_LichChieu] [nchar](10) NOT NULL,
	[ID_PhongChieu] [nchar](10) NOT NULL,
	[ThoiGianBatDau] [time](0) NULL,
	[ThoiGianKetThuc] [time](0) NULL,
 CONSTRAINT [PK_LichChieu_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[ID_PhongChieu] ASC,
	[ID_LichChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGhe]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGhe](
	[ID_LoaiGhe] [nchar](10) NOT NULL,
	[TenLoaiGhe] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiGhe] PRIMARY KEY CLUSTERED 
(
	[ID_LoaiGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKH]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKH](
	[ID_LoaiKH] [nchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiKH] PRIMARY KEY CLUSTERED 
(
	[ID_LoaiKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhim](
	[ID_LoaiPhim] [nchar](10) NOT NULL,
	[TenLoaiPhim] [nvarchar](200) NULL,
 CONSTRAINT [PK_LoaiPhim] PRIMARY KEY CLUSTERED 
(
	[ID_LoaiPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID_NV] [nchar](10) NOT NULL,
	[ID_RapPhim] [nchar](10) NOT NULL,
	[HoNV] [nvarchar](50) NULL,
	[TenNV] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](15) NULL,
	[ChucVu] [nchar](10) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[ID_Phim] [nchar](10) NOT NULL,
	[ID_LoaiPhim] [nchar](10) NOT NULL,
	[ID_HangPhim] [nchar](10) NOT NULL,
	[TenPhim] [nvarchar](100) NULL,
	[NuocSX] [nvarchar](50) NULL,
	[ThoiLuong] [int] NULL,
	[NamSX] [date] NULL,
	[HoDaoDien] [nvarchar](100) NULL,
	[TenDaoDien] [nvarchar](50) NULL,
	[Trailer] [image] NULL,
	[GiaVe] [money] NULL,
	[DoTuoi] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phimm] PRIMARY KEY CLUSTERED 
(
	[ID_Phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim_DienVien]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim_DienVien](
	[ID_Phim] [nchar](10) NOT NULL,
	[ID_DV] [nchar](10) NOT NULL,
	[VaiDong] [nvarchar](100) NULL,
 CONSTRAINT [PK_Phim_DienVien] PRIMARY KEY CLUSTERED 
(
	[ID_DV] ASC,
	[ID_Phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChieu](
	[ID_PhongChieu] [nchar](10) NOT NULL,
	[ID_RapPhim] [nchar](10) NOT NULL,
	[TenPhong] [nvarchar](200) NULL,
	[TongSoGhe] [int] NULL,
 CONSTRAINT [PK_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[ID_PhongChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RapPhim]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RapPhim](
	[ID_RapPhim] [nchar](10) NOT NULL,
	[TenRapPhim] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
 CONSTRAINT [PK_RapPhim] PRIMARY KEY CLUSTERED 
(
	[ID_RapPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanKH]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanKH](
	[ID_TaiKhoanKH] [nchar](10) NOT NULL,
	[ID_KH] [nchar](10) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[DiemTichLuy] [int] NULL,
 CONSTRAINT [PK_TaiKhoanKH] PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoanKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanNV]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanNV](
	[ID_TaiKhoanNV] [nchar](10) NOT NULL,
	[ID_NV] [nchar](10) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_TaiKhoanNV] PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoanNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheThanhVien]    Script Date: 9/20/2021 9:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheThanhVien](
	[ID_TaiKhoanKH] [nchar](10) NOT NULL,
	[ID_KH] [nchar](10) NOT NULL,
	[ID_NV] [nchar](10) NOT NULL,
	[HoKH] [nvarchar](50) NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [nchar](15) NULL,
	[CCCD] [nchar](30) NULL,
 CONSTRAINT [PK_TheThanhVien] PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoanKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [QLRAPPHIM] SET  READ_WRITE 
GO

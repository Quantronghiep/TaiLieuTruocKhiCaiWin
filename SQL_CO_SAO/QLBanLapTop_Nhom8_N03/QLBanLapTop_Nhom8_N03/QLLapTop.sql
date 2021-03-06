CREATE DATABASE QLLAPTOP
USE [QLLAPTOP]
GO
/****** Object:  Table [dbo].[ChiTietHDB]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[MaHDB] [nvarchar](10) NOT NULL,
	[MaLaptop] [nvarchar](10) NOT NULL,
	[SLBan] [int] NULL,
	[GiaBan] [money] NULL,
 CONSTRAINT [PK_ChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaLaptop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHDN]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[MaHDN] [nvarchar](10) NOT NULL,
	[MaLapTop] [nvarchar](10) NOT NULL,
	[SLNhap] [int] NULL,
	[GiaNhap] [money] NULL,
 CONSTRAINT [PK_ChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaLapTop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaKH] [nvarchar](10) NOT NULL,
	[NgayBan] [date] NULL,
 CONSTRAINT [PK_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDN] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaNCC] [nvarchar](10) NOT NULL,
	[NgayNhap] [date] NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](12) NULL,
 CONSTRAINT [PK_QLCuaHang] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSX]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSX](
	[MaNSX] [nvarchar](10) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSX] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QLKhachHang]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLKhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[HoKH] [nvarchar](30) NULL,
	[TenKH] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDT] [nchar](12) NULL,
 CONSTRAINT [PK_QLKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QLLaptop]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLLaptop](
	[MaLaptop] [nvarchar](10) NOT NULL,
	[TenLaptop] [nvarchar](50) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[CanNang] [float] NULL,
	[MaNSX] [nvarchar](10) NOT NULL,
	[CauHinh] [nvarchar](200) NULL,
	[DonGia] [money] NULL,
	[TGBH] [int] NULL,
 CONSTRAINT [PK_QLLaptop] PRIMARY KEY CLUSTERED 
(
	[MaLaptop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QLNhanVien]    Script Date: 5/3/2021 3:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLNhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[HoNV] [nvarchar](30) NULL,
	[TenNV] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[Que] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[SDT] [nchar](12) NULL,
 CONSTRAINT [PK_QLNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB01', N'LT01', 5, 50000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB01', N'LT03', 3, 35000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB01', N'LT04', 1, 24000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB02', N'LT01', 3, 50000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB02', N'LT05', 5, 33000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB03', N'LT07', 7, 29000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB03', N'LT08', 9, 21000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB04', N'LT09', 2, 19000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB04', N'LT11', 10, 11000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB04', N'LT19', 1, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB05', N'LT12', 20, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB06', N'LT15', 4, 5000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB06', N'LT17', 1, 13000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB07', N'LT12', 20, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB07', N'LT18', 51, 21000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB08', N'LT11', 2, 11000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB08', N'LT19', 1, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB08', N'LT43', 4, 21000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB09', N'LT04', 1, 24000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB09', N'LT21', 65, 10000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB10', N'LT24', 1, 18000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB10', N'LT40', 2, 14000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB11', N'LT25', 20, 15500000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB12', N'LT28', 2, 20000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB13', N'LT29', 3, 31000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB13', N'LT40', 2, 14000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB14', N'LT31', 1, 9500000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB15', N'LT32', 4, 75000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB16', N'LT34', 3, 5500000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB17', N'LT35', 7, 11000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB17', N'LT36', 5, 10000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB18', N'LT39', 11, 19000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB19', N'LT40', 2, 14000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB20', N'LT41', 1, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB21', N'LT43', 4, 21000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB21', N'LT44', 5, 15000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB22', N'LT46', 2, 21500000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB22', N'LT47', 9, 22000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB23', N'LT49', 10, 11000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB24', N'LT32', 3, 7500000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB25', N'LT11', 4, 11000000.0000)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaLaptop], [SLBan], [GiaBan]) VALUES (N'HDB25', N'LT50', 6, 14000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN01', N'LT01', 100, 45000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN01', N'LT02', 170, 63000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN02', N'LT03', 90, 33000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN02', N'LT04', 23, 22000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN02', N'LT05', 10, 30000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN03', N'LT06', 22, 21000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN04', N'LT07', 29, 26900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN05', N'LT08', 40, 19000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN05', N'LT09', 67, 17000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN05', N'LT10', 44, 23000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN06', N'LT11', 214, 9000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN06', N'LT12', 156, 13900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN07', N'LT13', 90, 19900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN07', N'LT14', 99, 15000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN08', N'LT15', 27, 45000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN08', N'LT16', 66, 6000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN09', N'LT17', 67, 11000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN09', N'LT18', 88, 19900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN10', N'LT19', 96, 14000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN10', N'LT20', 79, 7800000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN10', N'LT21', 65, 8000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN11', N'LT22', 70, 8500000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN11', N'LT23', 55, 17800000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN12', N'LT24', 26, 17000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN12', N'LT25', 99, 14900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN13', N'LT26', 22, 19000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN13', N'LT27', 55, 11000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN14', N'LT28', 122, 18600000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN14', N'LT47', 67, 19000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN15', N'LT29', 134, 29900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN15', N'LT48', 87, 22000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN16', N'LT30', 77, 14500000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN16', N'LT46', 47, 1900000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN17', N'LT31', 88, 8000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN17', N'LT49', 65, 9000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN18', N'LT32', 200, 6500000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN18', N'LT40', 50, 12000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN18', N'LT41', 54, 13000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN19', N'LT33', 65, 2000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN19', N'LT45', 44, 25000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN19', N'LT50', 150, 12000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN20', N'LT34', 44, 4000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN21', N'LT35', 47, 9000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN22', N'LT36', 87, 800000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN22', N'LT42', 69, 9000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN23', N'LT37', 33, 9000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN23', N'LT39', 27, 16800000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN23', N'LT44', 34, 13000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN24', N'LT38', 32, 5000000.0000)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaLapTop], [SLNhap], [GiaNhap]) VALUES (N'HDN24', N'LT43', 99, 19000000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB01', N'NV01', N'KH01', CAST(N'2020-02-03' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB02', N'NV04', N'KH01', CAST(N'2021-04-04' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB03', N'NV05', N'KH02', CAST(N'2021-02-08' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB04', N'NV05', N'KH06', CAST(N'2020-06-08' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB05', N'NV01', N'KH10', CAST(N'2020-09-08' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB06', N'NV05', N'KH14', CAST(N'2021-03-04' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB07', N'NV12', N'KH15', CAST(N'2021-04-06' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB08', N'NV15', N'KH15', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB09', N'NV22', N'KH16', CAST(N'2020-01-02' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB10', N'NV12', N'KH16', CAST(N'2019-02-02' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB11', N'NV16', N'KH09', CAST(N'2019-03-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB12', N'NV30', N'KH09', CAST(N'2019-10-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB13', N'NV30', N'KH03', CAST(N'2020-12-12' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB14', N'NV33', N'KH03', CAST(N'2020-03-03' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB15', N'NV04', N'KH01', CAST(N'2021-02-02' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB16', N'NV14', N'KH01', CAST(N'2021-02-06' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB17', N'NV22', N'KH02', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB18', N'NV35', N'KH02', CAST(N'2020-05-05' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB19', N'NV02', N'KH06', CAST(N'2021-04-05' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB20', N'NV03', N'KH14', CAST(N'2021-04-19' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB21', N'NV06', N'KH11', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB22', N'NV11', N'KH17', CAST(N'2020-08-09' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB23', N'NV35', N'KH24', CAST(N'2021-04-09' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB24', N'NV11', N'KH19', CAST(N'2021-08-08' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB25', N'NV32', N'KH20', CAST(N'2021-03-10' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN01', N'NV01', N'NCC01', CAST(N'2020-01-09' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN02', N'NV01', N'NCC05', CAST(N'2021-02-02' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN03', N'NV01', N'NCC07', CAST(N'2021-04-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN04', N'NV02', N'NCC02', CAST(N'2020-09-08' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN05', N'NV05', N'NCC01', CAST(N'2020-10-20' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN06', N'NV07', N'NCC03', CAST(N'2020-12-12' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN07', N'NV11', N'NCC04', CAST(N'2021-01-06' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN08', N'NV14', N'NCC05', CAST(N'2021-04-04' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN09', N'NV15', N'NCC06', CAST(N'2020-05-08' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN10', N'NV17', N'NCC05', CAST(N'2021-01-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN11', N'NV22', N'NCC01', CAST(N'2021-05-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN12', N'NV25', N'NCC02', CAST(N'2020-01-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN13', N'NV24', N'NCC04', CAST(N'2021-11-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN14', N'NV01', N'NCC05', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN15', N'NV04', N'NCC01', CAST(N'2020-05-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN16', N'NV31', N'NCC05', CAST(N'2021-09-05' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN17', N'NV33', N'NCC05', CAST(N'2020-07-04' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN18', N'NV21', N'NCC07', CAST(N'2020-06-06' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN19', N'NV25', N'NCC04', CAST(N'2020-05-03' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN20', N'NV35', N'NCC03', CAST(N'2021-11-13' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN21', N'NV16', N'NCC02', CAST(N'2020-06-06' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN22', N'NV17', N'NCC02', CAST(N'2020-05-23' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN23', N'NV35', N'NCC01', CAST(N'2021-11-11' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN24', N'NV35', N'NCC05', CAST(N'2021-04-03' AS Date))
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC01', N'Máy Vi Tính Đông Quân', N'Bình Dương', N'0937505118  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC02', N'LapTop98', N'Hồ Chí Minh', N'0914159946  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC03', N'Công ty Minh An', N'Hà Nội', N'0977851111  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC04', N'An Phát computer', N'Hà Nội', N'0989278839  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC05', N'Thiên Long Phước', N'Hồ Chí Minh', N'0857040505  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC06', N'Công Ty  VHC Tower', N'Hà Nội', N'03538611515 ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC07', N'Công Ty CN Syscom', N'Bình Dương', N' 0931457534 ')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX01', N'Apple')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX02', N'Lenovo')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX03', N'Alienware')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX04', N'ASUS')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX05', N'Sony')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX06', N'Gateway')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX07', N'Toshiba')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX08', N'HP')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX09', N'Dell')
INSERT [dbo].[NhaSX] ([MaNSX], [TenNSX]) VALUES (N'NSX10', N'Acer')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH01', N'Nguyễn Quang', N' Linh', N'Hà Nội', N'093242841   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH02', N'Tạ Quang', N' Sơn', N'Hà Nội', N'0932894717  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH03', N'Phạm Minh', N' Tuấn', N'Quảng Ninh', N'093841484   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH04', N'Cấn Thị Thùy ', N'Trang', N'Vĩnh Phúc', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH05', N'Nguyễn Thị', N' My', N'Tuyên Quang', N'032489189   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH06', N'Cấn Văn ', N'Long', N'Nghệ Anh', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH07', N'Nguyễn Thị ', N'Huyền', N'Ninh Bình', N'0990392414  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH08', N'Mai Thùy ', N'Trang', N'Hải Phòng', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH09', N'Nguyễn Huyền', N' Trang', N'Hà Nội', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH10', N'Hoàng Văn ', N'Hải', N'Hải Phòng', N'0938271844  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH11', N'Nguyễn Hoàng', N' Du', N'Hải Dương', N'083281284   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH12', N'Nguyễn Hữu', N' Toan', N'Vĩnh Phúc', N'098248414   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH13', N'Đào Văn ', N'Nam', N'Hà Giang', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH14', N'Nguyễn Thị Lan', N' Hương', N'Hà Nội', N'05284438284 ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH15', N'Lê Thị ', N'Hải', N'Hải Phòng', N'038814434   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH16', N'Trịnh Công ', N'Minh', N'Tuyên Quang', N'037903485   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH17', N'Trần Thị ', N'Anh', N'Nghệ An', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH18', N'Trần Văn', N' An', N'Nam Định', N'090390414   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH19', N'Nguyễn Văn ', N'Tiến', N'Bắc Ninh', N'033438484   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH20', N'Phạm Ngọc', N' Tiến', N'Vĩnh Phúc', N'073841849382')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH21', N'Hoàng Thị ', N'Lan', N'Tuyên Quang', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH22', N'Bùi Quang', N' Đức', N'Nam Định', N'0391382443  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH23', N'Bùi Văn', N' Hiên', N'Hà Nam', N'03201489741 ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH24', N'Đặng Thị ', N'Hiền', N'Hà Nội', N'093284641   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH25', N'Nguyễn Phương ', N'Thảo', N'Hải Phòng', N'038753851   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH26', N'Nguyễn Thị ', N'Ngọc', N'Hải Dương', N'093948144   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH27', N'Bùi Thế', N' Anh', N'Hà Tĩnh', N'08918544    ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH28', N'Cao Văn', N' Nam', N'Ninh Bình', N'0839198598  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH29', N'Đặng Văn', N' Cường', N'Quảng Ninh', N'09384738    ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH30', N'Lê Văn ', N'Nam', N'Quảng Ninh', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH31', N'Đặng Văn ', N'Chiến', N'Hà Nội', NULL)
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH32', N'Nguyễn Thế ', N'Lộc', N'Hải Dương', N'0318744784  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH33', N'Lê Minh', N' Đức', N'Hải Dương', N'093841954   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH34', N'Nguyễn Ngọc', N' Sơn', N'Thanh Hóa', N'09148348432 ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH35', N'Đặng Quang ', N'Thành', N'Thanh Hóa', N'0318184938  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH36', N'Nguyễn Quang ', N'Phúc', N'Nghệ An', N'0398318934  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH37', N'Trần Văn', N' Đại', N'Quảng Ninh', N'0489384831  ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH38', N'Trần Kiều', N' Trang', N'Hà Giang', N'093248434   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH39', N'Nguyễn Minh', N' Tú', N'Hà Tĩnh', N'018434743   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH40', N'Nghiêm Anh ', N'Tuấn', N'Hà Nội', N'093894147   ')
INSERT [dbo].[QLKhachHang] ([MaKH], [HoKH], [TenKH], [DiaChi], [SoDT]) VALUES (N'KH41', N'Phạm Minh ', N' Lam', N'Hà Nội', N'090384392   ')
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT01', N'MacBook Air 2020', N'Hoa Kỳ', 1.04, N'NSX01', N'Intel Core i7', 51000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT02', N'MacBook Pro 13 inch 2020', N'Hoa Kỳ', 1.09, N'NSX01', N'Intel Core i5', 70000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT03', N' MacBook Pro 16 inch', N'Hoa Kỳ', 2, N'NSX01', N'Intel Core i3', 36000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT04', N'Mac Mini', N'Cupertino', 0.6, N'NSX01', N'Intel Core i5', 24000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT05', N'MacBook Air Retina 2019', N'CaliFornia', 1.8, N'NSX01', N'Intel Core i3', 33000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT06', N'New macbook 12', N'Hoa Kỳ', 1.3, N'NSX01', N'Intel Core i7', 25200000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT07', N'Macbook Air 13 inch 2017', N'Hoa Kỳ', 1.7, N'NSX01', N'Intel Core i7', 29000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT08', N'Dell Inspiron', N'EngLands', 2.1, N'NSX09', N'Intel Core i5', 21100000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT09', N' Dell Vostro', N'Thái Lan', 2.2, N'NSX09', N'Intel Core i7', 19000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT10', N'Dell Alienware', N'Hàn Quốc', 1.4, N'NSX09', N'Intel Core i5', 26000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT11', N'Dell Precision', N'Hàn Quốc', 1.6, N'NSX09', N'Intel Core i3', 11200000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT12', N'Dell Latitude', N'China', 1.7, N'NSX09', N'Intel Core i3', 15000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT13', N'ASUS ZenBook UX434FA', N'China', 1.5, N'NSX04', N'Intel Core i7', 21000000.0000, 3)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT14', N'ASUS VivoBook A412FA', N'Đài Loan', 1.23, N'NSX04', N'Intel Core i5', 16000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT15', N'ASUS ROG Strix G G531GT', N'Nhật', 1.5, N'NSX04', N'Intel Core i5', 5000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT16', N'ASUS Chromebook Flip C302CA', N'Englands', 1.43, N'NSX04', N'Intel Core i5', 7000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT17', N'ASUS Chromebook C202SA', N'Hàn Quốc', 1.22, N'NSX04', N'Intel Core i5', 13000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT18', N'Lenovo L340 15IRH', N'China', 1.43, N'NSX02', N'Intel Core i7', 21000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT19', N'Lenovo Legion Y530 15 i7 8750H', N'China', 1.66, N'NSX02', N'Intel Core i5', 15000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT20', N'Lenovo IdeaPad S340 14IIL ', N'Đài Loa', 1.44, N'NSX02', N'Intel Core i5', 9000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT21', N' Lenovo Thinkpad ', N'Nhật bản', 1.8, N'NSX02', N'Intel Core i7', 10000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT22', N'HP ProBook 348 G5', N'Nhật bản', 1.56, N'NSX08', N'Intel Core i3', 17000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT23', N'HP Probook 13 i5 8265U', N'Hàn Quốc', 1.44, N'NSX08', N'Intel Core i3', 19000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT24', N'HP Elitebook X360 1030 G3 5AS42PA ', N'Việt Nam', 1.8, N'NSX08', N'Intel Core i5', 18000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT25', N'HP Envy 13 6ZF26PA', N'Việt Nam', 2, N'NSX08', N'Intel Core i5', 15500000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT26', N'HP Zbook studio G3', N'Hàn Quốc', 2.2, N'NSX08', N'Intel Core i7', 21000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT27', N'HP Notebook ', N'Thái Lan', 2.1, N'NSX08', N'Intel Core i7', 12500000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT28', N'HP Omen 17', N'Hoa Kỳ', 1.3, N'NSX08', N'Intel Core i5', 20000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT29', N'HP Chromebook 14', N'Hoa Kì', 1.45, N'NSX08', N'Intel Core i5', 31000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT30', N'HP Spectre x360', N'Hàn quốc', 1.77, N'NSX08', N'Intel Core i5', 15000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT31', N'Sony M series', N'Nhật Bản', 1.8, N'NSX05', N'Intel Core i7', 9500000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT32', N'Sony X series', N'Nhật Bản', 1.95, N'NSX05', N'Intel Core i7', 75000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT33', N'Sony P series', N'Hàn Quốc', 1.42, N'NSX05', N'Intel Core i3', 4000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT34', N'Sony W series', N'Hàn Quốc', 1.54, N'NSX05', N'Intel Core i5', 5500000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT35', N'Sony Y series', N'Nhật Bản', 1.66, N'NSX05', N'Intel Core i7', 11000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT36', N'Sony Vaio Y Series', N'Việt Nam', 1.76, N'NSX05', N'Intel Core i3', 10000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT37', N'Toshiba Chromebook 2', N'Nhật Bản', 1.32, N'NSX07', N'Intel Core i3', 12000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT38', N'Toshiba Satellite Radius', N'Nhật bản', 1.25, N'NSX07', N'Intel Core i5', 6000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT39', N'Toshiba SaTellite P50T-BST2N01', N'Nhật Bản', 1.66, N'NSX07', N'Intel Core i5', 19000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT40', N'Toshiba Portege Z20t ', N'Nhật Bản', 2, N'NSX07', N'Intel Core i3', 14000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT41', N'Acer Spin', N'China', 2.47, N'NSX10', N'Intel Core i7', 15000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT42', N'Acer Aspire ', N'China', 2.3, N'NSX10', N'Intel Core i7', 11000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT43', N'Acer Nitro', N'Đài Loan', 2.5, N'NSX10', N'Intel Core i7', 21000000.0000, 12)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT44', N'Acer Predator', N'Đài Loan', 1.5, N'NSX10', N'Intel Core i3', 15000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT45', N'Gateway MD7800', N'Việt Nam', 1.8, N'NSX06', N'Intel Core i5', 27000000.0000, 6)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT46', N'Gateway TC7800', N'Việt Nam', 1.6, N'NSX06', N'Intel Core i5', 21500000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT47', N'Gateway UC7800', N'Việt Nam', 1.7, N'NSX06', N'Intel Core i3', 22000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT48', N'Gateway LT1000', N'Việt Nam', 1.8, N'NSX06', N'Intel Core i3', 25000000.0000, 9)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT49', N'Alienware 17 R4 – 2016.', N'Việt Nam', 1.9, N'NSX03', N'Intel Core i7', 11000000.0000, 18)
INSERT [dbo].[QLLaptop] ([MaLaptop], [TenLaptop], [XuatXu], [CanNang], [MaNSX], [CauHinh], [DonGia], [TGBH]) VALUES (N'LT50', N'Alienware 17 R5 – 2018', N'Nhật Bản', 1.54, N'NSX03', N'Intel Core i7', 14000000.0000, 12)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV01', N'Bùi Văn', N' Kiên', CAST(N'1999-10-10' AS Date), N'Nam', N'Hà Nội', N'Bán Hàng', N'0948278154  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV02', N'Hoàng Hồng', N' Linh', CAST(N'1995-01-20' AS Date), N'Nữ', N'Bắc Ninh', N'Bán Hàng', N'093829914   ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV03', N'Nguyễn Thị', N' Lan', CAST(N'1997-02-08' AS Date), N'Nữ', N'Hải Dương', N'Bán Hàng', N'083287143   ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV04', N'Đào Thế ', N'Lộc', CAST(N'1990-05-08' AS Date), N'Nam', N'Hà Giang', N'Bán Hàng', N'03837145545 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV05', N'Nguyễn Quỳnh ', N'Như', CAST(N'1999-04-09' AS Date), N'Nữ', N'Nam Định', N'Bán Hàng', N'093281488   ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV06', N'Phạm Thị Lan ', N'Anh', CAST(N'2000-05-02' AS Date), N'Nữ', N'Hưng Yên', N'Bán Hàng', N'03491844    ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV07', N'Ngô Văn ', N'An', CAST(N'2001-05-05' AS Date), N'Nam', N'Hà Nội', N'Bán Hàng', N'035998429481')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV08', N'Bùi Xuân ', N'Đức', CAST(N'1980-03-03' AS Date), N'Nam', N'Vĩnh Phúc', N'Bảo Vệ', N'09384817    ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV09', N'Đặng Văn', N' Tân', CAST(N'1978-04-02' AS Date), N'Nam', N'Vĩnh Phúc', N'Kiểm Kho', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV10', N'Nguyễn Hồng ', N'Nhung', CAST(N'1989-05-05' AS Date), N'Nữ', N'Thanh Hóa', N'Thu Ngân', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV11', N'Đào Anh ', N'Đức', CAST(N'1995-07-08' AS Date), N'Nam', N'Quảng Ninh', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV12', N'Nguyễn Trọng', N' Hiệp', CAST(N'1992-10-02' AS Date), N'Nam', N'Bắc Ninh', N'Bán Hàng', N'09374141483 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV13', N'Ngô Cao ', N'Chiến', CAST(N'1999-02-02' AS Date), N'Nam', N'Cao Bằng', N'Bán Hàng', N'0358942384  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV14', N'Cao Thị', N' Lan', CAST(N'2002-03-03' AS Date), N'Nữ', N'Thanh Hóa', N'Bán Hàng', N'0823417472  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV15', N'Hoàng Ngọc', N' Linh', CAST(N'2000-04-05' AS Date), N'Nữ', N'Hà Giang', N'Bán Hàng', N'09837417    ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV16', N'Hoàng Hồng', N' Hà', CAST(N'2001-05-09' AS Date), N'Nam', N'Hà Nội', N'Bán Hàng', N'02338144734 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV17', N'Nguyễn Quang ', N'Trường', CAST(N'2001-07-09' AS Date), N'Nam', N'Hà Nam', N'Bán Hàng', N'0983481714  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV18', N'Phạm Minh ', N'Đức', CAST(N'1993-09-09' AS Date), N'Nam', N'Hưng Yên', N'Bảo Vệ', N'09348146    ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV19', N'Phạm Thị', N' Tâm', CAST(N'2001-06-18' AS Date), N'Nữ', N'Hà Giang', N'Thu Ngâ', N'082874873   ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV20', N'Hoàng Thị ', N'Lan', CAST(N'1991-05-07' AS Date), N'Nữ', N'Tuyên Quang', N'Kiểm Kho', N'039871348432')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV21', N'Nguyễn Trọng ', N'Dũng', CAST(N'1985-07-07' AS Date), N'Nam', N'Tuyên Quang', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV22', N'Nguyễn Đăng ', N'Dũng', CAST(N'1997-05-03' AS Date), N'Nam', N'Hà Giang', N'Bán Hàng', N'093871741   ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV23', N'Quản Trọng ', N'Hiệp', CAST(N'1997-10-05' AS Date), N'Nam', N'Bắc Ninh', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV24', N'Hoàng Trung ', N'Đức', CAST(N'1998-04-07' AS Date), N'Nam', N'Hà Nam', N'Bán Hàng', N'0983274817  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV25', N'Lê Thị ', N'Hoa', CAST(N'1987-04-05' AS Date), N'Nữ', N'Hà Nam', N'Bán Hàng', N'0374281344  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV26', N'Nguyễn Văn', N' Tân', CAST(N'1970-04-06' AS Date), N'Nam', N'Nam Định', N'Bán Hàng', N'0884147814  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV27', N'Cao Thế', N' Anh', CAST(N'1975-05-07' AS Date), N'Nam', N'Nam Định', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV28', N'Nguyễn Văn', N' Ba', CAST(N'1979-04-04' AS Date), N'Nam', N'Nghệ An', N'Bảo Vệ', N'083247218734')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV29', N'Nguyễn Thị', N' Nhung', CAST(N'1990-04-02' AS Date), N'Nữ', N'Nghệ An', N'Kiểm Kho', N'0990138443  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV30', N'Nguyễn Thị', N' Ngân', CAST(N'1994-05-05' AS Date), N'Nữ', N'Ninh Bình', N'Thu Ngân', N'03834183844 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV31', N'Phạm Thị ', N'Vân', CAST(N'1999-03-02' AS Date), N'Nữ', N'Ninh Bình', N'Bán Hàng', N'09328471474 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV32', N'Nguyễn Minh ', N'Hằng', CAST(N'2000-03-01' AS Date), N'Nữ', N'Hà Nội', N'Bán Hàng', N'0838248184  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV33', N'Chu Thị ', N'Mai', CAST(N'2000-06-08' AS Date), N'Nữ', N'Hà Giang', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV34', N'Nguyễn Thị ', N'Hiền', CAST(N'2001-03-05' AS Date), N'Nữ', N'Nam Định', N'Bán Hàng', NULL)
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV35', N'Nguyễn Tiến', N' An', CAST(N'2000-02-02' AS Date), N'Nam', N'Thanh Hóa', N'Bán Hàng', N'093971438423')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV36', N'Nguyễn Hoàng ', N'Bảo', CAST(N'1997-05-03' AS Date), N'Nam', N'Hải Dương', N'Quản Lý', N'0934881743  ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV37', N'Nguyễn Hoàng ', N'Quân', CAST(N'1992-09-02' AS Date), N'Nam', N'Quảng Ninh', N'Bảo Vệ', N'053914134920')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV38', N'Giáp Văn ', N'Chiến', CAST(N'1999-02-05' AS Date), N'Nam', N'Ba Vì', N'Kiểm kho', N'07093841494 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV39', N'Trần Quang ', N'Huy', CAST(N'2000-04-05' AS Date), N'Nam', N'Ba Vì', N'Quản Lý', N'08309241814 ')
INSERT [dbo].[QLNhanVien] ([MaNV], [HoNV], [TenNV], [NgaySinh], [GioiTinh], [Que], [ChucVu], [SDT]) VALUES (N'NV40', N'Ngô Thế ', N'Lộc', CAST(N'2000-05-08' AS Date), N'Nam', N'Nghệ An', N'Thu Ngân', N'0993204814  ')
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHDB_HoaDonBan] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HoaDonBan] ([MaHDB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [FK_ChiTietHDB_HoaDonBan]
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHDB_QLLaptop] FOREIGN KEY([MaLaptop])
REFERENCES [dbo].[QLLaptop] ([MaLaptop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [FK_ChiTietHDB_QLLaptop]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHDN_HoaDonNhap1] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHDN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [FK_ChiTietHDN_HoaDonNhap1]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHDN_QLLaptop] FOREIGN KEY([MaLapTop])
REFERENCES [dbo].[QLLaptop] ([MaLaptop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [FK_ChiTietHDN_QLLaptop]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_QLKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[QLKhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_QLKhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_QLNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[QLNhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_QLNhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_QLNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[QLNhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_QLNhanVien]
GO
ALTER TABLE [dbo].[QLLaptop]  WITH CHECK ADD  CONSTRAINT [FK_QLLaptop_NhaSX] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSX] ([MaNSX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QLLaptop] CHECK CONSTRAINT [FK_QLLaptop_NhaSX]
GO
USE [master]
GO
ALTER DATABASE [QL_LAPTOP] SET  READ_WRITE 
GO

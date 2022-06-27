CREATE DATABASE BTL_TKCSDL
USE [BTL_TKCSDL]
GO

/****** Object:  Table [dbo].[HangSX]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSX](
	[MaHSX] [nvarchar](5) NOT NULL,
	[TenHSX] [nvarchar](50) NULL,
 CONSTRAINT [pk_HangSX] PRIMARY KEY CLUSTERED 
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[SanPham]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](225) NULL,
	[MaHSX] [nvarchar](5) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [pk_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaSP] [int] NOT NULL,
	[KieuDang] [nvarchar](50) NULL,
	[ManHinh] [nvarchar](20) NULL,
	[HeDieuHanh] [nvarchar](30) NULL,
	[CPU] [nvarchar](30) NULL,
	[RAM] [nvarchar](10) NULL,
	[Pin] [nvarchar](10) NULL,
	[KichThuoc] [nvarchar](30) NULL,
 CONSTRAINT [pk_ChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](7) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](70) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[MaCV] [nvarchar](5) NULL,
 CONSTRAINT [pk_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChucVu]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [nvarchar](5) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](7) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](30) NULL,
 CONSTRAINT [pk_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](225) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [pk_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DonDatHang]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [nvarchar](10) NOT NULL,
	[MaKH] [nvarchar](7) NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
 CONSTRAINT [pk_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChiTietDonDH]    Script Date: 11/02/2021 7:11:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDH](
	[MaDDH] [nvarchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[GiamGia] [money] NULL,
 CONSTRAINT [pk_ChiTietDDH] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](7) NULL,
	[MaKH] [nvarchar](7) NULL,
	[NgayBan] [date] NULL,
 CONSTRAINT [pk_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChiTietHDB]    Script Date: 11/02/2021 7:11:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[MaHDB] [nvarchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [money] NULL,
 CONSTRAINT [pk_ChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDN] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](7) NULL,
	[MaNCC] [nvarchar](10) NULL,
	[NgayNhap] [date] NULL,
 CONSTRAINT [pk_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChiTietHDN]    Script Date: 11/02/2021 7:11:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[MaHDN] [nvarchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [money] NULL,
	[GiamGia] [money] NULL,
 CONSTRAINT [pk_ChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[PhieuNhapKho]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapKho](
	[MaPNK] [nvarchar](10) NOT NULL,
	[MaNCC] [nvarchar](10) NULL,
	[MaNV] [nvarchar](7) NULL,
	[NgayNhap] [date] NULL,
 CONSTRAINT [pk_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 11/02/2021 7:11:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPNK] [nvarchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [pk_ChiTietPNK] PRIMARY KEY CLUSTERED 
(
	[MaPNK] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[PhieuXuatKho]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuatKho](
	[MaPXK] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](7) NULL,
	[NgayXuat] [date] NULL,
 CONSTRAINT [pk_PXK] PRIMARY KEY CLUSTERED 
(
	[MaPXK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ChiTietPhieuXuat]    Script Date: 11/02/2021 7:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuat](
	[MaPXK] [nvarchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [pk_CTPXK] PRIMARY KEY CLUSTERED 
(
	[MaPXK] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'AM', N'Apple Macbook')
INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'AUS', N'Asus')
INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'DL', N'Dell')
INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'HP', N'Laptop HP')
INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'LEN', N'Lenovo')
INSERT [dbo].[HangSX] ([MaHSX], [TenHSX]) VALUES (N'MSI', N' Laptop MSI')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (1, N'Laptop Apple MacBook Air M1 256GB 2020 MGN93SA/A', N'AM', 55)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (2, N'Laptop Dell Vostro 3500 i5', N'DL', 60)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (3, N'Laptop Dell XPS 13-9360 Core i5', N'DL', 40)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (4, N'Laptop Asus FX Pro GL552 i7', N'AUS', 56)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (5, N'Laptop HP Pavilion 15-eg0504TU 46M00PA', N'HP', 48)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (6, N'LENOVO ThinkPad T14 Gen 1 Ryzen 5 Pro', N'LEN', 66)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (7, N'Laptop Asus GL702VT I7', N'AUS', 33)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (8, N'ThinkPad T14s Gen 2 2021 - AMD Ryzen 5 PRO', N'LEN', 54)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (9, N'Laptop HP Envy 2019 13-ah1012tu i7', N'HP', 47)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHSX], [SoLuong]) VALUES (10, N'MacBook Pro 13 inch 2019', N'AM', 36)

INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (1, N'Sang trọng', N'13.3 inch', N'Mac OS', N'Apple M1', N'8 GB', N'49.9Wh', N'1.61 cm x 30.41 cm x 21.24 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (2, N'Sang trọng', N'15.6 icnh', N'Windows 10 Home SL', N' i5 1135G7 2.4GHz', N'8 GB', N'5200 mAh', N'1.99 cm x 36.4 cm x 24.9 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (3, N'Sang trọng', N'13.3 inch', N'Windows 10 Home', N'i5-7200U 2.5GHz', N'8 GB', N'60Wh', N'15.2mm x 304.8mm x 200mm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (4, N'Sang trọng', N'15.6 inch', N'Windows 10 64bit licence', N'i7-6700HQ', N'8 GB', N'5200 mAh', N'2.19 cm x 36.5 cm x 26.6 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (5, N'Sang trọng', N'15.6 inch', N'Windows 10 Home', N'Core i7-1165G7', N'8 GB', N'41WHr', N'1.79 cm x 36.02 cm x 23.4 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (6, N'Sang trọng', N'14 inch', N'Windows 10 Professional', N'AMD Ryzen 5 Pro 4650U', N'8 GB', N'40WHr', N'1.51 cm x 30.1 cm x 21.1 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (7, N'Sang trọng', N'17.3 inch', N'Windows 10 Pro', N'Intel Core i7-6700HQ', N'16 GB', N'8800 mAh ', N'2.47 cm x 42.0 cm x 27.5 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (8, N'Sang trọng', N'14 inch', N'Windows 10 Professional', N'AMD Ryzen 5 PRO 5650U', N'16 GB', N'50Whr', N'1.79 cm x 32.9 cm x 22.7 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (9, N'Sang trọng', N'13.3 inch', N'Windows 10', N'Intel Core i7-8565U', N'8 GB', N'49.9Wh', N'1.49 cm x 30.7 cm x 21.2 cm')
INSERT [dbo].[ChiTietSanPham] ([MaSP], [KieuDang], [ManHinh], [HeDieuHanh], [CPU], [RAM], [Pin], [KichThuoc]) VALUES (10, N'Sang trọng', N'13.3 inch', N'watchOS 5.0', N'Core i5 1.4', N'8 GB', N'58 WH', N'1,49 cm x 30,41 cm x 21,24 cm')

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV01', N'Nguyễn Thuỳ Linh', 1, CAST(N'1998-10-20' AS Date), N'Xuân Đỉnh-Từ Liêm-Hà Nội', N'0986579538', N'BH')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV02', N'Lê Quang Việt', 0, CAST(N'1998-03-25' AS Date), N'Trung Hòa-Cầu Giấy-Hà Nội', N'0969283963', N'BH')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV03', N'Nguyễn Phương Thảo', 1, CAST(N'1996-02-12' AS Date), N'Định Công-Hai Bà Trưng-Hà Nội', N'0975280467', N'KT')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV04', N'Nguyễn Thị Thu Hiền', 1, CAST(N'2000-08-14' AS Date), N'Tây Mỗ-Từ Liêm-Hà Nội', N'0972077896', N'TK')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV05', N'Lý Bá Hùng', 0, CAST(N'1999-12-15' AS Date), N'Hoàng Hoa Thám-Cầu Giấy-Hà Nội', N'0969283259', N'BH')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV06', N'Đặng Hoàng Giang', 0, CAST(N'1997-05-26' AS Date), N'Định Công-Hai Bà Trưng-Hà Nội', N'0969283254', N'TK')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV07', N'Bùi Ngọc', 1, CAST(N'1997-04-01' AS Date), N'Yên Hòa-Cầu Giấy-Hà Nội', N'0945625674', N'BH')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV08', N'Nguyễn Hoàng', 0, CAST(N'1995-04-04' AS Date), N'Văn Bình-Thường Tín-Hà Nội', N'0865874269', N'KT')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV09', N'Thanh Tâm', 1, CAST(N'1996-01-12' AS Date), N'Hoàng Hoa Thám-Cầu Giấy-Hà Nội', N'0945684524', N'BH')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [MaCV]) VALUES (N'NV10', N'Nguyễn Minh', 0, CAST(N'1989-07-05' AS Date), N'Xuân Mai-Chương Mỹ-Hà Nội', N'0875862415', N'BH')

INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'BH', N'Nhân viên bán hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'KT', N'Kế toán trưởng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'TK', N'Thủ kho')

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH01', N'Chu Văn Quang', N'Thanh Vân-Tam Dương-Vĩnh Phúc', N'0975280467', N'chuvanquang96@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH02', N'Nguyễn Ái Tuấn', N'Đội Cấn-Vĩnh Tường-Vĩnh Phúc', N'0989967282', N'nguyen.aituan95@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH03', N'Vũ Hoàng Long', N'Phú Ninh-Phú Xuyên-Hà Nội', N'0975648974', N'longhoang93@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH04', N'Nguyễn Thị Là ', N'Doãn Thái-Vũ Thư-Thái Bình', N'0984388720', N'languyen@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH05', N'Nguyễn Thị Trang', N'Xuân Mai-Chương Mỹ-Hà Nội', N'0979679484', N'nhoccon@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH06', N'Trần Mạnh Hùng', N'Tân Dân-Giao Thuỷ-Nam Định', N'0974896077', N'hungtran11@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH07', N'Nguyễn Thị Hoài Thu', N'Vũ Kế-Thái Thịnh-Ninh Bình', N'0969283259', N'thunguyen1903@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH08', N'Vũ Thuỳ Trang', N'Nguyễn Khang-Cầu Giấy-Hà Nội', N'0972077896', N'vuthuytrang88@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH09', N'Nguyễn Ngọc Anh', N'Văn Bình-Thường Tín-Hà Nội', N'0969283258', N'cophuthuynho2111@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH10', N'Lê Văn Tùng', N'Đằng Hải-Hải An- Hải Phòng', N'0987456322', N'letung03@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH11', N'Trần Văn An', N'Yên Hòa-Cầu Giấy-Hà Nội', N'0845974125', N'tranan369@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Email]) VALUES (N'KH12', N'Vũ Thị Hạnh', N'Đông Hải-Hải An-Hải Phòng', N'0963258741', N'hanhvu789@gmail.com')

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC1', N'Công ty cổ phần thế giới số Trần Anh', N'1174,Đường Láng-Đống Đa,Hà Nội', N'04 3766 7708')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC2', N'Công ty trách nghiệm hữu hạn điện thoại Vân Trung', N'Tầng 3 Tòa nhà 157 Đặng Tiến Đông, Đống Đa, Hà Nội', N'04 3537 5995')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC3', N'Công ty TNHH Máy Tính và Viễn Thông An Khang', N'Số 210 Thái Hà, quận Đống Đa, thành phố Hà Nội', N'04 3456 5678')

INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH01', N'KH01', CAST(N'2020-01-10' AS Date), CAST(N'2020-01-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH02', N'KH02', CAST(N'2020-01-22' AS Date), CAST(N'2020-02-05' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH03', N'KH08', CAST(N'2020-02-06' AS Date), CAST(N'2020-02-24' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH04', N'KH12', CAST(N'2020-03-04' AS Date), CAST(N'2020-03-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH05', N'KH11', CAST(N'2020-03-15' AS Date), CAST(N'2020-04-01' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH06', N'KH08', CAST(N'2020-03-25' AS Date), CAST(N'2020-04-05' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH07', N'KH05', CAST(N'2020-04-23' AS Date), CAST(N'2020-04-30' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH08', N'KH06', CAST(N'2020-05-05' AS Date), CAST(N'2020-05-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH09', N'KH01', CAST(N'2020-06-03' AS Date), CAST(N'2020-06-16' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH10', N'KH04', CAST(N'2020-06-10' AS Date), CAST(N'2020-06-24' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH11', N'KH10', CAST(N'2020-07-18' AS Date), CAST(N'2020-07-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH12', N'KH03', CAST(N'2020-07-29' AS Date), CAST(N'2020-08-05' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH13', N'KH07', CAST(N'2020-08-02' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH14', N'KH09', CAST(N'2020-09-01' AS Date), CAST(N'2020-09-13' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH15', N'KH08', CAST(N'2020-10-03' AS Date), CAST(N'2020-10-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH16', N'KH01', CAST(N'2020-10-25' AS Date), CAST(N'2020-10-28' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH17', N'KH02', CAST(N'2020-11-12' AS Date), CAST(N'2020-11-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH18', N'KH05', CAST(N'2020-12-15' AS Date), CAST(N'2020-12-28' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH19', N'KH07', CAST(N'2020-12-29' AS Date), CAST(N'2021-01-03' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH20', N'KH11', CAST(N'2020-12-30' AS Date), CAST(N'2021-01-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH21', N'KH10', CAST(N'2021-01-25' AS Date), CAST(N'2021-02-07' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH22', N'KH12', CAST(N'2021-01-31' AS Date), CAST(N'2021-02-11' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH23', N'KH04', CAST(N'2021-02-17' AS Date), CAST(N'2021-02-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH24', N'KH03', CAST(N'2021-03-07' AS Date), CAST(N'2021-03-28' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH25', N'KH06', CAST(N'2021-04-10' AS Date), CAST(N'2021-04-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH26', N'KH09', CAST(N'2021-05-11' AS Date), CAST(N'2021-05-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH27', N'KH07', CAST(N'2021-05-25' AS Date), CAST(N'2021-06-07' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH28', N'KH11', CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH29', N'KH12', CAST(N'2021-07-22' AS Date), CAST(N'2021-07-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH30', N'KH08', CAST(N'2021-08-08' AS Date), CAST(N'2021-08-28' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH31', N'KH05', CAST(N'2021-08-16' AS Date), CAST(N'2021-08-30' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH32', N'KH07', CAST(N'2021-09-09' AS Date), CAST(N'2021-09-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH33', N'KH09', CAST(N'2021-09-25' AS Date), CAST(N'2021-09-30' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH34', N'KH03', CAST(N'2021-10-10' AS Date), CAST(N'2021-10-15' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH35', N'KH10', CAST(N'2021-10-22' AS Date), CAST(N'2021-10-25' AS Date))
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao]) VALUES (N'DDH36', N'KH08', CAST(N'2021-10-25' AS Date), CAST(N'2021-11-02' AS Date))

INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH01', 1, 1, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH01', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH02', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH02', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH02', 8, 1, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH03', 1, 2, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH03', 3, 3, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH04', 1, 4, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH04', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH04', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH05', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH05', 8, 1, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH06', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH06', 3, 3, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH06', 10, 3, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH07', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH08', 4, 1, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH08', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH08', 8, 1, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH09', 3, 4, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH09', 6, 3, 22490000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH10', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH11', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH11', 7, 2, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH12', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH12', 3, 1, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH12', 10, 2, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH13', 1, 3, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH13', 2, 5, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH14', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH14', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH14', 10, 2, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH15', 8, 3, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH15', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH15', 10, 3, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH16', 5, 1, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH16', 6, 3, 22490000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH17', 4, 1, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH17', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH18', 9, 4, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH18', 10, 2, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH19', 1, 3, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH19', 6, 1, 22490000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH19', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH20', 7, 5, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH20', 8, 2, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH21', 4, 1, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH21', 6, 2, 22490000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH22', 3, 3, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH22', 5, 7, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH22', 7, 3, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH23', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH23', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH23', 10, 6, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH24', 1, 2, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH24', 3, 3, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH25', 1, 1, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH25', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH25', 7, 5, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH26', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH26', 8, 1, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH27', 1, 2, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH27', 3, 3, 21000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH28', 1, 2, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH28', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH29', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH29', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH29', 10, 4, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH30', 2, 2, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH30', 4, 3, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH30', 6, 1, 22490000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH31', 2, 3, 19000000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH31', 7, 6, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH32', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH32', 8, 1, 25560000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH33', 4, 2, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH33', 7, 3, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH33', 10, 2, 23200000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH34', 1, 3, 27500000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH34', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH34', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH35', 4, 4, 22900000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH35', 5, 2, 23290000, NULL)
INSERT [dbo].[ChiTietDonDH] ([MaDDH], [MaSP], [SoLuong], [DonGia], [GiamGia]) VALUES (N'DDH36', 3, 3, 21000000, NULL)

INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB01', N'NV01', N'KH01', CAST(N'2020-01-03' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB02', N'NV05', N'KH02', CAST(N'2020-01-25' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB03', N'NV07', N'KH09', CAST(N'2020-02-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB04', N'NV09', N'KH06', CAST(N'2020-03-02' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB05', N'NV01', N'KH05', CAST(N'2020-03-15' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB06', N'NV10', N'KH03', CAST(N'2020-04-02' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB07', N'NV02', N'KH04', CAST(N'2020-04-13' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB08', N'NV02', N'KH12', CAST(N'2020-05-03' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB09', N'NV07', N'KH10', CAST(N'2020-06-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB10', N'NV10', N'KH04', CAST(N'2020-06-28' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB11', N'NV01', N'KH06', CAST(N'2020-07-12' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB12', N'NV05', N'KH07', CAST(N'2020-08-15' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB13', N'NV05', N'KH08', CAST(N'2020-09-06' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB14', N'NV07', N'KH09', CAST(N'2020-09-23' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB15', N'NV09', N'KH10', CAST(N'2020-10-03' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB16', N'NV01', N'KH11', CAST(N'2020-10-25' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB17', N'NV02', N'KH01', CAST(N'2020-11-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB18', N'NV09', N'KH02', CAST(N'2020-11-12' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB19', N'NV10', N'KH05', CAST(N'2020-11-15' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB20', N'NV01', N'KH03', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB21', N'NV05', N'KH04', CAST(N'2020-12-26' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB22', N'NV07', N'KH01', CAST(N'2021-01-07' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB23', N'NV09', N'KH02', CAST(N'2021-01-27' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB24', N'NV10', N'KH09', CAST(N'2021-02-13' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB25', N'NV07', N'KH10', CAST(N'2021-03-12' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB26', N'NV01', N'KH05', CAST(N'2021-04-15' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB27', N'NV02', N'KH07', CAST(N'2021-05-23' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB28', N'NV05', N'KH08', CAST(N'2021-06-09' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB29', N'NV01', N'KH11', CAST(N'2021-06-18' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB30', N'NV10', N'KH12', CAST(N'2021-07-25' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB31', N'NV09', N'KH09', CAST(N'2021-08-01' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB32', N'NV02', N'KH06', CAST(N'2021-09-17' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB33', N'NV05', N'KH02', CAST(N'2021-10-11' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB34', N'NV07', N'KH03', CAST(N'2021-10-29' AS Date))
INSERT [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan]) VALUES (N'HDB35', N'NV09', N'KH04', CAST(N'2021-11-02' AS Date))

INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB01', 1, 1, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB01', 2, 9, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB02', 3, 6, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB02', 5, 3, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB02', 6, 8, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB03', 7, 8, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB03', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB03', 8, 2, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB04', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB04', 10, 7, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB05', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB05', 7, 6, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB05', 9, 2, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB06', 1, 9, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB06', 5, 5, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB06', 10, 7, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB07', 6, 1, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB07', 8, 5, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB07', 3, 8, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB07', 2, 4, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB08', 6, 3, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB08', 8, 9, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB08', 10, 6, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB09', 5, 3, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB09', 6, 8, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB10', 1, 7, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB10', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB10', 8, 6, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB11', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB11', 10, 7, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB12', 2, 5, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB12', 7, 6, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB12', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB13', 3, 9, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB13', 5, 5, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB14', 6, 7, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB14', 8, 7, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB14', 1, 5, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB15', 3, 8, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB15', 9, 4, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB15', 10, 4, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB16', 2, 9, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB16', 3, 6, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB17', 5, 3, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB17', 6, 8, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB17', 7, 8, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB18', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB18', 8, 2, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB18', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB19', 2, 7, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB19', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB20', 7, 6, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB20', 9, 12, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB21', 1, 9, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB21', 5, 5, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB21', 10, 7, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB22', 6, 3, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB22', 8, 5, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB23', 3, 8, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB23', 7, 4, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB24', 1, 1, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB24', 2, 9, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB25', 3, 6, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB25', 5, 4, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB25', 7, 8, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB26', 7, 8, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB26', 9, 5, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB27', 8, 7, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB27', 9, 3, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB28', 4, 7, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB28', 6, 5, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB28', 10, 6, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB29', 1, 2, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB29', 5, 9, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB29', 6, 5, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB30', 3, 7, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB30', 6, 3, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB30', 8, 5, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB31', 3, 8, 21000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB31', 5, 4, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB31', 7, 1, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB32', 1, 9, 27500000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB32', 2, 7, 19000000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB32', 5, 3, 23290000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB33', 6, 8, 22490000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB33', 7, 8, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB33', 9, 5, 23390000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB33', 10, 2, 23200000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB34', 4, 3, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB34', 8, 7, 25560000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB35', 4, 5, 22900000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB35', 7, 6, 38100000, NULL)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SoLuong], [DonGiaBan], [GiamGia]) VALUES (N'HDB35', 9, 2, 23390000, NULL)

INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN01', N'NV02', N'NCC2', CAST(N'2020-01-14' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN02', N'NV01', N'NCC1', CAST(N'2020-03-25' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN03', N'NV05', N'NCC3', CAST(N'2020-05-06' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN04', N'NV08', N'NCC1', CAST(N'2020-06-23' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN05', N'NV04', N'NCC2', CAST(N'2020-09-18' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN06', N'NV09', N'NCC3', CAST(N'2020-10-30' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN07', N'NV07', N'NCC3', CAST(N'2020-12-18' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN08', N'NV10', N'NCC1', CAST(N'2021-02-05' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN09', N'NV08', N'NCC2', CAST(N'2021-04-10' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN10', N'NV05', N'NCC1', CAST(N'2021-06-12' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN11', N'NV06', N'NCC2', CAST(N'2021-07-28' AS Date))
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [MaNCC], [NgayNhap]) VALUES (N'HDN12', N'NV04', N'NCC3', CAST(N'2021-10-25' AS Date))

INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN01', 1, 35, 23000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN01', 2, 20, 17000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN01', 7, 30, 25600000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN02', 8, 25, 20300000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN02', 6, 21, 19900000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN02', 5, 15, 19632000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN02', 3, 20, 17800000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN03', 10, 30, 18856000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN03', 9, 35, 18500000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN03', 4, 15, 18688000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN04', 1, 23, 23000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN04', 2, 20, 17000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN04', 4, 25, 18688000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN05', 10, 35, 18856000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN05', 7, 25, 25600000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN05', 8, 20, 20300000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN06', 9, 23, 18500000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN06', 3, 18, 17800000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN06', 6, 32, 19900000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN07', 6, 30, 19900000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN07', 2, 35, 17000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN07', 9, 30, 18500000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN08', 8, 29, 20300000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN08', 1, 24, 23000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN09', 5, 15, 19632000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN09', 3, 20, 17800000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN09', 10, 30, 18856000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN10', 8, 40, 20300000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN10', 4, 19, 18688000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN10', 5, 23, 19632000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN11', 7, 24, 25600000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN11', 2, 25, 17000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN11', 1, 35, 23000000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN11', 10, 20, 18856000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN12', 4, 36, 18688000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN12', 9, 23, 18500000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN12', 3, 27, 17800000, NULL)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SoLuong], [DonGiaNhap], [GiamGia]) VALUES (N'HDN12', 6, 32, 19900000, NULL)

INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'1', N'NCC1', N'NV01', CAST(N'2020-01-20' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'2', N'NCC2', N'NV02', CAST(N'2020-03-11' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'3', N'NCC3', N'NV05', CAST(N'2020-06-01' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'4', N'NCC2', N'NV04', CAST(N'2020-10-05' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'5', N'NCC3', N'NV06', CAST(N'2021-01-16' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'6', N'NCC2', N'NV04', CAST(N'2021-04-25' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'7', N'NCC1', N'NV05', CAST(N'2021-07-07' AS Date))
INSERT [dbo].[PhieuNhapKho] ([MaPNK], [MaNCC], [MaNV], [NgayNhap]) VALUES (N'8', N'NCC3', N'NV06', CAST(N'2021-10-19' AS Date))

INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'1', 1, 20)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'1', 2, 15)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'1', 5, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'2', 1, 20)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'2', 6, 25)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'2', 3, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'3', 4, 35)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'3', 8, 20)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'3', 10, 10)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'4', 7, 25)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'4', 9, 15)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'4', 2, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'5', 9, 25)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'5', 7, 35)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'5', 5, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'6', 8, 23)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'6', 6, 19)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'6', 3, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'7', 1, 35)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'7', 4, 25)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'7', 10, 15)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'8', 7, 30)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'8', 9, 40)
INSERT [dbo].[ChiTietPhieuNhap] ([MaPNK], [MaSP], [SoLuong]) VALUES (N'8', 2, 30)

INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'1', N'NV01', CAST(N'2020-01-11' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'2', N'NV03', CAST(N'2020-03-05' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'3', N'NV04', CAST(N'2020-05-15' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'4', N'NV06', CAST(N'2020-06-27' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'5', N'NV05', CAST(N'2020-09-26' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'6', N'NV01', CAST(N'2020-11-21' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'7', N'NV06', CAST(N'2021-01-09' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'8', N'NV02', CAST(N'2021-02-15' AS Date))
INSERT [dbo].[PhieuXuatKho] ([MaPXK], [MaNV], [NgayXuat]) VALUES (N'9', N'NV04', CAST(N'2021-05-07' AS Date))

INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'1', 1, 5)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'1', 2, 10)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'2', 1, 8)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'2', 3, 4)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'2', 6, 12)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'3', 4, 7)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'3', 7, 13)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'3', 2, 9)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'4', 8, 11)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'4', 5, 15)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'4', 9, 19)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'5', 10, 9)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'5', 6, 6)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'5', 3, 10)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'6', 7, 5)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'6', 2, 10)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'7', 1, 8)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'7', 9, 7)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'7', 6, 12)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'8', 5, 10)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'8', 4, 13)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'8', 3, 20)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'9', 8, 11)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'9', 10, 15)
INSERT [dbo].[ChiTietPhieuXuat] ([MaPXK], [MaSP], [SoLuong]) VALUES (N'9', 7, 5)


ALTER TABLE [dbo].[ChiTietDonDH]  WITH CHECK ADD  CONSTRAINT [fk_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDH] CHECK CONSTRAINT [fk_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDH]  WITH CHECK ADD  CONSTRAINT [fk_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDH] CHECK CONSTRAINT [fk_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonBan] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HoaDonBan] ([MaHDB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [fk_HoaDonBan]
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [fk_SanPhamHDB] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [fk_SanPhamHDB]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonNhap] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHDN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [fk_HoaDonNhap]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [fk_SanPhamHDN] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [fk_SanPhamHDN]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_PhieuNhapKho] FOREIGN KEY([MaPNK])
REFERENCES [dbo].[PhieuNhapKho] ([MaPNK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [fk_PhieuNhapKho]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [fk_SP]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [fk_CTPXK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [fk_CTPXK]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [fk_PhieuXuatKho] FOREIGN KEY([MaPXK])
REFERENCES [dbo].[PhieuXuatKho] ([MaPXK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [fk_PhieuXuatKho]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [fk_ChiTietSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [fk_ChiTietSP]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [fk_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [fk_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_KhachHangHD] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_KhachHangHD]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_NhanVienHD] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_NhanVienHD]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_NhaCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [fk_NhaCC]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [fk_NCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhapKho] CHECK CONSTRAINT [fk_NCC]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [fk_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [fk_NV]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_Hangsx] FOREIGN KEY([MaHSX])
REFERENCES [dbo].[HangSX] ([MaHSX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_Hangsx]
GO
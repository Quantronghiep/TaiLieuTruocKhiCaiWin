create  database x
USE [x]


/****** Object:  Table [dbo].[HangPhim]    Script Date: 11/16/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangPhim](
	[ID_HangPhim] [nchar](10) NOT NULL,
	[TenHangPhim] [nvarchar](200) NULL,
 CONSTRAINT [PK_HangPhimm] PRIMARY KEY CLUSTERED 
(
	[ID_HangPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 11/16/2021 9:26:47 PM ******/
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
/****** Object:  Table [dbo].[Phim]    Script Date: 11/16/2021 9:26:47 PM ******/
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
	[TenNamChinh] [nvarchar](100) NULL,
	[TenNuChinh] [nvarchar](100) NULL,
	[DoTuoi] [int] NULL,
	[Poster] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[ID_Phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/16/2021 9:26:47 PM ******/
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
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Ve]    Script Date: 11/16/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[ID_Ve] [nchar](10) NOT NULL,
	[ID_BuoiChieu] [nchar](10) NOT NULL,
	[ID_Ghe] [nchar](10) NOT NULL,
	[ID_KH] [nchar](10) NOT NULL,
	[ID_NV] [nchar](10) NOT NULL,
	[TienVe] [money] NULL,
	[ThoiGianDatVe] [time](7) NULL,
	[PhuongThucThanhToan] [bit] NULL,
 CONSTRAINT [PK_VePhim] PRIMARY KEY CLUSTERED 
(
	[ID_Ve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuoiChieu]    Script Date: 11/16/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuoiChieu](
	[ID_BuoiChieu] [nchar](10) NOT NULL,
	[ID_Phim] [nchar](10) NOT NULL,
	[ID_RapPhim] [nchar](10) NOT NULL,
	[ID_PhongChieu] [nchar](10) NOT NULL,
	[NgayChieu] [date] NULL,
	[GioChieu] [float] NULL,
	[GiaVe] [money] NULL,
 CONSTRAINT [PK_BuoiChieu] PRIMARY KEY CLUSTERED 
(
	[ID_BuoiChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GheNgoi]    Script Date: 11/16/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GheNgoi](
	[ID_Ghe] [nchar](10) NOT NULL,
	[ID_PhongChieu] [nchar](10) NOT NULL,
	[TenGheNgoi] [nvarchar](50) NULL,
	[LoaiGhe] [nvarchar](50) NULL,
 CONSTRAINT [PK_GheNgoi] PRIMARY KEY CLUSTERED 
(
	[ID_Ghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/16/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KH] [nchar](10) NOT NULL,
	[HoKH] [nvarchar](100) NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [nchar](15) NULL,
	[CCCD] [nchar](20) NULL,
	[TheSV] [nchar](20) NULL,
	[NgaySinh] [date] NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[DiemTichLuy] [int] NULL,
	[CapBac] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 11/16/2021 9:26:47 PM ******/
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
/****** Object:  Table [dbo].[RapPhim]    Script Date: 11/16/2021 9:26:47 PM ******/
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
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC00      ', N'Phim00    ', N'RP01      ', N'PC00      ', CAST(N'2020-04-20' AS Date), 10, 70000.0000)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC01      ', N'Phim01    ', N'RP00      ', N'PC00      ', CAST(N'2020-04-20' AS Date), 20, 90000.0000)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC02      ', N'Phim01    ', N'RP01      ', N'PC01      ', CAST(N'2020-10-20' AS Date), 19, 90000.0000)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC03      ', N'Phim00    ', N'RP02      ', N'PC01      ', CAST(N'2020-04-20' AS Date), 17.3, 90000.0000)
GO
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe00     ', N'PC00      ', N'Ghế 00', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe01     ', N'PC02      ', N'Ghế 01', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe02     ', N'PC01      ', N'Ghế 02 ', N'Vip')
GO
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang00    ', N'Bình Minh')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang01    ', N'Rạng Đông')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang02    ', N'Disney')
GO
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH00      ', N'Nguyễn Đình', N'Nam', N'094357246      ', N'4654756257          ', NULL, CAST(N'2000-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH01      ', N'Chu Thị', N'Trang', N'091726746      ', N'657676              ', NULL, CAST(N'1994-03-09' AS Date), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'LP00      ', N'Kinh Dị')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'LP01      ', N'Viễn Tưởng')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'LP02      ', N'Tình Cảm')
GO
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password]) VALUES (N'NV00      ', N'RP00      ', N'Nguyễn Đăng', N'Dũng      ', N'Nam Định', N'034912345', N'Quản Lý   ', CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password]) VALUES (N'NV01      ', N'RP01      ', N'Trần Văn', N'Nam       ', N'Hà Nội', N'014567238', N'Bán Vé    ', CAST(N'1993-03-09T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password]) VALUES (N'NV02      ', N'RP01      ', N'Phạm Thị', N'Tâm       ', N'Hà Giang', N'045872145', N'Bán Vé    ', CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim00    ', N'LP00      ', N'Hang00    ', N'Tôi thấy hoa vàng trên cỏ xanh', N'VN', 180, CAST(N'2019-04-20' AS Date), N'Trần', N'Nghĩa', NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim01    ', N'LP02      ', N'Hang01    ', N'Mắt Biếc', N'VN', 150, CAST(N'2020-12-20' AS Date), N'Chu Hà', N'Lan', NULL, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC00      ', N'RP01      ', N'Phòng Phim 0', 100)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC01      ', N'RP00      ', N'Phòng Phim 1', 150)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC02      ', N'RP02      ', N'Phòng Phim 2', 200)
GO
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP00      ', N'Lotte', N'Hà Nội')
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP01      ', N'Vincom', N'Hà Nam')
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP02      ', N'BHD', N'Nam Định')
GO
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'Ve00      ', N'BC00      ', N'Ghe01     ', N'KH00      ', N'NV00      ', 70000.0000, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'Ve01      ', N'BC01      ', N'Ghe02     ', N'KH01      ', N'NV01      ', 100000.0000, NULL, NULL)
GO
ALTER TABLE [dbo].[BuoiChieu]  WITH CHECK ADD  CONSTRAINT [FK_BuoiChieu_Phim] FOREIGN KEY([ID_Phim])
REFERENCES [dbo].[Phim] ([ID_Phim])
GO
ALTER TABLE [dbo].[BuoiChieu] CHECK CONSTRAINT [FK_BuoiChieu_Phim]
GO
ALTER TABLE [dbo].[BuoiChieu]  WITH CHECK ADD  CONSTRAINT [FK_BuoiChieu_PhongChieu] FOREIGN KEY([ID_PhongChieu])
REFERENCES [dbo].[PhongChieu] ([ID_PhongChieu])
GO
ALTER TABLE [dbo].[BuoiChieu] CHECK CONSTRAINT [FK_BuoiChieu_PhongChieu]
GO
ALTER TABLE [dbo].[BuoiChieu]  WITH CHECK ADD  CONSTRAINT [FK_BuoiChieu_RapPhim] FOREIGN KEY([ID_RapPhim])
REFERENCES [dbo].[RapPhim] ([ID_RapPhim])
GO
ALTER TABLE [dbo].[BuoiChieu] CHECK CONSTRAINT [FK_BuoiChieu_RapPhim]
GO
ALTER TABLE [dbo].[GheNgoi]  WITH CHECK ADD  CONSTRAINT [FK_GheNgoi_PhongChieu] FOREIGN KEY([ID_PhongChieu])
REFERENCES [dbo].[PhongChieu] ([ID_PhongChieu])
GO
ALTER TABLE [dbo].[GheNgoi] CHECK CONSTRAINT [FK_GheNgoi_PhongChieu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_RapPhim] FOREIGN KEY([ID_RapPhim])
REFERENCES [dbo].[RapPhim] ([ID_RapPhim])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_RapPhim]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_HangPhim] FOREIGN KEY([ID_HangPhim])
REFERENCES [dbo].[HangPhim] ([ID_HangPhim])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_HangPhim]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_LoaiPhim1] FOREIGN KEY([ID_LoaiPhim])
REFERENCES [dbo].[LoaiPhim] ([ID_LoaiPhim])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_LoaiPhim1]
GO
ALTER TABLE [dbo].[PhongChieu]  WITH CHECK ADD  CONSTRAINT [FK_PhongChieu_RapPhim] FOREIGN KEY([ID_RapPhim])
REFERENCES [dbo].[RapPhim] ([ID_RapPhim])
GO
ALTER TABLE [dbo].[PhongChieu] CHECK CONSTRAINT [FK_PhongChieu_RapPhim]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_BuoiChieu] FOREIGN KEY([ID_BuoiChieu])
REFERENCES [dbo].[BuoiChieu] ([ID_BuoiChieu])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_BuoiChieu]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_GheNgoi] FOREIGN KEY([ID_Ghe])
REFERENCES [dbo].[GheNgoi] ([ID_Ghe])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_GheNgoi]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_KhachHang] FOREIGN KEY([ID_KH])
REFERENCES [dbo].[KhachHang] ([ID_KH])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_KhachHang]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_NhanVien] FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_NhanVien]
GO


Create database [Phim]

USE [Phim]
GO
/****** Object:  User [userTrungDuc]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userTrungDuc] FOR LOGIN [TrungDuc] WITH DEFAULT_SCHEMA=[userTrungDuc]
GO
/****** Object:  User [userTam]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userTam] FOR LOGIN [Tam] WITH DEFAULT_SCHEMA=[userTam]
GO
/****** Object:  User [userNgan]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userNgan] FOR LOGIN [Ngan] WITH DEFAULT_SCHEMA=[userNgan]
GO
/****** Object:  User [userHiep]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userHiep] FOR LOGIN [Hiep] WITH DEFAULT_SCHEMA=[userHiep]
GO
/****** Object:  User [userDung]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userDung] FOR LOGIN [Dung] WITH DEFAULT_SCHEMA=[userDung]
GO
/****** Object:  User [userAnhDuc]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE USER [userAnhDuc] FOR LOGIN [AnhDuc] WITH DEFAULT_SCHEMA=[userAnhDuc]
GO
/****** Object:  DatabaseRole [Supervisor]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE ROLE [Supervisor]
GO
/****** Object:  DatabaseRole [Management]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE ROLE [Management]
GO
/****** Object:  DatabaseRole [Guestt]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE ROLE [Guestt]
GO
/****** Object:  DatabaseRole [Employee]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE ROLE [Employee]
GO
ALTER ROLE [Employee] ADD MEMBER [userTrungDuc]
GO
ALTER ROLE [Supervisor] ADD MEMBER [userTam]
GO
ALTER ROLE [Guestt] ADD MEMBER [userNgan]
GO
ALTER ROLE [Management] ADD MEMBER [userHiep]
GO
ALTER ROLE [Management] ADD MEMBER [userDung]
GO
ALTER ROLE [Employee] ADD MEMBER [userAnhDuc]
GO
/****** Object:  Schema [Employee]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [Employee]
GO
/****** Object:  Schema [Guestt]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [Guestt]
GO
/****** Object:  Schema [Management]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [Management]
GO
/****** Object:  Schema [Supervisor]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [Supervisor]
GO
/****** Object:  Schema [userAnhDuc]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userAnhDuc]
GO
/****** Object:  Schema [userDung]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userDung]
GO
/****** Object:  Schema [userHiep]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userHiep]
GO
/****** Object:  Schema [userNgan]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userNgan]
GO
/****** Object:  Schema [userTam]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userTam]
GO
/****** Object:  Schema [userTrungDuc]    Script Date: 11/26/2021 11:18:26 PM ******/
CREATE SCHEMA [userTrungDuc]
GO
/****** Object:  UserDefinedFunction [dbo].[DoanhThu]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DoanhThu](@ngay date)
returns float
as
begin
	declare @sum float
	select @sum = sum(TienVe) from Ve join BuoiChieu on Ve.ID_BuoiChieu = BuoiChieu.ID_BuoiChieu
	WHERE cast(NgayChieu as date) =  @ngay 
	return @sum
end
GO
/****** Object:  UserDefinedFunction [dbo].[DoanhThuPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DoanhThuPhim](@ID_Phim nchar(10))
returns float
begin
	declare @DoanhThu float
	select @DoanhThu=Sum(GiaVe)
	from  DonDatVe_Phim 
	where ID_Phim=@ID_Phim
	return @DoanhThu
end
GO
/****** Object:  UserDefinedFunction [dbo].[LuotXemPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   function [dbo].[LuotXemPhim] (@TenPhim nvarchar(100))
Returns int
as
begin
	declare @luotxem int
	select @luotxem= count(Phim.ID_Phim)
	from Ve join BuoiChieu on Ve.ID_BuoiChieu=BuoiChieu.ID_BuoiChieu
	        join  Phim on Phim.ID_Phim=BuoiChieu.ID_Phim
	where TenPhim like @TenPhim 
	return @luotxem
end
GO
/****** Object:  UserDefinedFunction [dbo].[sinhMaBC]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[sinhMaBC]() 
returns nchar(10)
as
begin 
	declare @max int
	Select @max = max(cast(substring(ID_BuoiChieu,3,2) as int)) + 1
	from BuoiChieu
	declare @a nchar(10)
	set @a = '0' + RTRIM(Cast(@max as nchar(4)))
	set @a = 'BC' + RIGHT(@a,10)
	return @a
end
GO
/****** Object:  UserDefinedFunction [dbo].[SoNgay]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[SoNgay](@date1 date,@date2 date)
returns int
as
begin
	declare @ngay int
	set @ngay= DateDiff(day,@date1,@date2)
	return @ngay
end
GO
/****** Object:  Table [dbo].[HangPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  Table [dbo].[Phim]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  Table [dbo].[BuoiChieu]    Script Date: 11/26/2021 11:18:26 PM ******/
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
	[GioChieu] [time](7) NULL,
	[GiaVe] [money] NULL,
 CONSTRAINT [PK_BuoiChieu] PRIMARY KEY CLUSTERED 
(
	[ID_BuoiChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ve]    Script Date: 11/26/2021 11:18:26 PM ******/
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
	[PhuongThucThanhToan] [nvarchar](50) NULL,
 CONSTRAINT [PK_VePhim] PRIMARY KEY CLUSTERED 
(
	[ID_Ve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ThongKeVeBanDuocCuaHangPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[ThongKeVeBanDuocCuaHangPhim]
AS
SELECT HangPhim.ID_HangPhim,TenHangPhim,
	   isnull(count(case month (NgayChieu) when 1 then ID_Ve end),0) as Thang1,
	   isnull(count(case month (NgayChieu) when 2 then ID_Ve end),0) as Thang2,
	   isnull(count(case month (NgayChieu) when 3 then ID_Ve end),0) as Thang3,
	   isnull(count(case month (NgayChieu) when 4 then  ID_Ve end),0) as Thang4,
	   isnull(count(case month (NgayChieu) when 5 then  ID_Ve end),0) as Thang5,
	   isnull(count(case month (NgayChieu) when 6 then  ID_Ve end),0) as Thang6,
	   isnull(count(case month (NgayChieu) when 7 then  ID_Ve end),0) as Thang7,
	   isnull(count(case month (NgayChieu) when 8 then  ID_Ve end),0) as Thang8,
	   isnull(count(case month (NgayChieu) when 9 then ID_Ve end),0) as Thang9,
	   isnull(count(case month (NgayChieu) when 10 then  ID_Ve end),0) as Thang10,
	   isnull(count(case month (NgayChieu) when 11 then  ID_Ve end),0) as Thang11,
	   isnull(count(case month (NgayChieu) when 12 then  ID_Ve end),0) as Thang12,
	   isnull(COUNT(ID_Ve ),0) as Canam 
FROM HangPhim join Phim on HangPhim.ID_HangPhim=Phim.ID_HangPhim
			  join BuoiChieu on BuoiChieu.ID_Phim=Phim.ID_Phim
			  join Ve on Ve.ID_BuoiChieu=BuoiChieu.ID_BuoiChieu
--Where YEAR(NgayChieu)=2020
group by HangPhim.ID_HangPhim,TenHangPhim
GO
/****** Object:  Table [dbo].[RapPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/26/2021 11:18:26 PM ******/
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
	[HSL] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BangLuongNV]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
cREATE   VIEW [dbo].[BangLuongNV] 
AS
SELECT ID_NV,HoNV+' '+ TenNV as HoVaTen,ChucVu ,
	   iif(ChucVu=N'Quản Lý',200000,100000) as TroCap,
	   ((HSL*2500000)+ iif(ChucVu=N'Quản Lý',200000,100000)) as Luong,
		NhanVien.Id_RapPhim as RP,TenRapPhim,RapPhim.DiaChi
FROM NhanVien join RapPhim on NhanVien.ID_RapPhim=RapPhim.ID_RapPhim
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_ThongTinPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[FUNC_ThongTinPhim](@hangphim nvarchar(100))
Returns table
as
Return
	Select TenPhim as N'Tên phim' ,NuocSX as N'Nước sản xuất',ThoiLuong as N'Thời lượng',NamSX as N'Năm sản xuất',HoDaoDien  +' ' + TenDaoDien as N'Đạo diễn', TenNamChinh as 'Nam chính',TenNuChinh as N'Nữ chính',DoTuoi as N'Độ tuổi'
	from Phim join HangPhim on Phim.ID_HangPhim=HangPhim.ID_HangPhim
	where (Phim.ID_HangPhim like N'%'+@hangphim+N'%') OR (TenHangPhim like N'%'+@hangphim+N'%') OR (TenPhim like N'%'+@hangphim+N'%') OR (TenNamChinh like N'%'+@hangphim+N'%') OR (TenNuChinh like N'%'+@hangphim+N'%')
GO
/****** Object:  Table [dbo].[GheNgoi]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnc_TTLoaiGheNgoi]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnc_TTLoaiGheNgoi] (@LoaiGhe nvarchar(50))
returns table
as
return
	select * from GheNgoi where LoaiGhe = @LoaiGhe
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_TTGheNgoi]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnc_TTGheNgoi] (@IDPC nvarchar(50))
returns table
as
return
	select * from GheNgoi where ID_PhongChieu = @IDPC
GO
/****** Object:  UserDefinedFunction [dbo].[TongVe]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    function [dbo].[TongVe]()
returns table
as
	return
	select MONTH(NgayChieu) as Thang , count(ID_Ve) as TongVe 
	from Ve join BuoiChieu on BuoiChieu.ID_BuoiChieu = Ve.ID_BuoiChieu
	WHERE YEAR(NgayChieu) = 2021
	group by month(NgayChieu)
GO
/****** Object:  UserDefinedFunction [dbo].[ChucVu]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ChucVu](@ChucVu NVARCHAR) RETURNS TABLE
RETURN (
        SELECT
               NV.ID_NV,
               CONCAT(NV.HONV,' ',NV.TENNV) AS HoVaTen
        FROM dbo.NhanVien NV
       WHERE NV.ChucVu LIKE '%'+@ChucVu+'%'
    )
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
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
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 11/26/2021 11:18:26 PM ******/
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
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC01      ', N'Phim02    ', N'RP00      ', N'PC00      ', CAST(N'2021-09-08' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC02      ', N'Phim04    ', N'RP00      ', N'PC01      ', CAST(N'2021-07-06' AS Date), CAST(N'15:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC03      ', N'Phim07    ', N'RP00      ', N'PC02      ', CAST(N'2021-10-10' AS Date), CAST(N'11:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC04      ', N'Phim02    ', N'RP00      ', N'PC07      ', CAST(N'2021-11-12' AS Date), CAST(N'14:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC05      ', N'Phim05    ', N'RP00      ', N'PC08      ', CAST(N'2021-10-10' AS Date), CAST(N'17:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC06      ', N'Phim01    ', N'RP00      ', N'PC07      ', CAST(N'2021-11-11' AS Date), CAST(N'19:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC07      ', N'Phim07    ', N'RP00      ', N'PC09      ', CAST(N'2021-10-10' AS Date), CAST(N'21:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC08      ', N'Phim04    ', N'RP00      ', N'PC02      ', CAST(N'2011-12-11' AS Date), CAST(N'22:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC09      ', N'Phim07    ', N'RP00      ', N'PC04      ', CAST(N'2021-10-09' AS Date), CAST(N'13:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC10      ', N'Phim03    ', N'RP00      ', N'PC10      ', CAST(N'2021-06-06' AS Date), CAST(N'15:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC11      ', N'Phim00    ', N'RP01      ', N'PC11      ', CAST(N'2021-04-08' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC12      ', N'Phim01    ', N'RP01      ', N'PC15      ', CAST(N'2021-03-06' AS Date), CAST(N'15:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC13      ', N'Phim06    ', N'RP01      ', N'PC17      ', CAST(N'2021-11-12' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC14      ', N'Phim05    ', N'RP01      ', N'PC20      ', CAST(N'2021-01-12' AS Date), CAST(N'14:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC15      ', N'Phim05    ', N'RP01      ', N'PC14      ', CAST(N'2021-02-10' AS Date), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC16      ', N'Phim01    ', N'RP01      ', N'PC11      ', CAST(N'2021-03-11' AS Date), CAST(N'20:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC17      ', N'Phim02    ', N'RP01      ', N'PC21      ', CAST(N'2021-04-10' AS Date), CAST(N'21:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC18      ', N'Phim04    ', N'RP01      ', N'PC11      ', CAST(N'2021-05-11' AS Date), CAST(N'11:00:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC19      ', N'Phim07    ', N'RP01      ', N'PC12      ', CAST(N'2021-06-09' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC20      ', N'Phim03    ', N'RP01      ', N'PC13      ', CAST(N'2021-07-06' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC21      ', N'Phim02    ', N'RP01      ', N'PC15      ', CAST(N'2021-09-08' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC22      ', N'Phim04    ', N'RP01      ', N'PC16      ', CAST(N'2021-08-06' AS Date), CAST(N'15:30:00' AS Time), NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC23      ', N'Phim07    ', N'RP01      ', N'PC18      ', CAST(N'2021-05-20' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC24      ', N'Phim02    ', N'RP00      ', N'PC01      ', CAST(N'2021-11-11' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC25      ', N'Phim05    ', N'RP00      ', N'PC02      ', CAST(N'2021-12-09' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC26      ', N'Phim01    ', N'RP00      ', N'PC03      ', CAST(N'2021-11-11' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC27      ', N'Phim07    ', N'RP00      ', N'PC04      ', CAST(N'2021-08-06' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC28      ', N'Phim04    ', N'RP00      ', N'PC05      ', CAST(N'2021-01-01' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC29      ', N'Phim08    ', N'RP00      ', N'PC06      ', CAST(N'2021-11-08' AS Date), NULL, NULL)
INSERT [dbo].[BuoiChieu] ([ID_BuoiChieu], [ID_Phim], [ID_RapPhim], [ID_PhongChieu], [NgayChieu], [GioChieu], [GiaVe]) VALUES (N'BC30      ', N'Phim08    ', N'RP00      ', N'PC07      ', CAST(N'2021-06-06' AS Date), NULL, NULL)
GO
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe00     ', N'PC00      ', N'Ghế 00 - PC00', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe01     ', N'PC00      ', N'Ghế 01 - PC00', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe02     ', N'PC00      ', N'Ghế 02 - PC00 ', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe03     ', N'PC00      ', N'Ghế 03- PC00', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe04     ', N'PC00      ', N'Ghế 01- PC00', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe05     ', N'PC00      ', N'Ghế 05 - Phòng 00 ', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe06     ', N'PC00      ', N'Ghế 06 - Phòng 00 ', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe07     ', N'PC00      ', N'Ghế 07 - Phòng 00 ', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe08     ', N'PC00      ', N'Ghế 08-Phòng 00 ', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe09     ', N'PC00      ', N'Ghế 09 - Phòng 00', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe10     ', N'PC00      ', N'Ghế 10- Phòng 00 ', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe11     ', N'PC01      ', N'Ghế 11 - Phòng 00 ', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe12     ', N'PC01      ', N'Ghế 00 - Phòng 01', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe13     ', N'PC01      ', N'Ghế 01- Phòng 01', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe14     ', N'PC01      ', N'Ghế 02- Phòng 01 ', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe15     ', N'PC01      ', N'Ghế 03-- Phòng 01', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe16     ', N'PC01      ', N'Ghế 04-- Phòng 01', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe17     ', N'PC01      ', N'Ghế 05- - Phòng 01 ', N'VThuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe18     ', N'PC01      ', N'Ghế 06- - Phòng 01', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe19     ', N'PC01      ', N'Ghế 07- - Phòng 01', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe20     ', N'PC01      ', N'Ghế 08-- Phòng 01 ', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe21     ', N'PC01      ', N'Ghế 09-- Phòng 01', N'Vip')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe22     ', N'PC01      ', N'Ghế 10-- Phòng 01', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe23     ', N'PC01      ', N'Ghế 11-- Phòng 01 ', N'Thuong')
INSERT [dbo].[GheNgoi] ([ID_Ghe], [ID_PhongChieu], [TenGheNgoi], [LoaiGhe]) VALUES (N'Ghe24     ', N'PC01      ', N'Ghế 12-- Phòng 01', N'Vip')
GO
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'DW        ', N'Dream Works')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'GL        ', N'Galaxy Studio')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang00    ', N'Bình Minh')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang01    ', N'Rạng Đông')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Hang02    ', N'Disney')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'MS        ', N'Marvel Studios')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'Pixar     ', N'Pixar')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'SPS       ', N'Sony Pictures Studios')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'UP        ', N'Warner Bros')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'WB        ', N'Warner Bros')
INSERT [dbo].[HangPhim] ([ID_HangPhim], [TenHangPhim]) VALUES (N'WD        ', N'Warner Bros')
GO
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH00      ', N'Nguyễn Đình', N'Nam', N'094357246      ', N'4654756257          ', NULL, CAST(N'2000-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH01      ', N'Chu Thị', N'Trang', N'091726746      ', N'657676              ', NULL, CAST(N'1994-03-09' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH02      ', N'Mai Thùy', N'Trang', N'09890987       ', N'67876533            ', NULL, CAST(N'2001-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH03      ', N'Lê Thị', N'Ngọc', N'09096876       ', N'3452452             ', NULL, CAST(N'2002-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH04      ', N'Đình Mạnh', N'Huy', N'098797632      ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH05      ', N'Nguyễn Đình', N'Kiều', N'094357246      ', N'4654756257          ', NULL, CAST(N'2003-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH06      ', N'Chu Thị', N'Hiền', N'091726746      ', N'657676              ', NULL, CAST(N'1994-03-09' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH07      ', N'Mai Thùy', N'Liên', N'09890987       ', N'67876533            ', NULL, CAST(N'1999-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH08      ', N'Lê Thị', N'Hứa', N'09096876       ', NULL, NULL, CAST(N'2000-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH09      ', N'Đình Mạnh', N'Đức', N'098797632      ', NULL, N'67658729            ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH10      ', N'Nguyễn Đình', N'Tuấn', N'094357246      ', N'4654756257          ', NULL, CAST(N'2000-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH11      ', N'Chu Thị', N'Miên', N'091726746      ', N'657676              ', NULL, CAST(N'1994-03-09' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH12      ', N'Mai Thùy', N'Nụ', N'09890987       ', N'67876533            ', NULL, CAST(N'1998-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH13      ', N'Lê Thị', N'Hoa', N'09096876       ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH14      ', N'Đình Mạnh', N'Văn', N'098797632      ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH15      ', N'Nguyễn Đình', N'An', N'094357246      ', N'4654756257          ', NULL, CAST(N'2000-03-19' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH16      ', N'Chu Thị', N'Hồng', N'091726746      ', N'657676              ', NULL, CAST(N'1994-03-09' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH17      ', N'Mai Thùy', N'Kiều', N'09890987       ', N'67876533            ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH18      ', N'Lê Thị', N'Ngọc', N'09096876       ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([ID_KH], [HoKH], [TenKH], [SDT], [CCCD], [TheSV], [NgaySinh], [UserName], [Password], [DiemTichLuy], [CapBac]) VALUES (N'KH19      ', N'Đình Mạnh', N'Hiền', N'098797632      ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'GĐ        ', N'Gia Đình')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'HD        ', N'Hành Động')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'HH        ', N'Hài Hước')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'KD        ', N'Kinh Dị')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'LS        ', N'LS')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'TC        ', N'Tình Cảm')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'TL        ', N'Tài Liệu')
INSERT [dbo].[LoaiPhim] ([ID_LoaiPhim], [TenLoaiPhim]) VALUES (N'VT        ', N'Viễn Tưởng')
GO
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV00      ', N'RP00      ', N'Nguyễn Đăng', N'Toan      ', N'Nam Định', N'034912345', N'Quản Lý   ', CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV01      ', N'RP00      ', N'Nguyễn Thị ', N'Nội       ', N'Hà Nam', N'0947687654', N'Bán Vé    ', CAST(N'2000-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV02      ', N'RP00      ', N'Trần Văn', N'Nam       ', N'Quảng Ninh', N'014567238', N'Bán Vé    ', CAST(N'1993-03-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV03      ', N'RP00      ', N'Nguyễn Thị ', N'Lương     ', N'Bắc Giang', N'090990987', N'Bán vé    ', CAST(N'2001-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV04      ', N'RP00      ', N'Phạm Minh ', N'Lan       ', N'Hà Giang', N'09384762', N'Bán Vé    ', CAST(N'2002-09-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV05      ', N'RP00      ', N'Phạm Minh', N'Tân       ', N'Hà Nội', N'078765678', N'Bán Vé    ', CAST(N'1996-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV06      ', N'RP00      ', N'Nguyễn Minh', N'Liên      ', N'Quảng Ninh', N'07876568', N'Bán Vé    ', CAST(N'1999-10-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV07      ', N'RP00      ', N'Phạm Minh', N'Tú        ', N'Hà Nội', N'0987876', N'Bán Vé    ', CAST(N'2000-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV08      ', N'RP00      ', N'Nguyễn Đăng', N'Dũng      ', N'Nam Định', N'034912345', N'Bán Vé    ', CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV09      ', N'RP00      ', N'Nguyễn Thị ', N'Nội       ', N'Hà Nam', N'0947687654', N'Bán Vé    ', CAST(N'2000-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV10      ', N'RP00      ', N'Trần Văn', N'Nam       ', N'Quảng Ninh', N'014567238', N'Bán Vé    ', CAST(N'1993-03-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV11      ', N'RP01      ', N'Nguyễn Thị ', N'Lương     ', N'Bắc Giang', N'090990987', N'Bán vé    ', CAST(N'2001-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV12      ', N'RP01      ', N'Phạm Minh ', N'Liên      ', N'Hà Giang', N'09384762', N'Bán Vé    ', CAST(N'2002-09-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV13      ', N'RP01      ', N'Phạm Minh', N'Hoàng     ', N'Hà Nội', N'078765678', N'Quản Lý   ', CAST(N'1996-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV14      ', N'RP01      ', N'Nguyễn Minh', N'Dức       ', N'Quảng Ninh', N'07876568', N'Bán Vé    ', CAST(N'1999-10-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV15      ', N'RP01      ', N'Phạm Minh', N'Minh      ', N'Hà Nội', N'0987876', N'Bán Vé    ', CAST(N'2000-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV16      ', N'RP01      ', N'Nguyễn Đăng', N'Ngân      ', N'Nam Định', N'034912345', N'Bán Vé    ', CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV17      ', N'RP01      ', N'Nguyễn Thị ', N'Hướng     ', N'Hà Nam', N'0947687654', N'Bán Vé    ', CAST(N'2000-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV18      ', N'RP01      ', N'Trần Văn', N'Vụ        ', N'Quảng Ninh', N'014567238', N'Bán Vé    ', CAST(N'1993-03-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV19      ', N'RP01      ', N'Nguyễn Thị ', N'Hóa       ', N'Bắc Giang', N'090990987', N'Bán vé    ', CAST(N'2001-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV20      ', N'RP01      ', N'Phạm Minh ', N'Kiều      ', N'Hà Giang', N'09384762', N'Bán Vé    ', CAST(N'2002-09-08T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV21      ', N'RP01      ', N'Phạm Minh', N'Hồng      ', N'Hà Nội', N'078765678', N'Bán Vé    ', CAST(N'1996-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV22      ', N'RP01      ', N'Nguyễn Minh', N'Nụ        ', N'Quảng Ninh', N'07876568', N'Bán Vé    ', CAST(N'1999-10-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[NhanVien] ([ID_NV], [ID_RapPhim], [HoNV], [TenNV], [DiaChi], [SDT], [ChucVu], [NgaySinh], [UserName], [Password], [HSL]) VALUES (N'NV23      ', N'RP01      ', N'Phạm Minh', N'Khoa      ', N'Hà Nội', N'0987876', N'Bán Vé    ', CAST(N'2000-09-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim00    ', N'KD        ', N'Hang00    ', N'Tôi thấy hoa vàng trên cỏ xanh', N'VN', 180, CAST(N'2019-04-20' AS Date), N'Trần', N'Nghĩa', N'Văn Hùng', N'Diễm My', 16, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim01    ', N'VT        ', N'Hang01    ', N'Mắt Biếc', N'VN', 150, CAST(N'2020-12-20' AS Date), N'Chu Hà', N'Lan', N'Hồng Anh', N'Phạm Trang', 14, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim02    ', N'GĐ        ', N'GL        ', N'Bố Già', N'VN', 90, CAST(N'2021-10-04' AS Date), N'Lê Giang', N'Hoàng', N'Trấn Thành', N'Ngân Chi', 15, NULL, N'Bố già là câu chuyện thường nhật về một gia đình ở một xóm lao động nghèo tại thành phố Hồ Chí Minh.')
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim03    ', N'HH        ', N'UP        ', N'Raya Và Rồng Thần Cuối Cùng', N'NN', 120, CAST(N'2021-05-03' AS Date), N'Alex', N'Nolan', N'Denis', N'Nursing', 20, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim04    ', N'VT        ', N'MS        ', N'Phi Vụ Triệu Đô ', N'NN', 70, CAST(N'2020-09-09' AS Date), N'Alex ', N'Pina', N'Úrsula Corberó', N'Álvaro Morte', 18, NULL, N'Álvaro Morte')
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim05    ', N'HH        ', N'UP        ', N'Cua lại vợ bầu ', N'VN', 80, CAST(N'2020-09-08' AS Date), N'Lê Giang', N'Hoàng', N'Mạc Văn Khoa', N'Cua lại vợ bầu ', 19, NULL, N'Mạc Văn Khoa')
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim06    ', N'KD        ', N'SPS       ', N' Đôi Mắt Âm Dương', N'VN', 110, CAST(N'2021-10-10' AS Date), N'Quốc Trường', N'An', N'Thu nam', N'Vân Hiền', 20, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim07    ', N'KD        ', N'GL        ', N'Bằng Chứng Vô Hình', N'VN', 90, CAST(N'2021-09-06' AS Date), N'Quang ', N'Tuấn', N'Anh Tú', N'Phương Đào', 17, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim08    ', N'HH        ', N'WB        ', N'Trạng Quỳnh', N'VN', 70, CAST(N'2019-09-08' AS Date), N'Liên', N'Thành', N'Ngọc Tú', N'Ngô Hiền', 17, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim09    ', N'HD        ', N'WD        ', N'Hiệp Sĩ Bóng Đêm ', N'NN', 90, CAST(N'2021-08-08' AS Date), N' Christopher', N'Nolan', N'Christian Bale', N'Heath Ledger', 15, NULL, NULL)
INSERT [dbo].[Phim] ([ID_Phim], [ID_LoaiPhim], [ID_HangPhim], [TenPhim], [NuocSX], [ThoiLuong], [NamSX], [HoDaoDien], [TenDaoDien], [TenNamChinh], [TenNuChinh], [DoTuoi], [Poster], [MoTa]) VALUES (N'Phim10    ', N'GĐ        ', N'WB        ', N' 12 Người Đàn Ông Giận Dữ', N'NN', 70, CAST(N'2021-07-07' AS Date), N'Sisney', N'Lumet', N'Henry', N'Fonda', 18, NULL, NULL)
GO
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC00      ', N'RP00      ', N'Phòng 00 ', 100)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC01      ', N'RP00      ', N'Phòng 01', 150)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC02      ', N'RP00      ', N'Phòng 02', 50)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC03      ', N'RP00      ', N'Phòng 03', 60)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC04      ', N'RP00      ', N'Phòng 04', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC05      ', N'RP00      ', N'Phòng 05', 80)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC06      ', N'RP00      ', N'Phòng 06', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC07      ', N'RP00      ', N'Phòng 07', 50)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC08      ', N'RP00      ', N'Phòng 08', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC09      ', N'RP00      ', N'Phòng 09', 100)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC10      ', N'RP00      ', N'Phòng 10', 90)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC11      ', N'RP00      ', N'Phòng 11', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC12      ', N'RP01      ', N'Phòng 12', 100)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC13      ', N'RP01      ', N'Phòng 13', 150)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC14      ', N'RP01      ', N'Phòng 14', 50)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC15      ', N'RP01      ', N'Phòng 15', 60)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC16      ', N'RP01      ', N'Phòng 16', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC17      ', N'RP01      ', N'Phòng 17', 80)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC18      ', N'RP01      ', N'Phòng 18', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC19      ', N'RP01      ', N'Phòng 19', 50)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC20      ', N'RP01      ', N'Phòng 20', 70)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC21      ', N'RP01      ', N'Phòng 21', 100)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC22      ', N'RP01      ', N'Phòng 22', 90)
INSERT [dbo].[PhongChieu] ([ID_PhongChieu], [ID_RapPhim], [TenPhong], [TongSoGhe]) VALUES (N'PC23      ', N'RP01      ', N'Phòng 23', 70)
GO
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP00      ', N'E6 Phạm Hùng, Quận Cầu 
Giấy, Hà Nội', N' Cantavil Premier, Xa lộ Hà Nội, P.An Phú, Q.2, TP.HCM
')
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP01      ', N'Vincom', N'Hà Nam')
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP03      ', N'Lotte Cinema Huế ', N'Tầng 4 Big C Huế, 181 Bà Triệu, TP Huế, Thừa Thiên Huế
')
INSERT [dbo].[RapPhim] ([ID_RapPhim], [TenRapPhim], [DiaChi]) VALUES (N'RP04      ', N'Lotte Cinema Vinh', N'Tòa Nhà VR, Số 1 Phan Bội Châu,')
GO
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP01      ', N'BC01      ', N'Ghe01     ', N'KH01      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP02      ', N'BC01      ', N'Ghe02     ', N'KH02      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP03      ', N'BC01      ', N'Ghe03     ', N'KH04      ', N'NV00      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP04      ', N'BC02      ', N'Ghe04     ', N'KH03      ', N'NV02      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP05      ', N'BC02      ', N'Ghe05     ', N'KH05      ', N'NV03      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP06      ', N'BC03      ', N'Ghe06     ', N'KH06      ', N'NV04      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP07      ', N'BC03      ', N'Ghe07     ', N'KH03      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP08      ', N'BC04      ', N'Ghe08     ', N'KH02      ', N'NV00      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP09      ', N'BC05      ', N'Ghe09     ', N'KH01      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP10      ', N'BC05      ', N'Ghe10     ', N'KH02      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP11      ', N'BC05      ', N'Ghe11     ', N'KH04      ', N'NV00      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP12      ', N'BC06      ', N'Ghe12     ', N'KH09      ', N'NV02      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP13      ', N'BC06      ', N'Ghe13     ', N'KH10      ', N'NV00      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP14      ', N'BC06      ', N'Ghe14     ', N'KH11      ', N'NV00      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP15      ', N'BC06      ', N'Ghe15     ', N'KH01      ', N'NV01      ', NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID_Ve], [ID_BuoiChieu], [ID_Ghe], [ID_KH], [ID_NV], [TienVe], [ThoiGianDatVe], [PhuongThucThanhToan]) VALUES (N'VP16      ', N'BC09      ', N'Ghe24     ', N'KH01      ', N'NV01      ', NULL, NULL, N'Tiền mặt')
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
/****** Object:  StoredProcedure [dbo].[proc_insertVe]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[proc_insertVe] @ID_Ve nchar(10),@ID_BuoiChieu nchar(10),@ID_Phim nchar(10),@ID_RapPhim nchar(10),@ID_PhongChieu nchar(10),@NgayChieu date,@GioChieu time(7),
													@ID_Ghe nchar(10),@TenGheNgoi nvarchar(50),@LoaiGhe nvarchar(50),@ID_NV nchar(10),@ID_KH nchar(10),@PTTT nvarchar(50)
	AS
	BEGIN
		BEGIN TRAN 
			BEGIN TRY
				--insert into BuoiChieu(ID_BuoiChieu,ID_Phim,ID_RapPhim,ID_PhongChieu,NgayChieu,GioChieu) values(@ID_BuoiChieu,@ID_Phim,@ID_RapPhim,@ID_PhongChieu,@NgayChieu,@GioChieu) 
				insert into GheNgoi values(@ID_Ghe,@ID_PhongChieu,@TenGheNgoi,@LoaiGhe)
				insert into KhachHang(ID_KH,HoKH,TenKH,SDT,CCCD) select ID_KH,HoKH,TenKH,SDT,CCCD from #BangTamKhachHang where @ID_KH=ID_KH
				insert into Ve(ID_Ve,ID_BuoiChieu,ID_Ghe,ID_KH,ID_NV,PhuongThucThanhToan) values(@ID_Ve,@ID_BuoiChieu,@ID_Ghe,@ID_KH,@ID_NV,@PTTT) 
				COMMIT TRAN
			END TRY
			
			BEGIN CATCH
				PRINT 'Error: ' + ERROR_MESSAGE();
				ROLLBACK TRAN  
			END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[Proc_PhimChieuTheoNgay]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Proc_PhimChieuTheoNgay] @ngaychieu1 date,@ngaychieu2 date
AS
BEGIN

	SELECT distinct  Phim.ID_Phim,TenPhim,TenLoaiPhim,TenHangPhim,NuocSX,ThoiLuong,YEAR(NamSX) as NamSanXuat,HoDaoDien,TenDaoDien,TenNamChinh,TenNuChinh,MoTa,poster,DoTuoi
	FROM Phim join BuoiChieu on Phim.ID_Phim= BuoiChieu.ID_Phim
			  join LoaiPhim on Phim.ID_LoaiPhim= LoaiPhim.ID_LoaiPhim
			  join HangPhim on Phim.ID_HangPhim= HangPhim.ID_HangPhim
	WHERE (YEAR(NgayChieu)>=YEAR( @ngaychieu1 ) and YEAR(NgayChieu)<=YEAR( @ngaychieu2 )) and 
		  (MONTH(NgayChieu)>=MONTH( @ngaychieu1 ) and MONTH(NgayChieu)<=MONTH( @ngaychieu2 )) 

END
GO
/****** Object:  StoredProcedure [dbo].[Proc_TTNhanVien_TungRP]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Proc_TTNhanVien_TungRP] @marap nchar(10)
AS
BEGIN 
	SELECT  ID_NV,TenRapPhim,HoNV+' '+ TenNV as HVT,NhanVien.DiaChi,SDT,ChucVu,NgaySinh
	FROM NhanVien join RapPhim on NhanVien.ID_RapPhim=RapPhim.ID_RapPhim
	WHERE @marap=NhanVien.ID_RapPhim
END
GO
/****** Object:  StoredProcedure [dbo].[SoVeBanDuocCuaHangPhim]    Script Date: 11/26/2021 11:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[SoVeBanDuocCuaHangPhim] @nam int
AS
Begin
SELECT HangPhim.ID_HangPhim,TenHangPhim,
	   isnull(count(case month (NgayChieu) when 1 then ID_Ve end),0) as Thang1,
	   isnull(count(case month (NgayChieu) when 2 then ID_Ve end),0) as Thang2,
	   isnull(count(case month (NgayChieu) when 3 then ID_Ve end),0) as Thang3,
	   isnull(count(case month (NgayChieu) when 4 then  ID_Ve end),0) as Thang4,
	   isnull(count(case month (NgayChieu) when 5 then  ID_Ve end),0) as Thang5,
	   isnull(count(case month (NgayChieu) when 6 then  ID_Ve end),0) as Thang6,
	   isnull(count(case month (NgayChieu) when 7 then  ID_Ve end),0) as Thang7,
	   isnull(count(case month (NgayChieu) when 8 then  ID_Ve end),0) as Thang8,
	   isnull(count(case month (NgayChieu) when 9 then ID_Ve end),0) as Thang9,
	   isnull(count(case month (NgayChieu) when 10 then  ID_Ve end),0) as Thang10,
	   isnull(count(case month (NgayChieu) when 11 then  ID_Ve end),0) as Thang11,
	   isnull(count(case month (NgayChieu) when 12 then  ID_Ve end),0) as Thang12,
	   isnull(COUNT(ID_Ve ),0) as Canam 
FROM HangPhim join Phim on HangPhim.ID_HangPhim=Phim.ID_HangPhim
			  join BuoiChieu on BuoiChieu.ID_Phim=Phim.ID_Phim
			  join Ve on Ve.ID_BuoiChieu=BuoiChieu.ID_BuoiChieu
Where YEAR(NgayChieu)=@nam
group by HangPhim.ID_HangPhim,TenHangPhim
end
GO
USE [master]
GO
ALTER DATABASE [Phim] SET  READ_WRITE 
GO

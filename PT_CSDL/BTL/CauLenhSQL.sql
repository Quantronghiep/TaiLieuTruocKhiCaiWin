

														/*
														VIEW
														*/
--Cau1./

CREATE VIEW [nhan vien rap01] AS
SELECT [ID_NV], [HoNV], [TenNV]
FROM dbo.NhanVien
WHERE [ID_RapPhim] = 'RP01';
GO


/* Cau2.Tạo view tính doanh thu theo tháng của năm 2020*/
Create view DoanhThu as
Select MONTH(NgayChieu) as N'Tháng', Sum(TongTien) as 'Doanh thu'
from BuoiChieu
where YEAR(NgayChieu) = 2020
Group by MONTH(NgayChieu)

Select * from DoanhThu

--Cau3 View chi tiết chiếu phim: Mã phim, tên phim, phòng chiếu, ngày chiếu, giờ chiếu
create view vw_ChiTietChieu as
	select BC.NgayChieu, GioChieu, X.ID_Phim , X.TenPhim, Y.TenPhong
	from BuoiChieu BC 
	outer apply( select ID_Phim , TenPhim from Phim P where BC.ID_Phim = P.ID_Phim ) X
	outer apply( select TenPhong from PhongChieu PC where BC.ID_PhongChieu = PC.ID_PhongChieu ) Y
go
--Cau 4.View thông tin vị trí ngồi gồm: Tên rạp, Mã phòng, Tên phòng, Phim chiếu, ngày chiếu, tên ghế ngồi, loại ghế
create view vw_ThongTinVT as
	select * 
	from PhongChieu PC
	outer apply( select TenGheNgoi, LoaiGhe from GheNgoi GN where PC.ID_PhongChieu = GN.ID_PhongChieu ) X
	outer apply( select TenRapPhim, DiaChi from RapPhim RP where PC.ID_RapPhim = RP.ID_RapPhim ) Y
	outer apply( select NgayChieu, GioChieu from BuoiChieu BC where PC.ID_PhongChieu = BC.ID_PhongChieu ) Z
go

/*Cau5. Tạo View thống kê  mỗi một hãng phim  trong mỗi tháng và trong cả năm
bán được với số lượng bao nhiêu vé (Yêu cầu kết quả hiểu thị dưới dạng bảng, hai cột đầu là mã
hãng, tên hãng, các cột còn lại tương ứng từ tháng 1 đến tháng 12 và cả năm. Như vậy mỗi
dòng trong kết quả cho biết số lượng vé bán được mỗi tháng và trong cả năm của mỗi hãng phim.*/
CREATE OR ALTER VIEW ThongKeVeBanDuocCuaHangPhim
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

select * from ThongKeVeBanDuocCuaHangPhim

/*cau6 Tạo báo cáo bảng Lương:
MaNV, HoTen, ChucVu, Luong, TroCap, PhuCapTN.
Trong đó:
	- ThâmNiên là số năm làm việc của nhân niên trong công ty, được tính dựa và ngày bắt đầu làm việc (NgayVaoLam).
	- Lương là hệ số lương (HSL) nhân 2500000.
	- TrợCấp =  100000 - nhân viên có chức vụ bán ve
				200000- nhân viên có chức vụ quản lý

	
*/

cREATE OR ALter VIEW BangLuongNV 
AS
SELECT ID_NV,HoNV+' '+ TenNV as HoVaTen,ChucVu ,
	   iif(ChucVu=N'Quản Lý',200000,100000) as TroCap,
	   ((HSL*2500000)+ iif(ChucVu=N'Quản Lý',200000,100000)) as Luong,
		NhanVien.Id_RapPhim as RP,TenRapPhim,RapPhim.DiaChi
FROM NhanVien join RapPhim on NhanVien.ID_RapPhim=RapPhim.ID_RapPhim
select * from NhanVien
select * from BangLuongNV


/*Câu 7. VIEW thông tin khách hàng: mã KH,tên, Địa chỉ, sđt, tuổi, mã vé,số ghế, tên phim xem, phòng xem */
CREATE VIEW vw_cau2 
AS 
	SELECT a.ID_KH, a.HoKH,a.TenKH,a.SDT, YEAR(GETDATE())-YEAR(ngaysinh) AS N'Tuổi', b.ID_Ve,b.ID_Ghe
	FROM KhachHang a INNER JOIN Ve b ON a.ID_KH=b.ID_KH INNER JOIN Ve c ON b.ID_Ve=c.ID_Ve 
	
go

SELECT * 
FROM vw_cau2
Go

--Cau8. Liệt kê các phim được sản xuất bởi Hãng Phim có mã "HP001" với các field :	
--	ID Phim , Ten Phim , ID Hãng Phim , Tên Hãng Phim , TenLoaiPhim
create view LietKePhim
as
	select ID_Phim , TenPhim , HangPhim.ID_HangPhim , TenHangPhim , TenLoaiPhim
	from Phim join HangPhim on Phim.ID_HangPhim = HangPhim.ID_HangPhim join LoaiPhim on LoaiPhim.ID_LoaiPhim = Phim.ID_LoaiPhim
	where HangPhim.ID_HangPhim = 'HP001'

	SELECT * FROM LietKePhim


														/*
															PROC
														*/

--Cau1.
CREATE PROCEDURE [dbo].[getAllTicket]
as
begin
    select [ID_Ve] ,
	Ve.[ID_BuoiChieu] ,
	Ph.TenPhim,
	Ph.DoTuoi,
	Ph.ThoiLuong,
	RP.TenRapPhim,
	PC.TenPhong,
	Ve.[ID_Ghe],
	GN.TenGheNgoi,
	GN.LoaiGhe,
	BC.NgayChieu,
	BC.GioChieu,
	Ve.[ID_KH] ,
	(HoKH + ' ' + TenKH) AS HoTenKH,
	Ve.[ID_NV] ,
	(HoNV + ' ' + TenNV) AS HoTenNV,
	[TienVe],
	[ThoiGianDatVe],
	[PhuongThucThanhToan] from Ve 
	join KhachHang KH on Ve.[ID_KH] = KH.[ID_KH]
	join NhanVien NV on Ve.[ID_NV] = NV.[ID_NV]
	join GheNgoi GN on Ve.[ID_Ghe] = GN.[ID_Ghe]
	join BuoiChieu BC on Ve.[ID_BuoiChieu] = BC.[ID_BuoiChieu]
	INNER join Phim Ph on Ph.ID_Phim = BC.ID_Phim
	INNER join PhongChieu PC on PC.ID_PhongChieu = BC.ID_PhongChieu
	INNER join RapPhim RP on RP.ID_RapPhim = BC.ID_RapPhim
end
GO

CREATE PROCEDURE SoVeBan
AS
    BEGIN
        SELECT
               COUNT(BC.ID_Phim) AS TongSoVeBan
               
        FROM dbo.BuoiChieu AS BC
            JOIN dbo.PhongChieu AS PC
                ON BC.ID_PhongChieu = PC.ID_PhongChieu
			JOIN dbo.Ve
				ON Ve.ID_BuoiChieu = BC.ID_BuoiChieu
        GROUP BY BC.ID_Phim,
			     BC.NgayChieu,
			     BC.GioChieu
    end
GO


--Cau2. Tạo thủ tục đầu vào là mã nhân viên , đầu ra là Tên rạp phim nhân viên đó đang làm
create proc NoiLamViec @manv nvarchar(10) , @tenrap nvarchar(100) output
as
begin
	set @tenrap = (select TenRapPhim from RapPhim join NhanVien on RapPhim.ID_RapPhim = NhanVien.ID_RapPhim
	where ID_NV = @manv)
end

declare @ten nvarchar(100)
exec NoiLamViec 'NV01' , @ten output
print ('Nhan vien co ma NV01 dang lam tai rap phim : ' + @ten)

-- Cau3.Tạo thủ tục đầu vào là mã vé , đầu ra là tên phim khách đã đặt
create proc TenPhimTheoVe @mave nvarchar(10) , @tenphim nvarchar(100) output
as
begin
	set @tenphim = (select TenPhim from Phim join BuoiChieu on Phim.ID_Phim = BuoiChieu.ID_Phim
		join Ve on BuoiChieu.ID_BuoiChieu = Ve.ID_BuoiChieu
		where ID_Ve = @mave)
end

declare @tenp nvarchar(100)
exec TenPhimTheoVe 'Ve00' , @tenp output
print('Ten phim co ma ve 00 la : ' + @tenp)

/*Cau4. Tạo thủ tục đầu vào là Tên loại phim đầu ra là số phim của loại đó */ 
create proc TheLoai @Ten nvarchar(100), @So int output
as
begin
	Select @So = count(ID_Phim) 
	from Phim join LoaiPhim on Phim.ID_LoaiPhim = LoaiPhim.ID_LoaiPhim
	where TenLoaiPhim = @Ten
end

declare @So int
exec TheLoai N'Tình Cảm', @So output
print(@So)

/*Cau5. Tạo thủ tục đầu vào là Mã buổi chiếu đầu ra là số Vé và tổng tiền của bán vé của buổi đó */
Create proc SoVe @MaBC nchar(10), @SoVe int output, @Tong money output
as
begin
	Select @SoVe = COUNT(ID_Ve), @Tong = Sum(TienVe) 
	from Ve 
	where ID_BuoiChieu = @MaBC
	Group by ID_BuoiChieu
end
declare @SoVe int, @Tong money
exec SoVe 'BC00', @SoVe output, @Tong output
print @SoVe  
print @Tong

--Cau6. Thêm sửa xóa buổi Chiếu
create proc sp_BC_save
	@dataBC BC_Type readonly,
	@delete bit
as
begin
	begin tran
	begin try
		declare @dataBC BC_Type
        if exists (select 1 from @dataBC)
        BEGIN
            ---Insert---
            if exists (select 1 from @dataBC where ID_BuoiChieu = 0)
            BEGIN
                INSERT into BuoiChieu(ID_BuoiChieu, ID_Phim, ID_RapPhim, ID_PhongChieu, NgayChieu, GioChieu, GiaVe)
                select ID_BuoiChieu, ID_Phim, ID_RapPhim, ID_PhongChieu, NgayChieu, GioChieu, GiaVe
                from @dataBC
            END
            ---Update---
            else if exists (SELECT 1 from @dataBC where ID_BuoiChieu <> 0 and @delete = 0)
            BEGIN
				UPDATE BC
                set 
                    BC.ID_Phim = d.ID_Phim,
                    BC.ID_RapPhim = d.ID_RapPhim, 
                    BC.ID_PhongChieu = d.ID_PhongChieu,
                    BC.NgayChieu = d.NgayChieu,
					BC.GioChieu = d.GioChieu,
					BC.GiaVe = d.GiaVe
                from BuoiChieu BC join @dataBC d on BC.ID_BuoiChieu = d.ID_BuoiChieu
            END
            ---Delete---
            ELSE if exists (SELECT 1 from @dataBC where ID_BuoiChieu <> 0 and @delete = 1)
            BEGIN
               Delete from BuoiChieu where ID_BuoiChieu = @dataBC.ID_BuoiChieu 
            END
        END
    commit tran
	end try

	begin catch
        rollback tran
	end catch
end
go

/*Cau7.Thủ tục lấy THÔNG TIN  phim được chiếu Từ ngày ... đến ngày ..*/

CREATE or ALTER PROC Proc_PhimChieuTheoNgay @ngaychieu1 date,@ngaychieu2 date
AS
BEGIN

	SELECT distinct TenPhim as N'Tên Phim',TenLoaiPhim as N'Loại Phim',TenHangPhim as N'Hãng phim',NuocSX as N'Nước sản xuất',ThoiLuong as 'Thời lượng',YEAR(NamSX) as N' Năm SX',HoDaoDien + ' ' + TenDaoDien as N'Đạo diễn',TenNamChinh as N'Nam chính',TenNuChinh as N'Nữ chính',MoTa ,poster,DoTuoi
	FROM Phim join BuoiChieu on Phim.ID_Phim= BuoiChieu.ID_Phim
			  join LoaiPhim on Phim.ID_LoaiPhim= LoaiPhim.ID_LoaiPhim
			  join HangPhim on Phim.ID_HangPhim= HangPhim.ID_HangPhim
	WHERE (YEAR(NgayChieu)>=YEAR( @ngaychieu1 ) and YEAR(NgayChieu)<=YEAR( @ngaychieu2 )) and 
		  (MONTH(NgayChieu)>=MONTH( @ngaychieu1 ) and MONTH(NgayChieu)<=MONTH( @ngaychieu2 )) 

END



/*Cau8. Tạo Proc insert bảng Ve khi insert đồng thời bảng buổi chiếu, ghế ngồi ,khách hàng  (Giả sử KH lấy từ 1 bảng tạm) .
hãy đảm bảo việc cập nhật là đồng thời thành công hoặc không thành công (transaction)*/
Create  table #BangTamKhachHang(
	ID_KH nchar(10) NOT NULL,
	HoKH nvarchar(100) NULL,
	TenKH nvarchar(50) NULL,
	SDT nchar(15) NULL,
	CCCD nchar(20) NULL,
	

)
	CREATE OR alter PROC proc_insertVe @ID_Ve nchar(10),@ID_BuoiChieu nchar(10),@ID_Phim nchar(10),@ID_RapPhim nchar(10),@ID_PhongChieu nchar(10),@NgayChieu date,@GioChieu time(7),
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

	insert into #BangTamKhachHang select ID_KH,HoKH,TenKH,SDT,CCCD from KhachHang where ID_KH='KH00' OR ID_KH='KH01'
	SELECT * FROM #BangTamKhachHang
	Delete from Ve where ID_KH='KH00' OR ID_KH='KH01'
	DELETE KhachHang where ID_KH='KH00' OR ID_KH='KH01'

	exec proc_insertVe
	'Ve17','BC09','Phim01','RP02','PC01','2021-11-10','17:30:00','Ghe24',N'Ghế 24','Vip','NV01','KH01',N'Tiền mặt'
	
	select * from Ve
	select * from BuoiChieu
	select * from GheNgoi
	select * from KhachHang
	

									/*
										Function
									*/





/*Cau1. Hàm đưa ra thông tin  bộ phim của hãng phim, Diễn viên */
CREATE OR ALTER FUNCTION FUNC_ThongTinPhim(@hangphim nvarchar(100))
Returns table
as
Return
	Select TenPhim as N'Tên phim' ,NuocSX as N'Nước sản xuất',ThoiLuong as N'Thời lượng',NamSX as N'Năm sản xuất',HoDaoDien  +' ' + TenDaoDien as N'Đạo diễn', TenNamChinh as 'Nam chính',TenNuChinh as N'Nữ chính',DoTuoi as N'Độ tuổi'
	from Phim join HangPhim on Phim.ID_HangPhim=HangPhim.ID_HangPhim
	where (Phim.ID_HangPhim like N'%'+@hangphim+N'%') OR (TenHangPhim like N'%'+@hangphim+N'%') OR (TenPhim like N'%'+@hangphim+N'%') OR (TenNamChinh like N'%'+@hangphim+N'%') OR (TenNuChinh like N'%'+@hangphim+N'%')

	select * from FUNC_ThongTinPhim(N'Trấn ')
	select * from Phim


/*Cau2. Tạo hàm sinh ra Mã buổi chiếu tự động theo quy tắc BC + số
	BC luôn có công với số bắt đầu từ 00 */
Create function sinhMaBC() 
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

Select dbo.sinhMaBC() as MaBC
 

--Cau3.
CREATE FUNCTION ChucVu(@ChucVu NVARCHAR) RETURNS TABLE
RETURN (
        SELECT
               NV.ID_NV,
               CONCAT(NV.HONV,' ',NV.TENNV) AS HoVaTen
        FROM dbo.NhanVien NV
       WHERE NV.ChucVu LIKE '%'+@ChucVu+'%'
    )
GO

DECLARE @ChucVu NVARCHAR = 'Quan Ly'
SELECT * FROM ChucVu(@ChucVu)
GO

Cau4.
CREATE FUNCTION ThongTinVe(@IDVe NVARCHAR(5)) RETURNS TABLE
RETURN (
        SELECT
               ID_Ve,
			   GioChieu,
               NgayChieu,
               TenPhim,
			   TenRapPhim,
			   DiaChi,
			   TenPhong,
               TenGheNgoi,
               TienVe
        FROM dbo.BuoiChieu AS BC
			JOIN dbo.Ve ON BC.ID_BuoiChieu = Ve.ID_BuoiChieu
			JOIN dbo.Phim ON Phim.ID_Phim = BC.ID_Phim
			JOIN dbo.PhongChieu AS PC ON PC.ID_PhongChieu = BC.ID_PhongChieu
			JOIN dbo.RapPhim AS RP ON RP.ID_RapPhim = BC.ID_RapPhim
			JOIN dbo.GheNgoi AS GN ON GN.ID_Ghe = Ve.ID_Ghe
       WHERE @IDVe = ID_Ve
    )
GO

-- Cau5.Tạo hàm tính tổng số vé đã bán được trong từng tháng của năm 2020
create  or alter function TongVe()
returns table
as
	return
	select MONTH(NgayChieu) as Thang , count(ID_Ve) as TongVe 
	from Ve join BuoiChieu on BuoiChieu.ID_BuoiChieu = Ve.ID_BuoiChieu
	WHERE YEAR(NgayChieu) = 2021
	group by month(NgayChieu)

select * from TongVe()

--Cau6. Tính doanh thu trong ngày với thông tin ngày là tham số đầu vào
create function DoanhThu(@ngay date)
returns float
as
begin
	declare @sum float
	select @sum = sum(TienVe) from Ve join BuoiChieu on Ve.ID_BuoiChieu = BuoiChieu.ID_BuoiChieu
	WHERE cast(NgayChieu as date) =  @ngay 
	return @sum
end

select dbo.DoanhThu('2020-04-20')

--Cau7. Hàm tính tổng vé và tổng doanh thu theo phim
alter function [dbo].[VeDoanhThuPhim](@tenphim nvarchar(100))
returns table
as
	return
	select Phim.ID_Phim, TenPhim , count(ID_VE) as SoVe , sum(TienVe) as TongTien
	from Phim join BuoiChieu on Phim.ID_Phim = BuoiChieu.ID_Phim join Ve on BuoiChieu.ID_BuoiChieu = Ve.ID_BuoiChieu
	where TenPhim like N'%' +@tenphim + '%' or Phim.ID_Phim like '%' + @tenphim + '%'
	group by Phim.ID_Phim , TenPhim
	order by TongTien desc
	OFFSET 0 ROWS

--Cau8. tạo hàm có đầu vào mã phòng chiếu đầu ra là toàn bộ thông tin ghế ngồi của phòng chiếu đó
create function fnc_TTGheNgoi (@IDPC nvarchar(50))
returns table
as
return
	select * from GheNgoi where ID_PhongChieu = @IDPC

select * from fnc_TTGheNgoi('PC00')
--Cau9 Tạo hàm có đầu vào là loại ghế đầu ra là thông tin của những ghế có cùng loại
create function fnc_TTLoaiGheNgoi (@LoaiGhe nvarchar(50))
returns table
as
return
	select * from GheNgoi where LoaiGhe = @LoaiGhe

select * from fnc_TTLoaiGheNgoi('Vip')

								
												/*
												TRIGGER
												*/



--Cau1.Viết trigger tính tiền Vé mỗi khi insert , update ở bảng Ve biết :
-- nếu loại ghế Vip sẽ cộng thêm 10000 , loại ghế Thuong vẫn giữ nguyên giá
create trigger CapNhatTienVe on Ve
for insert , update
as
begin
	declare @mabc nvarchar(10) , @maghe nchar(10) , @loaighe nvarchar(10), @tienve money, @giave money, @mave nchar(10)
	select @mave = ID_Ve , @maghe = ID_Ghe, @mabc = ID_BuoiChieu from inserted
	select @loaighe = LoaiGhe from GheNgoi where ID_Ghe = @maghe
	select @giave = GiaVe from BuoiChieu where ID_BuoiChieu = @mabc
	if( @loaighe = 'Vip')
		set @tienve = @giave + 10000
	else 
		set @tienve = @giave
	update Ve set TienVe = @tienve where ID_Ve = @mave
end


--Cau2.trigger 
CREATE Trigger SoGheCon ON Ve AFTER INSERT
AS
    BEGIN
        SELECT
			   (PC.TongSoGhe - COUNT(BC.ID_BuoiChieu)) AS SoGheTrong
               
        FROM dbo.BuoiChieu AS BC
            JOIN dbo.PhongChieu AS PC
                ON BC.ID_PhongChieu = PC.ID_PhongChieu
			JOIN dbo.Ve
				ON Ve.ID_BuoiChieu = BC.ID_BuoiChieu
        GROUP BY BC.ID_Phim,
			     BC.NgayChieu,
			     BC.GioChieu,
				 PC.TongSoGhe
    end
GO

/*Cau3.Tạo trigger cập nhật tự động giá vé khi thay đổi ngày chiếu và giờ chiếu:
	- Nếu vào cuối tuần t6,7,cn:
		+)  Giờ chiếu <17h: Giá vé = 90000 + vip( phụ cấp ghế vip)
		+) Giờ chiếu >17: Giá vs=100000 + vip ( phụ cấp ghế vip)
	- Nếu là ngày đầu tuần (2,3,4,5):
		+)  Giờ chiếu <17h: Giá vé = 70000 + vip( phụ cấp ghế vip)
		+) Giờ chiếu >17: Giá vs=80000 + vip ( phụ cấp ghế vip) 
		Trong đó vip=10000 khi khách chọn loại ghế VIP 
				Ngược lại vip =0

*/
CREATE OR ALTER TRIGGER TRIGGER_ThayDoiGia on BuoiChieu
FOR INSERT,UPDATE
AS
BEGIN
	declare @GiaVe money,@NgayChieu date,@giochieu time(7),@loaighe nvarchar(50),@vip int	 
	select @NgayChieu=NgayChieu,@giochieu=GioChieu,@loaighe=LoaiGhe from inserted join Ve on inserted.ID_BuoiChieu= Ve.ID_BuoiChieu
																 join GheNgoi on GheNgoi.ID_Ghe=Ve.ID_Ghe
	if( DATEPART(WEEKDAY, @NgayChieu)>1 and DATEPART(WEEKDAY, @NgayChieu)<6 ) 
		begin
			
			if(DATEPART(Hour, @giochieu)<17) 
			set @GiaVe=70000
			else set @GiaVe=80000
		end
	else 
		begin
		   
			if(DATEPART(Hour, @giochieu)<17) set @GiaVe=90000
			else set @GiaVe=100000
		end
	update BuoiChieu set GiaVe=@GiaVe
	from inserted 
	where BuoiChieu.ID_BuoiChieu=inserted.ID_BuoiChieu
	
	if(@loaighe='Vip') set @vip = 10000
	else set @vip=0;
	
	update Ve set TienVe=@GiaVe+@vip
	from inserted 
	where Ve.ID_BuoiChieu=inserted.ID_BuoiChieu 
		
	
END



/*Cau4.Thêm HSL vào bảng NV và Tạo Trigger tự động cập nhật HSL nhân viên
 - Nếu NV có chức vụ: Bán vé: HSL=1.5
					  Quản lý:HSL=2

*/
Alter table NhanVien
add HSL float

CREATE or ALTER TRIGGER TRG_HSLNHanVien on NhanVien
FOR INSERT,UPDATE
AS
BEGIN
	Declare @hsl float,@chucvu nvarchar(50),@manv nchar(10)
	select @manv=ID_NV, @chucvu=ChucVu from inserted
	if(@chucvu=N'Quản Lý') set @hsl=2
	else set @hsl=1.5

	Update NhanVien set HSL=@hsl
	where NhanVien.ID_NV=@manv
END

--Cau5. Xóa phòng chiếu sẽ xóa ghế ngồi
alter trigger trg_XoaPC on PhongChieu
instead of delete
as
begin
	delete GheNgoi where ID_PhongChieu in (select ID_PhongChieu from deleted )
	delete PhongChieu where ID_PhongChieu in (select ID_PhongChieu from deleted )
end
GO

--Cau6. Xóa buổi chiếu xóa vé
alter trigger trg_XoaBC on BuoiChieu
instead of delete
as
begin
	delete Ve where ID_BuoiChieu in (select ID_BuoiChieu from deleted )
	delete BuoiChieu where ID_BuoiChieu in (select ID_BuoiChieu from deleted )
end
-- Cau7.
/* Tạo trigger tính tổng tiền vé đã bán của các buổi chiếu*/ 
alter table BuoiChieu
add TongTien money

Create trigger UpdateTongTien on Ve
for insert, update
as
begin
	declare @MaBC nchar(10), @TienVe money
	Select @MaBC = ID_BuoiChieu, @TienVe = TienVe from inserted
	
	update BuoiChieu set TongTien = ISNULL(TongTien,0) + ISNULL(@TienVe, 0) where ID_BuoiChieu = @MaBC
end

/*Cau8. Tạo trigger tính điểm tích lũy cho khách hàng
điểm tích lũy tính bằng 5% số tiền mua vé 
nếu cấp bậc của khách là vip thì là 7% 
khách là vip khi điểm tích lũy từ 100000 trở lên*/
Create trigger UpdateDiemTichLuy on Ve
for insert, update
as
begin
	Declare @Diem int, @maKH nchar(10), @Cap nvarchar(10), @DiemTichLuy int 
	select @maKH=ID_KH, @Diem = ISNULL(TienVe,0) * 0.05 from inserted	
	select @DiemTichLuy=DiemTichLuy, @Cap=ISNULL(CapBac, N'thường') from KhachHang where ID_KH = @maKH
	set @DiemTichLuy = ISNULL(@DiemTichLuy,0) + @Diem 
	if @DiemTichLuy >= 100000
	begin
		set @cap = 'VIP'
	end
	update KhachHang set DiemTichLuy = @DiemTichLuy, CapBac = @Cap where ID_KH = @maKH
end

							/*
							CAU LENH DIEU KHIEN
							*/


-- KỊCH BẢN 1
/*1.Tạo các role sau:Supervisor,Management, Employee, Guestt*/
	use RCP_TKCSDL
	go
	exec Sp_AddRole 'Supervisor'
	use RCP_TKCSDLL
	go
	exec Sp_AddRole 'Management'
	use RCP_TKCSDL
	go
	exec Sp_AddRole 'Employee'
	use RCP_TKCSDL
	go
	exec Sp_AddRole 'Guestt'
/*2.Tạo login Tam,Dung,Hiep,TrungDuc,AnhDuc,Ngan và user tương ứng*/
	--LOGIN
	exec Sp_addlogin Tam,TAM
	exec Sp_addlogin Dung,DUNG
	exec Sp_addlogin Hiep,HIEP
	exec Sp_addlogin TrungDuc,TRUNGDUC
	exec Sp_addlogin AnhDuc,ANHDUC
	exec Sp_addlogin Ngan,NGAN

	--USER
	use RCP_TKCSDL
	exec sp_adduser Tam,userTam
	exec sp_adduser Dung,userDung
	exec sp_adduser Hiep,userHiep
	exec sp_adduser TrungDuc,userTrungDuc
	exec sp_adduser AnhDuc,userAnhDuc
	exec sp_adduser Ngan,userNgan

	

/*3.Gán Tâm vào role Supervisor, Dũng và Hiệp vào role Management, Trung Đức và Anh Đức vào role Employee, Ngân vào role Guestt*/

	--role Superviso
	EXEC sp_addrolemember 'Supervisor','UserTam'
	--role Management
	EXEC sp_addrolemember 'Management','UserDung'
	EXEC sp_addrolemember 'Management','UserHiep'

	--role Employee
	EXEC sp_addrolemember 'Employee','UserTrungDuc'
	EXEC sp_addrolemember 'Employee','UserAnhDuc'

	--Role Guest
	EXEC sp_addrolemember 'Guestt','UserNgan'

/*4. Cho role Supervisor quyền xem được tất cả dữ liệu trong database
	 Cho role Management các quyền select,update,delete ,insert trên bảng Nhân Viên, Phim
     Cho role Employee các quyền như select, update, insert trên bảng Khách hàng, Phim 
	 Cho role Guestt quyền select trên bảng phim*/
		use RCP_TKCSDL
		go
		grant select to Supervisor with grant option
		grant Select,update,insert, delete  on Phim to Management with grant option
		grant Select,update,insert, delete  on NhanVien to Management with grant option
		grant Select,update,insert  on KhachHang to Employee
		grant Select,update,insert  on Phim to Employee
		grant select on Phim to Guestt

/*
5. Ở user Dũng, trao quyền delete cho User TrungDuc trên bảng Phim và không cho phép TrungDuc cấp quyền delete cho user khác (Đang nhặp để kiểm tra)
	ở user Tâm, trao quyền select cho Hiệp và hiệp có thể trao quyền cho người khác
*/
--user Dũng
	grant delete on Phim to UserTrungDuc
	
--user Tâm
	grant select to UserHiep with grant option



-- KỊCH BẢN 2

-- /* điều khiển dữ liệu */
exec sp_addlogin A, 123
exec sp_addlogin B, 123
exec sp_addlogin C, 123


exec sp_adduser A, userA
exec sp_adduser B, userB
exec sp_adduser C, userC

grant select, update, delete, insert on BuoiChieu to userA with grant option
grant select, update, delete, insert on Ve to userA with grant option

--USER A
grant select, update, delete, insert on Ve to userB 
grant select, update, delete, insert on BuoiChieu to userB 
grant select, update, delete, insert on BuoiChieu to userC 

-- KỊCH BẢN 3

/*
Tạo login Ax, Bx , Cx
Tạo user userAx, userBx, userCx tương ứng với login Ax, Bx, Cx
Gán quyền select, update , delete, insert cho userAx trên bảng NhanVien của CSDL, Ax có quyền trao quyền này cho người khác
Đăng nhập Ax để kiểm tra
Từ Ax, Trao quyền select , update cho userBx trên bảng NhanVien của CSDL 
Đăng nhập B để kiểm tra
Từ Bx, Trao quyền select cho userCx trên bảng NhanVien của CSDL 
Kiểm tra
Xóa login và user Bx, Cx
*/
/*ở user Admin: Tạo login A, B*/
exec sp_addlogin Ax, 123
exec sp_addlogin Bx, 123
exec sp_addlogin Cx, 123
/*ở user Admin: Tạo user userA, userB tương ứng với login A, B*/
use test1
exec sp_adduser Ax, userAx
exec sp_adduser Bx, userBx
exec sp_adduser Cx, userCx

grant select, update , delete , insert on NhanVien to userAx with grant option
--grant select, update  on NhanVien to userBx 
--grant select, update  on NhanVien to userCx 

exec sp_droplogin Bx
exec sp_droplogin Cx


exec sp_dropuser userBx
exec sp_dropuser userCx







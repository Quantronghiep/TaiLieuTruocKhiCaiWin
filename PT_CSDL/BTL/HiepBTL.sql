use test1
		/* View */
--Tạo View liệt kê các nhân viên có quê ở Hà Nội
create view QueNV
as
	select * from NhanVien
	where DiaChi like N'%Hà Nội%'

	select * from QueNV
-- Liệt kê các phim được sản xuất bởi Hãng Phim có mã "HP001" với các field :	
--	ID Phim , Ten Phim , ID Hãng Phim , Tên Hãng Phim , TenLoaiPhim
create view LietKePhim
as
	select ID_Phim , TenPhim , HangPhim.ID_HangPhim , TenHangPhim , TenLoaiPhim
	from Phim join HangPhim on Phim.ID_HangPhim = HangPhim.ID_HangPhim join LoaiPhim on LoaiPhim.ID_LoaiPhim = Phim.ID_LoaiPhim
	where HangPhim.ID_HangPhim = 'HP001'

	SELECT * FROM LietKePhim

				/* Procedure */
-- Tạo thủ tục đầu vào là mã nhân viên , đầu ra là Tên rạp phim nhân viên đó đang làm
create proc NoiLamViec @manv nvarchar(10) , @tenrap nvarchar(100) output
as
begin
	set @tenrap = (select TenRapPhim from RapPhim join NhanVien on RapPhim.ID_RapPhim = NhanVien.ID_RapPhim
	where ID_NV = @manv)
end

declare @ten nvarchar(100)
exec NoiLamViec 'NV01' , @ten output
print ('Nhan vien co ma NV01 dang lam tai rap phim : ' + @ten)

-- Tạo thủ tục đầu vào là mã vé , đầu ra là tên phim khách đã đặt
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

			/* TRIGGER */
-- Viet Trigger cập nhật GiaVe ở bảng BuoiChieu mỗi khi insert , update biết :
-- giá vé trước 17h là 70000 , sau 17h là 90000
create trigger GiaVe on BuoiChieu
for insert , update
as
begin
	declare @mabc nvarchar(10) , @gio int
	select @mabc = ID_BuoiChieu , @gio = GioChieu from inserted
	update BuoiChieu set GiaVe = iif(@gio < 17 , 70000, 90000) where ID_BuoiChieu = @mabc
end

--Viết trigger tính tiền Vé mỗi khi insert , update ở bảng Ve biết :
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

			/* FUNCTION */
-- Tạo hàm tính tổng số vé đã bán được trong từng tháng của năm 2020
create function TongVe()
returns table
as
	return
	select MONTH(NgayChieu) as Thang , count(ID_Ve) as TongVe 
	from Ve join BuoiChieu on BuoiChieu.ID_BuoiChieu = Ve.ID_BuoiChieu
	WHERE YEAR(NgayChieu) = 2020
	group by month(NgayChieu)

select * from TongVe()

-- Tính doanh thu trong ngày với thông tin ngày là tham số đầu vào
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

-- Hàm tính tổng vé và tổng doanh thu theo phim
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

			/* Câu lệnh điều khiển */
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
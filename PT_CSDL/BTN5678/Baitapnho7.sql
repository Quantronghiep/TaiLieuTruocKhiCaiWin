/*1. Tạo thủ tục chèn là các thông tin hóa đơn và chi tiết hóa đơn (giả sử chỉ tiết hóa đơn được
lấy từ một bảng tạm), hãy đảm bảo việc cập nhật là đồng thời thành công hoặc không thành công (transaction) */
create table #temp(
MaHD nvarchar(5),
MaSP tinyint,
SoLuong tinyint,
GiaBan money)


CREATE PROC NhapHD @MaHD nvarchar(5), @MaKH nvarchar(10), @MaNV int, @NgayLap datetime, @NgayGiao datetime
as
BEGIN
	BEGIN TRAN;
	BEGIN TRY
		insert into tblHoaDon(MaHD, MaKH, MaNV, NgayLapHD, NgayGiaoHang) values (@MaHD, @MaKH, @MaNV, @NgayLap, @NgayGiao)
		INSERT INTO tblchitiethoadon(MaHD, MaSP, SoLuong, GiaBan) select MaHD, MaSP, SoLuong, GiaBan from #temp where MaHD=@MaHD
    COMMIT TRAN;
	END TRY
	BEGIN CATCH
		PRINT 'Error: ' + ERROR_MESSAGE();
		ROLLBACK TRAN;
	END CATCH;
	delete from #temp where MaHD=@MaHD
END;

INSERT INTO #temp(MaHD, MaSP, SoLuong, GiaBan) values ('10144',1,20,10), ('10144',2,10,10), ('10144',3,30,10), ('10144',4,20,20)

exec NhapHD '10144','AGROMAS', 1, '2021-02-03', '2021-02-03'

select * from tblhoadon where MaHD='10144'
select * from tblChiTietHoaDon where MaHD='10144'

/* 2. Tạo thủ tục có đầu vào là số hóa đơn, đầu ra là số tiền cần thanh toán */
create proc TienThanhToan @id nvarchar(5) , @tongTien money output
as
begin
	select @tongTien = sum(SoLuong * GiaBan) from tblChiTietHoaDon where MaHD = @id
end

declare @ma nvarchar(5) , @t money
exec TienThanhToan '10144' , @t output
print('Tong tien cua ma 10144 la : ' + CONVERT(nvarchar,@t))
	
/* 3. Tạo view QUA TANG gồm có các field sau:
MaHD, MaKH, NgayLapHD, TenSp, Soluong, Giaban, ThanhTien, Giamgia, Quatang.
Trong đó: ThànhTiền là Số lượng nhân giá bán. Giảmgiá là 10% của ThànhTiền nếu thành
tiền của sản phẩm không dưới 500 và Soluong sản phẩm bán phải từ 35 trở lên. Quà tặng
được tính như sau: nếu thành tiền ít hơn 1000 thì không được vé nào, từ 1000 đến <2000 được
1 vé ca nhạc, từ 2000 đến <3000 được 2 vé ca nhạc, v.v… (ví dụ: nếu thànhtiền = 4000 thì
Quà tặng là 4 vé ca nhạc). Sắp xếp theo MaHD theo thứ tự tăng dần.  */
alter view QuaTang
as
Select tblHoaDon.MaHD , MaKH , NgayLapHD , TenSP , SoLuong , GiaBan ,(SoLuong * GiaBan) as ThanhTien , 
	iif((SoLuong * GiaBan) >=500 and SoLuong >= 35, 0.9*(SoLuong * GiaBan), 0) as GiamGia,
	iif((SoLuong * GiaBan)% 1000 >= 500 ,cast((SoLuong * GiaBan)/1000 as int )-1,cast((SoLuong * GiaBan)/1000 as int)) as QuaTang
from tblHoaDon join tblChiTietHoaDon on tblHoaDon.MaHD = tblChiTietHoaDon.MaHD 
			join tblSanPham on tblChiTietHoaDon.MaSP =tblSanPham.MaSP
group by tblHoaDon.MaHD , MaKH , NgayLapHD , TenSP , SoLuong , GiaBan
order by tblHoaDon.MaHD asc
OFFSET 0 ROWS

SELECT * FROM QuaTang

/* 4. Thêm trường TongSLBan (tổng số lượng bán) vào bảng sản phẩm. Tạo trigger cập nhật dữ
liệu tổng số sản phẩm đã bán cho trường này mỗi khi thêm, sửa, xóa một chi tiết hóa đơn. */
ALTER TABLE tblSanPham
ADD TongSLBan int
--Cách  1
alter trigger cau4 on tblChiTietHoaDon
for insert , update , delete
as
begin
	declare @masp1 char(10),@masp2 char(10),@slt int,@slx int
	select @masp1= MaSP , @slt = SoLuong from inserted
	select @masp2= MaSP , @slx=SoLuong from deleted
	update tblSanPham set TongSLBan = isnull(TongSLBan,0)+isnull(@slt,0)-isnull(@slx,0) where
	MaSP=IIF(@masp1 != null,@masp1,@masp2)
end

--Cách 2
alter trigger cau4 on tblChiTietHoaDon
for insert , update , delete
as
begin
	update tblSanPham set TongSLBan = isnull(TongSLBan,0) + inserted.SoLuong
	from inserted join tblSanPham on tblSanPham.MaSP = inserted.MaSP
	update tblSanPham set TongSLBan = isnull(TongSLBan,0) - deleted.SoLuong
	from deleted join tblSanPham on tblSanPham.MaSP = deleted.MaSP
end 

select * from tblSanPham
select  sum(SoLuong) from tblChiTietHoaDon
group by MaSP

--5. Lập view tính doanh thu theo tháng của năm 2021
create view DoanhThuThang
as
	Select month(NgayLapHD) as Thang,sum(SoLuong * GiaBan) as DoanhThu
	from tblChiTietHoaDon join tblHoaDon on tblChiTietHoaDon.MaHD = tblHoaDon.MaHD
	where YEAR(NgayLapHD) = 2021
	group by month(NgayLapHD)

select * from DoanhThuThang	

--6. Tạo thủ tục với đầu vào là ngày, đầu ra là số lượng hóa đơn, doanh thu của ngày đó
alter proc cau6 @ngay date , @slhd int output, @dt money output
as
begin
select @slhd = sum(SoLuong) , @dt = sum(SoLuong * GiaBan)
from tblChiTietHoaDon join tblHoaDon on tblChiTietHoaDon.MaHD = tblHoaDon.MaHD
where @ngay = cast(NgayLapHD as date)
end

declare @sl int , @t money
exec cau6 '1997-01-08' , @sl output, @t output
print(N'Số lượng : ' + CONVERT(nvarchar,@sl) + ' Doanh thu : '+ CONVERT(nvarchar,@t))

--7. Tạo hàm có đầu vào là mã hóa đơn, đầu ra là thông tin toàn bộ hóa đơn như chi tiết hóa đơn, thành tiền
alter function cau7(@mhd nvarchar(10))
returns table
as
	return
	select MaHD , MASP , SOLUONG , GIABAN , (SOLUONG*GIABAN) AS ThanhTien
	from tblChiTietHoaDon where tblChiTietHoaDon.MaHD = @mhd
	group by MaHD , MASP , SOLUONG , GIABAN

select * from cau7('10144')

--8. Tạo hàm có đầu vào là tỉnh, đầu ra là số nhân viên của tỉnh đó
CREATE function cau8z(@tinh nvarchar(100))
returns int
as
begin
	declare @x int 
	select @x = count(MaNV) 
	from tblNhanVien where DiaChi like N'%' + @tinh + '%'
	return @x
end

select dbo.cau8z(N'Hùng Vương')

--9. Tạo thủ tục xóa các hóa đơn mà không có chi tiết hóa đơn
create proc XoaHoaDon
as
begin
	delete from tblHoaDon where MAHD not in(Select MaHD from tblChiTietHoaDon)
end

exec XoaHoaDon

--10. Thêm trường TriGiaHD (trị giá hóa đơn) vào bảng Hóa đơn. Tạo trigger cập nhật dữ liệu
--cho trường này mỗi khi thêm, sửa, xóa một chi tiết hóa đơn
alter table tblHoaDon
add TriGiaHD money

alter trigger CapNhatTriGia on tblChiTietHoaDon
for insert , update , delete
as
begin
	declare @mahd1 nvarchar(10) , @mahd2 nvarchar(10), @giaban1 money,@giaban2 money, @sl1 int , @sl2 int
	if exists (select * from inserted)
		select @mahd1 = MaHD , @giaban1 = GiaBan , @sl1 = SoLuong from inserted
	if exists (select * from deleted)
		select @mahd2 = MaHD , @giaban2 = GiaBan , @sl2 = SoLuong from deleted
	update tblHoaDon set TriGiaHD = isnull(TriGiaHD,0) + ISNULL(@sl1,0) * isnull(@giaban1,0) - ISNULL(@sl2,0) * isnull(@giaban2,0)
	where MaHD = iif(@mahd1 != null , @mahd1,@mahd2)
end
/* cách 2*/
alter trigger CapNhatTriGia on tblChiTietHoaDon
for insert , update , delete
as
begin
	update tblHoaDon set TriGiaHD = isnull(TriGiaHD,0) + ISNULL(inserted.SoLuong,0) * inserted.GiaBan
	from inserted 
	where inserted.MaHD = tblHoaDon.MaHD

	update tblHoaDon set TriGiaHD = isnull(TriGiaHD,0) - ISNULL(deleted.SoLuong,0) * deleted.GiaBan
	from deleted 
	where deleted.MaHD = tblHoaDon.MaHD
end

insert tblChiTietHoaDon values('10144',6,20,10)

select * from tblChiTietHoaDon
select * from tblHoaDon
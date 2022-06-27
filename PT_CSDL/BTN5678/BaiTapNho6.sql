--1. Thêm trường Giá bán vào chi tiết hóa đơn, sau đó tạo trigger tự động cập nhật trường này
--từ Đơn giá bán của bảng tSach
alter table tChiTietHDB 
add GiaBan float

alter trigger cau1 on tChiTietHDB
for insert , update 
as
begin
	declare @sohd char(10), @masach char(10), @giaban float
	select @sohd=sohdb, @masach=masach from inserted
	select @giaban=dongiaban from tsach where masach=@masach
	update tChiTietHDB set GiaBan=@giaban where SoHDB=@sohd and MaSach=@masach
end

select * from tChiTietHDB

/* 2. Thêm trường Thành tiền cho bảng Chi tiết hóa đơn bán và tạo trigger cập nhật tự động cho
những trường này */
alter table tChiTietHDB
add ThanhTien float

alter trigger cau2 on tChiTietHDB
FOR INSERT ,UPDATE
as
begin
	declare @sohd char(10), @masach char(10), @giaban float
	select @sohd=sohdb, @masach=masach from inserted
	select @giaban=dongiaban from tsach where masach=@masach
	update tChiTietHDB set GiaBan=@giaban where SoHDB=@sohd and MaSach=@masach
	update tChiTietHDB set ThanhTien = @giaban*SLBan where SoHDB=@sohd and MaSach=@masach
end

insert into tChiTietHDB(SoHDB,MaSach,SLBan) values ('HDB02','S08',2) , ('HDB02','S10',2) , ('HDB02','S11',3)
select * from tChiTietHDB

--3. Tạo trigger khi xóa hóa đơn thì toàn bộ chi tiết hóa đơn xóa theo
create trigger cau3 on tHoaDonBan
instead of delete
as
begin
	Delete tHoaDonBan where SoHDB IN (select SoHDB from deleted)
	Delete tChiTietHDB where SoHDB IN (select SoHDB from deleted)
end

select * from tHoaDonBan
select * from tChiTietHDB
delete tHoaDonBan where SoHDB ='HDB01'

--4. Tạo thủ tục đưa ra số tiền của khách hàng đã mua trong năm 2014 khi nhập mã khách
alter PROC cau4 @makhach nvarchar(10) , @tien money output
as
begin
	select @tien = SUM(SLBan * tSach.DonGiaBan) from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
	join tHoaDonBan ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	WHERE MaKH = @makhach and year(NgayBan) = 2014
end

declare  @t money
exec cau4 'KH02', @t output
print  CONVERT(nvarchar,@t)

--5. Tạo view cho biết mã khách hàng, tên khách hàng, số điện thoại mức tiền khách hàng mua trong năm 2014
alter view cau5
as
	select tKhachHang.MaKH ,TenKH, DienThoai , SUM(SLBan * tSach.DonGiaBan) as TongTien 
	from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
	join tHoaDonBan ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB join tKhachHang on tKhachHang.MaKH = tHoaDonBan.MaKH
	where year(NgayBan) = 2014
	group by tKhachHang.MaKH ,TenKH, DienThoai

select * from cau5

--6. Tạo thủ tục đầu vào là tháng, đầu ra là doanh thu theo tháng đó
create proc cau6 @thang int , @doanhthu money output
as
begin
	select @doanhthu =  SUM(SLBan * tSach.DonGiaBan) 
	from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
	join tHoaDonBan ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
	where month(NgayBan) = @thang
end

declare @dt money
exec cau6 11 , @dt output
print ('Doanh thu tháng 11 : ' + CONVERT(nvarchar,@dt))

/* 7. Tạo thủ tục nhập dữ liệu hóa đơn và chi tiết hóa đơn (giả sử chi tiết hóa đơn với 3 bản ghi)
cùng lúc, đảm bảo rằng hoặc nhập toàn bộ hoặc không nhập gì cả (transaction) */
create table #temp(
MaHDB nvarchar(10),
MaSach nvarchar(10),
SLBan int,
KhuyenMai float)

alter PROC NhapHD @MaHDB nvarchar(5), @MaKH nvarchar(10),@NgayBan datetime, @MaNV NVARCHAR(10)
as
BEGIN
	BEGIN TRAN;
	BEGIN TRY
		insert into tHoaDonBan(SoHDB, MaNV,NgayBan, MaKH) values (@MaHDB, @MaNV, @NgayBan, @MaKH)
		INSERT INTO tChiTietHDB(SoHDB, MaSach, SLBan, KhuyenMai) select MaHDB, MaSach, SLBan, KhuyenMai from #temp where MaHDB=@MaHDB
    COMMIT TRAN;
	END TRY
	BEGIN CATCH
		PRINT 'Error: ' + ERROR_MESSAGE();
		ROLLBACK TRAN;
	END CATCH;
	delete from #temp where MaHDB=@MaHDB
END;

INSERT INTO #temp(MaHDB, MaSach, SLBan, KhuyenMai) values ('HDB14','S06',2,NULL), ('HDB14','S08',3,NULL) , ('HDB14','S11',5,NULL)
EXEC NhapHD 'HDB14' ,'NV05' , '2014-04-20', 'KH03'

--delete from #temp where MaHDB = 'HDB14'
--delete from tChiTietHDB where SoHDB = 'HDB14'
--delete from tHoaDonBan where SoHDB = 'HDB14'

--select * from #temp

select * from tHoaDonBan where SoHDB = 'HDB14'
select * from tChiTietHDB WHERE SoHDB = 'HDB14'

/* 8. Tạo View thống kê trong năm 2014 mỗi một mặt hàng trong mỗi tháng và trong cả năm
bán được với số lượng bao nhiêu (Yêu cầu kết quả hiểu thị dưới dạng bảng, hai cột đầu là mã
hàng, tên hàng, các cột còn lại tương ứng từ tháng 1 đến tháng 12 và cả năm. Như vậy mỗi
dòng trong kết quả cho biết số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng. */

alter view cau8 
as
	select tSach.MaSach , TenSach  ,
	sum(case
		when MONTH(NgayBan) = 1 then SLBan else 0
	end) as Thang1 ,
	sum(case
		when MONTH(NgayBan) = 2 then SLBan else 0
	end) as Thang2 ,
	sum(case
		when MONTH(NgayBan) = 3 then SLBan else 0
	end) as Thang3 ,
	sum(case
		when MONTH(NgayBan) = 4 then SLBan else 0
	end) as Thang4,
	sum(case
		when MONTH(NgayBan) = 5 then SLBan else 0
	end) as Thang5 ,
	sum(case
		when MONTH(NgayBan) = 6 then SLBan else 0
	end) as Thang6 ,
	sum(case
		when MONTH(NgayBan) = 7 then SLBan else 0
	end) as Thang7 ,
	sum(case
		when MONTH(NgayBan) = 8 then SLBan else 0
	end) as Thang8 ,
	sum(case
		when MONTH(NgayBan) = 9 then SLBan else 0
	end) as Thang9,
	sum(case
		when MONTH(NgayBan) = 10 then SLBan else 0
	end) as Thang10 ,
	sum(case
		when MONTH(NgayBan) = 11 then SLBan else 0
	end) as Thang11 ,
	sum(case
		when MONTH(NgayBan) = 12 then SLBan else 0
	end) as Thang12 ,
	sum(SLBan) as CaNam

	from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	where YEAR(NgayBan) = 2014
	group by tSach.MaSach , TenSach

select * from cau8

	select * from tChiTietHDB
	select * from tHoaDonBan where year(NgayBan) = 2014

/*9. Tạo bảng gồm các trường: mã hàng, tên hàng, số lượng nhập, số lượng bán, tháng, năm
Cập nhật tự động thông tin cho bảng này*/

create table BangPhu(
MaSach nvarchar(10)  ,
TenSach nvarchar(100),
SLN int ,
SLB INT,
Thang int ,
Nam int
)

alter trigger cau9 on tChiTietHDB
for insert , update , delete
as
begin
	declare @mas nvarchar(10) , @ten nvarchar(100) , @sln int , @slb int , @thang int , @nam int , @mhd nvarchar(10)
	declare @masx nvarchar(10) , @slbx int , @mhdx nvarchar(10)
	select @mas = MaSach , @mhd = SoHDB , @slb = sum(SLBan) from inserted group by MaSach , SoHDB
	select @masx = MaSach from deleted
	select @ten = TenSach from tSach where MaSach = @mas
	select @sln = sum(SLNhap) from tChiTietHDN where MaSach = @mas group by MaSach
	select @thang = month(NgayBan) , @nam = year(NgayBan) from tHoaDonBan where SoHDB = @mhd
	if exists (select MaSach from BangPhu where MaSach = @mas)
		update BangPhu set TenSach = @ten , SLN = @sln , SLB = @slb , Thang = @thang , Nam = @nam
		where MaSach = @mas
	if (@mas is not null) and  not exists (select MaSach from BangPhu where MaSach = @mas)
		insert into BangPhu values(@mas , @ten , @sln , @slb , @thang , @nam)
	if ( @mas is null ) and exists (select MaSach from BangPhu where MaSach = @masx)
		delete BangPhu where MaSach = @masx
end

delete from BangPhu

select * from tChiTietHDB

insert into BangPhu values('S10' , 'Buc vl' , 12 , 5 , 6 , 2014)
select * from BangPhu



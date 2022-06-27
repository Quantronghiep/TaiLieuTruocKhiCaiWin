--1.	Tạo view in ra danh sách các sách của nhà xuất bản trẻ nhập trong năm 2021
create view cau1
as
	select tSach.* from tSach join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
	WHERE TenNXB = N'NXB Trẻ'

select * from cau1

--2.	Tạo view thống kê các sách không bán được trong năm 2014
alter view cau2
as
	select * from tSach 
	where tSach.MaSach not in (Select MaSach from tChiTietHDB join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where YEAR(NgayBan) = 2014)

select * from cau2

--3.	Tạo view thống kê 10 khách hàng có tổng hóa đơn cao nhất trong năm 2021
create view cau3
as
	select top(10) with ties tKhachHang.MaKH , TenKH , (sum(SLBan * DonGiaBan )) as tongTien
	from tKhachHang join tHoaDonBan on tKhachHang.MaKH = tHoaDonBan.MaKH join tChiTietHDB
	on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB join tSach on tSach.MaSach = tChiTietHDB.MaSach
	where year(NgayBan) = 2014
	group by tKhachHang.MaKH , TenKH
	order by tongTien desc 

select * from cau3

/* 4.	Tạo view thống kê số lượng sách bán ra trong năm 2021 và số lượng sách còn tồn kho ứng với mỗi đầu sách */
alter view cau4
as
	SELECT TenSach ,sum(SLNhap) as Nhap , SUM(SLBan) as TongSLBan , Sum(SLNhap) - Sum(SLBan) as Ton
	FROM tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
			join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
			join tChiTietHDN on tSach.MaSach = tChiTietHDN.MaSach
	where YEAR(NgayBan) = 2014
	group by TenSach

select * from cau4

--5.	Tạo view đưa ra những thông tin hóa đơn và tổng tiền của hóa đơn đó trong ngày 16/11/2021
alter view cau5
as
	Select tHoaDonBan.SoHDB , MaNV , NgayBan ,MaKH , sum(SLBan * DonGiaBan ) as tongTien
	from tHoaDonBan join tChiTietHDB  on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
	join tSach on tSach.MaSach = tChiTietHDB.MaSach
	WHERE NgayBan = '2014-04-10 00:00:00.000' --04/10/2014
	group by tHoaDonBan.SoHDB , MaNV , NgayBan ,MaKH 

	SELECT * FROM cau5

--6.	 Tạo hàm đưa ra tổng số tiền đã bán sách trong một năm với tham số đầu vào là năm
create function cau6(@nam int)
returns float
as
begin
	declare @tongtien float
	select @tongtien = sum(SLBan * DonGiaBan)
	from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
			join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where year(NgayBan) = @nam
	return @tongtien
end

select  dbo.cau6(2014)

--7.	Tạo hàm đưa ra danh sách 10 đầu sách bán chạy nhất trong tháng nào đó (tháng là tham số đầu vào)
alter function cau7(@thang int)
returns table
as
return	
	select top(10) tSach.MaSach , TenSach , SLBan
	FROM tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
			join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where MONTH(NgayBan) = @thang
	order by SLBan desc

select * from cau7(4)

--8.	 Tạo hàm đưa ra danh sách n nhân viên có doanh thu cao nhất trong một năm với n và năm là tham số đầu vào
create function cau8(@sl int , @nam int ) 
returns table
as
return 
	select  top(@sl) tNhanVien.MaNV , TenNV , sum(SLBan * DonGiaBan) as DoanhThu
	FROM tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
			join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
			join tNhanVien on tNhanVien.MaNV = tHoaDonBan.MaNV
	where year(NgayBan) = @nam
	group by tNhanVien.MaNV , TenNV 
	order by DoanhThu desc

select * from cau8(3, 2014)

--9.	Tạo hàm đưa ra thông tin nhân viên sinh nhật trong ngày là tham số nhập vào
create function cau9(@ngay date)
returns table
as
return 
	select *
	from tNhanVien
	where cast(NgaySinh as date ) = @ngay

select * from cau9('1990-09-11')

--10.	Tạo hàm đưa ra danh sách tồn trong kho quá 2 năm 
alter function cau10()
returns table
as
	return
	select distinct MaSach
	from tChiTietHDN join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
	where Datediff(Year , NgayNhap , GETDATE()) > 2

SELECT * from cau10()
--11.	Tạo thủ tục có đầu vào là năm, đầu ra là số lượng sách nhập, sách bán và sách tồn của năm đó
create proc cau11 @nam int , @sln int output , @slb int output , @slt int output
as
begin
	select @sln =  sum(SLNhap) from tChiTietHDN join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
	where YEAR(NgayNhap) = @nam
	select @slb =  sum(SLBan) from tChiTietHDB join tHoaDonBAn on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where YEAR(NgayBan) = @nam
	select @slt = @sln - @slb
end

declare  @sln int , @slb int , @slt int
exec cau11 2014 , @sln output ,@slb output,@slt output
print ('SLNhap : ' + cast(@sln as char))
print ('SLBan : ' + cast(@slb as char))
print ('SLTon : ' + cast(@slt as char))

--12.	Tạo thủ tục nhập dữ liệu cho bảng hóa đơn nhập và chi tiết hóa đơn nhập cùng lúc (sử dụng transaction)
create table #temp(
MaHDB nvarchar(10),
MaSach nvarchar(10),
SLBan int,
KhuyenMai float)

create  PROC NhapHD @MaHDB nvarchar(5), @MaKH nvarchar(10),@NgayBan datetime, @MaNV NVARCHAR(10)
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

--13.	Tạo thủ tục có đầu vào là mã nhà cung cấp, đầu ra là số đầu sách và số tiền cửa hàng đã nhập của nhà cung cấp đó
alter proc cau13 @mncc nvarchar(10) , @sds int output , @sotien money output
as
begin
	select @sds = count(tChiTietHDN.MaSach) , @sotien = sum(SLNhap * DonGiaNhap) 
	from tChiTietHDN join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN join tSach on tSach.MaSach = tChiTietHDN.MaSach
	WHere MaNCC = @mncc
end

declare @sds int , @tien money
exec cau13 'NCC04' , @sds output , @tien output
print ('SDS : ' + CAST(@sds as char))
print ('Tong tien nhap : ' + convert(nvarchar,@tien))

--14.	Tạo thủ tục có đầu vào là năm, đầu ra là số tiền nhập hàng, số tiền bán hàng của năm đó.
create proc cau14 @nam int , @tiennhap money output , @tienban money output
as
begin
	select @tiennhap = sum(SLNhap * DonGiaNhap) 
	from tChiTietHDN join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN join tSach on tSach.MaSach = tChiTietHDN.MaSach
	where year(NgayNhap) = @nam
	select @tienban = sum(SLBan * DonGiaBan) 
	from tChiTietHDB join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB join tSach on tSach.MaSach = tChiTietHDB.MaSach
	where year(NgayBan) = @nam
end

declare @tn money , @tb money
exec cau14 2014 , @tn output , @tb output
print cast(@tn as char)
print cast(@tb as char)

--15.	 Tạo thủ tục xóa đồng thời hóa đơn bán và chi tiết hóa đơn bán (dùng transaction)
create  PROC cau15 @mhd nvarchar(10)
as
BEGIN
	BEGIN TRAN;
	BEGIN TRY
		delete from tHoaDonBan where SoHDB = @mhd
		delete from tChiTietHDB where SoHDB = @mhd
    COMMIT TRAN;
	END TRY
	BEGIN CATCH
		PRINT 'Error: ' + ERROR_MESSAGE();
		ROLLBACK TRAN;
	END CATCH;
END;

select * from tHoaDonBan
select * from tChiTietHDB

exec cau15 'HDB01'

--16.	Số lượng trong bảng Sách là số lượng tồn kho, cập nhật tự động dữ liệu cho trường này mỗi khi nhập hay bán sách
CREATE trigger Nhap on tChiTietHDN
after insert,update,delete as
begin
   UPDATE S
	set S.SoLuong = S.SoLuong + I.SLNhap
	from tSach S join inserted I on S.MaSach = I.MaSach

 UPDATE S
	set S.SoLuong = S.SoLuong - D.SLNhap
	from tSach S join deleted D on S.MaSach = D.MaSach
END

CREATE trigger Ban on tChiTietHDB
after insert,update,delete as
begin
      UPDATE S
	set S.SoLuong = S.SoLuong - I.SLBan
	from tSach S join inserted I on S.MaSach = I.MaSach

 UPDATE S
	set S.SoLuong = S.SoLuong + D.SLBan
	from tSach S join deleted D on S.MaSach = D.MaSach
END

select * from tSach
select * from tChiTietHDB
select * from tChiTietHDN

--17.	Thêm trường tổng tiền cho hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn
alter table tHoaDonBan
add TongTien money

create trigger cau17 on tChiTietHDB
for insert , update , delete
as
begin
	declare @mhd nvarchar(10) , @masach nvarchar(10) , @slb int , @dgb money , @mhdx nvarchar(10) , @slbx int 
	select @mhd = SoHDB , @masach = MAsach ,  @slb = SLBan from inserted
	select @mhdx = SoHDB , @slbx = SLBan , @masach = MaSach from deleted
	select @dgb = DonGiaBan from tSach where MaSach = @masach
	update tHoaDonBan set TongTien = isnull(TongTien,0) + (isnull(@slb,0) - isnull(@slbx,0)) * @dgb
	where SoHDB = iif(@mhd != null , @mhd,@mhdx)
end

select * from tChiTietHDB
select * from tHoaDonBan

--18.	Thêm trường Tổng tiền tiêu dùng cho bảng khách hàng, cập nhật thông tin cho trường này và đặt lại về 0 vào ngày 1/1 hàng năm
alter table tKhachHang
add TongTienTD money

alter trigger cau18 on tChiTietHDB
for insert , update , delete
as
begin
	update tKhachHang set TongTienTD = ISNULL(TongTienTD,0) + ISNULL(inserted.SLBan,0) * DonGiaBan
	from inserted join tSach on tSach.MaSach = inserted.MaSach join tHoaDonBan on tHoaDonBan.SoHDB = inserted.SoHDB
	where tKhachHang.MaKH = tHoaDonBan.MaKH

	update tKhachHang set TongTienTD = ISNULL(TongTienTD,0) + ISNULL(deleted.SLBan,0) * DonGiaBan
	from deleted join tSach on tSach.MaSach = deleted.MaSach join tHoaDonBan on tHoaDonBan.SoHDB = deleted.SoHDB
	where tKhachHang.MaKH = tHoaDonBan.MaKH
	
	update tKhachHang set TongTienTD = 0 
	FROM tHoaDonBan
	where tKhachHang.MaKH = tHoaDonBan.MaKH and DAY(NgayBan) = 01 and MONTH(NgayBan) = 01
end

select * from tKhachHang

--19.	Thêm trường Số đầu sách cho bảng nhà cung cấp, cập nhật tự động số đầu sách nhà cung cấp cung cấp cho cửa hàng 
alter table tNhaCungCap
add SoDauSach int

create trigger cau19 on tChiTietHDN
for insert , update , delete
as
begin
	declare @mncc nvarchar(10) , @sl int , @mnccx nvarchar(10) , @slx int
	select @mncc = MaNCC , @sl = count(distinct MaSach)
	from inserted join tHoaDonNhap on tHoaDonNhap.SoHDN = inserted.SoHDN
	group by MaNCC
	update tNhaCungCap set SoDauSach = ISNULL(SoDauSach,0) + ISNULL(@sl,0)
	where MaNCC = @mncc

	select @mnccx = MaNCC , @slx = count(distinct MaSach)
	from deleted join tHoaDonNhap on tHoaDonNhap.SoHDN = deleted.SoHDN
	group by MaNCC
	update tNhaCungCap set SoDauSach = ISNULL(SoDauSach,0) - ISNULL(@slx,0)
	where MaNCC = @mnccx
end

select * from tNhaCungCap

--20.	 Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn
alter table tHoaDonBan
add SoSP int

create trigger cau20 on tChiTietHDB
for insert , update , delete
as
begin
	update tHoaDonBan set SoSP = ISNULL(SoSP,0) + inserted.SLBan
	from inserted join tHoaDonBan on tHoaDonBan.SoHDB = inserted.SoHDB
	update tHoaDonBan set SoSP = ISNULL(SoSP,0) - deleted.SLBan
	from deleted join tHoaDonBan on tHoaDonBan.SoHDB = deleted.SoHDB
end

select * from tChiTietHDB
select * from tHoaDonBan
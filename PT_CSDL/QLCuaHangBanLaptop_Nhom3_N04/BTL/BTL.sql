/* View */
/*Câu 1: Tính doanh thu năm 2020*/

create view DOANHTHU2020 as
select
isnull(sum(case month(Ngayban) when 1 then (soluong*dongiaban)end),0) as Thang1,
isnull(sum(case month(Ngayban) when 2 then (soluong*dongiaban)end),0) as Thang2,
isnull(sum(case month(Ngayban) when 3 then (soluong*dongiaban)end),0) as Thang3,
isnull(sum(case month(Ngayban) when 4 then (soluong*dongiaban)end),0) as Thang4,
isnull(sum(case month(Ngayban) when 5 then (soluong*dongiaban)end),0) as Thang5,
isnull(sum(case month(Ngayban) when 6 then (soluong*dongiaban)end),0) as Thang6,
isnull(sum(case month(Ngayban) when 7 then (soluong*dongiaban)end),0) as Thang7,
isnull(sum(case month(Ngayban) when 8 then (soluong*dongiaban)end),0) as Thang8,
isnull(sum(case month(Ngayban) when 9 then (soluong*dongiaban)end),0) as Thang9,
isnull(sum(case month(Ngayban) when 10 then (soluong*dongiaban)end),0) as Thang10,
isnull(sum(case month(Ngayban) when 11 then (soluong*dongiaban)end),0) as Thang11,
isnull(sum(case month(Ngayban) when 12 then (soluong*dongiaban)end),0) as Thang12,
isnull(sum(SoLuong*DonGiaBan),0) as Canam
from HoaDonBan as hd
join ChiTietHDB as ct on ct.mahdb=hd.mahdb
where year(ngayban)=2020

select * from DOANHTHU2020

/*Câu 2: Tính tổng tiền cho từng hóa đơn nhập*/

CREATE VIEW TongTienHDN AS
select HoaDonNhap.MaHDN,sum(SoLuong*Dongianhap) as Tongtien 
from HoaDonnhap inner join ChiTietHDN 
on HoaDonNhap.MaHDN=ChiTietHDN.MaHDN
group by HoaDonNhap.MaHDN

select * from TongTienHDN

/*Câu 3: Đưa ra 3 sản phẩm được bán nhiều nhất trong tháng 3 năm 2020*/

create view Top3SPBanDuocNhieu as
select top 3 SanPham.MaSP,SanPham.TenSP,ChiTietSanPham.KieuDang,ChiTietSanPham.ManHinh,
ChiTietSanPham.RAM,ChiTietSanPham.HeDieuHanh,ChiTietSanPham.CPU,ChiTietSanPham.Pin,Count(distinct ChiTietHDB.SoLuong) as [So lan ban]
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
join SanPham on ChiTietHDB.MaSP=SanPham.MaSP 
join ChiTietSanPham on ChiTietSanPham.MaSP=SanPham.MaSP
where month(NgayBan)=3 and year(NgayBan)=2020
group by SanPham.MaSP,SanPham.TenSP,ChiTietSanPham.KieuDang,ChiTietSanPham.ManHinh,
ChiTietSanPham.RAM,ChiTietSanPham.HeDieuHanh,ChiTietSanPham.CPU,ChiTietSanPham.Pin  
order by count(distinct ChiTietHDB.SoLuong) desc

select * from Top3SPBanDuocNhieu

/*Câu 4:Tạo view dùng để thống kê số lượng nhập trong tháng 10 năm 2021*/

create view ThongKeSLNhap as
select MaSP,sum(SoLuong) as SoLuongNhap
from HoaDonNhap join ChiTietHDN on HoaDonNhap.MaHDN=ChiTietHDN.MaHDN
where month(NgayNhap)=10 and year(NgayNhap)=2021
group by MaSP

select * from ThongKeSLNhap

/*cau 5: Tạo view QUA TANG gồm có các field sau:
MaHD, MaKH, NgayBan, MASP, Soluong, Giaban, ThanhTien, Giamgia, Quatang.
Trong đó: ThànhTiền là Số lượng nhân giá bán. Giảmgiá là 10% của ThànhTiền nếu thành
tiền của sản phẩm không dưới 10000000 . Quà tặng
được tính như sau: nếu thành tiền ít hơn 10000000 thì không được voucher nào, từ 10000000 đến <20000000 được
1 voucher, từ 20000000 đến <30000000 được 2 voucher, v.v… (ví dụ: nếu thànhtiền = 40000000 thì
Quà tặng là 4 voucher). Sắp xếp theo MaHD theo thứ tự tăng dần.*/

create view QUATANG as
select top 1000 HoaDonBan.MaHDB,MaKH,SanPham.MaSP,NgayBan,ChiTietHDB.SoLuong,DonGiaBan,(ChiTietHDB.SoLuong*DonGiaBan) as ThanhTien,
(case when DonGiaBan>10000000 then (ChiTietHDB.SoLuong*DonGiaBan)-(ChiTietHDB.SoLuong*DonGiaBan)*0.1 else 0
end )as GiamGia,
(case when (ChiTietHDB.SoLuong*DonGiaBan)<10000000 then 'Khong tang ve'
when (ChiTietHDB.SoLuong*DonGiaBan) between 10000000 and 20000000 then 'Tang 1 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan) between 20000000 and 30000000 then 'Tang 2 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan) between 30000000 and 40000000 then 'Tang 3 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan) between 40000000 and 50000000 then 'Tang 4 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)between 50000000 and 60000000 then 'Tang 5 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)between 60000000 and 70000000 then 'Tang 6 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)between 70000000 and 80000000 then 'Tang 7 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)between 80000000 and 90000000 then 'Tang 8 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)between 90000000 and 100000000 then 'Tang 9 voucher'
when (ChiTietHDB.SoLuong*DonGiaBan)> 100000000 then 'Tang 10 voucher'
end) as QuaTang
from HoaDonBan join ChiTietHDB on HoaDonban.MaHDB=ChiTietHDB.MaHDB
join SanPham on ChiTietHDB.MaSP=SanPham.MaSP
group by HoaDonBan.MaHDB,MaKH,SanPham.MaSP,NgayBan,ChiTietHDB.SoLuong,DonGiaBan

select * from QUATANG

/*Câu 6:Tạo View thống kê trong năm 2021 mỗi một mặt hàng trong mỗi tháng và trong cả năm 
bán được với số lượng bao nhiêu */

create view ThongKe2021Hang as
select sp.MaSP,sp.TenSP,
isnull(sum(case month(Ngayban) when 1 then (ct.soluong)end),0) as Thang1,
isnull(sum(case month(Ngayban) when 2 then (ct.soluong)end),0) as Thang2,
isnull(sum(case month(Ngayban) when 3 then (ct.soluong)end),0) as Thang3,
isnull(sum(case month(Ngayban) when 4 then (ct.soluong)end),0) as Thang4,
isnull(sum(case month(Ngayban) when 5 then (ct.soluong)end),0) as Thang5,
isnull(sum(case month(Ngayban) when 6 then (ct.soluong)end),0) as Thang6,
isnull(sum(case month(Ngayban) when 7 then (ct.soluong)end),0) as Thang7,
isnull(sum(case month(Ngayban) when 8 then (ct.soluong)end),0) as Thang8,
isnull(sum(case month(Ngayban) when 9 then (ct.soluong)end),0) as Thang9,
isnull(sum(case month(Ngayban) when 10 then (ct.soluong)end),0) as Thang10,
isnull(sum(case month(Ngayban) when 11 then (ct.soluong)end),0) as Thang11,
isnull(sum(case month(Ngayban) when 12 then (ct.soluong)end),0) as Thang12,
isnull(sum(ct.SoLuong),0) as Canam
from HoaDonBan as hd
join ChiTietHDB as ct on ct.mahdb=hd.mahdb
join SanPham as sp on ct.MaSP=sp.MaSP
where year(ngayban)=2021
group by sp.MaSP,sp.TenSP

select * from ThongKe2021Hang

/*Câu 7: Tính tổng tiền của mỗi hoá đơn*/

create view TongTienHD as
select HoaDonBan.MaHDB,MaNV,MaKH,NgayBan,sum(SoLuong*DonGiaBan) as TongTien
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
group by HoaDonBan.MaHDB,MaNV,MaKH,NgayBan

select * from TongTienHD

/*Câu 8:Tạo view 3 sản phẩm được bán ít nhất năm 2021*/

create view TOP3SPBANITNHAT as
select top 3 SanPham.MaSP,SanPham.TenSP,ChiTietSanPham.KieuDang,ChiTietSanPham.ManHinh,
ChiTietSanPham.RAM,ChiTietSanPham.HeDieuHanh,ChiTietSanPham.CPU,ChiTietSanPham.Pin,Count(distinct ChiTietHDB.SoLuong) as [So lan ban]
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
join SanPham on ChiTietHDB.MaSP=SanPham.MaSP 
join ChiTietSanPham on ChiTietSanPham.MaSP=SanPham.MaSP
where year(NgayBan)=2021
group by SanPham.MaSP,SanPham.TenSP,ChiTietSanPham.KieuDang,ChiTietSanPham.ManHinh,
ChiTietSanPham.RAM,ChiTietSanPham.HeDieuHanh,ChiTietSanPham.CPU,ChiTietSanPham.Pin 
order by [So lan ban] asc

select * from TOP3SPBANITNHAT


/* Trigger */
/* 1. Thêm trường ThanhTien (thành tiền) vào bảng ChiTietHDB.
Tạo trigger điền dữ liệu cho trường ThanhTien khi insert, update biết
ThanhTien = SoLuong * DonGiaBan */
alter table ChiTietHDB
	add ThanhTien money

create trigger TrgCapNhatThanhTien on ChiTietHDB
for insert, update 
as
begin
	declare @mahdb nvarchar(10), @masp int, @giaban money
	select @mahdb = MaHDB, @masp = MaSP from inserted
	update ChiTietHDB set ThanhTien=SoLuong*DonGiaBan where MaHDB=@mahdb and MaSP=@masp
end

update ChiTietHDB set SoLuong = 5 where MaHDB = N'HDB01' and MaSP = 2
insert ChiTietHDB values (N'HDB01',7,3,38100000,NULL)

/* 2. Cập nhật trường giảm giá cho bảng chi tiết hóa đơn bán là 5% của giá bán nếu số lượng bán >= 5*/
create trigger TrgCapNhatGiamGia on ChiTietDonDH
for insert, update 
as
begin
	declare @maddh nvarchar(10), @masp int
	select @maddh = MaDDH, @masp = MaSP from inserted
	update ChiTietDonDH set GiamGia=0.05*DonGia where MaDDH = @maddh and MaSP = @masp and SoLuong >= 5
end

select * from ChiTietDonDH where MaDDH = N'DDH01' and MaSP = 2
update ChiTietDonDH set SoLuong = 6 where MaDDH = N'DDH01' and MaSP = 2

/* 3. Thêm trường TongTien (tổng tiền) vào bảng hóa đơn bán. 
Tạo trigger cập nhật dữ liệu cho trường này khi insert, update, delete một chi tiết hóa đơn bán.*/
alter table HoaDonBan
	add TongTien money

create trigger TrgCapNhatTongTien on ChiTietHDB
for insert, update, delete as
begin
	declare @mahdb nvarchar(5), @sl1 int, @sl2 int, @giaban1 money, @giaban2 money, @giamgia1 money, @giamgia2 money
	if exists (select * from inserted)
		select @mahdb = MaHDB, @sl1 = SoLuong, @giaban1 = DonGiaBan, @giamgia1 = GiamGia from inserted
	if exists (select * from deleted)
		select @mahdb = MaHDB, @sl2 = SoLuong, @giaban2 = DonGiaBan, @giamgia2 = GiamGia from deleted
	update HoaDonBan set TongTien = isnull(TongTien,0)+(isnull(@sl1,0)*isnull(@giaban1,0)-isnull(@giamgia1,0))-(isnull(@sl2,0)*isnull(@giaban2,0)-isnull(@giamgia2,0)) where MaHDB = @mahdb
end

select * from ChiTietHDB where MaHDB = N'HDB02'
delete from ChiTietHDB where MaHDB = N'HDB02'

insert ChiTietHDB (MaHDB,MaSP,SoLuong,DonGiaBan,GiamGia) values (N'HDB02',3,5,21000000.0000,NULL)
insert ChiTietHDB (MaHDB,MaSP,SoLuong,DonGiaBan,GiamGia) values (N'HDB02',5,3,23290000.0000,NULL)
insert ChiTietHDB (MaHDB,MaSP,SoLuong,DonGiaBan,GiamGia) values (N'HDB02',6,8,22490000.0000,NULL)

update ChiTietHDB set SoLuong = 6 where MaHDB = N'HDB02' and MaSP = 6

delete ChiTietHDB where MaHDB = N'HDB02' and MaSP = 3

select * from HoaDonBan where MaHDB = N'HDB02'

/* 4. Ràng buộc ngày bán trong bảng hóa đơn bán sao cho ngày bán không được lớn hơn ngày hiện tại. */
create trigger TrgNgayBan on HoaDonBan
for insert,update 
as
begin
	declare @ngayban date 
	select @ngayban=NgayBan from inserted
	if(@ngayban>getdate())
		begin
			raiserror ('Ngay ban khong duoc lon hon ngay hien tai',16,1)
			ROLLBACK TRAN
		end
end

insert HoaDonBan values (N'HDB36',N'NV01',N'KH01','2021-11-13')

select * from HoaDonBan where MaHDB = N'HDB36'

/* 5. Tự động cập nhật lại số lượng sản phẩm khi xuất kho nếu số lượng xuất lớn hơn số lượng sản phẩm thì hiện lên thông báo. */
create trigger TrgCapNhatSoLuongSP on ChiTietPhieuXuat
for insert,update,delete
as
begin
	declare @soluong1 int,@soluong2 int,@soluongconlai int,@soluonghientai int,@masp int
	if exists (select * from inserted)
		select @masp = MaSP, @soluong1 =SoLuong from inserted
	if exists (select * from deleted)
		select @masp = MaSP, @soluong2 =SoLuong from deleted
	select @soluonghientai=SoLuong from SanPham where MaSP=@masp
	select @soluongconlai = @soluonghientai - isnull(@soluong1,0) + isnull(@soluong2,0)
	if(@soluongconlai<0)
		begin
			raiserror ('So luong san pham con lai khong am',16,1)
			ROLLBACK TRAN
		end
	else
		begin
			update SanPham set SoLuong=@soluongconlai where MaSP=@masp
		end
end

select * from SanPham where MaSP = 1
select * from ChiTietPhieuXuat where MaSP = 1

insert ChiTietPhieuXuat (MaPXK,MaSP,SoLuong) values ('3',1,10)
insert ChiTietPhieuXuat (MaPXK,MaSP,SoLuong) values ('4',1,45)

update ChiTietPhieuXuat set SoLuong = 15 where MaPXK = '3' and MaSP = 1

delete ChiTietPhieuXuat where MaPXK = 3 and MaSP = 1

/* 6. Tạo trigger tự động xóa bảng ghi ChiTietDDH khi xóa dữ liệu hóa đơn bán trong bảng DonDatHang. */
create trigger TrgDeleteDDH on DonDatHang
for delete
as
begin
	delete ChiTietDonDH where MaDDH = (select MaDDH from deleted)
	delete DonDatHang where MaDDH = (select MaDDH from deleted)
end

select * from ChiTietDonDH where MaDDH = N'DDH01'
select * from DonDatHang where MaDDH = N'DDH01'

delete DonDatHang where MaDDH = N'DDH01'

/* Thủ tục */
--Câu 1: Tạo nội thủ tục với đầu vào một tháng,năm, đầu ra là  tổng doanh thu cho tháng đó

create procedure DoanhThu @month datetime, @year datetime, @tongdoanhthu money output
as 
begin
	select @tongdoanhthu=sum(SoLuong*DonGiaBan)
	from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
	where month(NgayBan)=@month and year(NgayBan)=@year
end

declare @tdoanhthu money
exec DoanhThu 11, 2020, @tdoanhthu output
print @tdoanhthu

--Câu 2: Tạo nội thủ tục đưa ra tổng chi phí nhập sản phẩm của cửa hàng trong năm nào đó khi nhập năm

create procedure ChiPhiNhap @year datetime, @tongchiphi money output
as
begin
	select @tongchiphi=sum(SoLuong*DonGiaNhap)
	from ChiTietHDN join HoaDonNhap on ChiTietHDN.MaHDN=HoaDonNhap.MaHDN
	where year(NgayNhap)=@year
end

declare @tchiphi money
exec ChiPhiNhap 2020, @tchiphi output
print @tchiphi

--Câu 3: Tạo nội thủ tục với đầu vào là tháng, năm, đầu ra là nhân viên bán được nhiều hàng nhất trong tháng đó

create procedure ThuongNhanVien @month int, @year int
as
begin
	select NhanVien.MaNV, TenNV, iif(GioiTinh=N'True',N'Nữ','Nam') as GioiTinh, DiaChi, DienThoai, TenCV,sum(SoLuong) as SLBan
	from ChucVu join NhanVien on ChucVu.MaCV=NhanVien.MaCV
	            join HoaDonBan on NhanVien.MaNV=HoaDonBan.MaNV
				join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
	where month(NgayBan)=@month and year(NgayBan)=@year
	group by NhanVien.MaNV, TenNV, GioiTinh, DiaChi, DienThoai, TenCV
	having sum(SoLuong) >=all(select max(SLBan) as SLBanNhieuNhat
	from (select sum(SoLuong) as SLBan
	from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
	where month(NgayBan)=@month and year(NgayBan)=@year
	group by MaNV)A
	)
end

exec ThuongNhanVien 10, 2021

select MaNV, sum(SoLuong) as SLB
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
where month(NgayBan)=10 and year(NgayBan)=2021
group by MaNV

--Câu 4: Tạo nội thủ tục với đầu vào là mã nhà cung cấp, đầu ra là danh sách sản phẩm nhập từ nhà cung cấp đó theo hãng sản xuất

create proc PhanLoaiSanPham @mancc nvarchar(10), @hangsx nvarchar(5)
as
begin 
	select SanPham.MaSP, TenSP, MaHSX, MaNCC, sum(ChiTietHDN.SoLuong) as SLNhap
	from SanPham join ChiTietHDN on SanPham.MaSP = ChiTietHDN.MaSP
	join HoaDonNhap on ChiTietHDN.MaHDN = HoaDonNhap.MaHDN
	where MaNCC = @mancc and MaHSX = @hangsx
	group by SanPham.MaSP, TenSP, MaHSX, MaNCC
end

exec PhanLoaiSanPham N'NCC2', N'AM'

--Câu 5: Cho biết tổng số lượng đã bán và tổng số tiền đã bán của một sản phẩm nào đó trong một năm nào đó dựa vào mã sản phẩm

create procedure TongBan @masp int, @nam int, @tongSLBan int output, @tongtienban money output
as
begin
	select @tongSLBan=sum(ChiTietHDB.SoLuong), @tongtienban=sum(ChiTietHDB.SoLuong*DonGiaBan)
	from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
	where year(NgayBan)=@nam and ChiTietHDB.MaSP=@masp
end

declare @tongSLB int, @tongban money
exec TongBan 2, 2020, @tongSLB output, @tongban output
print @tongSLB
print @tongban 

/*6. Tạo thủ tục chèn là các thông tin đơn đặt hàng và chi tiết hóa đơn đặt hàng (giả sử chỉ tiết hóa đơn được
lấy từ một bảng tạm), hãy đảm bảo việc cập nhật là đồng thời thành công hoặc không thành 
công (transaction)*/

create table #temp(
MaDDH nvarchar(10),
MaSP int,
SoLuong int,
DonGia money,
GiamGia money)

CREATE PROC NhapDDH @MaDDH nvarchar(10), @MaKH nvarchar(7), @NgayDat date, @NgayGiao date
as
BEGIN
 BEGIN TRAN;
  BEGIN TRY
	insert into DonDatHang(MaDDH, MaKH, NgayDat, NgayGiao) values (@MaDDH, @MaKH, @NgayDat, @NgayGiao)
	INSERT INTO ChiTietDonDH(MaDDH, MaSP, SoLuong, DonGia, GiamGia) select MaDDH, MaSP, SoLuong, DonGia, GiamGia from #temp where MaDDH=@MaDDH
      COMMIT TRAN;
	 delete from #temp where MaDDH=@MaDDH
  END TRY
  BEGIN CATCH
	PRINT 'Error: ' + ERROR_MESSAGE();
	ROLLBACK TRAN;
  END CATCH;
END;

select * from ChiTietDonDH where MaDDH = N'DDH01'
select * from DonDatHang where MaDDH = N'DDH01'

select * from #temp
INSERT INTO #temp(MaDDH, MaSP, SoLuong, DonGia, GiamGia) values (N'DDH01',5,3,23290000,NULL), (N'DDH01',8,1,25560000,NULL), (N'DDH01',10,4,23200000,NULL)

delete ChiTietDonDH where MaDDH = N'DDH01'
delete DonDatHang where MaDDH = N'DDH01'

exec NhapDDH N'DDH01',N'KH01', '2021-10-28', '2021-11-05'

/* Hàm */
--1 Tạo hàm có đầu vào là mã khách hàng, năm, đầu ra là danh sách các hóa đơn khách hàng mua trong năm

create function DSHoaDon (@maKH nvarchar(10), @year int)
returns table 
as return 
(select MaKH, ChiTietHDB.MaHDB, NgayBan, sum(SoLuong*DonGiaBan) as TongTien
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB=ChiTietHDB.MaHDB
where MaKH=@maKH and year(NgayBan)=@year
group by MaKH, ChiTietHDB.MaHDB, NgayBan)

select * from DSHoaDon('KH01',2020)

--2. Tạo hàm lấy danh sách nhà cung cấp theo mã sản phẩm

create function DSNCC (@masp int)
returns table
as return
(select PhieuNhapKho.MaNCC, TenNCC, DiaChi, DienThoai
from NhaCungCap join PhieuNhapKho on NhaCungCap.MaNCC=PhieuNhapKho.MaNCC
                join ChiTietPhieuNhap on PhieuNhapKho.MaPNK=ChiTietPhieuNhap.MaPNK
where ChiTietPhieuNhap.MaSP=@masp)

select * from DSNCC(1)

-- 3.Tạo hàm tính tổng tiền của từng hóa đơn với mã hóa đơn là tham số đầu vào 

alter function TongTien(@mahoadon nvarchar(10))
returns int
as begin 
declare @tongtien int
select @tongtien=sum(SoLuong*DonGiaBan)
from ChiTietHDB join HoaDonBan on ChiTietHDB.MaHDB=HoaDonBan.MaHDB
where ChiTietHDB.MaHDB=@mahoadon
return @tongtien
end

select dbo.TongTien('HDB01')

--4.Tạo hàm tính số lượng sản phẩm đã bán được trong một năm nào đó

create function TongSanPham(@year int)
returns int
as begin
declare @tongsp int
select @tongsp=sum(SoLuong)
from ChiTietHDB join HoaDonBan on ChiTietHDB.MaHDB=HoaDonBan.MaHDB
where year(NgayBan)=@year
return @tongsp
end

select dbo.TongSanPham(2020)

--5.Tạo hàm tính tổng số đơn đặt hàng trong tháng nào đó

alter function TongDonDatHang(@month int)
returns int
as begin
declare @tongdon int
select @tongdon=sum(SoLuong)
from ChiTietDonDH join DonDatHang on ChiTietDonDH.MaDDH=DonDatHang.MaDDH
where month(NgayDat)=@month
return @tongdon
end

select dbo.TongDonDatHang(12)

--6.viết hàm in ra sản phẩm bán chạy nhất trong 1 tháng, quý, năm nào đó

create function SanPhamBanChay(@thang int, @nam int)
returns TABLE
as
return (
select SanPham.MaSP, TenSP
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB 
join SanPham on ChiTietHDB.MaSP = SanPham.MaSP
where month(NgayBan) = @thang and year(NgayBan) = @nam
group by SanPham.MaSP, TenSP
having sum(ChiTietHDB.SoLuong) = (select max(SoLuongBan) as SLBanMax
from (select MaSP, sum(SoLuong) as SoLuongBan
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
where month(NgayBan) = @thang and year(NgayBan) = @nam
group by MaSP)A)
)

select * from SanPhamBanChay(1,2020)


/* Login */
/*Câu 1: Tạo một tài khoản có tên là "Nhom7" có mật khẩu là "123" kết nối với cơ sở dữ liệu "BTL_TKCSDL"*/
exec sp_addlogin Nhom7,123,BTL_TKCSDL

/*Câu 2:Tạo một user quanly ứng với tài khoản "Nhom7" để tạo tác với cơ sở dữ liệu đã tạo*/
use BTL_TKCSDL
exec sp_adduser Nhom7,quanly

/*Câu 3: Phân quyền cho user quanly để thao tác dữ liệu với bảng SanPham,DonDatHang,HoaDonNhap*/
grant all on SanPham to quanly with grant option
grant all on DonDatHang to quanly with grant option
grant all on HoaDonNhap to quanly with grant option
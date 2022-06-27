--Tạo thủ tục có đầu vào là ngày hóa đơn, đầu ra là số mặt hàng bán trong ngày đó
alter proc cau1 @ngay date , @somh int output
as
begin
	select @somh = count(MaSP) from ChiTietHD JOIN HoaDon on ChiTietHD.MaHD = Hoadon.MaHD
	where CAST(Ngayban as date) = @ngay 
end

declare @smh int
exec cau1 '2015-03-21' , @smh output
print cast(@smh as char)

--Tạo hàm có đầu vào là mã khách hàng, năm, đầu ra là danh sách các hóa đơn khách hàng mua trong năm 
alter function cau3(@makh nvarchar(10), @nam int)
returns table
as
return
	select MaKH , HoaDon.MaHD , Ngayban as NgayMua , sum(SLBan * GiaSP) as ThanhTien
	from HoaDon join ChiTietHD on Hoadon.MaHD = ChiTietHD.MaHD join SanPham on ChiTietHD.MaSP = SanPham.MaSP
	Where MaKH = @makh and year(NgayBan) = @nam
	group by MaKH,HoaDon.MaHD , Ngayban

select * from cau3('0002',2015)

--Tạo View thống kê hàng tồn dựa trên số lượng nhập và bán trong năm 2015
alter view cau4
as
	select SanPham.MaSP , TenSP , sum(SLN) as SLN, sum(SLBan) as SLB, sum(SLN) - sum(SLBan) Ton
	from SanPham join ChiTietHDN on SanPham.MaSP = ChiTietHDN.MaSP join ChiTietHD on ChiTietHD.MaSP = SanPham.MaSP
	join Hoadon on Hoadon.MaHD = ChiTietHD.MaHD JOIN HoaDonNhap ON HoaDonNhap.MaHDN = ChiTietHDN.MaHDN
	where Year(NgayBan) = 2015 and YEAR(NgayNhap) = 2015
	group by SanPham.MaSP , TenSP 
	
select * from cau4

--Thêm các trường Số lượng hàng mua vào Hóa đơn. 
--Tạo Trigger cập nhật tự động cho trường này. (tính tổng số lượng bán của toàn bộ hàng trong mỗi hóa đơn)
alter table HoaDon
add SLHangMua int

alter trigger cau5 on ChiTietHD
for insert , update , delete
as
begin
	update HoaDon set SLHangMua = isnull(SLHangMua,0) + inserted.SLBan
	from inserted join HoaDon on inserted.MaHD = Hoadon.MaHD
	update HoaDon set SLHangMua = isnull(SLHangMua,0) - deleted.SLBan
	from deleted join HoaDon on deleted.MaHD = Hoadon.MaHD
end

insert into ChiTietHD values('0003','0007',5) 
insert into ChiTietHD values('0003','0004',4) 
insert into ChiTietHD values('0004','0004',1) 
delete from ChiTietHD where MaHD = '0003' and MaSP = '0007'
delete from ChiTietHD where MaHD = '0003' and MaSP = '0004'
delete from ChiTietHD where MaHD = '0004' and MaSP = '0004'

select * from Hoadon
SELECT sum(SLBan) FROM ChiTietHD
group by MaHD

/* Câu 6: (1 điểm) Tạo hai login A và B, gán quyền Select, Insert, Update cho A trên bảng Hóa đơn và chi tiết hóa đơn, 
cho phép A được phép gán những quyền này cho người khác
A gán quyền cho B, hãy đăng nhập dưới tài khoản B để kiểm tra */

exec sp_addlogin Athithu, 123
exec sp_addlogin Bthithu, 123
/*ở user Admin: Tạo user userA, userB tương ứng với login A, B*/
use QLBanDienThoai_QuanTrongHiep_191202830
exec sp_adduser Athithu, userAthithu
exec sp_adduser Bthithu, userBthithu

grant select , insert , update on HoaDon to userAthithu with grant option
grant select , insert , update on ChiTietHD to userAthithu with grant option

exec sp_droplogin Athithu
exec sp_droplogin Bthithu


exec sp_dropuser userAthithu
exec sp_dropuser userBthithu

--grant select  on HoaDon to userBthithu 
--grant select  on ChiTietHD to userBthithu 
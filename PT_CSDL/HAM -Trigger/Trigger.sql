				--SACH-

alter table tchitiethdb
add ThanhTien money
--Them trg ThanhTien trong bang chitiethoadon , cap nhat tu dong cho trg nay
create TRIGGER TrgUpdateThanhTien ON tchitiethdb
FOR INSERT, UPDATE
AS
BEGIN
	declare @sohd char(10), @masach char(10), @giaban money
	select @sohd=sohdb, @masach=masach from inserted
	select @giaban=dongiaban from tsach where masach=@masach
	update tChiTietHDB set ThanhTien=@giaban*SLBan where SoHDB=@sohd and MaSach=@masach
END 

select * from tChiTietHDB
/*các dữ liệu phi chuẩn : lặp , dẫn xuất thì không đc nhập . Một cách tốt để cập nhật thông tin cho các trường này là dùng trigger */
--Them trường dongiaban vào bảng tchitiethdb , cập nhật trg này mỗi khi insert dữ liệu
alter table tchitiethdb
add DonGiaBan money

alter TRIGGER TrgUpdateDGB ON tchitiethdb
FOR INSERT, UPDATE
AS
BEGIN
	declare @sohd char(10), @masach char(10), @giaban money
	select @sohd=sohdb, @masach=masach from inserted
	select @giaban=dongiaban from tsach where masach=@masach
	update tChiTietHDB set DonGiaBan=@giaban where SoHDB=@sohd and MaSach=@masach
	update tChiTietHDB set ThanhTien=@giaban*SLBan where SoHDB=@sohd and MaSach=@masach
END

select * from tchitiethdb

--Thêm trường SLNhap vào bảng tSach , cập nhật tự động cho trường này
alter table tSach
add SLNhap int 

alter TRIGGER cau1 ON tChiTietHDN
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	declare @masach nvarchar(10), @slnhap int ,@slnhap1 int 
	select @masach = MASACH , @slnhap = SLNhap from inserted
	select  @masach = MASACH ,@slnhap1 = SLNhap from deleted    
	update tSach set SLNhap = isnull(SLNhap,0) - isnull(@slnhap1,0) + isnull(@slnhap,0) where MaSach = @masach
END

/* 
ALTER trigger Trg_CapNhatSLNhap on tChiTietHDN
AFTER INSERT, UPDATE, DELETE AS
BEGIN
UPDATE S
set S.SoLuongNhap = S.SoLuongNhap + I.SLNhap
from tSach S join inserted I on S.MaSach = I.MaSach

 UPDATE S
set S.SoLuongNhap = S.SoLuongNhap - D.SLNhap
from tSach S join deleted D on S.MaSach = D.MaSach
END
*/

--Trong tSach cho trg SoLuong là thống kê số lượng tồn , cập nhật tự động cho trường này
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

--Thêm trg tổng tiền vào bảng hóa đơn bán , cập nhật dữ liệu cho trg này
alter table tHoaDonBan
add tongTien money

create TRIGGER tongTien ON tChiTietHDB
FOR INSERT, UPDATE , delete
AS
BEGIN
	declare @masach nvarchar(10),  @sohdb1 nvarchar(10) ,@sohdb2 nvarchar(10) , @sl1 int ,  @sl2 int ,@dongiaban money
	select @sohdb1 = SoHDB, @sl1 = SLBan , @masach = MaSach from inserted
	select @sohdb2 = SoHDB , @sl2 = SLBan , @masach = MaSach from deleted
	select @dongiaban = dongiaban from tsach where masach=@masach
	UPDATE tHoaDonBan set tongTien = ISNULL(tongTien,0) +( ISNULL(@sl1,0) - ISNULL(@sl2,0)) * @dongiaban 
	where SoHDB = iif(@sohdb1 != null , @sohdb1,@sohdb2)
end


select * from tChiTietHDB
select * from tHoaDonBan
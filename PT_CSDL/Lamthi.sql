--Câu 2: (2 điểm) Tạo thủ tục có đầu vào là mã câu lạc bộ, đầu ra là số bàn thắng của câu lạc bộ
alter proc cau2 @maclb nchar(10) , @sbt int output
as
begin 
	select @sbt = count(*) 
	from TRANDAU_GHIBAN
	where CauLacBoID = @maclb and VaoLuoiNha is null
end

declare @s int
exec cau2 '101' , @s output
print (N'Số bàn thắng : ' + cast(@s as char))

--Câu 3: (1.5 điểm) Tạo hàm đưa ra danh sách các cầu thủ đã ghi bàn gồm hai trường mã cầu thủ và số
--bàn thắng cho câu lạc bộ với mã câu lạc bộ được người dùng đưa vào
alter function cau3(@mclb nchar(10))
returns table
as
	return
	select CauThuID as MaCauThu, count(GhiBanID) as SoBanThang 
	from TRANDAU_GHIBAN
	where CauLacBoID = @mclb and VaoLuoiNha is null
	group by CauThuID

SELECT * FROM cau3('112')

--Câu 4: (2 điểm) Thêm các trường Số bàn ghi vào bảng cầu thủ. Tạo Trigger cập nhật tự động cho các
--trường này với những bàn ghi vào lưới đội bạn.
alter table CauThu
add SoBanGhi int 

ALTER trigger cau4 on TRANDAU_GHIBAN
for insert , update ,delete
as
begin 
	update CAUTHU set SoBanGhi = isnull(SoBanGhi,0) + iif(inserted.VaoLuoiNha is null, 1 ,0) 
	from CAUTHU join inserted on CAUTHU.CauThuID = inserted.CauThuID

	update CAUTHU set SoBanGhi = isnull(SoBanGhi,0) - iif(deleted.VaoLuoiNha is null , 1,0)
	from CAUTHU join deleted on CAUTHU.CauThuID = deleted.CauThuID
end

Insert into TRANDAU_GHIBAN(GhiBanID, TranDauID, CauLacBoID, ThoiDiemGhiBan, CauThuID,VaoLuoiNha) 
values('3339','1','112',50,'1442',NULL)

select * from CAUTHU where CauThuID = '1442'

--Câu 5: (1.5 điểm) Tạo View gồm các thông tin sau: Mã Câu lạc bộ, Tên CLB, Tên cầu thủ, Tên Sân,
--Ngày Thi đấu, Thời điểm ghi bàn, bàn ghi lưới nhà với tên câu lạc bộ là Manchester United
alter view cau5
as
	Select CAULACBO.CauLacBoID, TenCLB, HoVaTen, TenSan, NgayThiDau,ThoiDiemGhiBan , VaoLuoiNha
	from CAULACBO join CAUTHU on CAULACBO.CauLacBoID = CAUTHU.CauLacBoID
				join TRANDAU_GHIBAN on CAUTHU.CauThuID =TRANDAU_GHIBAN.CauThuID
				join TRANDAU on TRANDAU_GHIBAN.TranDauID = TRANDAU.TranDauID
				join SANVANDONG on TRANDAU.SanVanDongID = SANVANDONG.SanVanDongID
	Where TenCLB = 'Manchester United'

select * from cau5

--Câu 6: (1 điểm) Tạo login có tên là tên của anh/chị và gán quyền select trên View ở câu 5.
exec sp_addlogin QuanTrongHiep, 123
use QLBongDa_QTH_191202830

exec sp_adduser QuanTrongHiep, userQuanTrongHiep

GRANT select on cau5 to userQuanTrongHiep

exec sp_droplogin QuanTrongHiep

exec sp_dropuser userQuanTrongHiep

-- Đưa tên những cầu thủ ghi nhiều bàn thắng nhất và nhì của câu lạc bộ Manchester
--United mà không có bàn ghi vào lưới nhà.
alter view cau7 as
	select top(2) with ties CauThu.CauThuID , HoVaTen , count(GhiBanID) as SoBan
	from CAUTHU join TRANDAU_GHIBAN ON CAUTHU.CauThuID = TRANDAU_GHIBAN.CauThuID
	join CAULACBO ON CAUTHU.CauLacBoID = CAULACBO.CauLacBoID
	WHERE TenCLB = 'Manchester United' and CauThu.CauThuID NOT IN (select CauThuID  from TRANDAU_GHIBAN where VaoLuoiNha is not null )
	group by CauThu.CauThuID , HoVaTen
	order by SoBan desc

select * from cau7

--(2 điểm) Tạo thủ tục có đầu vào là mã câu lạc bộ, đầu ra là số bàn thắng của câu lạc bộ
create proc cau2p2 @mclb nchar(100) , @sbt int output
as
begin
	select @sbt = count(*)
	from TRANDAU_GHIBAN
	where CauLacBoID = @mclb
end

declare @sb int
exec cau2p2 '114' , @sb output
print (N'Số bàn thắng : ' + cast(@sb as char))

--Câu 3: (1.5 điểm) Tạo hàm có đầu vào là mã câu lạc bộ, đầu ra là danh sách các cầu thủ của câu lạc bộ
create function cau3p2 (@mclb nchar(10))
returns table 
as
	return
	select CauThuID , HoVaTen , ViTri , QuocTich , SoAo
	from CAUTHU
	where CauLacBoID = @mclb

select * from cau3p2('101')

--Câu 4: (2 điểm) Thêm các trường Số trận đấu vào câu lạc bộ. Tạo Trigger cập nhật tự động cho trường này
alter table CauLacBo
add SoTranDau int

alter trigger cau4p2 on TranDau
for insert , update , delete
as
begin
	update CAULACBO set SoTranDau = ISNULL(SoTranDau, 0) + 1 from CAULACBO join inserted on CAULACBO.CauLacBoID = inserted.CLBKhach
	update CAULACBO set SoTranDau = ISNULL(SoTranDau, 0) + 1 from CAULACBO join inserted on CAULACBO.CauLacBoID = inserted.CLBNha																	
	update CAULACBO set SoTranDau = ISNULL(SoTranDau, 0) - 1 from CAULACBO join deleted on CAULACBO.CauLacBoID = deleted.CLBKhach
	update CAULACBO set SoTranDau = ISNULL(SoTranDau, 0) - 1 from CAULACBO join deleted on CAULACBO.CauLacBoID = deleted.CLBNha
end

select * from CAULACBO where CauLacBoID = 101

--Câu 5: (1.5 điểm) Tạo View gồm các thông tin sau: Mã Câu lạc bộ, Tên CLB, Tên cầu thủ, Tên Sân,
--Ngày Thi đấu, Thời điểm ghi bàn, bàn ghi lưới nhà với tên câu lạc bộ là Manchester United

alter view cau5p2 
as
	Select CAULACBO.CauLacBoID, TenCLB, HoVaTen, TenSan, NgayThiDau,ThoiDiemGhiBan
	from CAULACBO join CAUTHU on CAULACBO.CauLacBoID = CAUTHU.CauLacBoID
				join TRANDAU_GHIBAN on CAUTHU.CauThuID =TRANDAU_GHIBAN.CauThuID
				join TRANDAU on TRANDAU_GHIBAN.TranDauID = TRANDAU.TranDauID
				join SANVANDONG on TRANDAU.SanVanDongID = SANVANDONG.SanVanDongID
	Where TenCLB = 'Manchester United'

select * from cau5p2

--Câu 6: (1 điểm) Tạo login có tên là tên của anh/chị và gán quyền select trên bảng CAUTHU
--Tạo login
exec sp_addlogin qth, 123

use QLBongDa_QTH_191202830
--Tạo user
exec sp_adduser qth, userqth
--Gán quyền
GRANT select on CauThu to userqth

/* Câu 7: (1 điểm) Do người dùng nhập nhầm nên Bảng Câu lạc bộ có hai câu lạc bộ Manchester United
với hai mã khác nhau. Một mã câu lạc bộ được sử dụng ở tất cả các bảng còn lại, một mã câu lạc bộ
không được sử dụng ở bảng nào. Hãy tạo thủ tục xóa bản ghi không được sử dụng. */
alter proc cau7p2
as
begin
	delete from CAULACBO 
	where TenCLB = 'Manchester United' and  (CauLacBoID not in (select CauLacBoID from CAUTHU)
	or CauLacBoID not in (select CauLacBoID from TRANDAU_GHIBAN) 
	or CauLacBoID not in (select CLBKhach from TRANDAU)
	or CauLacBoID not in (select CLBNha from TRANDAU))
end

exec cau7p2 


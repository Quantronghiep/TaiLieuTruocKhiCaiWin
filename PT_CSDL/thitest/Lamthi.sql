--Câu 2: (2 điểm) Tạo thủ tục có đầu vào là mã câu lạc bộ, đầu ra là số bàn thắng của câu lạc bộ
alter proc cau2 @maclb nchar(10) , @sbt int output
as
begin 
	select @sbt = count(*) 
	from TRANDAU_GHIBAN
	where CauLacBoID = @maclb
end

declare @s int
exec cau2 '112' , @s output
print (N'Số bàn thắng : ' + cast(@s as char))

--Câu 3: (1.5 điểm) Tạo hàm đưa ra danh sách các cầu thủ đã ghi bàn gồm hai trường mã cầu thủ và số
--bàn thắng cho câu lạc bộ với mã câu lạc bộ được người dùng đưa vào
create function cau3(@mclb nchar(10))
returns table
as
	return
	select CauThuID as MaCauThu, count(GhiBanID) as SoBanThang 
	from TRANDAU_GHIBAN
	where CauLacBoID = @mclb
	group by CauThuID

SELECT * FROM cau3('112')

--Câu 4: (2 điểm) Thêm các trường Số bàn ghi vào bảng cầu thủ. Tạo Trigger cập nhật tự động cho các
--trường này với những bàn ghi vào lưới đội bạn.
alter table CauThu
add SoBanGhi int 

create trigger cau4 on TRANDAU_GHIBAN
for insert , update ,delete
as
begin 
	update CAUTHU set SoBanGhi = isnull(SoBanGhi,0) + iif(inserted.VaoLuoiNha is not NULL , 0 ,1) 
	from CAUTHU join inserted on CAUTHU.CauThuID = inserted.CauThuID

	update CAUTHU set SoBanGhi = isnull(SoBanGhi,0) - iif(deleted.VaoLuoiNha is not NULL , 0 ,1)
	from CAUTHU join deleted on CAUTHU.CauThuID = deleted.CauThuID
end

Insert into TRANDAU_GHIBAN(GhiBanID, TranDauID, CauLacBoID, ThoiDiemGhiBan, CauThuID,VaoLuoiNha) 
values('2524','1','112',50,'1442',2)

select * from CAUTHU where CauThuID = '1442'

--Câu 5: (1.5 điểm) Tạo View gồm các thông tin sau: Mã Câu lạc bộ, Tên CLB, Tên cầu thủ, Tên Sân,
--Ngày Thi đấu, Thời điểm ghi bàn, bàn ghi lưới nhà với tên câu lạc bộ là Manchester United
create view cau5
as
	select CAULACBO.CauLacBoID , TenClB , HoVaTen , TenSan , NgayThiDau , ThoiDiemGhiBan ,VaoLuoiNha
	from CAULACBO join CAUTHU on CAULACBO.CauLacBoID = CAUTHU.CauLacBoID
	join SANVANDONG on CAULACBO.SanVanDongID = SANVANDONG.SanVanDongID
	join TRANDAU on TRANDAU.SanVanDongID = SANVANDONG.SanVanDongID
	join TRANDAU_GHIBAN on TRANDAU_GHIBAN.TranDauID = TRANDAU.TranDauID
	WHERE TenCLB = 'Manchester United'

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


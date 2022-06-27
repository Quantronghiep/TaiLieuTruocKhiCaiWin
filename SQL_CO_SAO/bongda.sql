--2.4. Đưa ra danh sách cầu thủ ghi nhiều bàn thắng nhất và nhì gồm thông tin gồm mã cầu thủ,
--họ và tên, ngày sinh, số bàn thắng (1 điểm)
select distinct top(2) CAUTHU.CauThuID , HovaTen , NgaySinh , count(GhiBanID) as SoBan
from CAUTHU join TRANDAU_GHIBAN on CauThu.CAULACBOID = TRANDAU_GHIBAN.CAULACBOID
group by CAUTHU.CauThuID , HovaTen , NgaySinh
order by SoBan desc

select  CAUTHU.CAULACBOID , HovaTen , NgaySinh , count(GhiBanID) as SoBan
from CAUTHU join TRANDAU_GHIBAN on CauThu.CAULACBOID = TRANDAU_GHIBAN.CAULACBOID
group by CAUTHU.CAULACBOID , HovaTen , NgaySinh
having count(GhiBanID) in (select distinct top(2)  count(GhiBanID) as SoBanThang
							from TRANDAU_GHIBAN
							group by CauThuID
							order by SoBanThang desc)

--2.5. Đưa ra câu lạc bộ gồm mã câu lạc bộ, tên câu lạc bộ mà câu lạc bộ đó có cầu thủ là người
--Anh và có cầu thủ là người Ý (1 điểm)
select distinct CAULACBO.CauLacBoID , TenCLB 
from CAULACBO JOIN CAUTHU ON CAULACBO.CauLacBoID = CAUTHU.CauLacBoID
WHERE QuocTich like 'EngLand' and CAULACBO.CauLacBoID in (
		select CAULACBO.CauLacBoID 
		from CAULACBO JOIN CAUTHU ON CAULACBO.CauLacBoID = CAUTHU.CauLacBoID
		WHERE QuocTich like 'Italy')

--2.6. Thêm một trường SoCauthu vào bảng Câu lạc bộ, cập nhật số cầu thủ của câu lạc bộ cho
--trường này (1 điểm)

alter table CAULACBO
add SoCauThu int
go
update CAULACBO
set SoCauThu = A.TSoCauThu
from
(select CauLacBoID, count(CauThuID) as TSoCauThu
from CAUTHU 
group by CauLacBoID) as A
where CAULACBO.CauLacBoID = A.CauLacBoID
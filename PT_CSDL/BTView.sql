--bt9
--1. Liệt kê thông tin mã nhân viên, họ tên, tuổi, quê quán, số điện thoại, hệ số lương, lương (=HSL * 1500000)
alter view cau1
as
select MaNV , HoTen , QueQuan , SDT , YEAR(getdate())-YEAR(NgaySinh) as 'Tuoi', HSL , (HSL * 150000) as Luong
from NHANVIEN 

SELECT * FROM cau1
--2. Liệt kê các nhân viên cùng quê Hà Nội
create view cau2
as
select MaNV , HoTen , QueQuan
from NHANVIEN
where QueQuan like N'%Hà Nội%'

SELECT * FROM cau2
--3. Liệt kê các mặt hàng của cùng nhà cung cấp có mã ‘0001’
create view cau3
as
select  HANGHOA.MAHH , HangSX , TenHH 
from HANGHOA JOIN CT_PHIEUNHAP on HANGHOA.MaHH = CT_PHIEUNHAP.MaHH JOIN PHIEUNHAP on CT_PHIEUNHAP.MaPN = PHIEUNHAP.MaPN
where MaNCC = '0001'

SELECT * FROM cau3

--4. Liệt kê thông tin hóa đơn và tổng số tiền thu được của từng hóa đơn
create view cau4
as
	select HOADON.MaHD , SUM(SL*GiaBan) as TongTien
	from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD join HANGHOA on CT_HOADON.MaHH = HANGHOA.MaHH
	group by HOADON.MaHD

select * from cau4

--5. Liệt kê hàng hóa, số lượng và tổng số tiền đã bán được của từng hàng hóa
create view cau5x
as
	select HANGHOA.MaHH , TenHH , sum(SL) AS SL , SUm(SL*GiaBAN) AS TongTien
	from HANGHOA join CT_HOADON on HANGHOA.MaHH = CT_HOADON.MaHH
	group by HANGHOA.MaHH , TenHH

	select * from cau5x

--6. Liệt kê doanh thu theo từng tháng của năm 2015
alter view cau6v
as
	select month(NgayLap) as Thang , sum(SL*GiaBan) as DoanhThu
	from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD join HANGHOA on CT_HOADON.MaHH = HANGHOA.MaHH
	where year(NgayLap) = 2015
	group by month(NgayLap)

	select * from cau6v

--7. Liệt kê thông tin khách hàng và tổng số tiền khách hàng đã mua trong năm 2015
alter view cau7v
as
	select KHACHHANG.MaKH , TenKH , NgayLap, SUM(SL*GiaBan) as TongTienMua
	FROM KHACHHANG join HOADON ON KHACHHANG.MaKH = HOADON.MaKH join CT_HOADON on CT_HOADON.MaHD = HOADON.MaHD
	JOIN HANGHOA on HANGHOA.MaHH = CT_HOADON.MaHH
	where year(NGayLAp) = 2015
	group by KHACHHANG.MaKH , TenKH , NgayLap

select * from cau7v
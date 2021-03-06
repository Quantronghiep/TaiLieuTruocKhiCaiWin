
--1. In ra danh sách các sách chỉ lấy (MaSach,TenSach) do Nhà xuất bản Giáo Dục xuất bản
SELECT MaSach, TenSach
FROM tSach INNER JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE TenNXB = N'NXB Giáo Dục'

--2. In ra danh sách các sách có tên bắt đầu là “Ngày”.
SELECT MaSach, TenSach
FROM tSach
WHERE TenSach like N'Ngày %' 
--3. In ra danh sách các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục có giá từ 100.000  đến 150.000.
SELECT MaSach, TenSach
FROM tSach INNER JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE (TenNXB like N'NXB Giáo Dục' )AND (DonGiaBan BETWEEN 100000 AND 150000)

--4. In ra danh sách các các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục hoặc Nhà Xuất
	--Bản Trẻ sản xuất có giá từ 90.000 đến 140.000.
SELECT MaSach, TenSach,DonGiaBan
FROM tSach INNER JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE (TenNXB = N'NXB Giáo Dục' or TenNXB = N'NXB Trẻ')AND (DonGiaBan BETWEEN 90000 AND 140000)

-- 5. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2014 và ngày 31/12/2014.
select tHoaDonBan.SoHDB , NgayBan , sum( SLBan * DonGiaBan) as TriGia
from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where NgayBan = '1/1/2014' or NgayBan = '04/10/2014'
group by tHoaDonBan.SoHDB , NgayBan

--6. In ra các số hóa đơn, trị giá hóa đơn trong tháng 4/2014, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT tHoaDonBan.SoHDB, NgayBan, sum(tChiTietHDB.SLBan*DonGiaBan) as TriGia
from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach= tSach.MaSach
where month(NgayBan) = 4 AND year(NgayBan) = 2014
group by tHoaDonBan.SoHDB, NgayBan
order by NgayBan asc, TriGia desc

--7. In ra danh sách các khách hàng (MaKH, TenKH) đã mua hàng trong ngày 10/4/2014
SELECT tKhachHang.MaKH ,TenKH
FROM tKhachHang INNER JOIN tHoaDonBan ON tKhachHang.MaKH = tHoaDonBan.MaKH
WHERE (NgayBan='2014-04-10 00:00:00.000')

	SELECT tKhachHang.MaKH , TenKH , NgayBan
	FROM tKhachHang,tHoaDonBan 
	WHERE tKhachHang.MaKH = tHoaDonBan.MaKH
	and (NgayBan = '04/10/2014')

SELECT tKhachHang.MaKH, TenKH
FROM tKhachHang INNER JOIN tHoaDonBan ON tKhachHang.MaKH = tHoaDonBan.MaKH
--WHERE NgayBan >= '08/01/2014' AND NgayBan <= '08/31/2014'
WHERE month(NgayBan)=8 AND year(NgayBan)=2014
--9. In ra danh sách các sách (MaSach,TenSach) được khách hàng có tên “Nguyễn Đình Sơn” mua trong tháng 8/2014
SELECT tSach.MaSach , tSach.TenSach
FROM tKhachHang INNER JOIN tHoaDonBan ON tKhachHang.MaKH = tHoaDonBan.MaKH
	INNER JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	INNER JOIN tSach on tSach.MaSach = tChiTietHDB.MaSach
WHERE month(NgayBan)=8 AND year(NgayBan)=2014 and TenKH = N'Nguyễn Đình Sơn'

--10. Tìm các số hóa đơn đã mua sách “Cấu trúc dữ liệu và giải thuật”
select SoHDB
from tSach join tChiTietHDB on tChiTietHDB.MaSach = tSach.MaSach
WHERE TenSach = N'Cấu trúc dữ liệu và giải thuật'

--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “S01” hoặc “S02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SoHDB , SLBan
from tChiTietHDB
where (SLBan between 10 and 20) and (( MaSach = 'S01') or ( MaSach = 'S02'))

/*12. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “S01” và “S02”, mỗi sản phẩm mua
với số lượng từ 5 đến 10.*/
select SoHDB, SLBan
from tChiTietHDB
where (SLBan between 5 and 10) and ( MaSach = 'S01') and
		SoHDB in (select SoHDB
				from tChiTietHDB
				where  MaSach = 'S02')
/* select SoHDB
from tChiTietHDB
where (SLBan between 5 and 10) and ( MaSach = 'S10') and ( MaSach = 'S11') */   --sai
/* 13. In ra danh sách các sách không bán được */
select MaSach , TenSach
from tSach
where MaSach not in ( select distinct MaSach from tChiTietHDB )
/* distinct để không lặp lại */

/*14. In ra danh sách các sách không bán được trong năm 2014.*/
select MaSach , TenSach
from tSach
where MaSach not in ( 
		select distinct MaSach 
		from tChiTietHDB join tHoaDonBan on tChiTietHDB.SoHDB = tChiTietHDB.SoHDB 
		where YEAR(NgayBan) =2014)

/* 15. In ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014 */
select MaSach , TenSach , TenNXB
from tSach join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
where TenNXB = N'NXB Giáo Dục' and MaSach not in ( select distinct  tChiTietHDB.MaSach from tChiTietHDB 
												JOIN tHoaDonBan on tChiTietHDB.SoHDB = tChiTietHDB.SoHDB  
													join tSach on tChiTietHDB.MaSach = tSach.MaSach 
												join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
												where YEAR(NgayBan) = 2014 )

--16. Tìm số hóa đơn đã mua tất cả các sách của NXB Giáo Dục
select SoHDB
from tHoaDonBan
where SoHDB = all (select SoHDB 
					from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach 
									join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
										where TenNXB = N'NXB Giáo Dục')

--17. Có bao nhiêu đầu sách khác nhau được bán ra trong năm 2014.

/* 18. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu? */
SELECT  MAX(TONG) AS HDMAX, MIN(TONG) AS HDMIN
FROM (SELECT SoHDB, SUM(SLBan * DonGiaBan) AS TONG
	FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach
	GROUP BY SoHDB
	) AS TONGHD

/* 19. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2014 là bao nhiêu? */
SELECT AVG(TONG) AS TRUNGBINH
FROM (SELECT tChiTietHDB.SoHDB, SUM(SLBan * DonGiaBan) AS TONG
	FROM tHoaDonBan JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
					JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach
	WHERE YEAR(NgayBan) = 2014 
	GROUP BY tChiTietHDB.SoHDB
	)AS TONGHD

-- 20. Tính doanh thu bán hàng trong năm 2014.
SELECT  SUM(SLBan * DonGiaBan) AS TONG
	FROM tHoaDonBan JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
					JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach
	WHERE YEAR(NgayBan) = 2014

-- 21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014
SELECT SoHDB, SUM(SLBan * DonGiaBan) as MaxTong
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
GROUP BY SoHDB
having SUM(SLBan * DonGiaBan)= (select MAX(TONG) 
	FROM (SELECT tChiTietHDB.SoHDB, SUM(SLBan * DonGiaBan) AS TONG
		FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
		where year(NgayBan) = 2014
		GROUP BY tChiTietHDB.SoHDB
		)AS TONGHD)
	 
	select top(1) tChiTietHDB.SoHDB ,SUM(SLBan * DonGiaBan) as MaxTong
	FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where year(NgayBan) = 2014
	GROUP BY tChiTietHDB.SoHDB
	order by MaxTong desc

	SELECT MAX(TONG) as MaxTong
	FROM (SELECT tChiTietHDB.SoHDB, SUM(SLBan * DonGiaBan) AS TONG
		FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
		where year(NgayBan) = 2014
		GROUP BY tChiTietHDB.SoHDB
		)AS TONGHD

/* 22. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014. */
select  top(1) TenKH 
from tKhachHang join tHoaDonBan  on tKhachHang.MaKH = tHoaDonBan.MaKH
				join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				JOIN tSach ON tSach.MaSach = tChiTietHDB.MaSach 
				where year(NgayBan) = 2014
				GROUP BY TenKH 
				--GROUP BY TenKH 
				order by SUM(SLBan * DonGiaBan) desc

/* 23. In ra danh sách 3 khách hàng (MaKH, TenKH) có doanh số cao nhất */
select TOP(3)  tKhachHang.MaKH,TenKH  
from tKhachHang join tHoaDonBan  on tKhachHang.MaKH = tHoaDonBan.MaKH
				join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				JOIN tSach ON tSach.MaSach = tChiTietHDB.MaSach 
				GROUP BY TenKH , tKhachHang.MaKH
				order by SUM(SLBan * DonGiaBan) desc
/* 24. In ra danh sách các sách có giá bán bằng 1 trong 3 mức giá cao nhất. */
select MaSach , TenSach , DonGiaBan
from tSach 
where DonGiaBan in(select distinct top 3 DonGiaBan from tSach order by DonGiaBan desc)

/* 25. In ra danh sách các sách do NXB Giáo Dục sản xuất có giá bằng 1 trong 3 mức giá cao nhất
(của tất cả các sản phẩm). */
select MaSach , TenSach , DonGiaBan
from tSach join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
where TenNXB LIKE N'NXB Giáo Dục' and  DonGiaBan in ( select distinct top 3 DonGiaBan from tSach order by DonGiaBan desc)

--26. Tính tổng số đầu sách do NXB Giáo Dục xuất bản
select count(MaSach) as SoDauSach 
from tSach join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
where TenNXB = N'NXB Giáo Dục'

--27. Tính tổng số sách của từng NXB.
select TenNXB , SUM(SoLuong) as TongSoSach
from tSach join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
group by TenNXB

--28. Với từng NXB, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm
SELECT TenNXB ,MAX(DonGiaBan) AS GIAMAX , MIN(DonGiaBan) AS GIAMIN, AVG(DONGIABAN) AS GIATB
FROM tNhaXuatBan INNER JOIN tSach ON tNhaXuatBan.MaNXB = tSach.MaNXB
Group by TenNXB

 /* 29. Tính doanh thu bán hàng mỗi ngày. */
SELECT NgayBan ,SUM(tChiTietHDB.SLBan * DonGiaBan ) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				JOIN tHoaDonBan ON tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
group by NgayBan
/* 30. Tính tổng số lượng của từng sách bán ra trong tháng 8/2014 */
SELECT TenSach , SUM(SLBan) as TongSL
FROM tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
			join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
where MONTH(NgayBan) = 8 and YEAR(NgayBan) = 2014
group by TenSach

 /* 31. Tính doanh thu bán hàng của từng tháng trong năm 2014. */
 SELECT MONTH(NgayBan) as Thang, SUM(SLBan * DonGiaBan) AS DOANHTHU
FROM tSach JOIN tChiTietHDB ON tSach.MaSach = tChiTietHDB.MaSach
			JOIN tHoaDonBan ON tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
WHERE YEAR(NgayBan) = 2014
GROUP BY MONTH(NgayBan)

/* 32. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau. */
select SoHDB, count(tChiTietHDB.MaSach) as SLSach
from tChiTietHDB 
group by SoHDB
having count(tChiTietHDB.MaSach) >= 4

/* 33. Tìm hóa đơn có mua 3 sách do NXB Giáo Dục xuất bản (3 sách khác nhau). */
SELECT SoHDB, COUNT(tSach.MaSach) AS SOSACH
FROM tChiTietHDB JOIN tSach ON tSach.MaSach = tChiTietHDB.MaSach
				JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE TenNXB like N'NXB Giáo Dục'
GROUP BY SoHDB
HAVING COUNT(tSach.MaSach) >= 3

 /* Tìm khách hàng cos số hóa đơn mua 3 sách của nhà XB giáo dục */



/* 34. Tìm khách hàng (MaKH, TenKH) có số lần mua hàng nhiều nhất. */

--35. Tháng mấy trong năm 2014, doanh số bán hàng cao nhất ?
select top(1) month(NgayBan) as Thang
FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
where YEAR(NgayBan) = 2014
group by month(NgayBan) 
order by SUM(SLBan * DonGiaBan) desc
/* 5 cuon sach gia cao nhat */
select top(5)  with ties MaSach , TenSach , DonGiaBan
from tSach order by DonGiaBan desc

/* Những nhân viên có doanh thu cao nhất  và có hóa đơn trong tháng 8 /2014 */
select tNhanVien.MaNV
from tNhanVien join tHoaDonBan on tNhanVien.MaNV = tHoaDonBan.MaNV
where MONTH(NgayBan) = 8 and YEAR(NgayBan) = 2014 and tNhanVien.MaNV in( select top(1)  MaNV from tHoaDonBan  
																JOIN tChiTietHDB ON tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
																JOIN tSach ON tSach.MaSach = tChiTietHDB.MaSach 
																GROUP BY MaNV 
																order by SUM(SLBan * DonGiaBan) desc) 

--37. Mỗi NXB, tìm sách (MaSach,TenSach) có giá bán cao nhất.
select distinct tNhaXuatBan.MaNXB, MaSach , TenSach ,tSach.DonGiaBan
from tSach ,tNhaXuatBan,( select tSach.MaNXB, Max(DonGiaBan) as MAXX
					from tSach JOIN tNhaXuatBan on tSach.MaNXB= tNhaXuatBan.MaNXB
					Group by tSach.MaNXB ) as A 
where tNhaXuatBan.MaNXB = A.MaNXB and tSach.DonGiaBan = A.MAXX	

--39.Thêm trưởng tổng tiền cho bảng tHoaDonBan rồi cập nhật tổng tiền của hóa đơn cho trườngnày.
alter table tHoaDonBan
add tongTien INT
go
update tHoaDonBan
set tongTien = A.TONG
from (SELECT SoHDB, SUM(SLBan * tChiTietHDB.DonGiaBan) AS TONG
	FROM tChiTietHDB 
	GROUP BY SoHDB) as A
WHERE tHoaDonBan.SoHDB = A.SoHDB


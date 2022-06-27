--1 . In ra danh sách các Laptop chỉ lấy (MaLaptop , TenLaptop , XuatXu) xuất xứ tại Hoa Kỳ
select MaLaptop , TenLaptop , XuatXu
from  QLLaptop 
where XuatXu = N'Hoa Kỳ'

--2 In ra danh sách các Laptop (MaLaptop , TenLaptop , DonGia) có giá từ 3.000.000 đến 7.000.000.
select MaLaptop , TenLaptop , DonGia
from  QLLaptop 
where DonGia between 3000000 and 7000000

--3 .In ra danh sách các Laptop (MaLaptop , TenLaptop , CanNang , TenNSX) do NhaSX HP có cân nặng < 2
select MaLaptop , TenLaptop , CanNang ,TenNSX
from QLLaptop join NhaSX on QLLaptop.MaNSX = NhaSX.MaNSX
where TenNSX = 'HP' and CanNang < 2

--4. In ra danh sách các Laptop được bán trong tháng 4/2021
select QLLaptop.MaLaptop , TenLaptop , NgayBan
from QLLaptop join ChiTietHDB on QLLaptop.MaLaptop = ChiTietHDB.MaLaptop  join HoaDonBan on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
WHERE month(NgayBan) = 4 and year(NgayBAN) = 2021

--5 .Tính doanh thu bán hàng mỗi ngày.
SELECT NgayBan ,SUM(ChiTietHDB.SLBan * GiaBan ) as DoanhThu
from QLLaptop join ChiTietHDB on QLLaptop.MaLaptop = ChiTietHDB.MaLaptop  join HoaDonBan on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
group by NgayBan

/* 6
 In ra các số hóa đơn, trị giá hóa đơn bán ra trong năm 2021
*/
select ChiTietHDB.MaHDB, SUM(SLBan * GiaBan) as TriGia
from ChiTietHDB  join HoaDonBan on ChiTietHDB.MaHDB = HoaDonBan.MaHDB
				 join QLLaptop on ChiTietHDB.MaLaptop = QLLaptop.MaLaptop
where year(NgayBan) = 2021
group by ChiTietHDB.MaHDB

/* 7.Có bao nhiêu Laptop khác nhau được bán ra trong năm 2021.*/

select year(NgayBan) as N'Năm bán',Count(MaLaptop) as N'Tổng LapTop'
from ChiTietHDB join HoaDonBan on ChiTietHDB.MaHDB = HoaDonBan.MaHDB
where year(NgayBan) = 2021
group by year(NgayBan)

/* 8
Tổng số laptop có xuất sứ ở Hoa Kỳ và có SL trong kho  > 100
*/

select QLLaptop.MaLaptop, sum(SLNhap) as N'Tổng Số Lượng' 
from QLLaptop JOIN ChiTietHDN on QLLaptop.MaLaptop= ChiTietHDN.MaLapTop
where XuatXu = N'Hoa Kỳ'
group by QLLaptop.MaLaptop
having sum(SLNhap) > 100

/* 9
Tìm mã laptop bán ra có tổng doanh thu > 50000000 và có xuất sứ ở Hoa kỳ
*/
select QLLaptop.MaLaptop, sum(SLBan * GiaBan) as N'Doanh Thu'
from QLLaptop join ChiTietHDB on QLLaptop.MaLaptop = ChiTietHDB.MaLaptop
where XuatXu = N'Hoa Kỳ'
group by QLLaptop.MaLaptop
having sum(SLBan * GiaBan) > 50000000


/* 10
Tìm hóa đơn có mua ít nhất 3 sản phẩm khác nhau
*/
select MaHDB, count(TenLaptop) as Soluong
from ChiTietHDB join QLLaptop on ChiTietHDB.MaLaptop = QLLaptop.MaLaptop
group by MaHDB
having count(TenLaptop) >= 3

/* 11. Tìm hóa đơn có trị giá cao nhất trong năm 2020 mà mua ít nhất 2 laptop do Apple san xuất (2 laptop khac nhau).*/
select top 1 with ties HoaDonBan.MaHDB ,SUM(SLBan*GiaBan) as N'Trị giá'
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
				join QLLaptop on ChiTietHDB.MaLaptop = QLLaptop.MaLaptop
				join NhaSX on QLLaptop.MaNSX = NhaSX.MaNSX
where YEAR(NgayBan) = 2020 and TenNSX = 'apple'
Group by HoaDonBan.MaHDB
Having Count(TenLaptop) >= 2
Order by N'Trị giá' desc


/*12 Tìm mã khách hàng mua 1 sản phẩm và cửa hàng lãi được nhiều nhất */

select top 1 with ties MaKH, COUNT(ChiTietHDB.MaLapTop) as N'Số lần mua', SUM(SLBan*GiaBan - SLBan*GiaNhap) as N'Lãi'
from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
				join ChiTietHDN on ChiTietHDB.MaLaptop = ChiTietHDN.MaLapTop
Group by MaKH
Having COUNT(ChiTietHDB.MaLaptop) = 1
Order by N'Lãi' desc

/*13. Tìm khách hàng (MaKH, TenKH) có số sản phẩm mua trên 3 và có trị giá hóa đơn trên 1.000.000.000 */
select QLKhachHang.MaKH, HoKH,TenKH,SUM(SLBan*GiaBan) as TriGia
from QLKhachHang join HoaDonBan on QLKhachHang.MaKH = HoaDonBan.MaKH
				 join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB
				 join QLLaptop on ChiTietHDB.MaLaptop = QLLaptop.MaLaptop	
where QLKhachHang.MaKH in (select MaKH from HoaDonBan join ChiTietHDB on HoaDonBan.MaHDB = ChiTietHDB.MaHDB Group by MaKH Having COUNT(MaLaptop) >= 3)
Group by QLKhachHang.MaKH, HoKH,TenKH
Having SUM(SLBan*GiaBan) >= 1000000000



/*14. In ra danh sách các laptop không bán được mà có tổng giá nhập lớn hơn 500.000.000 .*/
select MaLaptop, SUM(SLNhap * GiaNhap) as TriGiaNhap
from ChiTietHDN join HoaDonNhap on ChiTietHDN.MaHDN = HoaDonNhap.MaHDN
where  MaLaptop not in (select MaLaptop from ChiTietHDB) 
Group by MaLaptop
Having SUM(SLNhap * GiaNhap) >= 500000000

/*15.Xóa những khách hàng không mua hàng*/
delete from QLKhachHang
where MaKH not in (select distinct QLKhachHang.MaKH
					from QLKhachHang join HoaDonBan on QLKhachHang.MaKH =HoaDonBan.MaKH)


/* 16 Xóa những hóa đơn  mua hàng trong năm 2019 */
delete from HoaDonBan
where MaHDB in (select MaHDB from HoaDonBan where YEAR(NgayBan) = 2019)

/*17 tạo một bảng dữ liệu mới tên Latop_KhachHang gồm: MaLaptop, Tenlaptop, SLKhachMua trong năm 2020
 và chèn thêm dữ liệu dựa vào bảng đã có*/
create table Laptop_KhachHang(
	MaLaptop nvarchar(10) not null,
	TenLaptop nvarchar(50) not null,
	SLKhachMua int not null
 )

	insert into Laptop_KhachHang
	select QLLaptop.MaLaptop, TenLaptop,count(distinct MaKH)
	from QLLaptop join ChiTietHDB on QLLaptop.MaLaptop=ChiTietHDB.MaLaptop
				   join HoaDonBan on HoaDonBan.MaHDB= ChiTietHDB.MaHDB
	where year(NgayBan)=2020
	group by QLLaptop.MaLaptop, TenLaptop

	/*18. Thêm nhân viên có họ Phạm vào dữ liệu bảng khách hàng*/

	insert into QLKhachHang (MaKH, HoKH,TenKH, DiaChi, SoDT)
	select MaNV,HoNV,TenNV,Que,SDT
	from QLNhanVien
	where HoNV like N'Phạm%' 

	/*19.Thêm vào bảng QLNhanVien cột Thưởng, cập nhật cột Thưởng từ dữ liệu đã có, biết:
	
	- NV có chức vụ bán hàng: nếu bán được cho 2 khách trở lên thưởng = 3000000
							  Ngược lại thưởng=0
	- NV có chức vụ bảo vệ, thưởng = 500000
	- NV có chức vụ kiểm kho, thưởng = 1500000
	- NV có chức vụ thu ngân, thưởng= 25000000
	- NV có chức vụ quản lý, thưởng= 4500000
	*/
	alter table QLNhanVien
	add Thuong money
	go

	update QLNhanVien
	set Thuong = 3000000  

	where ChucVu = N'Bán Hàng' and MaNV in 	(
		select HoaDonBan.MaNV
		from HoaDonBan  join ChiTietHDB on HoaDonBan.MaHDB= ChiTietHDB.MaHDB
					   join QLLaptop on QLLaptop.MaLaptop= ChiTietHDB.MaLaptop
					   join QLNhanVien on QLNhanVien.MaNV= HoaDonBan.MaNV
		where ChucVu = N'Bán Hàng'
	    group by HoaDonBan.MaNV
		having count(distinct MaKH)>=2)
		
	update QLNhanVien
	set Thuong = 0
	where ChucVu = N'Bán Hàng' and MaNV not in 	(
		select HoaDonBan.MaNV
		from HoaDonBan  join ChiTietHDB on HoaDonBan.MaHDB= ChiTietHDB.MaHDB
					   join QLLaptop on QLLaptop.MaLaptop= ChiTietHDB.MaLaptop
					   join QLNhanVien on QLNhanVien.MaNV= HoaDonBan.MaNV
		where ChucVu = N'Bán Hàng'
	    group by HoaDonBan.MaNV
		having count(distinct MaKH)>=2)
		

	update QLNhanVien
	set Thuong = 500000
	where ChucVu= N'Bảo Vệ'

	update QLNhanVien
	set Thuong = 1500000
	where ChucVu= N'Kiểm Kho'

	update QLNhanVien
	set Thuong = 2500000
	where ChucVu= N'Thu Ngân'
	
	update QLNhanVien
	set Thuong = 2500000
	where ChucVu= N'Quản Lý'
	
	select *
	from QLNhanVien

	/*20.Thêm vào bảng ChiTietHDB cột GiamGia, và cập nhật cột gaimr giá như sau:
	 Giảm 3% giá bán laptop  nếu laptop có giá bán <30.000.000
	 và 7% cho laptop có giá bán 30.000.000 -> 50.000.000 và 10% cho laptop có giá bán>50.000.000
	*/
	alter table ChiTietHDB
	add GiamGia money

	update ChiTietHDB 
	set GiamGia = ( GiaBan -0.03*GiaBan)
	where GiaBan < 30000000 

	update ChiTietHDB 
	set GiamGia= ( GiaBan -0.07*GiaBan)
	where GiaBan>= 30000000  and GiaBan<= 50000000
	
	update ChiTietHDB 
	set GiamGia = ( GiaBan -0.1*GiaBan)
	where GiaBan> 50000000  
	
	select *
	from ChiTietHDB

/*21.Cho biết laptop nào được mua bởi ít nhất 2 khách hàng khác nhau  */

SELECT QLLaptop.MaLaptop,TenLaptop, COUNT(MaKH) AS N'Số Lượng Khách Mua'
FROM QLLaptop JOIN ChiTietHDB ON QLLaptop.MaLaptop=ChiTietHDB.MaLaptop
			  JOIN HoaDonBan ON ChiTietHDB.MaHDB= HoaDonBan.MaHDB
GROUP BY QLLaptop.MaLaptop,TenLaptop
HAVING COUNT(MaKH)>=2

/*22.Cho biết Laptop nào tồn kho nhiều nhất và laptop nào tồn kho ít nhất(khác 0)*/

Select  ChiTietHDB.MaLaptop, (SUM(SLNhap) - SUM(SLBan)) AS SL
from ChiTietHDB  join  ChiTietHDN on ChiTietHDB.MaLaptop = ChiTietHDN.MaLapTop
group by  ChiTietHDB.MaLaptop 
having SUM(SLNhap) - SUM(SLBan) = (
								(Select top 1 with ties SUM(SLNhap) - SUM(SLBan) 
								from ChiTietHDB join  ChiTietHDN on ChiTietHDB.MaLaptop = ChiTietHDN.MaLapTop
								group by  ChiTietHDB.MaLaptop 
								order by (SUM(SLNhap) - SUM(SLBan)) desc))
OR SUM(SLNhap) - SUM(SLBan) =
								(Select top 1 with ties  SUM(SLNhap) - SUM(SLBan)
								from ChiTietHDB join  ChiTietHDN on ChiTietHDB.MaLaptop = ChiTietHDN.MaLapTop
								group by  ChiTietHDB.MaLaptop 
								having (SUM(SLNhap) - SUM(SLBan))!=0
								order by (SUM(SLNhap) - SUM(SLBan))asc  )
								 



								

/*23.Cho biết thông tin cac laptop, gồm: MaLaptop, Tenlaptop,CuatXu, SLban (Nếu có) của NSX01*/

  SELECT QLLaptop.MaLaptop, TenLaptop, XuatXu, sum( SLBan) as N'Số lượng bán'
  FROM QLLaptop LEFT JOIN ChiTietHDB ON QLLaptop.MaLaptop = ChiTietHDB.MaLaptop
  Where MaNSX='NSX01'
  group by QLLaptop.MaLaptop, TenLaptop,xuatxu








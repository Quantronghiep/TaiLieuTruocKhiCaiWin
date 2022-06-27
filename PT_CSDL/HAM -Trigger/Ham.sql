/* 
		BT9									FUNCTION
*/
-- 1. Tạo hàm lấy danh sách nhân viên theo quê quán
alter function NVque(@que nvarchar(50))
	returns table
as
	return (select * from NHANVIEN where QueQuan like N'%' + @que +'%')

select * from NVque(N'Hà Nội')

--2. Tạo hàm lấy danh sách hóa đơn theo nhân viên và ngày (ngày/tháng/năm)
alter function [dbo].DSHD( @MaNV nvarchar(50),@Ngay date)
returns TABLE
as
	return select * from HOADON where MaNV = @MaNV and cast(NgayLap as date) = @Ngay

select * from [dbo].DSHD('0002', '2015-03-20')

--3. Tạo hàm tính tổng tiền của từng hóa đơn với mã hóa đơn là tham số đầu vào ( vo huong)
alter function sumMoney(@mahd nchar(5))
returns float
as
begin
	declare @money float
	select @money = sum(SL*GiaBan)
	from CT_HOADON join HANGHOA on CT_HOADON.MaHH= HANGHOA.MaHH 
	where MaHD =  @mahd 
	return @money
end
select dbo.sumMoney('0001') 

--4. Tạo hàm lấy danh sách nhà cung cấp theo mã hàng
alter function DSNCC1(@mahang nchar(5))
returns table
as
return
	select TenNCC,NHACUNGCAP.MaNCC , MaHH from CT_PHIEUNHAP JOIN PHIEUNHAP ON CT_PHIEUNHAP.MaPN=PHIEUNHAP.MaPN 
			JOIN NHACUNGCAP ON NHACUNGCAP.MaNCC=PHIEUNHAP.MaNCC
    WHERE CT_PHIEUNHAP.MaHH=@mahang

select * from DSNCC1('0001')

--5. Tạo hàm lấy danh sách các mặt hàng theo mã nhà cung cấp
ALTER function cau5 (@mancc nvarchar(255)) 
returns table
as
    return 
        select HANGHOA.MaHH, HangSX, TenHH, GiaBan, DacDiem , MaNCC
        from HANGHOA join CT_PHIEUNHAP on HANGHOA.MaHH = CT_PHIEUNHAP.MaHH
            join PHIEUNHAP on PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
        where MaNCC = @mancc

select * from cau5('0001')

--6. Cho danh sách các khách hàng ở một quận nào đó
create function cau6 (@diachi nvarchar(255)) 
returns table
as
    return 
        select *
        from KHACHHANG
        where DiaChi like N'%' + @diachi + '%'

select * from cau6(N'Cầu giấy')

--7. Tính tổng số hóa đơn đã lập trong từng tháng của năm 2015
create function fc_cau7()
returns table
as
    return 
        select sum(sl) as TongHoaDon, month(ngaylap) as Thang
        from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD
        where year(ngaylap) like 2015
        group by month(ngaylap)

select * from fc_cau7()

--8. Tính tổng số tiền thu được của từng hóa đơn
alter function cau8()
returns table 
as 
return 
   select MaHD,sum(SL*GiaBan) as tongtien from HANGHOA join CT_HOADON ON HANGHOA.MaHH=CT_HOADON.MaHH 														
   group by MaHD

 select *from cau8()
--9. Tính tổng số lượng và tổng số tiền đã bán được của từng hàng hóa
alter function bai9()
 returns table 
 as 
 return 
   select HANGHOA.MaHH,sum(SL*GiaBan) as tongtien,sum(SL) as soluonghh from HANGHOA join CT_HOADON
										ON HANGHOA.MaHH=CT_HOADON.MaHH 
   group by HANGHOA.MaHH

 select *from bai9()

 --10. Tính tổng số lượng và tổng số tiền đã nhập của từng hàng hóa
alter FUNCTION cau10()
 returns table
 as
	return 
		select HANGHOA.MaHH , sum(SL) as SoLuongNhap, sum(SL*GiaMua) as tongTienNhap
		from CT_PHIEUNHAP JOIN HANGHOA on CT_PHIEUNHAP.MaHH = HANGHOA.MaHH
		GROUP BY HANGHOA.MaHH 

select * from cau10()
 --11. Tính số hóa đơn trong một ngày với thông tin đầu vào là ngày bán
 CREATE FUNCTION bai11(@ngayban date)
 returns float
 as
begin 
	declare @shd int
	select @shd = sum(SL) from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD
	where cast(NgayLap as date) = @ngayban
	return @shd
end

select dbo.bai11('2015-04-02')
--12. tính doanh thu trong ngày với thông tin ngày là tham số đầu vào
alter FUNCTION bai12(@ngayban date)
 returns float
 as
begin 
	declare @sum float
	select @sum = sum(SL*GiaBan)  from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD
								join HANGHOA on HANGHOA.MaHH = CT_HOADON.MaHH
	where cast(NgayLap as date) = @ngayban
	return @sum
end
select dbo.bai12('2015-04-02')
 --13. Đưa ra danh sách nhân viên bán mặt hàng là tham số đưa vào trong tháng và năm nào đó (cũng là các tham số đưa vào)
create function cau13( @mahh nvarchar(255), @thang int,@nam int)
returns table
as
    return 
        select NHANVIEN.*
        from NHANVIEN join HOADON on NHANVIEN.MaNV = HOADON.MaNV
            join CT_HOADON on CT_HOADON.MaHD = HOADON.MaHD
        where month(ngaylap) = @thang and year(ngaylap) = @nam and MaHH like @mahh

select * from cau13('0003',3,2015)

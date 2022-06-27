--1. Tạo hàm đầu vào là chức vụ đầu ra là những nhân viên cùng chức vụ đó
create function ChucVu(@cv nvarchar(50))
returns table
as
return
	Select tNhanVien.MaNV , Ho , TEN , ChucVu from tNhanVien join tChiTietNhanVien on tChiTietNhanVien.MaNV = tNhanVien.MaNV
	where ChucVu like  N'%' + @cv + '%'

select * from ChucVu('NV')

/* 
2. Tạo báo cáo bảng Phụ cấp, trợ cấp cho nhân viên gồm có các trường sau:
MaNV, Ho, Ten, ChucVu, ThamNien, Luong, TroCap, PhuCapTN.
Trong đó:
ThâmNiên là số năm làm việc của nhân niên trong công ty, được tính dựa và ngày bắt đầu làm việc (NgayBD).
Lương là hệ số lương (HSLuong) nhân 250000.
TrợCấp là 150000 cho các nhân viên có ngày sinh trước ngày 30/4/75.
PhụCấpTN (phụ cấp thâm niên): chỉ được tính cho các nhân viên có thâm niên không dưới 5
năm, và cứ mỗi năm thâm niên sau 5 năm được tính 50000 (ví dụ: ThamNien=5 có
PhuCapTN=50000, 6 năm – 100000, 7 năm – 150000, 8 năm – 200000 v.v…) */

alter view PhuCap
as
	select tNhanVien.MaNV , Ho , Ten , ChucVu , DATEDIFF(YEAR,NgayBD,GETDATE()) as ThamNien ,
		HSLuong * 250000 as Luong ,ntns, iif(DATEDIFF(day, NTNS,'1975-04-30' ) > 0 , 150000,0) as TroCap ,
		iif(DATEDIFF(YEAR,NgayBD,GETDATE()) >=5 , 50000 + (DATEDIFF(YEAR,NgayBD,GETDATE())-5)*50000 , 0 ) as PhuCapTN
	from tNhanVien JOIN tChiTietNhanVien on tNhanVien.MaNV = tChiTietNhanVien.MaNV

select * from PhuCap

--3. Tạo hàm với đầu vào là năm, đầu ra là số nhân viên sinh vào năm đó
Create function cau3(@nam int)
returns int
as
begin
	declare @sl int
	select @sl = count(MaNV) 
	from tNhanVien
	where YEAR(NTNS) = @nam
	return @sl
end

select dbo.cau3(1962)

--4. Tạo hàm với đầu vào là số thâm niên đầu ra là danh sách nhân viên có thâm niên đó
Create function cau4(@tn int)
returns table
as
return
	select * from tNhanVien
	where DATEDIFF(YEAR,NgayBD,GETDATE()) = @tn

select * from cau4(31)

--5. Tạo hàm đưa ra thông tin về nhân viên được tăng lương của ngày hôm nay (giả sử 3 năm lên lương 1 lần)
create function cau5()
returns table
as
return
	select * from tNhanVien
	where DATEDIFF(YEAR,NgayBD,GETDATE())%3 = 0

select * from cau5()

--6. Tạo thủ tục nhập đồng thời nhân viên và chi tiết nhân viên (dùng transaction).
CREATE PROC NhapNhanVien
    @manv NVARCHAR(5),
    @ho NVARCHAR(100),
	@ten NVARCHAR(100),
    @phai bit,
    @ntns DATETIME,
    @ngaybd DATETIME,
    @mapb NVARCHAR(5),
    @hinh image,
	@ghichu NVARCHAR(MAX),
    @chucvu nvarchar(50),
	@hsl float,
	@mucdocv nvarchar(10)
AS
	begin
    BEGIN TRAN
		BEGIN TRY
--      INSERT VAlUES
			INSERT INTO tNhanVien(MaNV , HO , TEN , PHAI , NTNS , NgayBD,MaPB ,HINH , GHICHU)
            VALUES (@manv, @ho , @ten , @phai , @ntns , @ngaybd , @mapb ,@hinh , @ghichu)

            INSERT INTO tChiTietNhanVien(MaNV , ChucVu , HSLuong , MucDoCV)
            VALUES (@manv , @chucvu, @hsl , @mucdocv)

            COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
--          IF ERROR
			PRINT 'Error: ' + ERROR_MESSAGE()
			ROLLBACK TRANSACTION
        END CATCH
    end

exec NhapNhanVien '080',N'Trọng',N'Hiệp', true , '2001-04-20 00:00:00.000' ,'2019-01-01 00:00:00.000' , 'KH',null,null,
	'NV' , 2 ,C3

select * from tNhanVien where MaNV = '080'
select * from tChiTietNhanVien where MaNV = '080'

--7. Thêm trường ThamNien vào bảng chi tiết nhân viên. Tạo thủ tục tính thâm niên cho nhân
--viên và cập nhật vào trường ThamNien. (ThamNien=năm hiện tại – năm vào).

alter table tChiTietNhanVien
add ThamNien int

--alter proc ThemThamNien @manv nvarchar(5)
alter proc ThemThamNien
as
begin
	update tChiTietNhanVien set ThamNien = DATEDIFF(YEAR,NgayBD,GETDATE()) 
	from tChiTietNhanVien join tNhanVien on tChiTietNhanVien.MaNV = tNhanVien.MaNV
	--where tChiTietNhanVien.MaNV = @manv
end

exec ThemThamNien 

select * from tChiTietNhanVien

--8. Tạo thủ tục tính nhân viên mỗi phòng ban, số nhân viên nam, số nhân viên nữ với mã phòng
--ban là tham số đầu vào.

create proc cau8 @mapb nvarchar(5) , @sonv int output , @sonvnam int output , @sonvnu int output
as
begin 
	select @sonv = count(MaNV) from tNhanVien where MaPB = @mapb
	select @sonvnam = count(MaNV) from tNhanVien where MaPB = @mapb and PHAI = 0
	select @sonvnu = count(MaNV) from tNhanVien where MaPB = @mapb and PHAI = 1
end

declare @ma nvarchar(5), @snv int , @snvnam int , @snvnu int
exec cau8 'KH' , @snv output , @snvnam output, @snvnu output
print('So nhan vien : ' + cast(@snv as char(4)))
print('So nhan vien nam : ' + cast(@snvnam as char(4)))
print('So nhan vien nu : ' + cast(@snvnu as char(4)))
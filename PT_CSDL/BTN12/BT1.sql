--BÀI 1
--1. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update bản ghi để chỉ cho
--phép nhập giá trị trong khoảng từ 0 đến 10
alter TRIGGER CAU1 on DIEM
FOR INSERT, UPDATE
AS
BEGIN
	declare @mahs nvarchar(10) , @toan float , @ly float , @hoa float , @van float
	select @mahs = MAHS , @toan = Toan , @ly = LY , @hoa = HOA , @van = VAN from inserted
	if (@toan not between 0 and 10) or (@van not between 0 and 10) or (@ly not between 0 and 10) or (@hoa not between 0 and 10)
		RAISERROR('Diem phai tu 0-10',16,1)
		rollback tran
END

--2. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động cập nhật
--điểm trung bình của học sinh khi thêm mới hay cập nhật bảng điểm
--Điểm trung bình= ((Toán +Văn)*2+Lý+Hóa)/6

alter TRIGGER CAU2 on DIEM
FOR INSERT, UPDATE
AS
BEGIN
	declare @mahs nvarchar(10) 
	select @mahs = MAHS from inserted
	update Diem set DTB = ((toan + van)*2+ ly + hoa)/6 where MAHS = @mahs
END

select * from DIEM

--3. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động xếp loại học sinh, cách thức xếp loại như sau
-- Nếu Điểm trung bình>=5 là lên lớp, ngược lại là lưu ban
alter TRIGGER CAU3 on DIEM
FOR INSERT, UPDATE
AS
BEGIN
	declare @mahs nvarchar(10) ,  @dtb float
	select @mahs = MAHS from inserted
	select  @dtb = ((toan + van)*2+ ly + hoa)/6 from DIEM where MAHS = @mahs
	update Diem set XEPLOAI = iif(@dtb >=5 ,N'Lên Lớp', N'Lưu Ban' ) where MAHS = @mahs
END

select * from DIEM
 disable TRIGGER CAU3 on DIEM

 /* 4. Viết một Trigger gắn với bảng DIEM dựa trên sự kiện Insert, Update để tự động xếp loại
học sinh, cách thức xếp loại như sau
- Xét điểm thấp nhất (DTN) của các 4 môn
- Nếu DTB>=5 và DTN>=4 là “Lên Lớp”, ngược lại là lưu ban */

alter TRIGGER CAU4 on DIEM
FOR INSERT, UPDATE
AS
BEGIN
	declare @mahs nvarchar(10) , @dtb float , @dtn float
	select @mahs = MAHS from inserted
	select 	@dtb = ((toan + van)*2+ ly + hoa)/6 , 
		@dtn = (
		case
			when toan <= van and toan <= ly and toan <= hoa then toan 
			when  hoa <= toan and hoa<= ly AND hoa <= van then hoa
			when ly<= hoa and ly <= van AND ly <= van then ly
			else van
		end
		)
	from DIEM where MAHS = @mahs
	
	update Diem set XEPLOAI = iif(@dtb >=5 and @dtn >= 4 ,N'Lên Lớp', N'Lưu Ban' ) where MAHS = @mahs
END

select * from DIEM
 disable TRIGGER CAU4 on DIEM


--5. Viết một trigger xóa tự động bản ghi về điểm học sinh khi xóa dữ liệu học sinh đó trong DSHS
create TRIGGER CAU5 on DSHS
INSTEAD OF DELETE
AS
BEGIN
	delete Diem where MAHS in (select MAHS from deleted)
	delete DSHS where MAHS in (select MAHS from deleted)
end 

--6. Viết nội thủ tục (Stored Procedure) cập nhật phần ghi chú là “Chuyển trường từ ngày
--5/9/2016” cho học sinh có mã nhập vào trong bảng danh sách học sinh.
CREATE PROC ghichu @mahs nvarchar(5)
as
begin
	update DSHS SET GHICHU = N'Chuyển trường từ ngày 5/9/2016' where MAHS = @mahs
end

exec ghichu '00019'

--7. Tạo View báo cáo Kết thúc năm học gồm các thông tin: Mã học sinh, Họ và tên, Ngày sinh,
--Giới tính, Điểm Toán, Lý, Hóa, Văn, Điểm Trung bình, Xếp loại
Create View BaoCao
as
	select DSHS.MaHS , Ho , Ten ,Nu , Toan ,Ly , Hoa , Van , DTB , DIEM.XEPLOAI 
	from DSHS join DIEM on DSHS.MAHS = DIEM.MAHS

select * from BaoCao

--8. Tạo trường điểm thấp nhất trong bảng Điểm, tạo thủ tục cập nhật điểm thấp nhất cho trường
--này của tất cả các bản ghi đã có (dùng con trỏ)
alter table Diem
ADD DTN float

Declare hs CURSOR for select mahs from DIEM
Open hs
Declare @mahs nvarchar(5) , @dtn float 
Fetch next from hs into @mahs
while(@@FETCH_STATUS =0 )
begin
	select @dtn = (
	case
		when toan <= van and toan <= ly and toan <= hoa then toan 
		when  hoa <= toan and hoa<= ly AND hoa <= van then hoa
		when ly<= hoa and ly <= van AND ly <= van then ly
		else van
	end
	)
	from DIEM where MAHS=@mahs
	update DIEM set DTN = @dtn where MAHS = @mahs
	Fetch next from hs into @mahs
end
Close hs 
Deallocate hs

Select * from DIEM

--9. Tạo trigger cập nhật điểm thấp nhất mỗi khi insert, update một bản ghi vào bảng điểm.
alter trigger cau9 on DIEM
for insert , update
as
begin
	declare @mahs nvarchar(10) , @dtn float
	select @mahs = MAHS from inserted
	select @dtn = (
		case
			when toan <= van and toan <= ly and toan <= hoa then toan 
			when  hoa <= toan and hoa<= ly AND hoa <= van then hoa
			when ly<= hoa and ly <= van AND ly <= van then ly
			else van
		end
	)
	from DIEM where MAHS=@mahs
	update DIEM set DTN = @dtn where MAHS = @mahs
end

/*
10. Tạo View danh sách HOC SINH XUAT SAC bao gồm các học sinh có DTB>=8.5 và
DTN>=8 với các trường: Lop, Mahs, Hoten, Namsinh (năm sinh), Nu, Toan, Ly, Hoa, Van,
DTN, DTB (không dùng trường thấp nhất đã làm ở câu 7)
*/
alter view cau10
as
	select DSHS.MaHS , Ho , Ten ,Nu as Phai , YEAR(NGAYSINH) as NamSinh ,MALOP, Toan ,Ly , Hoa , Van , DTB , 
		DTN = (case
			when TOAN <= HOA and TOAN <= LY AND TOAN <= VAN then TOAN
			when  HOA <= TOAN and HOA <= LY AND HOA <= VAN then HOA
			when LY <= HOA and LY <= TOAN  AND LY <= VAN then LY 
			else VAN end)
	from DSHS join DIEM on DSHS.MAHS = DIEM.MAHS
	where DTB>=8.5 and DTN>=8

select * from cau10

--11. Tạo View danh sách HOC SINH DAT THU KHOA KY THI bao gồm các học sinh xuất
--sắc có DTB lớn nhất với các trường: Lop, Mahs, Hoten, Namsinh, Nu, Toan, Ly, Hoa, Van, DTB

alter view HSThuKhoa
as 
	select top(1) with ties DSHS.MaHS , Ho , Ten ,Nu , YEAR(NGAYSINH) as NamSinh ,MALOP, Toan ,Ly , Hoa , Van , DTB 
	from DSHS join DIEM on DSHS.MAHS = DIEM.MAHS
	order by DTB desc
	--with ties có thể trùng nhau
select * from HSThuKhoa
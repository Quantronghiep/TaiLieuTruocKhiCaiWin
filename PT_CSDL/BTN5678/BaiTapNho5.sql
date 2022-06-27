--1. Tạo thủ tục với giá trị nhập vào là mã học sinh, đầu ra là toàn bộ thông tin của học sinh
create proc cau1 @mahs nvarchar(10) 
as
begin
	select * from DANHSACH where MAHS = @mahs
end

exec cau1 '0001'

--2. Tạo hàm với đầu vào là họ tên học sinh, đầu ra là toàn bộ thông tin của học sinh
ALTER function cau2(@hotenhs nvarchar(100))
returns table
as
	return
	select * from DANHSACH where ( HO +' '+ TEN) like  '%' + @hotenhs +'%'

select * from cau2('Doan Duc Ch')

/* 3. Tạo trigger tự động cập nhật mã và tên học sinh,giới tính, tên trường của học sinh vào bảng
điểm học sinh khi nhập thông tin vào DanhSach (giới tính là nam nếu Phái là False, là nữ nếu Phái là True) */
create trigger cau3 on DanhSach
for insert 
as
begin
	declare @mahs nvarchar(10) , @matruong nvarchar(10) , @tentrg nvarchar(100) ,@phai bit
	declare @ho nvarchar(10) , @ten nvarchar(10)
	select @mahs = MAHS , @matruong = MATRUONG , @ho = HO , @ten = TEN , @phai = PHAI from inserted
	SELECT @tentrg = TENTRUONG from TRUONG where MATRUONG = @matruong
	insert into BangDiemHS(MAHS,Hoten,GioiTinh,TenTruong) values (@mahs,@ho + ' ' + @ten , iif(@phai = 0 , 'Nam' , N'Nữ'),@tentrg)
end

select * from DANHSACH
select * from BangDiemHS

/* 4. Tạo trigger cập nhật điểm toán, văn vào bảng điểm học sinh mỗi khi thêm mới hay cập nhật bảng điểm */
alter trigger cau4 on DIEM
for insert , update , delete
as
begin
	declare @mahs nvarchar(10) , @mon nvarchar(10) , @diem float , @mahsx nvarchar(10) , @monx nvarchar(10) , @diemx float
	select @mahs = MAHS , @mon = MON , @diem = DIEM from inserted
	select @mahsx = MAHS , @monx = MON , @diemx = DIEM from deleted
	UPDATE BangDiemHS set TD = iif(@diem != null ,@diem , null) where MAHS = @mahs and @mon = 'TD'
	UPDATE BangDiemHS set Toan = iif(@diem != null ,@diem , null) where MAHS = @mahs and @mon = 'Toan'
	UPDATE BangDiemHS set Van = iif(@diem != null ,@diem , null) where MAHS = @mahs and @mon = 'Van'

	UPDATE BangDiemHS set TD = iif(@diemx != null ,null , @diem) where MAHS = @mahsx and @monx = 'TD'
	UPDATE BangDiemHS set Toan = iif(@diemx != null ,null , @diem) where MAHS = @mahsx and @monx = 'Toan'
	UPDATE BangDiemHS set Van = iif(@diemx != null ,null , @diem) where MAHS = @mahsx and @monx = 'Van'
end

select * from BangDiemHS

--5. Tạo hàm với đầu vào là mã trường đầu ra là danh sách điểm của học sinh trường đó
alter FUNCTION cau5(@matrg nvarchar(10))
returns table
as
	return
	Select  BangDiemHS.* from BangDiemHS join DANHSACH on BangDiemHS.MAHS = DANHSACH.MAHS 
	where MATRUONG = @matrg

select * from cau5('TV')

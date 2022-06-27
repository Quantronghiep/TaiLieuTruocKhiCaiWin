--BT1_TKCSDL

--Them truong dtbc
--alter table DSHS
--ADD dtbc float
----------CON TRO ---------
--Tính điểm trung bình chung (DTBC) của học sinh
Declare hs cursor for select mahs from DSHS
Open hs
Declare @mahs nvarchar(5), @dtb float
Fetch next from hs into @mahs
While (@@fetch_status = 0) 
begin
  select @dtb=round((toan*2+van*2+hoa+ly)/6,2) from diem where   MAHS=@mahs
  update dshs set dtbc=@dtb where MAHS=@mahs
   Fetch next from hs into @mahs
end
Close hs; Deallocate hs

--select * from DSHS

--Thêm trường DTN vào bảng Điểm , cập nhật cho trường đó
alter table DIEM
ADD dtn float

Declare hs cursor for select mahs from DIEM
Open hs
Declare @ma nvarchar(5), @dtn float 
Fetch next from hs into @ma
While (@@fetch_status = 0)
begin
	select  @dtn = 
	(case
		when toan <= hoa and toan<= ly AND toan<= van then toan
		when  hoa <= toan and hoa<= ly AND hoa <= van then hoa
		when ly<= hoa and ly <= van AND ly <= van then ly
		else van
	end) 
	from DIEM where MAHS=@ma
	update DIEM set dtn = @dtn where MAHS =  @ma
	Fetch next from hs into @ma
end
Close hs; Deallocate hs

select * from DIEM

--------THU TUC---------

/* tạo thủ tục có đầu vào là mã học sinh, đầu ra là điểm
trung bình của học sinh đó*/
alter PROCEDURE DiemTrungBinh @mahs nvarchar(5), @dtb float output
AS
begin
	select @dtb=round((toan*2+van*2+ly+hoa)/6, 2) from diem where MAHS=@mahs
End

--Gọi thủ tục:
declare @tb float
exec DiemTrungBinh '00001', @tb output
print @tb

/*Tinh xep loai cua hs , dau vào ma hs , dau ra xep loai hs , DTB>=5 len lop , nguoc lai luu ban */
alter PROCEDURE XepLoai @mahs nvarchar(5), @dtb float output ,@xeploai nvarchar(100)  output
AS
begin
	select @dtb=round((toan*2+van*2+ly+hoa)/6, 2) from diem where MAHS=@mahs
	--if @dtb >=5 set @xeploai = 'Len lop'
	--else set @xeploai = 'Luu ban'
	select @xeploai = IIF(@dtb >=5 , 'Len Lop' , 'Luu ban')
end
--Goi thu tuc
declare @xl nvarchar(100), @tb float
exec XepLoai '00001', @tb output, @xl output
print ('Hoc sinh co ma 00001 : ' + @xl + ' DTB: ' + cast(@tb as char(4)))
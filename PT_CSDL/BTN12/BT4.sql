/*
1. Tạo view KET QUA chứa kết quả thi của từng học sinh bao gồm các thông tin: SoBD,
HoTen, Phai, Tuoi, Toan, Van, AnhVan, TongDiem, XepLoai, DTDuThi
Biết rằng: TongDiem = Toan + Van + AnhVan + DiemUT
XepLoai học sinh như sau:
* Giỏi nếu TongDiem>=24 và tất cả các môn >=7
* Khá nếu TongDiem>=21 và tất cả các môn >=6
* Trung Bình nếu TongDiem>=15 và tất cả các môn >=4
* Trượt nếu ngược lại  */
alter view KETQUA
as
	select d.SoBD, Ho+' '+Ten HoTen, iif(Phai=1,N'NỮ','NAM') AS Gioitinh, YEAR(getdate())-YEAR(NTNS) Tuoi,Toan,Van,AnhVan,
	(Toan+Van+AnhVan+c.DiemUT) TongDiem,
	iif((Toan+Van+AnhVan+c.DiemUT)>=24 and Toan>=7 and Van>=7 and AnhVan>=7,N'Giỏi',
	iif((Toan+Van+AnhVan+c.DiemUT)>=21 and Toan>=6 and Van>=6 and AnhVan>=6,N'Khá',
	iif((Toan+Van+AnhVan+c.DiemUT)>=15 and Toan>=4 and Van>=4 and AnhVan>=4,N'Trung bình',N'Trượt'))) XepLoai, c.DiemUT, c.DTDuThi
	from DanhSach d join DiemThi t on d.SoBD= t.SoBD
	join ChiTietDT c on d.DTDuThi=c.DTDuThi

select * from KETQUA

/* 2. Tạo view GIOI TOAN – VAN – ANH VAN bao gồm các học sinh có ít nhất 1 môn 10 và
có TongDiem>=25 bao gồm các thông tin: SoBD, HoTen, Toan, Van, AnhVan, TongDiem, DienGiaiDT */
alter view GIOITOANVANANH
as
select DanhSach.SoBD,Ho+' '+Ten HoTen,Toan,Van,AnhVan,(Toan+Van+AnhVan+ChiTietDT.DiemUT) TongDiem,ChiTietDT.DiemUT,ChiTietDT.DTDuThi
from DanhSach join ChiTietDT on DanhSach.DTDuThi=ChiTietDT.DTDuThi join DiemThi on DanhSach.SoBD = DiemThi.SoBD
where (Toan+Van+AnhVan+ChiTietDT.DiemUT) >=25 and (Toan =10 or Van=10 or AnhVan=10)
go
select * from GIOITOANVANANH
go

/* 3. Tạo view DANH SACH DAU (ĐẬU) gồm các học sinh có XepLoai là Giỏi, Khá hoặc
Trung Bình với các field: SoBD, HoTen, Phai, Tuoi, Toan, Van, AnhVan, TongDiem, XepLoai, DTDuThi */
create view DANHSACHDAU
as
select SoBD, HoTen, Gioitinh, Tuoi, Toan, Van, AnhVan, TongDiem,XepLoai, DTDuThi
from KETQUA
where XepLoai like N'Giỏi' or XepLoai like N'Khá' or XepLoai like N'Trung bình'
go
select * from DANHSACHDAU
go
/* 4. Tạo view HOC SINH DAT THU KHOA KY THI bao gồm các học sinh “ĐẬU” có
TongDiem lớn nhất với các field: SoBD, HoTen, Phai, Tuoi, Toan, Van, AnhVan, TongDiem, DienGiaiDT */
alter view cau4
as
select top(1) with ties DanhSach.SoBD,Ho+' '+Ten HoTen,Toan,Van,AnhVan,(Toan+Van+AnhVan+ChiTietDT.DiemUT) TongDiem,ChiTietDT.DiemUT,ChiTietDT.DTDuThi
from DanhSach join ChiTietDT on DanhSach.DTDuThi=ChiTietDT.DTDuThi join DiemThi on DanhSach.SoBD = DiemThi.SoBD
order by TongDiem desc
go
select * from cau4
/* 5. Tạo thủ tục có đầu vào là số báo danh, đầu ra là các điểm thi, điểm ưu tiên và tổng điểm */

/* 6. Tạo trigger kiểm tra xem việc nhập mã đối tượng dự thi trong bảng danh sách có đúng với
bảng đối tượng dự thi không */
alter trigger bai6 on DanhSach
for insert
as
begin
  declare @dtduthi int
  select @dtduthi=DTDuThi from inserted
  IF not exists(SELECT DTDuThi from ChiTietDT where DTDuThi=@dtduthi)
     BEGIN
       RAISERROR('KHONG CO MA NAY BEN CHITIETDT',16,1)
       ROLLBACK TRANSACTION
     END
END

/* 7. Thêm trường điểm ưu tiên và tổng điểm vào bảng Điểm thi. Tạo trigger cập nhật tự động
trường ưu tiên và tổng điểm mỗi khi nhập hay chỉnh sửa */
alter table DiemThi
add DiemUT int , TongDiem float

create trigger cau7 on DiemThi
for insert , update
as
begin
	declare @sbd int ,@toan float , @van float , @anhvan float , @tongdiem float , @diemut int
	select @sbd = SoBD , @toan = Toan , @van = Van , @anhvan = AnhVan ,@tongdiem = (@toan + @van +@anhvan) from inserted
	select @diemut = ChiTietDT.DiemUT from inserted join DanhSach on inserted.SoBD = DanhSach.SoBD 
							join ChiTietDT on DanhSach.DTDuThi = ChiTietDT.DTDuThi
	update DiemThi set DiemThi.DiemUT = @diemut , TongDiem = @tongdiem where SoBD = @sbd
end

/*8. Tạo trigger xóa tự động bản ghi tương ứng ở bảng điểm khi xóa bản ghi ở danh sách */
create TRIGGER CAU8 on DanhSach
INSTEAD OF DELETE
AS
BEGIN
	delete DiemThi where SoBD in (select SoBD from deleted)
	delete DanhSach where SoBD in (select SoBD from deleted)
end 
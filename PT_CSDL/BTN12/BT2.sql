--1. Tạo View gồm các field sau: MaDK, LoaiKH, TenKH,NgaySinh, Phai, DiaChi, DienThoai,
--SoPhong, LoaiPhong, NgayVao, SoNgayO.
--Trong đó Số Ngày ở = Ngày Ra – Ngày Vao
create view Cau1
as
	select tChiTietKH.MaDK , LoaiKH, TenKH, NgaySinh, iif(Phai=1,N'NỮ','NAM') AS Gioitinh, DiaChi, 
	DienThoai, SoPhong,LoaiPhong, NgayVao, DATEDIFF(DAY,NgayVao,NgayRa) as SoNgayO
from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK 

select * from Cau1

--2. Viết hàm có mã nhập vào là ngày vào trong năm 1999 và thông tin đưa ra như câu 1
create function cau2(@ngay date)
returns table
as
	return select tChiTietKH.MaDK , LoaiKH, TenKH, NgaySinh, iif(Phai=1,N'NỮ','NAM') AS Gioitinh, DiaChi, 
	DienThoai, SoPhong,LoaiPhong, NgayVao, DATEDIFF(DAY,NgayVao,NgayRa) as SoNgayO
	from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK 
	where cast(NgayVao as date) = @ngay



--3. Viết truy vấn tạo bảng doanh thu (tDoanhThu) gồm các trường
CREATE TABLE [dbo].[tDoanhThu](
	[MaDK] [nvarchar](3) NOT NULL,
	[LoaiPhong] [nvarchar](2) NULL,
	[SoNgayO] [int] NULL,
	[ThucThu] [bigint] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDK] ASC
)
)

--4. Tạo Trigger tính tiền và điền tự động vào bảng tDoanhThu như sau:
--Các trường lấy thông tin từ các bảng và các thông tin sau:
--Trong đó:
--(a) Số Ngày Ở= Ngày Ra – Ngày Vào
--(b) ThucThu: Tính theo yêu cầu sau:
--Nếu Số Ngày ở <10 Thành tiền = Đơn Giá * Số ngày ở
--Nếu 10 <=Số Ngày ở <30 Thành Tiền = Đơn Giá* Số Ngày ở * 0.95 (Giảm5%)
--Nếu Số ngày ở >= 30 Thành Tiền = Đơn Giá* Số Ngày ở * 0.9 (Giảm10%)

ALTER trigger CapNhatDoanhThu on tDangKy
for insert , update , delete
as
begin 
	declare @madk nvarchar(10) ,@madk2 nvarchar(10) , @loaiphong nvarchar(10) , @songayo int , @thucthu bigint , @dongia int
	select @madk = MADK , @loaiphong = LoaiPhong , @songayo = iif(DATEDIFF(day,ngayvao,ngayra) = 0 , 1,DATEDIFF(day,ngayvao,ngayra))
	from inserted  -- khi them, sua o tDangKy

	select @dongia = DonGia from tLoaiPhong where LoaiPhong = @loaiphong
	select @thucthu = iif(@songayo < 10 , @dongia * @songayo , iif(@songayo < 30 , @dongia * @songayo*0.95, @dongia * @songayo *0.9))

	select @madk2 = MADK from deleted -- khi xoa o tDangKy ( khi xoa thi Insert o Deleted rong )

	--Truong hop 1 : tDoanhThu da co MADK o tDangKy
	if exists(select MaDK from tDoanhThu where MaDK = @madk )  -- khong null ( update , delete ) -- bản ghi trc khi sửa không null
		update tDoanhThu set LoaiPhong = @loaiphong , SoNgayO = @songayo , ThucThu = @thucthu, DonGia = @dongia
		where MaDK = @madk
	--TH2 : tDoanhThu chua co MADK o tDangKy ( @madk không null -> insert,update)
	if (@madk is not null) and not exists(select MaDK from tDoanhThu where MaDK = @madk)
		insert tDoanhThu(MaDK,LoaiPhong,SoNgayO,ThucThu,DonGia) values (@madk,@loaiphong,@songayo,@thucthu,@dongia)
	--TH3 : xóa ở tDangKy thì tDoanhThu xóa
	if exists(select MaDK from tDoanhThu where MaDK = @madk2) and (@madk is null)
		delete tDoanhThu where MaDK = @madk2
end
		
		-- 1 . tDoanhThu da co MADK o tDangKy : DoanhThu có mã = mã sau khi tác động và mã TRƯỚC tác động không null --> UPDATE ( trước đó NULL hay không đâu ảnh hưởng) and (@madk2 is not null)
		--2 . tDoanhThu chua co MADK o tDangKy  : mã sau khi tác động không null và DoanhThu không có mã = mã sau tác động --> INSERT
		--3.  xóa ở tDangKy thì tDoanhThu xóa : DoanhThu có mã = mã TRƯỚC tác động và mã sau tác động không tồn tại --> DELETE

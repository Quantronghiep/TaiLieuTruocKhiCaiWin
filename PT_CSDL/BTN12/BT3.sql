/* 2. Tạo view gồm các trường SoXe, MaLoTrinh, SoLuongVT, NgayDi, NgayDen,
ThoiGianVT, CuocPhi, Thuong. Trong đó:
• ThoiGianVT: là 1 nếu vận chuyển trong ngày, là (NgayDen-NgayDi) trong trường hợp
ngược lại.
• CuocPhi: là SoLuongVT x DonGia x 105% nếu SoLuongVT nhiều hơn TrongTaiQD, là
SoLuongVT x DonGia trong trường hợp ngược lại.
• Thuong: là 5% của CuocPhi nếu ThoiGianVT vuot ThoiGianQD, là 0 trong trường hợp
ngược lại. */

alter view cau2
as 
	select  SoXe,ChiTietVanTai.MaLoTrinh, SoLuongVT, TrongTaiQD ,NgayDi, NgayDen ,  DonGia,ThoiGianQD,
		iif(DATEDIFF(DAY,NgayDi,NgayDen) = 0 ,1,DATEDIFF(DAY,NgayDi,NgayDen)) as ThoiGianVT ,
		iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) as CuocPhi ,
		iif((iif(DATEDIFF(DAY,NgayDi,NgayDen) = 0 ,1,DATEDIFF(DAY,NgayDi,NgayDen))) > ThoiGianQD ,
			0.05 *iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia),0 ) as Thuong
from ChiTietVanTai  join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
					join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh

select * from cau2

/* 3. Tạo view để lập bảng cước phí gồm các trường SoXe, TenLoTrinh, SoLuongVT, NgayDi, NgayDen, CuocPhi. */
create view cau3
as
	select SoXe , TenLoTrinh , SoLuongVT , NgayDi, NgayDen, 
	iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) as CuocPhi
from ChiTietVanTai join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh 
					join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 

select * from cau3

/* 4. Tạo view danh sách các xe có có SoLuongVT vượt trọng tải qui định, gồm các trường
SoXe, TenLoTrinh, SoLuongVT, TronTaiQD, NgayDi, NgayDen. */
create view cau4
as 
	select SoXe , TenLoTrinh , SoLuongVT , TrongTaiQD, NgayDi, NgayDen
	from ChiTietVanTai join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
		join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	where  SoLuongVT > TrongTaiQD

select * from cau4

/* 5. Tạo hàm có đầu vào là lộ trình, đầu ra là số xe, mã trọng tải, số lượng vận tải, ngày đi, ngày
đến (SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen.) */
create function cau5(@tenlotrinh nvarchar(200))
returns table 
as
	return 
	select SoXe , MaTrongTai , SoLuongVT , NgayDi , NgayDen
	from ChiTietVanTai join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	where TenLoTrinh like N'%' + @tenlotrinh + '%'

select * from cau5(N'Đà nẵng')

/* 6. Thiết lập hàm có đầu vào là số xe, đầu ra là thông tin về lộ trình */
create function cau6(@soxe int)
returns table 
as 
	return
	select  LoTrinh.MaLoTrinh,TenLoTrinh,DonGia,ThoiGianQD 
	from LoTrinh join ChiTietVanTai on LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
	where SoXe = @soxe

select * from cau6(111)

/* 7. Thêm trường Thành tiền vào bảng chi tiết vận tải và tạo trigger điền dữ liệu cho trường này
biết:
Thành tiền = là SoLuongVT x DonGia x 105% nếu SoLuongVT nhiều hơn TrongTaiQD, là
SoLuongVT x DonGia trong trường hợp ngược lại */

alter table ChiTietVanTai
add ThanhTien money

alter trigger cau7 on ChiTietVanTai
for insert , update
as
begin
	declare @dongia money , @soluong int , @malotrinh nvarchar(50),@matrongtai nvarchar(50),
		@trongtaiqd int , @thanhtien money , @mavt int
	select @soluong = SoLuongVT , @malotrinh = MaLoTrinh , @matrongtai = MaTrongTai , @mavt = MaVT from inserted
	select @dongia = DonGia from LoTrinh where MaLoTrinh = @malotrinh
	select @trongtaiqd = TrongTaiQD from TrongTai where MaTrongTai = @matrongtai
	if(@soluong>@trongtaiqd)
		set @thanhtien = @soluong * @dongia * 1.05
	else
		set @thanhtien = @soluong * @dongia
	update ChiTietVanTai set ThanhTien = @thanhtien where MaVT = @mavt
end

/* 8. Tạo thủ tục có đầu vào là mã lộ trình, năm vận tải, đầu ra là số tiền theo mã lộ trình đó */
alter PROCEDURE cau8 @malotrinh nvarchar(50) , @namvt int , @sotien float output
as
begin
	select @sotien = sum(iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia))
	from ChiTietVanTai join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	where ChiTietVanTai.MaLoTrinh = @malotrinh and year(NgayDen) = @namvt
end

declare @st float
exec cau8 'HN',2014, @st output
print @st

--9. Tạo thủ tục có đầu vào là số xe, năm vận tải, đầu ra là số tiền theo mã lộ trình đó
alter PROCEDURE cau9 @soxe int , @namvt int , @sotien float output
as
begin
	select @sotien = sum(iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia)) 
	from ChiTietVanTai join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	where ChiTietVanTai.SoXe = @soxe and year(NgayDen) = @namvt
end

declare @st money
exec cau9 333,2014, @st output
print @st
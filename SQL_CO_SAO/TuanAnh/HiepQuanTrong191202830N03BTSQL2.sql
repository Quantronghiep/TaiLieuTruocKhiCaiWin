--BÀI TẬP 3
alter table Diem
add DTN float

--1. Cập nhật điểm trung bình cho học sinh biết DTB=((Toán+Văn)*2+Lý +Hóa)/6
alter table Diem
add DTB float

update Diem set DTB =  ((Toan + Van)*2+ Ly + Hoa)/6 from Diem

--2. Cập nhật điểm thấp nhất cho học sinh biết DTN là điểm thấp nhất trong 4 điểm TOAN, LY, HOA, VAN
	update DIEM set DTN =
	(case
		when TOAN <= HOA and TOAN <= LY AND TOAN <= VAN then TOAN
		when  HOA <= TOAN and HOA <= LY AND HOA <= VAN then HOA
		when LY <= HOA and LY <= TOAN  AND LY <= VAN then LY 
		else VAN end) 
	from DIEM

--3. Cập nhật trường xếp loại cho học sinh biết: XEPLOAI bằng:
--		* Lên Lớp nếu DTB>=5 và DTN >=4
--		* Lưu Ban nếu ngược lại 
alter table Diem 
add XepLoai nvarchar(20)
update Diem set XepLoai =
iif(DTB >=5  and DTN >=4 ,N'Lên Lớp', N'Lưu Ban' )


--4.Đưa kết quả thi của từng học sinh bao gồm các thông tin: LOP, MAHS, HOTEN, NU,
--NAMSINH, TOAN, LY, HOA, VAN, DTN, DTB, XEPLOAI
select LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as Namsinh , iif(NU=1,N'NỮ','NAM') AS Gioitinh , TOAN , LY ,HOA , VAN ,DTN,DTB,
	XepLoai
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS

--5. Đưa ra danh sách học sinh xuất sắc bao gồm các học sinh có DTB>=8.5 và DTN>=8 với các field: 
--LOP, MAHS, HOTEN, NAMSINH, NU, TOAN, LY, HOA, VAN, DTN, DTB
select LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as NamSinh , iif(NU=1,N'NỮ','NAM') AS Gioitinh , TOAN , LY ,HOA , VAN ,DTN,DTB
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
WHere DTB >= 8.5 AND DTN >= 8

--6. Đưa ra danh sách học sinh thủ khoa bao gồm các học sinh Lên Lớp có DTB lớn nhất với các
--field: LOP, MAHS, HOTEN, NAMSINH, NU, TOAN, LY, HOA, VAN, DTB
select top(1) with ties DTB , LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as Namsinh ,iif(NU=1,N'NỮ','NAM') AS Gioitinh ,TOAN, LY, HOA, VAN
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
where XepLoai =N'Lên Lớp'
order by DTB desc



--BÀI TẬP 4

  --1. Đưa ra thông tin khách hàng đặt phòng gồm các field sau: MaDK, LoaiKH, TenKH, NgaySinh,
--Phai, DiaChi, DienThoai, SoPhong, LoaiPhong, NgayVao, SoNgayO. Trong đó Số Ngày ở = Ngày Ra – Ngày Vào
--(a) Số Ngày Ở= Ngày Ra – Ngày Vào
--(b) ThanhTien: Tính theo yêu cầu sau:
--Nếu Số Ngày ở <10 Thành tiền = Đơn Gía * Số ngày ở
--Nếu 10 <=Số Ngày ở <30 Thành Tiền = Đơn Gía* Số Ngày ở * 0.95 (Giảm5%)
--Nếu Số ngày ở >= 30 Thành Tiền = Đơn Gía* Số Ngày ở * 0.9 (Giảm10%)
--(c) GiamGiaA: (Khuyến mãi nhân dịp 30/4 và 1/5).
--Đối với khách hàng đến khách sạn trong tháng 5 (tính theo Ngày vào) thì:
--GiamGiaA = 15% * ThanhTien.
--Ngoài ra: GiamGiaA = 0
--(d) GiamGiaB: (Khách hàng đặc biệt)
--Khách loại 3: GiamGiaB = 10%*ThanhTien
--Khách loại 2: GiamGiaB = 5%*ThanhTien
--Khách loại 1: GiamGiaB = 0
--(e) ThucThu= ThanhTien – GiamGiaA – GiamGiaB 
select tChiTietKH.MaDK , LoaiKH, TenKH, NgaySinh, iif(Phai=1,N'NỮ','NAM') AS Gioitinh, DiaChi, DienThoai, SoPhong, NgayVao,
	DATEDIFF(DAY,NgayVao,NgayRa) as SoNgayO
from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK 


--2. Đưa ra thông tin khách hàng như câu 1 cho các khách hàng nữ và địa chỉ ở Hà Nội
select tChiTietKH.MaDK , LoaiKH, TenKH, NgaySinh, iif(Phai=1,N'NỮ','NAM') AS Gioitinh, DiaChi, DienThoai, SoPhong, NgayVao,
	DATEDIFF(DAY,NgayVao,NgayRa) as SoNgayO , DonGia , 
	iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)) as ThanhTien ,

	IIF(month(ngayvao)=4 and day(ngayvao)=30 or(month(ngayvao)=5 and day(ngayvao)=1),
		0.15*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0 ) as GiamGiaA,

	(case 
	when LoaiKH=3 then 0.1* iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	when LoaiKH=2 then 0.05*iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	else 0 end) as GiamGiaB

from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK join tLoaiPhong on tLoaiPhong.LoaiPhong = tDangKy.LoaiPhong
where Phai = 1 and DiaChi like N'%Hà Nội'

--3. Đưa ra các khách hàng mà khách sạn không có số điện thoại liên lạc
select *
from tChiTietKH
WHERE isnull(DienThoai,0) = 0
--4. Đưa ra các khách hàng nữ ở phòng loại A mà dưới 30 tuổi
select TenKH , iif(Phai=1,N'NỮ','NAM') AS Gioitinh ,NgaySinh, LoaiPhong
from tChiTietKH join tDangKy on tChiTietKH.MaDK = tDangKy.MaDK
where LoaiPhong like 'A' and Phai = 1 and year(NgaySinh) <30

--5. Đưa ra thông tin tính tiền gồm: MaDK, SoPhong, LoaiPhong, LoaiKH, TenKH, NgayVao,
--NgayRa, SoNgayO,DonGia, ThanhTien, GiamGiaA, GiamGiaB, ThucThu.
select tChiTietKH.MaDK ,SoPhong, LoaiKH, TenKH, NgayVao, NgayRa,
	DATEDIFF(DAY,NgayVao,NgayRa) as SoNgayO , DonGia , 
	iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)) as ThanhTien ,

	IIF(month(ngayvao)=4 and day(ngayvao)=30 or(month(ngayvao)=5 and day(ngayvao)=1),
		0.15*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0 ) as GiamGiaA,

	(case 
	when LoaiKH=3 then 0.1* iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	when LoaiKH=2 then 0.05*iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	else 0 end) as GiamGiaB,

	( iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)) - IIF(month(ngayvao)=4 and day(ngayvao)=30 or(month(ngayvao)=5 and day(ngayvao)=1),
		0.15*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0 ) - (case 
	when LoaiKH=3 then 0.1* iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	when LoaiKH=2 then 0.05*iif(DATEDIFF(day, NgayVao, NgayRa)<10, DonGia*DATEDIFF(day, NgayVao, NgayRa), iif(DATEDIFF(day, NgayVao, NgayRa)<30, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.95, DonGia*DATEDIFF(day, NgayVao, NgayRa)*0.9))
	else 0 end) ) as ThucThu

from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK join tLoaiPhong on tLoaiPhong.LoaiPhong = tDangKy.LoaiPhong

  -- BÀI TẬP 5
--alter table ChiTietVanTai
--add CuocPhi float
--update ChiTietVanTai set CuocPhi = iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) from ChiTietVanTai join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
	--																															join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
--1. Đưa thông tin về cước phí vận tải gồm SoXe, MaLoTrinh, SoLuongVT, NgayDi, NgayDen,ThoiGianVT, CuocPhi, Thuong. Trong đó:
--• ThoiGianVT: là 1 nếu vận chuyển trong ngày, là (NgayDen-NgayDi) trong trường hợp ngược lại.
--• CuocPhi: là SoLuongVT x DonGia x 105% nếu SoLuongVT nhiều hơn TrongTaiQD, là SoLuongVT x DonGia trong trường hợp ngược lại.
--• Thuong: là 5% của CuocPhi nếu ThoiGianVT vuot ThoiGianQD, là 0 trong trường hợp ngược lại.
select  SoXe,ChiTietVanTai.MaLoTrinh, SoLuongVT, TrongTaiQD ,NgayDi, NgayDen ,  DonGia,ThoiGianQD,
		iif(DATEDIFF(DAY,NgayDi,NgayDen) = 0 ,1,DATEDIFF(DAY,NgayDi,NgayDen))+1 as ThoiGianVT ,
		iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) as CuocPhi ,
		iif((iif(DATEDIFF(DAY,NgayDi,NgayDen) = 0 ,1,DATEDIFF(DAY,NgayDi,NgayDen))+1) > ThoiGianQD ,
			0.05 *iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia),0 ) as Thuong
from ChiTietVanTai  join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
					join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh

--2. Đưa thông tin chi tiết về cước phí gồm SoXe, TenLoTrinh, SoLuongVT, NgayDi, NgayDen, CuocPhi
select SoXe , TenLoTrinh , SoLuongVT , NgayDi, NgayDen, 
	iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) as CuocPhi
from ChiTietVanTai join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh 
					join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 

--3. Đưa ra danh sách các xe có lộ trình vận tải là Hà Nội gồm SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen. 
select SoXe , MaTrongTAi ,SoLuongVT, NgayDi, NgayDen
from ChiTietVanTai  join LoTrinh ON ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
where TenLoTrinh = N'Hà Nội'

--4. Đưa ra danh sách các xe có lộ trình vận tải là Nha Trang hoặc có SoLuongVT vượt trọng tải
--qui định. Query gồm SoXe, TenLoTrinh, SoLuongVT, TronTaiQD, NgayDi, NgayDen. 
select SoXe , TenLoTrinh , SoLuongVT , TrongTaiQD, NgayDi, NgayDen
from ChiTietVanTai join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
		join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
where TenLoTrinh = N'Nha Trang' or ( SoLuongVT > TrongTaiQD)

--5. Lập danh sách các xe có lộ trình Pleiku được thưởng hoặc các xe có CuocPhi từ 30000 đến 
--50000 gồm SoXe, TenLoTrinh, CuocPhi, Thuong. 
select SoXe , TenLoTrinh , iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia) as CuocPhi ,
		iif((iif(DATEDIFF(DAY,NgayDi,NgayDen) = 0 ,1,DATEDIFF(DAY,NgayDi,NgayDen))+1) > ThoiGianQD ,
			0.05 *iif(SoLuongVT>TrongTaiQD , SoLuongVT * DonGia * 1.05,SoLuongVT * DonGia),0 ) as Thuong
from ChiTietVanTai join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai 
		join LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
where TenLoTrinh = N'Pleiku' or (CuocPhi between 30000 and 50000)


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
from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK join tLoaiPhong on tLoaiPhong.LoaiPhong = tDangKy.LoaiPhong


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

	IIF(LoaiKH = 3,0.1 *iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),
		iif(LoaiKH =2,0.05*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
			iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0)) as GiamGiaB

from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK join tLoaiPhong on tLoaiPhong.LoaiPhong = tDangKy.LoaiPhong
where Phai = 1 and DiaChi = N'%Hà Nội'

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

	IIF(LoaiKH = 3,0.1 *iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),
		iif(LoaiKH =2,0.05*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
			iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0)) as GiamGiaB,

	( iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)) - IIF(month(ngayvao)=4 and day(ngayvao)=30 or(month(ngayvao)=5 and day(ngayvao)=1),
		0.15*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0 ) - IIF(LoaiKH = 3,0.1 *iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
		iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),
		iif(LoaiKH =2,0.05*iif(DATEDIFF(DAY,NgayVao,NgayRa) <10 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) , 
			iif(DATEDIFF(DAY,NgayVao,NgayRa) < 30 , DonGia * DATEDIFF(DAY,NgayVao,NgayRa) *0.95 ,
			DonGia * DATEDIFF(DAY,NgayVao,NgayRa) * 0.9)),0)) ) as ThucThu

from tDangKy join tChiTietKH on tChiTietKH.MaDK =tDangKy.MaDK join tLoaiPhong on tLoaiPhong.LoaiPhong = tDangKy.LoaiPhong
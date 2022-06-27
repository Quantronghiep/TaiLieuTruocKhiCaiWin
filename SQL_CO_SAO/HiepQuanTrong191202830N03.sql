--1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh
--viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.
Select MaSV, HoSV, TenSV, HocBong
From DSSinhVien
Order by MaSV asc

--2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái,
--Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
Select MaSV, HoSV, TenSV, Phai, NgaySinh
From DSSinhVien
Order by Phai asc

--3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được
--sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
Select HoSV, TenSV, NgaySinh, HocBong
From DSSinhVien
Order by NgaySinh asc, HocBong desc

--4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn,Số tiết.
Select MaMH, TenMH, SoTiet
From DMMonHoc
Where TenMH like 'T%'

--5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông tin:
--Họ tên sinh viên, Ngày sinh, Phái.
Select HoSV, TenSV, NgaySinh, HocBong
From DSSinhVien
Where TenSV like '%i'

--6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: Mã khoa, Tên khoa.
	----Dấu "_" đại diện cho 1 ký tự, dấu "%" đại diện cho nhiều ký tự.
Select MaKhoa, TenKhoa
From DMKHOA
Where TenKhoa like '_n%'

--7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
Select *
From DSSinhVien
Where HoSV like N'%Thị%'

--8. Cho biết danh sách những sinh viên có ký tự đầu tiên của tên nằm trong khoảng từ A đến M, gồm:
--Mã Sinh Viên, Họ Tên Sinh Viên, Phái, Học Bổng.
Select MaSV, HoSV, TenSV, Phai, HocBong
From DSSinhVien
Where TenSV like '[a-m]%'

--9. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến m,
--gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách được sắp
--xếp tăng dần theo họ tên sinh viên.
Select  HoSV, TenSV, NgaySinh, NoiSinh , HocBong
From DSSinhVien
Where TenSV between 'a' and 'm'
Order by TenSV asc

--10. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin:
--Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ
--tự Mã khoa giảm dần.
Select MaSV, HoSV, TenSV, MaKhoa, NoiSinh, HocBong
From DSSinhVien
Where HocBong>100000
Order by MaKhoa desc

--11. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông tin:
--Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
Select HoSV, TenSV, MaKhoa, NoiSinh, HocBong
From DSSinhVien
Where HocBong>=150000 and NoiSinh like N'Hà Nội'

--12. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
Select DSSinhVien.MaSV, DSSinhVien.MaKhoa, DSSinhVien.Phai
From DMKHOA inner join DSSinhVien on DMKHOA.MaKhoa=DSSinhVien.MaKhoa
where DMKHOA.TenKhoa like N'Anh Văn' or DMKHOA.TenKhoa like N'Vật Lý'

--13. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm các
--thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
Select MaSV, NgaySinh, NoiSinh, HocBong
From DSSinhVien
Where NgaySinh between '01/01/1991' and '06/05/1992'

--14. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin:
--Mã sinh viên, Ngày sinh, Phái, Mã khoa.
Select MaSV, NgaySinh, Phai, MaKhoa, HocBong
From DSSinhVien
Where HocBong between 80000 and 150000

--15. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
Select MaMH, TenMH, SoTiet
From DMMonHoc
Where SoTiet>30 and SoTiet<45

--16. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin:
--Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
Select DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, DMKhoa.TenKhoa, DSSinhVien.Phai
From DMKHOA inner join DSSinhVien on DMKHOA.MaKhoa=DSSinhVien.MaKhoa
Where DSSinhVien.Phai = 'Nam' and (  DMKhoa.TenKhoa like N'Tin Học' or DMKhoa.TenKhoa like N'Vật Lý' )

--17. Liệt kê những sinh viên nữ, tên có chứa chữ 't'. Truy vấn sử dụng hàm: year, month, day, getdate, case, ….
Select MaSV, TenSV, NgaySinh,
	(case
		when month(getdate()) < month(NgaySinh) then year(getdate())-year(NgaySinh) - 1
		when month(getdate()) >= month(NgaySinh) and day(getdate()) - day(NgaySinh) >=0 then year(getdate()) - year(NgaySinh)
		else year(getdate()) - year(NgaySinh)-1
	end) as Tuoi
From DSSinhVien
Where Phai = N'Nữ' and TenSV like '%t%'


--18. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin:
--Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
Select HoSV, TenSV, NoiSinh, NgaySinh
From DSSinhVien
Where NoiSinh like N'Hà Nội' and MONTH(NgaySinh)=02

--19. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Họcbổng.
Select HoSV, TenSV, HocBong, NgaySinh ,  YEAR(getdate())-YEAR(NgaySinh) 'Tuoi'
From DSSinhVien
Where YEAR(getdate())-YEAR(NgaySinh) >20
--order by N'Tuoi' desc

--20. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên,Tuổi, Tên khoa.
 Select DSSinhVien.HoSV, DSSinhVien.TenSV, YEAR(getdate())-YEAR(NgaySinh) 'Tuoi', DMKHOA.TenKhoa
From DSSinhVien join DMKHOA on DSSinhVien.MaKhoa=DMKHOA.MaKhoa
Where YEAR(getdate())-YEAR(NgaySinh) between 30 and 35

--21. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên, Phái, Ngày sinh. (between 1 and 3)
Select HoSV, TenSV, YEAR(getdate())-YEAR(NgaySinh) 'Tuoi', Phai, NgaySinh
From DSSinhVien
Where YEAR(NgaySinh)=1990 and (MONTH(NgaySinh) between 1 and 3)

--22. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa,
--Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field
--học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
Select HoSV, TenSV, Phai, MaKhoa, 'Muc hoc bong '=
	Case
	When HocBong>500000 then N'Học bổng cao'
	--When ISNULL(HocBong,0) >0 then  N'Mức trung bình' --- nếu null trả về 0 , k NUll trả về HocBong
	When HocBong between 0 and 500000 then N'Mức trung bình'
	End 
From DSSinhVien

--Cho biết thông tin các sinh viên, gồm: Mã sinh viên, Tên SV, Phái, Mã khoa, Điểm lần 1 môn có mã 01 ( nếu có )
select DSSinhVien.MaSV ,HoSV , TenSV , Phai , MaKhoa , Diem 
from DSSinhVien left join (select Masv , Diem from KetQua where MaMH = '01' and LanThi = 1) A 
on  DSSinhVien.MaSV = A.MaSV

--23. Cho biết tổng số sinh viên của toàn trường
Select COUNT(*) 'Tong'
From DSSinhVien

--24. Cho biết tổng sinh viên và tổng sinh viên nữ.
Select *
From ( Select COUNT(*) as 'So SV' From DSSinhVien) A,
( Select COUNT(*) as 'So SV Nu' from DSSinhVien where phai=N'Nữ' ) B

--25. Cho biết tổng số sinh viên của từng khoa.
Select  MaKhoa ,COUNT(MaSV) 'Tong SV'
From DSSinhVien
Group By MaKhoa

--26. Cho biết số lượng sinh viên học từng môn.
Select  distinct MaMH, COUNT(MaSV) 'Tong SV hoc tung mon'
From KETQUA
where LanThi = 1
Group By MaMH

--27. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có torng bảng kq)
Select COUNT(MaMH) 'Tong MH cua sinh vien', MaSV
From KETQUA
Group By MaSV
--Select *
--From KETQUA

--28. Cho biết tổng số học bổng của mỗi khoa.
Select COUNT( HocBong) as 'Tong so Hoc Bong', MaKhoa
From DSSinhVien
Where HocBong>0
Group By MaKhoa
--Select *
--From DSSinhVien

--29. Cho biết học bổng cao nhất của mỗi khoa.
Select max(HocBong) 'Max Hoc Bong', MaKhoa
From DSSinhVien
Where HocBong>0
Group By MaKhoa

--30. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
Select COUNT(*) 'Tong SV', Phai, MaKhoa
From DSSinhVien
Group By Phai, MaKhoa

--31. Cho biết số lượng sinh viên theo từng độ tuổi.
Select COUNT(*) 'So Luong',YEAR(getdate())-YEAR(NgaySinh) 'Tuoi' 
From DSSinhVien
Group By Year(NgaySinh)

--32. Cho biết những năm sinh nào có >= 2 sinh viên đang theo học tại trường.
Select Year(NgaySinh) N'NĂM'
From DSSinhVien
Group By Year(NgaySinh)
Having COUNT(*)>=2

--33. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
Select NoiSinh
From DSSinhVien
Group By NoiSinh
Having COUNT(*)>=2

--34. Cho biết những môn nào có trên 3 sinh viên dự thi.
Select TenMH
From DMMonHoc inner join KETQUA on DMMonHoc.MaMH=KETQUA.MaMH
Group By TenMH
Having COUNT(MaSV)>=3 

--35. Cho biết những sinh viên thi lại trên 2 lần.
Select DSSinhVien.MaSV
From DSSinhVien inner join KETQUA on DSSinhVien.MaSV=KETQUA.MaSV
Where  Diem<5 and LanThi >=2
Group By DSSinhVien.MaSV
--Having count(DSSinhVien.MaSV)>=2 

--36. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
Select KETQUA.MaSV, AVG(Diem)'DTB', Phai
From KETQUA, DSSinhVien
Where KETQUA.MaSV=DSSinhVien.MaSV and LanThi=1and Phai=N'NAM' 
Group by KETQUA.MaSV, Phai
Having AVG(Diem)>7.0 

--37. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
Select DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV,LanThi, COUNT(MaMH)'Số môn rớt'
From DSSinhVien inner join KETQUA on DSSinhVien.MaSV=KETQUA.MaSV
Where LanThi=1 and Diem<5
Group by DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV,LanThi
Having count(MaMH)>=2

-- 38. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
Select DSSinhVien.MaKhoa, DMKHOA.TenKhoa, COUNT(MaSV) 'Số SV Nam'
From DSSinhVien inner join DMKHOA on DSSinhVien.MaKhoa=DMKHOA.MaKhoa
Where Phai=N'Nam'
Group by DSSinhVien.MaKhoa, DMKHOA.TenKhoa
Having count(MaSV)>2

--39. Cho biết những khoa có 2 sinh viên đạt học bổng từ 200.000 đến 300.000.
Select DSSinhVien.MaKhoa, DMKHOA.TenKhoa, COUNT(MaSV) 'Số SV nhận HB'
From DSSinhVien inner join DMKHOA on DSSinhVien.MaKhoa=DMKHOA.MaKhoa
Where HocBong between 200000 and 300000
Group by DSSinhVien.MaKhoa, DMKHOA.TenKhoa
Having count(MaSV)=2

--40. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1.
Select  TenMH, COUNT(MaSV) 'Số SV Đậu'
From  KETQUA, DMMonHoc
Where  KETQUA.MaMH=DMMonHoc.MaMH and  LanThi=1 and Diem>=5
Group  by  TenMH
Select  TenMH, COUNT(MaSV) 'Số SV Rớt'
From  KETQUA, DMMonHoc
Where  KETQUA.MaMH=DMMonHoc.MaMH and  LanThi=1 and Diem<5
Group  by  TenMH

--41. Cho biết sinh viên nào có học bổng cao nhất.
select top(1) with ties DSSinhVien.MaSV, HoSV , TenSV , HocBong
from DSSinhVien 
order by HocBong desc

--42. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
 select top 1  DSSinhVien.MaSV, HoSV , TenSV , Diem
from DSSinhVien JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV JOIN DMMonHoc on KetQua.MaMH = DMMonHoc.MaMH
where LanThi = 1 and DMMonHoc.TenMH = N'Cơ sở dữ liệu'
order by Diem desc 

select  DSSinhVien.MaSV, HoSV , TenSV , Diem
from DSSinhVien JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
where LanThi = 1 and Diem in (select MAX(Diem)
							from KetQua join DMMonHoc on KetQua.MaMH = DMMonHoc.MaMH
							where DMMonHoc.TenMH = N'Cơ sở dữ liệu')

/* select distinct  DSSinhVien.MaSV, HoSV , TenSV 
from DSSinhVien JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
where DSSinhVien.MaSV in (select top 1 MaSV 
										from KetQua join DMMonHoc on KetQua.MaMH = DMMonHoc.MaMH
										where DMMonHoc.TenMH = N'Cơ sở dữ liệu' and LanThi = 1
										order by KetQua.Diem desc ) */


--43. Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
select top 1 with ties DSSinhVien.HoSV, DSSinhVien.TenSV, YEAR(getdate())-YEAR(NgaySinh) 'Tuoi', DMKHOA.TenKhoa
From DSSinhVien join DMKHOA on DSSinhVien.MaKhoa=DMKHOA.MaKhoa
where TenKhoa = N'Anh Văn' 
order by YEAR(getdate())-YEAR(NgaySinh) desc

-- 44. Cho biết khoa nào có đông sinh viên nhất.
select distinct TOP 1 TenKhoa ,count(MaSV) as SoSv
from DMKhoa join DSSinhVien on DMKhoa.MaKhoa = DSSinhVien.MaKhoa 
group by TenKhoa
order by count(MaSV) desc

--45. Cho biết khoa nào có đông nữ nhất.
select TOP 1 with ties TenKhoa ,count(MaSV) as SoSvNu
from DMKhoa join DSSinhVien on DMKhoa.MaKhoa = DSSinhVien.MaKhoa 
where Phai = N'Nữ'
group by TenKhoa
order by count(MaSV) desc

--46. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select TOP 1 with ties DMMonHoc.TenMH, count(MaSV) as SoSV
from DMMonHoc join KetQua on DMMonHoc.MaMH = KetQua.MaMH
where LanThi = 1 and Diem <5
group by TenMH
order by count(MaSV) desc

--47. Cho biết sinh viên không học khoa anh văn có điểm thi môn văn phạm lớn hơn điểm thi môn văn
--phạm của sinh viên học khoa anh văn.
select  DSSinhVien.MaSV , HoSV , TenSV , Diem
from DSSinhVien join KetQua on DSSinhVien.MaSV = KetQua.MaSV JOIN DMMonHoc ON DMMonHoc.MaMH = KetQua.MaMH
where TenMH = N'Văn Phạm' and MaKhoa not like 'AV' and diem > (
															select max(diem) 
															from  KetQua kq , DSSinhVien sv 
															where  sv.MaSV = kq.MaSV and mamh = '05' and MaKhoa = 'AV'
															)
--48. Cho biết sinh viên có nơi sinh cùng với Hải.
select masv,hosv+' '+tensv as HovaTen, NoiSinh
from DSSinhVien
where noisinh = ( select noisinh
				from DSSinhVien
				where tensv=N'Hải')

--49. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộckhoa anh văn
	SELECT MaSV, HoSV +' '+TenSV AS N'HỌ VÀ TÊN', HocBong, TenKhoa
	FROM DSSinhVien INNER JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa
	WHERE TenKhoa NOT LIKE N'Anh Văn' AND HocBong>(SELECT MAX(HocBong)
												   FROM DSSinhVien INNER JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa
												   WHERE TenKhoa=N'Anh Văn')   -- >all()

/* select masv , hoSV , tensv , hocbong , MaKhoa
from DSSinhVien
where  hocbong> all (select hocbong from DSSinhVien where makhoa='AV')  */

--50. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn
select masv , hoSV , tensv , hocbong , makhoa
from DSSinhVien
where makhoa != 'AV' and hocbong> (select min(hocbong) from DSSinhVien where makhoa='AV')   -- >any() / not like <-> != / = <-> in

/* select masv , hoSV , tensv , hocbong , makhoa
from DSSinhVien
where makhoa != 'AV'and hocbong> any (select hocbong from DSSinhVien where makhoa='av') */

--51. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần
--   1 môn cơ sở dữ liệu của những sinh viên khác.
select masv ,diem
from ketqua
where mamh='01' and lanthi=2 and diem>(select max(diem) from ketqua where mamh='01' and lanthi=1)

--kho
--52. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
select  MaSv,Diem , ketqua.MaMH
from ketqua, (select MaMH, max(Diem) as maxdiem
				from ketqua
				group by MaMH) a 
where ketqua.MaMH=a.MaMH and Diem=a.maxdiem

--53. Cho biết những khoa không có sinh viên học.
SELECT *
FROM DMKhoa 
WHERE MaKhoa NOT IN ( SELECT distinct DMKhoa.MaKhoa FROM DSSinhVien INNER JOIN KetQua  ON DSSinhVien.MaSV=KetQua.MaSV
														  INNER JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa)

/* SELECT *
FROM DMKhoa 
WHERE MaKhoa NOT IN ( SELECT DMKhoa.MaKhoa FROM DSSinhVien INNER JOIN DMKhoa ON DMKhoa.MaKhoa=DSSinhVien.MaKhoa) */

/*select * 
from DMKhoa
where  not exists (select distinct makhoa
						from ketqua,DSSinhVien where ketqua.masv=DSSinhVien.masv and makhoa=DMKhoa.MaKhoa) */

--54. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
SELECT MaSV,HoSV ,TenSV 
FROM DSSinhVien 
WHERE MaSV NOT  IN( SELECT MaSV	
					FROM KetQua INNER JOIN DMMonHoc ON DMMonHoc.MaMH= KetQua.MaMH 
					WHERE TenMH=N'Cơ Sở Dữ Liệu')
/*
select *
from DSSinhVien
where not exists (SELECT MaSV	
					FROM KetQua INNER JOIN DMMonHoc ON DMMonHoc.MaMH= KetQua.MaMH 
					WHERE TenMH=N'Cơ Sở Dữ Liệu' and masv=DSSinhVien.masv) */

--55. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
/* SELECT *
FROM KetQua x
WHERE LanThi=2 AND MASv not in (SELECT MaSV
								FROM KetQua 
								WHERE LanThi=1 ) */

SELECT *
FROM KetQua x
WHERE LanThi=2 AND NOT EXISTS (SELECT * 
								FROM KetQua 
								WHERE LanThi=1 AND MaSV=x.MaSV)

--56. Cho biết môn nào không có sinh viên khoa anh văn học.
SELECT TenMH,MaMH
FROM DMMonHoc x
WHERE  NOT EXISTS (SELECT MaMH
					FROM KetQua INNER JOIN DSSinhVien ON DSSinhVien.MaSV= KetQua.MaSV
					WHERE MaKhoa=N'AV' and x.MaMH = MaMH)

/* SELECT TenMH,MaMH
FROM DMMonHoc 
WHERE  MaMH NOT in (SELECT MaMH
					FROM KetQua INNER JOIN DSSinhVien ON DSSinhVien.MaSV= KetQua.MaSV
					WHERE MaKhoa=N'AV') */

--57. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
Select MaSV , HoSV , TenSV , MaKhoa
From DSSinhVien 
Where   MaKhoa='AV' and masv Not in (Select masv
									From KetQua
									Where MaMH='05' )

--58. Cho biết những sinh viên không rớt môn nào. ( đỗ )
Select MaSV , HoSV , TenSV 
From DSSinhVien x
Where Not Exists (Select *
				from KetQua
				Where Diem<5 And MaSV=x.MaSV)

Select MaSV , HoSV , TenSV 
From DSSinhVien 
Where masv not in (Select masv
				from KetQua
				Where Diem<5 )

--59. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao giờ rớt. ( đỗ )
Select MaSV,MaKhoa,HocBong
	From DSSinhVien 
	Where MaKhoa='AV' And HocBong>0 And masv not in (Select masv
													From KetQua
													Where Diem<5)	
	
Select distinct dssinhvien.MaSV,MaKhoa,HocBong
	From DSSinhVien join KetQua on DSSinhVien.MaSV = KetQua.MaSV
	Where MaKhoa='AV' And HocBong>0 And Diem> 5
--60. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít sinh
--viên nhận học bổng nhất.
Select MaKhoa,count(MaSV)'So Luong SV'
		From DSSinhVien
		Where HocBong>0
		Group By MaKhoa
		Having count(MaSV)>=All (Select count(MaSV)
								From DSSinhVien
									where hocbong>0
									Group By MaKhoa)
UNION
--ÍT NHẤT
Select MaKhoa,count(MaSV)'So Luong SV'
		From DSSinhVien
		Where HocBong>0
		Group By MaKhoa
		Having count(MaSV)<=All (Select count(MaSV)
								From DSSinhVien
									where hocbong>0
									Group By MaKhoa)

/* Select top 1 MaKhoa,count(MaSV)'So Luong SV'
	From DSSinhVien
	Where HocBong>0
	Group By MaKhoa
	order by count(MaSV) desc 

Select top 1 with ties MaKhoa,count(MaSV)'So Luong SV'
	From DSSinhVien
	Where HocBong>0
	Group By MaKhoa
	order by count(MaSV) asc  */

--61. Cho biết 3 sinh viên có học nhiều môn nhất.
 Select top 3 MaSV,Count(Distinct MaMH)'Số môn học'
	From KetQua
	Group By MaSV
	order by  Count(Distinct MaMH) desc

--62. Cho biết những môn được tất cả các sinh viên theo học.
Select MaMH ,count( distinct Masv)
From KetQua
Group By MaMH
Having count(distinct MaSV) = (Select count(distinct MaSV)  From DSSinhVien	)

--63. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
/* Select distinct MaSV
From KetQua kq
Where Exists(Select distinct MaMH
					From KetQua									
					Where MaSV='A02' and MaMH=kq.MaMH) */

SELECT DISTINCT DSSinhVien.MaSV,TenSV ,MaMH
FROM DSSinhVien INNER JOIN KetQua ON KetQua.MaSV=DSSinhVien.MaSV
WHERE MaMH IN (SELECT distinct MaMH
					FROM KetQua
					WHERE MaSV='A02' )

--64. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.

	
--65. Tạo một bảng mới tên sinhvien-ketqua: gồm: MASV, HoSV, TenSV, SoMonHoc. Sau đó
--Thêm dữ liệu vào bảng này dựa vào dữ liệu đã có.
Create Table SinhVien_KetQua
(
	MaSV char(3) not null,
	HoSV nvarchar(15) not null,
	TenSV nvarchar(7)not null,
	SoMonHoc tinyint
)

Insert Into SinhVien_KetQua 
Select DSSinhVien.MaSV,HoSV,TenSV,count(distinct MaMH)
From DSSinhVien ,KetQua 
Where DSSinhVien.MaSV=KetQua.MaSV
Group By DSSinhVien.MaSV,HoSV,TenSV 

--66. Thêm vào bảng khoa cột Siso, cập nhật sỉ số vào khoa từ dữ liệu sinh viên.
ALTER TABLE DMKhoa
	ADD Siso3 INT
	go
	UPDATE DMKhoa
	SET Siso3 = (SELECT COUNT(MaSV) FROM DSSinhVien WHERE MaKhoa ='AV' )
	WHERE MaKhoa ='AV'
	UPDATE DMKhoa
	SET Siso3 = (SELECT COUNT(MaSV) FROM DSSinhVien WHERE MaKhoa='TH' )
	WHERE MaKhoa='TH'
	 UPDATE DMKhoa
	SET Siso3 = (SELECT COUNT(MaSV) FROM DSSinhVien WHERE MaKhoa='TR' )
	WHERE MaKhoa='TR'
	 UPDATE DMKhoa
	SET Siso3 = (SELECT COUNT(MaSV) FROM DSSinhVien WHERE MaKhoa='VL' )
	WHERE MaKhoa='VL'

--67. Tăng thêm 1 điểm cho các sinh viên vớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm
update ketqua
set diem=diem+1
where lanthi=2 and  diem+1<=5

--68. Tăng học bổng lên 100000 cho những sinh viên có điểm trung bình là 6.5 trở lên
update DSSinhVien
set hocbong=hocbong+100000
where masv in (select masv 
				from ketqua 
				group by masv 
				having avg(diem)>=6.5)

--69. Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1
update DSSinhVien
set hocbong=0
where masv  in (select masv
				from ketqua
				where lanthi=1 and diem<5
				group by masv
				having count(mamh)=2)

--70. Xoá tất cả những sinh viên chưa dự thi môn nào.
delete from DSSinhVien
where not exists  (select masv
					from ketqua
					where masv=DSSinhVien.masv)

--71. Xóa những môn mà không có sinh viên học.
delete from DMMonHoc
where not exists(select mamh 
					from ketqua
					where mamh=DMMonHoc.mamh)

--72. Danh sách sinh viên không bi rớt môn nào
SELECT DISTINCT MaSV
FROM KetQua
WHERE MaSV NOT IN (SELECT DISTINCT MaSV
							  FROM KetQua 
							  WHERE Diem<5)

--73. Danh sách sinh viên học môn văn phạm và môn cơ sở dữ liệu
SELECT DISTINCT DSSinhVien.MaSV,TenSV,TenMH
	FROM DSSinhVien INNER JOIN KetQua ON KetQua.MaSV=DSSinhVien.MaSV
					INNER JOIN DMMonHoc ON DMMonHoc.MaMH=KetQua.MaMH
	WHERE TenMH=N'Văn Phạm' and TenMH=N'Cơ Sở Dữ Liệu'

--74. Trong mỗi sinh viên cho biết môn có điểm thi lớn nhất. Thông tin gồm: mã sinh viên, tên
--sinh viên, tên môn, điểm.
Select distinct DSSinhVien.MaSV, TenMH , Diem
FROM DSSinhVien , KetQua , DMMonHoc,  (select  MaSV,  max(Diem) as Maxx
							from KetQua 
							GROUP BY MaSV) as A
where DSSinhVien.MaSV = A.MaSV and KetQua.Diem= A.Maxx  and KetQua.MaMH = DMMonHoc.MaMH


--75. Danh sách sinh viên: Không rớt lần 1 hoặc ,Không học môn văn phạm
SELECT DISTINCT  DSSinhVien.MaSV,TenSV
	FROM DSSinhVien INNER JOIN KetQua ON KetQua.MaSV=DSSinhVien.MaSV
	WHERE (LanThi=1 AND Diem>=5) 
		OR DSSinhVien.MaSV not IN (SELECT MaSV
								FROM KetQua INNER JOIN DMMonHoc ON DMMonHoc.MaMH=KetQua.MaMH
								WHERE TenMH=N'Văn Phạm')

--76. Danh sách những sinh viên khoa có 2 sinh viên nữ trở lên
SELECT MaKhoa,COUNT(MaSV) SL_NU
FROM DSSinhVien
WHERE Phai=N'Nữ'
GROUP BY MaKhoa
HAVING COUNT(MaSV)>=2
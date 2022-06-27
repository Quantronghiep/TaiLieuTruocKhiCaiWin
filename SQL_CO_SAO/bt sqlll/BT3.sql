

alter table Diem
add DTN float

alter table Diem
add DTB float

update Diem set DTB =  ((Toan + Van)*2+ Ly + Hoa)/6 from Diem

--2. Cập nhật điểm thấp nhất cho học sinh biết DTN là điểm thấp nhất trong 4 điểm TOAN, LY, HOA, VAN
update DIEM set DTN =
(case
	when TOAN <= HOA and TOAN <= LY AND TOAN <= VAN then TOAN
	when  HOA <= TOAN and HOA <= LY AND HOA <= VAN then HOA
	when LY <= HOA and LY <= TOAN  AND LY <= VAN then LY 
	else VAN end) from DIEM

--3. Cập nhật trường xếp loại cho học sinh biết: XEPLOAI bằng:
--		* Lên Lớp nếu DTB>=5 và DTN >=4
--		* Lưu Ban nếu ngược lại 
alter table Diem 
add XepLoai nvarchar(20)
update Diem set XepLoai =
iif(((Toan + Van)*2+ Ly + Hoa)/6 >=5  and DTN >=4 ,N'Lên Lớp', N'Lưu Ban' )


--Đưa kết quả thi của từng học sinh bao gồm các thông tin: LOP, MAHS, HOTEN, NU,
--NAMSINH, TOAN, LY, HOA, VAN, DTN, DTB, XEPLOAI
select LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as Namsinh , iif(NU=1,N'NỮ','NAM') AS Gioitinh , TOAN , LY ,HOA , VAN ,DTN,DTB,
	XepLoai
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS

--5. Đưa ra danh sách học sinh xuất sắc bao gồm các học sinh có DTB>=8.5 và DTN>=8 với các field: 
--LOP, MAHS, HOTEN, NAMSINH, NU, TOAN, LY, HOA, VAN, DTN, DTB
select LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as Namsinh , iif(NU=1,N'NỮ','NAM') AS Gioitinh , TOAN , LY ,HOA , VAN ,DTN,DTB
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
WHere DTB >= 8.5 AND DTN >= 8

--6. Đưa ra danh sách học sinh thủ khoa bao gồm các học sinh Lên Lớp có DTB lớn nhất với các
--field: LOP, MAHS, HOTEN, NAMSINH, NU, TOAN, LY, HOA, VAN, DTB
select top(1) with ties DTB , LOP ,DIEM.MAHS , HO , ten , year(Ngaysinh) as Namsinh ,iif(NU=1,N'NỮ','NAM') AS Gioitinh ,TOAN, LY, HOA, VAN
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
where XepLoai =N'Lên Lớp'
order by DTB desc



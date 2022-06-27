--2.2. Đưa ra danh sách học sinh gồm mã học sinh, họ và tên, ngày sinh, giới tính, điểm
--trung bình (làm tròn đến 2 số sau dấu chấm thập phân) của các học sinh có mã lớp 10A1
select DSHS.MAHS , HO,TEN,iif(NU=1,N'Nữ','Nam') as GIOITINH ,NGAYSINH, ROUND(SUM(TOAN+LY+HOA+VAN)/4,2) AS DTB 
from DSHS join DIEM ON DSHS.MAHS = DIEM.MAHS
WHERE LOP = '10A1'
group by DSHS.MAHS , HO,TEN,iif(NU=1,N'Nữ','Nam') ,NGAYSINH

--2.4. Đưa ra danh sách học sinh thủ khoa và á khoa gồm các thông tin như câu 2.1
select  top(2) with ties DIEM.MAHS , HO , ten , NGAYSINH ,iif(NU=1,N'NỮ','NAM') AS Gioitinh ,SUM(TOAN+LY+HOA+VAN)/4 AS DTB 
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
group by DIEM.MAHS , HO,TEN,NGAYSINH, iif(NU=1,N'NỮ','NAM') 
order by DTB desc  --SAI

select  DIEM.MAHS , HO , ten , NGAYSINH ,iif(NU=1,N'NỮ','NAM') AS Gioitinh ,SUM(TOAN+LY+HOA+VAN)/4 AS DTB 
FROM Diem join DSHS ON DIEM.MAHS = DSHS.MAHS
group by DIEM.MAHS , HO,TEN,NGAYSINH, iif(NU=1,N'NỮ','NAM') 
having SUM(TOAN+LY+HOA+VAN)/4 in (
	select distinct top(2) SUM(TOAN+LY+HOA+VAN)/4
	from DIEM
	GROUP BY MAHS
	order by SUM(TOAN+LY+HOA+VAN)/4 desc)

	--2.6. Xóa những giáo viên không tham gia chủ nhiệm (1 điểm)
	DELETE from LOP
	Where Lop not in (
	select lop
	from DSHS)
/* Kịch bản 1
Tạo login A, B
Tạo user userA, userB tương ứng với login A, B
Gán quyền select, update cho userA trên bảng KhachHang của CSDL QLBanHang, A có quyền trao quyền này cho người khác
Đăng nhập A để kiểm tra
Từ A, Trao quyền select cho userB trên bảng KhachHang của CSDL QLBanHang
Đăng nhập B để kiểm tra */

/*ở user Admin: Tạo login A, B*/
exec sp_addlogin A, 123
exec sp_addlogin B, 123
/*ở user Admin: Tạo user userA, userB tương ứng với login A, B*/
use BT9
exec sp_adduser A, userA
exec sp_adduser B, userB

/* ở user Admin: Gán quyền select, update cho userA trên bảng KhachHang của CSDL QLBanHang, A có quyền trao quyền này cho người khác*/

grant select, update on KhachHang to userA with grant option

/*Đăng xuất khỏi Admin, vào A để kiểm tra*/
--Từ A, Trao quyền select cho userB trên bảng KhachHang của CSDL QLBanHang
-- pHẢI NewQuery  ( chuột phải vào BT9 NewQuery)

/*
Kịch bản 2
Tạo login A, B , C
Tạo user userA, userB, userC tương ứng với login A, B, C
Gán quyền select, update cho userA trên bảng NhaCungCap của CSDL QLBanHang, A có quyền trao quyền này cho người khác
Đăng nhập A để kiểm tra
Từ A, Trao quyền select cho userB trên bảng NhaCungCap của CSDL QLBanHang
Đăng nhập B để kiểm tra
Từ B, Trao quyền select cho userC trên bảng NhaCungCap của CSDL QLBanHang
Kiểm tra
Xóa login và user B, C
*/
/*ở user Admin: Tạo login A, B*/
exec sp_addlogin A2, 123
exec sp_addlogin B2, 123
exec sp_addlogin C2, 123
/*ở user Admin: Tạo user userA, userB tương ứng với login A, B*/
use BT9
exec sp_adduser A2, userA2
exec sp_adduser B2, userB2
exec sp_adduser C2, userC2

grant select, update on NHACUNGCAP to userA2 with grant option

--grant select on NHACUNGCAP to userB2 with grant option
--grant select on NHACUNGCAP to userC2 with grant option

--Xóa login và user B, C

exec sp_droplogin B2
exec sp_droplogin C2


exec sp_dropuser userB2
exec sp_dropuser userC2
/*
§Kịch bản 3
–Tạo login A, B , C
–Tạo user userA, userB, userC tương ứng với login A, B, C
–Gán quyền select, update, delete, insert cho userA trên bảng KhachHang của CSDL QLBanHang, A có quyền trao quyền này cho người khác
–Đăng nhập A để kiểm tra
–Từ A, Trao quyền select, update cho userB trên bảng NhaCungCap của CSDL QLBanHang
–Đăng nhập B để kiểm tra
–Từ B, Trao quyền select cho userC trên bảng NhaCungCap của CSDL QLBanHang
–Kiểm tra
–Xóa login và user B, C
*/
/*ở user Admin: Tạo login A, B*/
exec sp_addlogin A3, 123
exec sp_addlogin B3, 123
exec sp_addlogin C3, 123
/*ở user Admin: Tạo user userA, userB tương ứng với login A, B*/
use BT9
exec sp_adduser A3, userA3
exec sp_adduser B3, userB3
exec sp_adduser C3, userC3

grant select, update , delete , insert on KhachHang to userA3 with grant option

exec sp_droplogin B3
exec sp_droplogin C3


exec sp_dropuser userB3
exec sp_dropuser userC3

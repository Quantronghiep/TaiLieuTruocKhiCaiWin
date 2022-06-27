<?php
/**
 * b.php
 * Muốn sử dụng biến $var1 của file a.php?
 * Cần nhúng file a.php vào thì mới dùng đc
 */
require_once 'a.php';
echo $var1;
// + Tổng quát lại:
// - include và requrie chỉ khác nhau về cơ chế hiển thị lỗi
//và thực thi code phía sau đoạn lỗi khi nhúng file
//ko tồn tại
// - _once kiểm tra xem đã nhúng file trc đó hay chưa,
//đảm bảo 1 file chỉ đc nhúng 1 lần duy nhất trên trang
// + Nên dùng hàm require_once để nhúng file
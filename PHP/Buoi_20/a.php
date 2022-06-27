<?php
session_start();
/**
 * a.php
 * Thử hiển thị session trên hệ thống
 * Thử mở trình duyệt ẩn, chạy file a.php này
 */
// Khi thao tác với session, luôn phải đảm bảo
//session tồn tại thì mới thao tác đc
//// Luôn phải check session đc sinh ra từ đâu, và dùng
////hàm isset, để fix trường hợp dùng trình duyệt ẩn
////truy cập thẳng vào file hiện tại
$var1 = 'haha';
$_SESSION['name']= 'quantronghiep';
echo $_SESSION['name']; //quantronghiep
echo isset($_SESSION['name']) ? $_SESSION['name'] : '';

echo "<pre>";
print_r($_SESSION);
echo "</pre>";


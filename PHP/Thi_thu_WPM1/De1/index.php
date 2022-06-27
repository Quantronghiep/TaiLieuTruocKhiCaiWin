<?php
session_start();
//cần xử lý nếu chưa login ko cho phép truy cập
if (!isset($_SESSION['username'])) {
    $_SESSION['error'] = 'Bạn cần đăng kí  để hiển thị chức năng này';
    header('Location: Bai3.php');
    exit();
}

echo "<pre>";
print_r($_SESSION);
echo "</pre>";

$username = $_SESSION['username'];
// Chỉ hiển thị session dạng message 1 lần duy nhất
// bằng cơ chế: sau khi echo sẽ xóa luôn
// -> dạng flash
if (isset($_SESSION['success'])) {
    $success = $_SESSION['success'];
    echo "<h2>$success</h2>";
    unset($_SESSION['success']);
}


//echo "<a href='logout.php'>Thoát tài khoản</a>";
?>
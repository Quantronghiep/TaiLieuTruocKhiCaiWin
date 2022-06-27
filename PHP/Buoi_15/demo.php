<!--
Cách chạy file .php :
+ thủ công : mở xampp - >Start -> localhost:81/demo/demo.php ( 81 là cổng trên xampp )
+ Chạy file sử dụng tính năng của PHPStorm , chỉ hoạt động chính xác khi dùng PHPStorm
mở thư mục gốc nằm ngay dưới htdocs đang chứa file cần chạy
    -
-->
<!--Sửa : config -> cái 1 : ( 80->81)
            -> Cái 2 : ( 443 -> 444)
-->
<?php
for ($i = 1; $i <= 10; $i++) {
    if ($i < 0 || $i == 8) {
        break;
    }
    echo $i;
}
?>

<?php echo date('d-m-Y H:i:s'); ?>
<?php echo "<h1>hello</h1>"; ?>

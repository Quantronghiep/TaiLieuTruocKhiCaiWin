<!--php_basic.php-->
<!--Demo code PHP đầu tiên-->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chương tình code PHP đầu tiên</title>
</head>
<body>
<!--    <h1>Hello</h1>-->
    <?php
    //Code PHP nằm trong đây
//    echo number_format(100000000);
    //Không thể xem đc mã nguồn của PHP khi xem nguồn trang
    //HTML CSS JS ko giấu đc , PHP giấu mã nguồn
    ?>
</body>
</html>
<?php
//Các khái niệm cơ bản PHP , giống JS
// 1 . Biến
    $name = 'Hiệp';
    echo $name;
    echo "<br><i>$name</i>";
//2  Kiểu dữ liệu: nhìn bằng mắt dựa vào giá trị
//đang gán cho biến đó để biết kiểu dữ liệu
// - Integer: kiểu số nguyên
$number = 2;
$check = is_int($number);
//Debug
var_dump($check);
// - Float/double: kiểu số thực, thường dùng float
$number = 3.5;
$check = is_float($number); // true
// - String: chuỗi, đc bao bởi nháy đơn hoặc kép
$string1 = 'String 1';
$string2 = "String 2";
$string3 = "Hello, 'Mạnh' ";
$name = 'nvmanh';
// Nối chuỗi trong PHP dùng ký tự .
echo 'Tôi là: ' . $name;
// Ko cần nối chuỗi bằng cách sử dụng dấu nháy
//kép khi hiển thị chuỗi
echo "Hello: $name";
echo 'Hello: $name';
is_string($string1);
// - Boolean: chỉ chứa 2 giá trị duy nhất là
//true/false, với PHP hoa thường thoải mái 2 gtri
//này
$check = false;
$check1 = False;
$check2 = TRUE;
is_bool($check);
// - NULL: 1 giá trị duy nhất = null
$var1 = NULL;
is_null($var1);
// - Array: kiểu mảng, lưu đc nhiều giá trị
//tại 1 thời điểm
$arr = [1, 2, 'a', true, null, [] ];
is_array($arr);
// - Object: kiểu đối tượng, sẽ học sau


?>
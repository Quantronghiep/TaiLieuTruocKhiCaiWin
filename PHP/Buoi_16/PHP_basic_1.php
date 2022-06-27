<?php
// 1 - Ép kiểu dữ liệu trong PHP
$number = 20.4;
var_dump($number);
// Để ép thì thêm từ khóa là tên kiểu dữ liệu trước giá trị muốn ép
$number1 = (int) $number;
var_dump($number1);

$string1 = (string) $number;
var_dump($string1);

$bool1 = (boolean) $number;
var_dump($bool1);
echo $bool1;

//Các giá trị sau khi ép về boolean sẽ false : 0,'0' , '' , null . Ngược lại là true
$string2 = '';
$bool2 = (bool) $string2 ;
var_dump($bool2);

// Hiển thị : true -> hiện thị 1 , false hiển thị 0

$arr = (array) $number ;
var_dump($arr);

$object = (object) $number;
var_dump($object);

// 2. HẰNG
    // - Dùng từ khóa const => ưu TIÊN . Khi học OOP ko thẻ dùng define trong 1 class
const MAX = 10 ;
    // - Dùng hàm define
define('MIN',11);
echo MAX;

    // MỘT SỐ HẰNG ĐỊNH NGHĨA SẴN trong PHP
echo "<br>";
echo __LINE__;
echo "<br>";
echo __FILE__ ;
echo "<br>";
echo __DIR__; // Thư mục cha gần nhất

// 3 - HÀM
function show(){
    echo '<br>Hi my name is Hiep';
}
show();
    //Hàm có sẵn
echo date('d-m-Y H:i:s');
    // Hàm tự định nghĩa
    // + Hàm ko có tham số
function info(){
    echo "Hello Meo";
}
    // + Hàm có tham số
function sum($number1 , $number2 , $number3){
    return $number1 + $number2 + $number3;
}
echo '<br>' .sum(1,2,3);

function showName($name) {
    return "<br>Hello, $name";
}
echo showName('AnhMeo');

// 4 - Truyền tham trị , tham chiếu : truyền giá trị vào hàm theo kiểu tham trị , tham chiếu
// Viết hàm thay đổi giá trị của biến
$number = 20 ;
echo "<br>Gía trị ban đầu : $number";
function changeNumber($n){
    $n = 0;
    echo "<br> Biến n bên trong hàm = $n";
}
changeNumber($number);
echo "<br> Sau khi gọi hàm number = $number";
//Number không bị thay đổi do truyền tham trị - chỉ truyền giá trị vào hàm , chứ ko truyền bản gốc
// Tham trị - tạo ra 1 bản sao của biến gốc để truyền vào hàm

// + Truyền tham chiếu
$a = 4 ;
echo "<br> Ban đầu a = $a";
function changA(&$n){
    $n = 0;
    echo "<br> Trong hàm , number = $n";
}
changA($a);
echo "<br>Sau khi gọi hàm , a = $a";
// - Tính áp dụng :
//   + Truyền tham chiếu hay gặp ở các CMS
?>
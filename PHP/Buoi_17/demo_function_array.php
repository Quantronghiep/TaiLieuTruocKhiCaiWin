
<?php
// Thao tác với mảng
//  1.  Tổng
$arr = [ 1,3,5,7];
$sum = array_sum($arr);

// cách đọc comment hàm có sẵn trong PHPStorm
//   - Khi gõ tên hàm dùng Ctrl + Q để hiện cmt

//  2.Kiểm tra xem key $key có tồn tại trong mảng $array hay không, trả về TRUE nếu tồn tại, ngược lại là FALSE

$arr = [
    'name' => 'Hiep',
    'age' => 19
];
$check = array_key_exists('name',$arr);
var_dump($check);

//  4.Tìm kiếm theo giá trị của mảng, trả về  key của phần tử đó nếu có.
$arr = [7,8,3,1];
var_dump(array_search(1,$arr));

//  5.Lấy các phần tử từ vị trí $begin của mảng $array, lấy $length phần tử, trả về mảng mới
$arr = [7,8,3,1,4,8,0,1,6,9];
$new_arr = array_slice($arr,2,5);
echo "<pre>";
print_r($new_arr);
echo "</pre>";

//  6.Loại bỏ các phần tử có giá trị trùng lặp, và trả về 1 mảng mới
$arr = [1,2,3,4,1,1,2,2];
$new_arr = array_unique($arr);
echo "<pre>";
print_r($new_arr);
echo "</pre>";

//  7.Tạo mảng mới như mảng ban đầu
$arr = [7,8,3,1];
$new_arr = array_values($arr);
echo "<pre>";
print_r($new_arr);
echo "</pre>";

// 8.Tạo ra  mảng tuần tự mới với giá trị là key của mảng bạn đầu
$arr = [2,0,4,0,1];
$new_arr = array_keys($arr);
echo "<pre>";
print_r($new_arr);
echo "</pre>";

//  9.Bỏ đi phần tử cuối cùng của mảng ban đầu và trả về giá trị của phần tử cuối cùng đó
$arr = [2,0,4,0,1];
var_dump(array_pop($arr));

//  10.Thêm 1 hoặc nhiều phần tử vào cuối mảng ban đầu, trả về số lượng phần tử của mảng ban đầu sau khi thêm
$arr = [2,0,4,0,1];
var_dump(array_push($arr,6,7));
echo "push" ."<pre>";
print_r($arr);
echo "</pre>";

//  11.Xóa phần tử đầu tiên của mảng ban đầu, trả về giá trị của phần tử vừa bị xóa
$arr = [2,0,4,0,1];
var_dump(array_shift($arr));
echo "<pre>";
print_r($arr);
echo "</pre>";


//  14. Đếm số ptu của mảng  count($arr)
//  15. Chuyển từ string thành array dựa theo kí tự phân tách explode($character, $string) ,
//Mảng về chuổi implode
$string = "1,2,3,4,5,6,7";
$arr = explode(',',$string);
echo "<pre>";
print_r($arr);
echo "</pre>";

//  16.Trả về giá trị cuối cùng của mảng $array
echo end($arr);

//  18.Sắp xếp mảng
$arr = [7,8,3,1];
sort($arr);
echo "<pre>";
print_r($arr);
echo "</pre>";


// 22.convert các giá trị của mảng $array thành string ngăn cách nhau bởi ký tự $character
$string = implode('-',$arr);
echo "<pre>";
print_r($string);
echo "</pre>";


//  28.Trả về giá trị đầu tiên của mảng $array
echo "<br>".reset($arr);
//  29 . Xóa phần tử mảng theo Key
$arr = [1,4,2];
unset($arr[2]);
echo "<pre>";
print_r($arr);
echo "</pre>";

//  10. Ktra có phải mảng hay k
$check = is_array($arr);
//  11.Kiểm tra giá trị có tồn tại hay k
$check = in_array(2, $arr);  // true

//  25,26. Max , min mảng
$max = max($arr);
$min = min($arr);

//  21.

?>
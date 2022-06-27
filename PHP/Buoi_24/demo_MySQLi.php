<?php
/**
Kết nối CSDL MySQL trong PHP sử dụng thư viện MySQLi
 * Web động : tương tác với CSDL , web tĩnh thì không
 * PHP và MySQL hoàn toàn độc lập với nhau ,cần có cơ chế để liên kết
 * -> Dùng thư viện MySQLi có sẵn để liên kết
 * XAMPP tích hợp sẵn MySQLi
 * MySQLi chỉ hỗ trợ kết nối tới 1 csdl duy nhất là MySQL
 * Sang phần OOP : cơ chế PDO  - PHP Data Object
 * MySQLi cung cấp 2 hướng tiếp cận : PHP thuần và OOP -> dùng PHP thuần
 *  + Demo PHP kết nối MySQL thông qia 4 truy vấn : SELECT , INSERT , UPDATE , DELETE
 *  + Chuẩn bị tài nguyên :
 *      * Tạo CSDL : php1220e2_crud
 */
/*
 * #Tạo CSDL
CREATE DATABASE IF NOT EXISTS
php1220e2_crud
CHARACTER SET utf8
COLLATE utf8_general_ci;

#Tạo bảng : products(id , name , price , avatar , created_at )
                //CREATE TABLE IF NOT EXISTS categories(
                //    id INT(11) AUTO_INCREMENT,
                //    name VARCHAR(255) NOT NULL,
                //    price int(11),
                //    avatar VARCHAR(255),
                //    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                //    #khai báo khóa chính, khóa phú nếu có sau khi khai báo tất cả các trường
                //    PRIMARY KEY (id)
                //)
# Demo dùng PHPMyAdmin để thao tác với CSDL :
    + Tạo CSDL : php1220e2-test
    + Tạo bảng users : ì , name , age , created_at
    + Thêm / sửa / xóa
# Export CSDL ra file.sql :

# Demo các bước kết nối CSDL  từ PHP theo cơ chế MySQLi , PHP có các hàm có tiền tố mysqli_ để thao tác

// Khai báo các hằng số lưu thông tin kết nối
//Máy chủ chứa CSDL MySQL : localhost là thuật ngữ CSDL đc lưu trên chính nơi gọi CSDL đó
 */
const DB_HOST = 'localhost';
// Username kết nối vào CSDL MySQL
const DB_USERNAME = 'root';   // mặc định đc tạo khi cài XAMPP
//PASSWORD kết nối vào CSDL
const DB_PASSWORD = '';
//Ten CSDL sẽ kết nối
const DB_NAME = 'php1220e2_crud';
// cỔNG kết nối vào CSDL MySQL
const DB_PORT = 3306;

// -- KHỞI TẠO KẾT NÓI CSDL
$connection = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME,DB_PORT);
if(!$connection) {
    die('Lỗi kết nối' .mysqli_connect_error());
}
echo "<h2>Kết nối CSDL thành công</h2>";
//set thủ công utf8 cho kết nối, để lưu đc các ký tự có dấu
//mà ko bị lỗi font chữ
mysqli_query($connection, "SET NAMES 'utf8'");

// Sử dụng biến nối để thực hiện các truy vấn
//  - Demo truy vấn Thêm dữ liệu :
// products(id,name,price , avatar , created_at)
// Viết truy vấn : chú ý dữ liệu thêm cho trường phải ứng với kiểu dữ liệu của PHP
// cHỈ THÊM  cho trường thủ công
// ngoài ra cần bao tên trường bởi cặp ký tự `` để tránh lỗi, vì tên trường
// có thể sẽ bị trùng với từ khóa của MYSQL mà bạn ko biết
$sql_insert = "INSERT INTO 
products(`name`,`price`,`avatar`)
VALUES('Iphone',10000,'iphone.jpg'),
      ('SamSung',10000,'iphone.jpg')";
//Thực thi truy vấn : sử dụng hàm mysqli_query
//Với truy vấn INSERT , UPDATE , DELETE thì kết quả sau khi thực thi luôn là Boolean
$is_insert = mysqli_query($connection,$sql_insert);
// Cách debug khi FALSE : Copy nội dung câu truy vấn paste SQL củxa PHPMyAdmin để chạy trực tiếp
var_dump($is_insert);

// 2 . Demo truy vấn lấy dữ liệu : SELECT
//  + Lấy nhiều bản ghi : lấy tất cả sp đang có sắp xếp theo chiều giảm dần ngày tạo
//Viết truy vấn
$sql_select_all = "SELECT * FROM products ORDER BY created_at desc";
// + Thực thi truy vấn : kết quả trả về không phải Bool , mà là 1 obj trung gian
$obj_select_all = mysqli_query($connection,$sql_select_all);
// + Lấy dạng mảng từ đối tượng trung gian trên :
$products = mysqli_fetch_all($obj_select_all,MYSQLI_ASSOC);
echo"<pre>";
print_r($products);
echo"</pre>";
foreach ($products as $product){
    echo "Tên sản phẩm : {$product['name']} </br>";}
//  Lấy 1 bản ghi duy nhất
// lẤY sp có id = 1 -> trả về 1 bản ghi
$sql_select_one = "SELECT * FROM products WHERE id = 1";
//Thực thi truy vấn
$obj_select_one = mysqli_query($connection,$sql_select_one);
//trả về mảng 1 chiều chứa thông tin sp
$product = mysqli_fetch_assoc($obj_select_one);
    echo"<pre>";
    print_r($product);
    echo"</pre>";
    echo $product['name']."</br>";

//DEMO với truy vấn đếm tổng số bản ghi theo id và theo name
//của bảng danh mục
// - Tạo câu truy vấn
$sql_count = "SELECT COUNT(id) AS count_id, 
              COUNT(name) AS count_name
              FROM categories";
// - Thực thi truy vấn select
$result_count = mysqli_query($connection, $sql_count);
// - Lấy mảng dữ liệu trả về từ đối tượng trung gian trên
//với truy vấn count thì sẽ chỉ trả về 1 bản ghi duy nhất
//$count = mysqli_fetch_assoc($result_count);
//echo "<pre>";
//print_r($count);
//echo "</pre>";

// 3 . Truy vấn cập nhật : điều kiện cập nhật
    // Cập nhật name = 'ABC' với sp có id<3
    // Viết truy vấn :
$sql_update = "UPDATE products SET name = 'ABC' WHERE  id <3";
//Thực thi truy vấn
$is_update = mysqli_query($connection,$sql_update);
var_dump($is_update);

// 4. Truy vấn xóa : kèm Đkien
//Xóa sp có id > 8
//Viết truy vấn
$sql_delete = "DELETE FROM products WHERE id > 8 and id < 30 ";
//Thực thi truy vấn
$is_delete = mysqli_query($connection,$sql_delete);
var_dump($is_delete);
?>
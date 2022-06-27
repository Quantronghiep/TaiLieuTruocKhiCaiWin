<?php
const DB_DSN ='mysql:host=localhost;dbname=php1220e2_pdo;port=3306;charset=utf8';
//  + USER name kết nối vào csdl
const DB_USERNAME = 'root';
//  + PASSword
const DB_PASSWORD ='';
//cODE KẾT nối với PDO cần dùng try...catch thì mới bắt đc các ngoại lệ sinh ra khi có lỗi kết nối
try{
    $connection = new PDO(DB_DSN,DB_USERNAME,DB_PASSWORD);
}catch (PDOException $e){
    die("Lỗi kết nối" . $e->getMessage());
}
echo "<h2>Kết nối CSDL theo PDO thành công</h2>";
?>
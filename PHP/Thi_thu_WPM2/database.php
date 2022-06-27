<?php
const DB_DSN = "mysql:host=localhost;dbname=php1220e2_wpm2_bai1;port=3306;charset=utf8";
const DB_USERNAME = "root";
const DB_PASSWORD = "";
try{
    $connection = new PDO(DB_DSN,DB_USERNAME,DB_PASSWORD);
}catch (Exception $e){
    die("Lỗi kết nối" . $e->getMessage());
}
echo "<h2> Kết nối CSDL theo cơ chế PDO thành công</h2>";
?>
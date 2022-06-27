<?php
//Model.php
require_once 'configs/Database.php';

/**
 * Class Model cha chứa thuộc tính kết nối dùng chung ở các Model con kế thừa từ nó
 *
 */

class Model {
    public $connection;
    // Sử dụng

    public function __construct(){
        try{
            $this->connection = new PDO(Database::DB_DSN,Database::DB_USERNAME,Database::DB_PASSWORD);
        }catch (PDOException $e){
            die('Lỗi kết nối'. $e->getMessage());
        }
    }
}
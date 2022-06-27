<?php
//models/Category
require_once 'models/Model.php';
class Category extends Model
{
    public $name;
    public $description;

    //insert dữ liệu vào bảng categories
    public function insert()
    {
        $sql_insert =
            "INSERT INTO categories(`name`, `description`)
            VALUES (:name,  :description)";
        //cbi đối tượng truy vấn
        $obj_insert = $this->connection
            ->prepare($sql_insert);
        //gán giá trị thật cho các placeholder
        $arr_insert = [
            ':name' => $this->name,
            ':description' => $this->description
        ];
        return $obj_insert->execute($arr_insert);
    }

    public function getAll(){
        $sql_select_all =
            "SELECT * FROM categories ORDER BY id ASC";
        $obj_select_all = $this->connection->prepare($sql_select_all);
        $obj_select_all->execute();
        $categories = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
        return $categories;
    }

    public function getOne($id)
    {
        $obj_select = $this->connection
            ->prepare("SELECT * FROM categories WHERE id =  :id");
        $selects = [
            ':id' => $id
        ];
        $obj_select->execute($selects);
        $category = $obj_select->fetch(PDO::FETCH_ASSOC);

        return $category;
    }
//    public function getOne($id)
//    {
//        $sql_select_one = "SELECT id,short_content, categories.name as category_name
//        FROM posts join categories on posts.category_id = categories.id
//        WHERE id =  :id";
//        $obj_select = $this->connection
//            ->prepare($sql_select_one);
//        $selects = [
//            ':id' => $id
//        ];
//        $obj_select->execute($selects);
//        $category = $obj_select->fetch(PDO::FETCH_ASSOC);
//
//        return $category;
//    }

}
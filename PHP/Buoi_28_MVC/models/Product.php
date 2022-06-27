<?php
//Product.php
require_once 'models/Model.php';
/**
 * Model tương tác với bảng products
 * model là mapping/ánh xạ đến bảng của đối tg
 * Không nên viết code kết nối CSDL ở model Product , viết ở Model cha
 */

class Product extends Model {
    // Khai báo các thuộc tính của Model là các trường của bảng
    public $name;
    public $price;

    // sử dụng đc thuộc tính $connection của model cha

    // Xây dựng pthuc thêm mới vào bản products

    public function insert(){
        //+ Viết truy vấn sử dụng tham số để tránh lỗi bảo mật SQLInjection
        $sql_insert = "INSERT INTO products(name, price)
                      VALUES(:name, :price)";
        //  + Chuẩn bị đối tượng truy vấn : prepare
        $obj_insert = $this->connection->prepare($sql_insert);
        //  +[Tùy chọn] Tạo mảng để truyền gtri thật vào tham số trong truy vấn
        $inserts = [
            ':name'=>$this->name,
            ':price' => $this->price
        ];
        // + Thực thi đối tượng truy vấn vừa tạo => excute
        $is_insert = $obj_insert->execute($inserts);
        return $is_insert;
    }

    public function getAll(){
        // + Viết truy vấn:(tham số) theo thứ tự giảm dần của ngày tạo
        $sql_select_all =
            "SELECT * FROM products ORDER BY created_at DESC";
// + cbi đối tg truy vấn : prepare
        $obj_select_all = $this->connection->prepare($sql_select_all);
//  +[Tùy chọn] Tạo mảng để truyền gtri thật vào tham số trong truy vấn
// + Thực thi đối tượng truy vấn vừa tạo => excute
        $obj_select_all->execute();
//Trả về mảng kết hợp chứa dữ liệu , nằm sau bước execute
//cần truyền vào hằng số của class có sẵn ::
//Lấy dữ liệu dưới dạng mảng kết hợp nhiều ptu
        $products = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
        return $products;
    }

    public function getOne($id){
        // - Tương tác với CSDL để lấy ra sp theo id: SELECT
        // + Viết truy vấn dạng tham số
        $sql_select_one = "SELECT * FROM products WHERE id = :id";
        // + Cbi obj truy vấn:
        $obj_select_one = $this->connection->prepare($sql_select_one);
        // + [Tùy chọn] Tạo mảng truyền giá trị cho tham số câu truy vấn nếu có
        $selects = [
            ':id' => $id
        ];
        // + Thực thi obj truy vấn:
        $obj_select_one->execute($selects);
        // + TRả về mảng kết hợp 1 chiều:
        $product = $obj_select_one->fetch(PDO::FETCH_ASSOC);
        return $product;
    }

    public function update($id)
    {
        // + Viết truy vấn dạng tham số:
        $sql_update = "UPDATE products SET name=:name, price=:price WHERE id=:id";
        // + Cbi obj truy vấn
        $obj_update = $this->connection->prepare($sql_update);
        // + [Tùy chọn] Tạo mảng để truyền giá trị cho tham số của câu truy vấn
        $updates = [
            ':name' => $this->name,
            ':price' => $this->price,
            ':id' => $id
        ];
        // + Thực thi obj truy vấn:
        $is_update = $obj_update->execute($updates);
        return $is_update;
    }

    public function delete($id){
//  + Viết truy vấn dạng tham số
        $sql_delete = "DELETE FROM products WHERE id = :id";
// Cbi đối tượng truy vấn : prepare
        $obj_delete = $this->connection->prepare($sql_delete);
//  +[TÙY CHỌN] tạo mảng
        $deletes = [
            ':id' => $id
        ];
//  + Thực thi obj truy vấn
        $is_delete = $obj_delete->execute($deletes);
        return $is_delete;
    }
}
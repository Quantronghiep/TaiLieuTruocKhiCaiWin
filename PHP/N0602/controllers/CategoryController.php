<?php
require_once 'controllers/Controller.php';
require_once 'models/Category.php';

class CategoryController extends Controller{
    public function create()
    {
        if (isset($_POST['submit'])) {
            $name = $_POST['name'];
            $description = $_POST['description'];

            if (empty($this->error)) {
                //lưu vào csdl
                //gọi model để thực  hiện lưu
                $category_model = new php();
                $category_model->name = $name;
                $category_model->description = $description;
                //gọi phương thức insert
                $is_insert = $category_model->insert();
                if ($is_insert) {
                    $_SESSION['success'] = 'Thêm mới thành công';
                } else {
                    $_SESSION['error'] = 'Thêm mới thất bại';
                }
                header('Location: index.php?controller=category&action=index');
                exit();
            }

        }

        //lấy nội dung view create.php
        $this->content = $this->render('views/categories/create.php');
        //gọi layout để nhúng nội dung view create vừa lấy đc
        require_once 'views/layouts/main.php';
    }

    public function index(){
        $category_model= new php();
        $categories= $category_model->getAll();
        $variables = [
            //Mỗi ptu mảng theo cú pháp :
            //Tên biến sd ở view => gtri tương ứng ở controller
            'categories'=>$categories //view tương ứng sẽ có biến $products
        ];

        // + Controller gọi view để hiển thị dssp
        //Lấy ndung view tương ứng
        $this->content = $this->render('views/categories/index.php',$variables);
        $this->page_title = 'Trang liệt kê sản phẩm';
        //Gọi layout để hiển thị nd trên
        require_once 'views/layouts/main.php';
    }
    public function detail()
    {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=category&action=index');
            exit();
        }
        $id = $_GET['id'];
        $category_model = new php();
        $category = $category_model->getOne($id);
        //lấy nội dung view create.php
        $this->content = $this->render('views/categories/detail.php', [
            'Category.php' => $category
        ]);
        //gọi layout để nhúng nội dung view detail vừa lấy đc
        require_once 'views/layouts/main.php';

    }
    public function img(){
        $this->content = $this->render('assets/images/image.png');
        require_once 'views/layouts/main.php';
    }

}

?>
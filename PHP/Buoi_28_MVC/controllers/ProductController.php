<?php
// Với MVC cần phải đứng từ file index gốc của mô hình MVC để nhúng
require_once 'controllers/Controller.php';
require_once 'models/Product.php';
// + Khi sd 1 class từ file khác cần nhúng file chứa class đó thì mới sd đc
//controllers/ProductController.php
// Controller xử lý cho đối tượng product
// Thử chạy lại url ban đầu xem có lỗi khác ko ?
// index.php?controller=product&action=create
class ProductController extends Controller {
    public function create() {
        // + Xử lí submit form trên logic hiển thị ra view , xử lí ở controller
        //Debug
        echo "<pre>";
        print_r($_POST);
        echo "</pre>";
        // + Tạo biến chứa lỗi , tuy nhiên với MVC bỏ qua , sdung thuộc tính $error của controller cha
        // - Xử lí nếu user submit form
        if(isset($_POST['submit'])){
            // Biến trung gian
            $name = $_POST['name'];
            $price = $_POST['price'];
            //Validate : tên ko trống , ít nhất 3 kí tự
            if(empty($name)){
                $this->error = 'Tên sp không đc để trống';
            } elseif(strlen($name) < 3){
                $this->error = 'Tên sp từ 3 kí tự trở lên';
            }

            // Xử lí logic chính là thêm sp vào csdl chỉ khi ko có lỗi
            if(empty($this->error)){
                // + Cần gọi Model để nhờ Model tg tác với CSDL -> Thêm sp vào csdl
                // + Code chuẩn MVC thì sẽ k viết code tương tác với CSDL ở controller - >Model
                //Nhúng file model vào để sd đc class tg ứng
                $product_model = new Product();
                //Gán giá trị từ form cho đối tượng trên
                $product_model->name = $name ;
                $product_model->price = $price;
                //Gọi phg thức insert trên obj trên
                $is_insert = $product_model->insert();
//                var_dump($is_insert);
                if($is_insert){
                    // Chuyển hướng
                    $_SESSION['success'] = "Thêm mới sp thành công";
                    header('Location: index.php?controller=product&action=index');
                    exit();
                } else {
                    $this->error = ' Thêm sp thất bại';
                }
            }
        }
    // + Sau khi xác định đc phương thức của controller , đi gọi view để hiển thị giao diện trước
    // MVC : Controller gọi Vieư
        // + Lấy ndung của file
        $this->content = $this->render('views/products/create.php');
        $this->page_title = ' Trang thêm mới sản phẩm';
        //        echo $this->content;
        // + Gọi layout tương ứng để hiển thị ndung của file trên
        require_once 'views/layouts/main.php';
    }

    //Phương thức liệt kê sp dựa trên khung MVC đã dựng
    public function index(){
        //Phương thức liệt kê sp dựa trên khung MVC đã dựng
        // + GọiModel để lấy dsach sp
        $product_model = new Product();
        $products = $product_model->getAll();
//        echo "<pre>";
//        print_r($products);
//        echo "</pre>";
        // Để view tương ứng

        $variables = [
          //Mỗi ptu mảng theo cú pháp :
            //Tên biến sd ở view => gtri tương ứng ở controller
            'products'=>$products //view tương ứng sẽ có biến $products
        ];

        // + Controller gọi view để hiển thị dssp
        //Lấy ndung view tương ứng
        $this->content = $this->render('views/products/index.php',$variables);
        $this->page_title = 'Trang liệt kê sản phẩm';
        //Gọi layout để hiển thị nd trên
        require_once 'views/layouts/main.php';
    }
    //Phuong thức cập nhật theo id
    public function update(){
        //Lấy sp tương ứng theo id truyền từ url để đổ ra view
        // Url: update.php?id=4
        // Xử lý validate cho tham số id trc khi lấy giá trị:
        if(!isset($_GET['id']) || !is_numeric($_GET['id'])){
            $_SESSION['error'] = 'Tham số Id không hợp lệ';
            header('Location: index.php?controller=product&action=index');
            exit();
        }
        $id = $_GET['id'];
        $product_model = new Product();
        $product = $product_model->getOne($id);
        //Xử lí submit forrm
        echo "<pre>";
        print_r($_POST);
        echo "</pre>";
        //Ktra nếu user submit form mới xử lí
        if(isset($_POST['submit'])){
            //gán biến trung gia
            $name = $_POST['name'];
            $price = $_POST['price'];

            //Validate : tên ko trống , ít nhất 3 kí tự
            if(empty($name)){
                $this->error = 'Tên sp không đc để trống';
            } elseif(strlen($name) < 3){
                $this->error = 'Tên sp từ 3 kí tự trở lên';
            }

            // Xử lí logic chính là cập nhật sp vào csdl chỉ khi ko có lỗi
            if(empty($this->error)){
                // + Cần gọi Model để nhờ Model tg tác với CSDL -> Cập nhật sp vào csdl
                // + gán gtri cho thuoc tính name và price của class
                $product_model->name = $name ;
                $product_model->price = $price ;
                $is_update = $product_model->update($id);
//                var_dump($is_update);
                //Test
            if ($is_update) {
                $_SESSION['success'] = "Cập nhật sp thành công";
                header('Location: index.php?controller=product&action=index');
                exit();
            } else {
                $this->error = "Cập nhật sp thất bại";
            }
            }
        }

        //Gọi model để lấy sp theo id : MVC : Controller gọi Model

//        $product = $product_model->getOne($id);
        // Lấy nội dung view và gọi layer để hiển thị view cho user
        $this->content = $this->render('views/products/update.php',[
            'product' =>$product
        ]);
        $this->page_title = 'Trang cập nhật sp';
        require_once 'views/layouts/main.php';
    }

    public function delete(){
        if(!isset($_GET['id']) || !is_numeric($_GET['id'])){
            $_SESSION['error'] = 'Tham số Id không hợp lệ';
            header('Location: index.php?controller=product&action=index');
            exit();
        }
        $id = $_GET['id'];
        $product_model = new Product();
        $is_delete = $product_model->delete($id);
//        var_dump($is_delete);
        if($is_delete){
            $_SESSION['success'] = 'XoÁ sp thành công';
        } else {
            $_SESSION['error'] = 'XOá sp thất bại';
        }
        header('Location: index.php?controller=product&action=index');
        exit();
    }

    public function detail(){
        if(!isset($_GET['id']) || !is_numeric($_GET['id'])){
            $_SESSION['error'] = "ID không hợp lệ";
            header('Location:index.php?controller=products&action=index');
            exit();
        }
        $id = $_GET['id'];
        $product_model = new Product();
        $product = $product_model->getOne($id);

        $this->content = $this->render('views/products/detail.php',[
            'product' =>$product
        ]);
        $this->page_title = 'Trang xem thông tin sp';
        require_once 'views/layouts/main.php';
    }

}

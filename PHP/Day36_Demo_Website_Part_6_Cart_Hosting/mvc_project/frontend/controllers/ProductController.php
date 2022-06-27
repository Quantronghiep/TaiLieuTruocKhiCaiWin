<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';
require_once 'models/Categoryy.php';
require_once 'models/Pagination.php';
class ProductController extends Controller {
    public function showAll() {
//    echo "<pre>" . __LINE__ . ", " . __DIR__ . "<br />";
//    print_r($_REQUEST);
//    echo "</pre>";
//    die;
        $params = [];
        //nếu user có hành động filter
        if (isset($_POST['filter'])) {
            if (isset($_POST['category'])) {
                $category = implode(',', $_POST['category']); // nối mảng thành chuỗi ngăn nhau bởi dấu ,
                //chuyển thành chuỗi sau để sử dụng câu lệnh in_array
                $str_category_id = "($category)";
                $params['category'] = $str_category_id;
            }
            if (isset($_POST['price'])) {
                $str_price = '';
                foreach ($_POST['price'] AS $price) {
                    if ($price == 1) {
                        $str_price .= " products.price < 1000000";
                    }
                    if ($price == 2) {
                        $str_price .= " (products.price >= 1000000 AND products.price < 2000000)";
                    }
                    if ($price == 3) {
                        $str_price .= " (products.price >= 2000000 AND products.price < 3000000)";
                    }
                    if ($price == 4) {
                        $str_price .= " products.price >= 3000000";
                    }
                }
                //cắt bỏ từ khóa OR ở vị trí ban đầu
//        $str_price = substr($str_price, 3);
//        $str_price = "($str_price)";
                $params['price'] = $str_price;
            }
        }

        $product_model = new Product();

    $params = [
      'limit' => 2,
        'query_string' => 'page',
        'controller' => 'product',
        'action' => 'showAll',
      'full_mode' => FALSE,
    ];
      $page = 1;
      //nếu có truyền tham số page lên trình duyêt - tương đương đang ở tại trang nào, thì gán giá trị đó cho biến $page
      if (isset($_GET['page'])) {
          $page = $_GET['page'];
      }
      $params['page'] = $page;
      $count_total = $product_model->countTotal();
      $params['total'] = $count_total;
    //xử lý phân trang
    $pagination_model = new Pagination($params);
    $pagination = $pagination_model->getPagination();
        //get products

        $products = $product_model->getProductInHomePage($params);

        //get categories để filter
        $category_model = new Categoryy();
        $categories = $category_model->getAll();

        $this->content = $this->render('views/products/show_all.php', [
            'products' => $products,
            'categories' => $categories,
      'pagination' => $pagination
        ]);

        require_once 'views/layouts/main.php';
    }

    public function detail() {
//          echo "<pre>";
//    print_r($_GET);
//    echo "</pre>";
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID ko hợp lệ';
            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: $url_redirect");
            exit();
        }

        $id = $_GET['id'];
//    echo $id;
        $product_model = new Product();
        $product = $product_model->getById($id);

        $this->content = $this->render('views/products/detail.php', [
            'product' => $product
        ]);
        require_once 'views/layouts/main.php';
    }

    // Chức năng tìm kiếm sản phẩm
    public function search() {
        // Lấy ra thông tin từ URL
        //frontend/index.php?search=dsa&controller=product&action=search
//    echo "<pre>";
//    print_r($_GET);
//    echo "</pre>";
        $search = $_GET['search'];

        // Gọi model để truy vấn CSDL, lấy ra các sp có tên chứa từ khóa search
        $product_model = new Product();
        $products = $product_model->getProductSearch($search);
//    echo "<pre>";
//    print_r($products);
//    echo "</pre>";
        if(empty($products)){
            $this->error = "Không có sản phẩm nào có chứa tên " .$search;
        }

        // Lấy nội dung view:
        $this->content = $this->render('views/homes/index.php',[
            'products' => $products
        ]);
        // Gọi layout để hiển thị view
        require_once 'views/layouts/main.php';
    }
}
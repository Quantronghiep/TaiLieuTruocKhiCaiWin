<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';
require_once 'models/Pagination.php';

class HomeController extends Controller {
  public function index() {
    $product_model = new Product();
      $params = [
          'limit' => 2,
          'query_string' => 'page',
          'controller' => 'home',
          'action' => 'index',
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

    $this->content = $this->render('views/homes/index.php', [
      'products' => $products,
        'pagination' => $pagination
    ]);
    require_once 'views/layouts/main.php';
  }
}
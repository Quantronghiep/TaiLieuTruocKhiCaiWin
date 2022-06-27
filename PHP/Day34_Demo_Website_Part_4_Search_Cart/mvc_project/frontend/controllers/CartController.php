<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';

class CartController extends Controller
{
    public function add(){
        echo "Các gía trị hiển thị trong phương thức sẽ là kết quả trả về cho ajax";
        echo "<h2 style='color: red'>Thẻ H2 </h2>";

      echo "<pre>";
      print_r($_GET);
      echo "</pre>";
      $product_id = $_GET['product_id'];
      //Gọi model để lấy sp thep id
        $product_model = new Product();
        $product = $product_model->getById($product_id);

        $cart = [
            'name' => $product['title'],
            'price' => $product['price'],
            'avatar' => $product['avatar'],
            'quantity' => 1 // mỗi lần thêm sp giỏ chỉ thêm 1 sp
        ];
        // Xử lí logic để thêm cart vào session giỏ hàng : key là id của sp , value là mảng $cart
        //Mảng giỏ hàng đặt tên là $_SESSION['cart']
        // + Nếu giỏ hàng chưa từng tồn tại trc đó , thì tạo giỏ hàng , thêm sp đầu tiên vào giỏ
        if(!isset($_SESSION['cart'])) {
//            $_SESSION['cart'] = [
//               $product_id => $cart
//            ];
            $_SESSION['cart'][$product_id] = $cart;
        } else {
            // 2 Trường hợp :
            // dựa vào key của mảng giỏ hàng  => id của sp , nếu trùng update quantity , ngc lại thêm mới
            // dùng hàm array_key_exits để ktra key đã tồn tại trong mảng hay chưa
            // + Them 1 sp đã tồn tại trong giỏ hàng , cập nhật số lượng sp đó lên 1 : quantity
            // + Nếu sp chưa tồn tại trong giỏ , thêm sp mới vào giỏ
            $is_key_exits = array_key_exists($product_id,$_SESSION['cart']);
            if($is_key_exits){
                $_SESSION['cart'][$product_id]['quantity']++ ;
            } else {
                $_SESSION['cart'][$product_id] = $cart;
            }
        }
        echo "<pre>";
        print_r($_SESSION['cart']);
        echo "</pre>";
    }
}
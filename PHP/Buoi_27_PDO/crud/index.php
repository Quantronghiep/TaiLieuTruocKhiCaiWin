<?php
session_start();
require_once 'database.php';
/**
 * Demo CRUD  đơn giản kết nối với CSDL MySQL = PDO
 * Cấu trúc thư mục :
 *  + database.php : kết nối csdl theo PDO ,tạo ra biến kết nối sử dụng cho các chức năng CRUD
 *  + create.php : thêm mới sp
 *  + update.php : cập nhật
 *  + index : danh sách
 *  + detail : chi tiết
 *  + delete : xóa
 */
// Xử lý lấy dữ liệu từ bảng products
// + Viết truy vấn:(tham số) theo thứ tự giảm dần của ngày tạo
$sql_select_all =
    "SELECT * FROM products ORDER BY created_at DESC";
// + cbi đối tg truy vấn : prepare
$obj_select_all = $connection->prepare($sql_select_all);
//  +[Tùy chọn] Tạo mảng để truyền gtri thật vào tham số trong truy vấn
// + Thực thi đối tượng truy vấn vừa tạo => excute
$obj_select_all->execute();
//Trả về mảng kết hợp chứa dữ liệu , nằm sau bước execute
//cần truyền vào hằng số của class có sẵn ::
//Lấy dữ liệu dưới dạng mảng kết hợp nhiều ptu
$products = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
//echo "<pre>";
//print_r($products);
//echo "</pre>";

?>
<?php
// Session dạng flash : hiển thị session ra rồi xóa luôn
if (isset($_SESSION['success'])) {
    echo $_SESSION['success'];
    unset($_SESSION['success']);
}
if (isset($_SESSION['error'])) {
    echo $_SESSION['error'];
    unset($_SESSION['error']);
}
?>
<a href="create.php">Thêm mới sp</a>
<table border="1" cellspacing="0" cellpadding="8">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Created_at</th>
        <th></th>
    </tr>
    <?php foreach ($products AS $product): ?>
        <tr>
            <td><?php echo $product['id']; ?></td>
            <td><?php echo $product['name']; ?></td>
            <td><?php echo number_format($product['price']); ?> VNĐ</td>
            <td>
                <!--              09-01-2021 20:52:11-->
                <?php
                $created_at = date('d-M-Y H:i:s',
                    strtotime($product['created_at']));
                echo $created_at;
                ?>
            </td>
            <td>
                <a href="detail.php?id=<?php echo $product['id']; ?>">Xem</a>
                <a href="update.php?id=<?php echo $product['id']; ?>">Sửa</a>
                <a href="delete.php?id=<?php echo $product['id']; ?>" onclick="return confirm('Chắc chắn muốn xóa ?')">Xóa</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>


<?php
session_start();
require_once 'database.php';
/**
 * crud/detail.php
 * Xem chi tiết sản phẩm
 */
// detail.php?id=4
// + Lấy id từ url
// + Lấy sp tương ứng dựa theo id
// + Hiển thị sản phẩm dưới dạng bảng...

$id = $_GET['id'];

$sql_select_one = "SELECT * FROM products where id =:id";
$obj_select_one =  $connection->prepare($sql_select_one);
$selects  =[
  ":id" => $id
];
$obj_select_one->execute($selects);
$product = $obj_select_one->fetch(PDO::FETCH_ASSOC);
?>
<table border="1" cellspacing="0" cellpadding="8">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Created_at</th>
    </tr>

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
        </tr>
</table>
<a href="index.php">Back</a>

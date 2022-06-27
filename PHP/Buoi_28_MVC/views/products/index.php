<?php
//index.php
//echo "<pre>";
//print_r($products);
//echo "</pre>";
?>
<a href="index.php?controller=product&action=create">Thêm mới sp</a>
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
                <a href="index.php?controller=product&action=detail&id=<?php echo $product['id']; ?>">Xem</a>
                <a href="index.php?controller=product&action=update&id=<?php echo $product['id']; ?>">Sửa</a>
                <a href="index.php?controller=product&action=delete&id=<?php echo $product['id']; ?>" onclick="return confirm('Chắc chắn muốn xóa ?')">Xóa</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>
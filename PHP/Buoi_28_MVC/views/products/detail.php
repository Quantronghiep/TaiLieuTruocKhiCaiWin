<?php
//detail.php
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
<a href="index.php?controller=product&action=index">Danh sách sp</a>
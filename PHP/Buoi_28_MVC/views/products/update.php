<?php
//views/products/update.php
//Form cập nhật sp
?>
<h1>Form cập nhật sp</h1>
<form action="" method="post">
    Nhập tên sp :
    <input type="text" name="name" value="<?php echo $product['name']; ?>">
    <br>
    Nhập giá sp :
    <input type="number" name="price" value="<?php echo $product['price']; ?>">
    <br>
    <input type="submit" name="submit" value="Cập nhật">
    <a href="index.php?controller=product&action=index">Về trang sanh sách</a>
</form>

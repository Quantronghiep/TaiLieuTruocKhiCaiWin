<?php
echo "<pre>";
print_r($_POST);
echo "</pre>";

$error = '';
$result = '';

if(isset($_POST['submit'])){
    $number1 = $_POST['number1'];
    $number2 = $_POST['number2'];
    if(empty($number1) || empty($number2)){
        $error = "Không đc bỏ trống";
    } elseif (is_numeric($number1)==false || is_numeric($number2)==false){
        $error = "Phải nhập số";
    }
    if (empty($error)){
        $tinh = $_POST['tinh'];
        $result .= "Ket qua: ";
        switch ($tinh) {
            case 0: $result .= $number1 + $number2;break;
            case 1: $result .= $number1 - $number2;break;
            case 2: $result .= $number1 * $number2;break;
            case 3: $result .= $number1 / $number2;break;
        }
    }
}
?>
<h1>Thực hành toán tử</h1> <br>
<form action="" method="post">
    Nhập số 1 : <input type="text" name="number1">  <br>
    Nhập số 2: <input type="text" name="number2"> <br>
    Chọn phép tính : <br>
    <!-- Bắt buộc phải khai bao value cho radio để PHP bắt đc dữ liệu tương ứng -->
    <?php
    // Radio dựa vào thuộc tính checked để tích mặc định, về quy tắc có bao nhiêu radio thì tạo tương ứng biến checked
    $checked_cong = '';
    $checked_tru = '';
    $checked_nhan = '';
    $checked_chia = '';
    if (isset($_POST['tinh'])) {
        switch ($_POST['tinh']) {
            case 0: $checked_cong = 'checked';break;
            case 1: $checked_tru = 'checked';break;
            case 2: $checked_nhan = 'checked';break;
            case 3: $checked_chia = 'checked';break;
        }
    }
    ?>
    <input type="radio" name="tinh" value="0" <?php echo $checked_cong; ?>>+ <br>
    <input type="radio" name="tinh" value="1" <?php echo $checked_tru; ?>>-<br>
    <input type="radio" name="tinh" value="2" <?php echo $checked_nhan; ?>>* <br>
    <input type="radio" name="tinh" value="3" <?php echo $checked_chia; ?>>/ <br>
    <input type="submit" value="Ketqua" name="submit">

</form>
<h3 style="color: red"><?php echo $error; ?></h3>
<h3 style="color: green"><?php echo $result; ?></h3>
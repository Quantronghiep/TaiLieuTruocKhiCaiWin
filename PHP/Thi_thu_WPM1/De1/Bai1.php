<?php
echo "<pre>";
print_r($_POST);
echo "</pre>";

$result = '';

function isPrimeNumber($n) {
    // so nguyen n < 2 khong phai la so nguyen to
    if ($n < 2) {
        return false;
    }
    // check so nguyen to khi n >= 2
    $squareRoot = sqrt ( $n );
    for($i = 2; $i <= $squareRoot; $i ++) {
        if ($n % $i == 0) {
            return false;
        }
    }
    return true;
}
if(isset($_POST['submit'])){
    $number = $_POST['number'];
    if(empty($number)){
        $result = "Không đc bỏ trống";
    } elseif (is_numeric($number)==false){
        $result = "Phải nhập số";
    }elseif(isPrimeNumber($number)==true)
        $result = "Là số nt";
    else
        $result = "Không là số nt";
}
?>
<form action="" method="post">
    <h1>Kiểm tra số nguyên</h1> <br>
    Nhập số cần kiểm tra : <input type="text" name="number"> <br>
    <input type="submit" value="kiemtra" name="submit">
</form>

<h3 style="color: green"><?php echo $result; ?></h3>

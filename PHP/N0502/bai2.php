<?php
//echo "<pre>";
//print_r($_POST);
//echo "</pre>";

$error = '';
$result = '';

function tinhTien($n){
    $sum = 0;
    if($n>=0 && $n <=10 ){
        $sum = $n *6000;
    }
    if($n>10 && $n <=20){
        $sum = 10*6000 + ($n-10)*7000;
    }
    if($n>20 && $n <=30){
        $sum = 10*6000 + 10*7000 + ($n-20)*8500;
    }
    if($n>30){
        $sum = 10*6000 + 10*7000 + 10*8500 + ($n-30)*15000;
    }
    return $sum;
}

if(isset($_POST['submit'])){
    $number = $_POST['number'];
    if(empty($number)){
        $error = "Không đc bỏ trống";
    } elseif (!is_numeric($number)){
        $error = "Phải nhập số";
    }
    if (empty($error)){
        $number = $_POST['number'];
        $result = tinhTien($number);
    }
}
?>

<form action="" method="post">
    <table border="1" cellspacing="0" cellpadding="8">
        <tr>
            <td colspan="2" style="background: blue; color:white ; text-align: center ">Tính tiền nước</td>
        </tr>
        <tr>
            <td>Nhập số m3 nước tiêu thụ</td>
            <td><input type="text" name="number" value="<?php echo isset($_POST['number']) ? $_POST['number'] : '' ?>"></td>

        </tr>
        <tr>
            <th colspan="2">Bảng giá nước theo bậc thang</th>
        </tr>
        <tr>
            <td>0-10m3</td>
            <td><b>6000đ/m3</b></td>
        </tr>
        <tr>
            <td>Trên 10m3-20m3</td>
            <td>
                <b>7000đ/m3</b> <br>
                Từ 0-10m3 giá 6000đ/m3
            </td>
        </tr>
        <tr>
            <td>Trên 20m3-30m3</td>
            <td>
                <b>8500đ/m3</b> <br>
                Từ 0-10m3 giá 6000đ/m3 <br>
                Trên 10m3-20m3 giá 7000đ/m3
            </td>
        </tr>
        <tr>
            <td>Trên 30m3</td>
            <td>
                <b>15000đ/m3</b> <br>
                Từ 0-10m3 giá 6000đ/m3 <br>
                Trên 10m3-20m3 giá 7000đ/m3 <br>
                Trên 20m3-30m3 giá 8500đ/m3
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Tính tiền" name="submit"> </td>
            <td style="background: blue ; color: white">
                <?php echo $error; ?>
                <?php echo $result; ?>
            </td>
        </tr>
    </table>
</form>

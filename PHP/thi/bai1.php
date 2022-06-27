<?php
//echo "<pre>";
//print_r($_POST);
//echo "</pre>";

$error = '';
$result = '';

if(isset($_POST['submit'])) {
    $number = $_POST['number'];
    if (empty($number)) {
        $error = "Không đc bỏ trống";
    } elseif (is_numeric($number) == false) {
        $error = "Phải nhập số";
    }
    if (empty($error)) {
        $chon = $_POST['chon'];
        switch ($chon) {
            case 1: $result .= $number%2==1 ?'true':'false';break;
            case 2: $result .= $number%2==0 ?'true':'false';break;
            case 3: $result .= $number%3==0 ?'true':'false';break;
            case 4: $result .= $number%4==0 ?'true':'false';break;
        }
    }
}
?>
<form action="" method="post">
    <table border="1" cellspacing="0" cellpadding="8">
        <tr>
            <td colspan="2" style="background: blue; color:white ; text-align: center ">Kiểm tra logic</td>
        </tr>
        <tr>
            <td>Nhập số ban đầu</td>
            <td><input type="text" name="number" value="<?php echo isset($_POST['number']) ? $_POST['number'] : '' ?>"></td>
        </tr>
        <tr>
            <td>Chọn logic</td>
            <?php
            $checked_le = '';
            $checked_chan = '';
            $checked_chiaba = '';
            $checked_chiabon = '';
            if (isset($_POST['chon'])) {
                switch ($_POST['chon']) {
                    case 1: $checked_le = 'checked';break;
                    case 2: $checked_chan = 'checked';break;
                    case 3: $checked_chiaba = 'checked';break;
                    case 4: $checked_chiabon = 'checked';break;
                }
            }
            ?>
            <td>
                <input type="radio" name="chon" value="1" <?php echo $checked_le; ?>> Là số lẻ<br>
                <input type="radio" name="chon" value="2" <?php echo $checked_chan; ?>> Là số chẵn<br>
                <input type="radio" name="chon" value="3" <?php echo $checked_chiaba; ?>> Chia hết cho 3<br>
                <input type="radio" name="chon" value="4" <?php echo $checked_chiabon; ?>> Chia hết cho 4<br>
            </td>        </tr>
        <tr>
            <td>    <input type="submit" value="Kiểm tra" name="submit"> </td>
            <td style="background: blue ; color: white">
                <?php echo $error; ?>
                <?php echo $result; ?>
            </td>
        </tr>
    </table>

</form>

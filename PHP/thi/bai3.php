<?php
session_start();
//echo "<pre>";
//print_r($_POST);
//echo "</pre>";

// + Check lỗi bảo mật: nếu đăng nhập thành công
// thì ko cho phép truy cập lại form login nữa
//if (isset($_SESSION['name'])) {
//    $_SESSION['success'] = 'Bạn đã đăng kí rồi';
//    header('Location: index.php');
//    exit();
//}

$error = '';
$result = '';

if(isset($_POST['submit'])){
    $name = $_POST['name'];
    $age = $_POST['age'];
    $note = $_POST['note'];
    if (empty($name)) {
        $error = 'Phải nhập tên';
    }elseif (empty($age)){
        $error = 'Phải nhập tuổi';
    } elseif (!isset($_POST['gender'])) {
        $error = 'Phải chọn giới tính';
    }elseif (empty($note)) {
        $error = 'Phải nhập Ghi chú thêm';
    }
    if(empty($error)){
        $_SESSION['name'] = $username;
        $_SESSION['success'] = 'Đăng nhập thành công';
        header('Location: index.php');
        exit();
    }
}
?>

<?php
if (isset($_SESSION['error'])) {
    echo
    "<h3 style='color: red'>{$_SESSION['error']}</h3>";
    unset($_SESSION['error']);
}
?>

<?php
if (isset($_SESSION['success'])) {
    echo
    "<h3 style='color: green'>{$_SESSION['success']}</h3>";
    unset($_SESSION['success']);
}
?>

<form action="" method="post">
    <table>
        <tr>
            <th colspan="2"><h3>Thông tin liên hệ</h3></th>
        </tr>
        <tr>
            <td>Họ tên(*)</td>
            <td> <input type="text" name="name" value="<?php echo isset($_POST['name']) ? $_POST['name'] : '' ?>"> </td>
        </tr>
        <tr>
            <td>Tuổi(*)</td>
            <td><input type="text" name="age" value="<?php echo isset($_POST['age']) ? $_POST['age'] : '' ?>"></td>
        </tr>
        <tr>
            <td>Giới tính(*)</td>
            <?php
            $checked_nam = '';
            $checked_nu = '';
            if (isset($_POST['gender'])) {
                switch ($_POST['gender']) {
                    case 1: $checked_nam = 'checked';break;
                    case 0: $checked_nu = 'checked';break;
                }
            }
            ?>
            <td>
                <input type="radio" name="gender" value="1" <?php echo $checked_nam; ?>>Nam
                <input type="radio" name="gender" value="0" <?php echo $checked_nu; ?>>Nữ
            </td>
        </tr>
        <tr>
            <td>Nội dung liên hệ(*)</td>
            <td>
                <textarea name="note" id="" cols="30" rows="10" value="<?php echo isset($_POST['note']) ? $_POST['note'] : '' ?>"></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Gửi thông tin" name="submit">
                <input type="reset" value="Nhập lại">
            </td>
        </tr>
    </table>
</form>
<h3 style="color: red"><?php echo $error; ?></h3>
<h3 style="color: green"><?php echo $result; ?></h3>

<?php
session_start();

// + Check lỗi bảo mật: nếu đăng nhập thành công
// thì ko cho phép truy cập lại form login nữa
if (isset($_SESSION['username'])) {
    $_SESSION['success'] = 'Bạn đã đăng kírồi';
    header('Location: index.php');
    exit();
}

echo "<pre>";
print_r($_POST);
echo "</pre>";

$error = '';
$result = '';

if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $hoten = $_POST['hoten'];
    $pasword = $_POST['password'];
    if(empty($username) || empty($hoten) || empty($pasword)){
        $error = "Không đc bỏ trống";
    }
    // + Xử lý logic đăng nhập chỉ khi ko có lỗi nào
    //xảy ra
    if (empty($error)){
        // + Khi đăng nhập thành công, hiển thị
        // username và 1 thông báo đăng nhập thành công
        // ở file index.php
        // + Trước khi chuyển hướng, cần lưu lại
        //các thông tin cần thiết -> dùng session/
        //cookie để lưu, với chức năng đăng nhập
        // -> session để lưu
        $_SESSION['username'] = $username;
        $_SESSION['success'] = 'Đăng nhập thành công';
        header('Location: index.php');
        exit();
    }
}
?>

<!--Hiển thị session error nếu có-->
<?php
if (isset($_SESSION['error'])) {
    echo
    "<h3 style='color: red'>{$_SESSION['error']}</h3>";
    unset($_SESSION['error']);
}
?>

<!--Hiển thị session success nếu có-->
<?php
if (isset($_SESSION['success'])) {
    echo
    "<h3 style='color: green'>{$_SESSION['success']}</h3>";
    unset($_SESSION['success']);
}
?>

<h1>FORM ĐĂNG KÍ</h1>
<form action="" method="post">
    Nhập username : <input type="text" name="username"> <br>
    Nhập họ tên : <input type="text" name="hoten"> <br>
    Nhập pass : <input type="text" name="password"> <br>
    <input type="submit" value="Đăng kí" name="submit">
    <input type="reset" value="Nhập lại" >
</form>
<h3 style="color: red"><?php echo $error; ?></h3>
<h3 style="color: green"><?php echo $result; ?></h3>

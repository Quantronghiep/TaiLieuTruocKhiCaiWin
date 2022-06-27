<?php
session_start();
require_once 'database.php';

echo "<pre>";
print_r($_POST);
print_r($_FILES);
echo "</pre>";

// + Tạo biến chứa lỗi
$error = '';
// + Chỉ xử lý form nếu user submit form:
if(isset($_POST['submit'])){
    // + Tạo biến trung gian
    $name = $_POST['name'];
    $age = $_POST['age'];
    $note = $_POST['note'];
    $avatar_arr = $_FILES['avatar'];
    // + Validate form: nếu có lỗi thì đổ vào biến $error
        //    - Họ tên và tuổi không được để trống
        //    - Nếu có upload file, chỉ cho phép upload file có định dạng ảnh là png, jpg, jpeg, gif
    if (empty($name) || empty($age)) {
        $error = 'Tên hoặc tuổi phải nhập';
    } elseif ($avatar_arr['error'] == 0){
        // - Validate file phải là ảnh
        // Lấy đuôi file từ tên file
        $extension = pathinfo($avatar_arr['name'], PATHINFO_EXTENSION);
        // Chuyển về chữ thường
        $extension = strtolower($extension);
        // Tạo mảng các đuôi file ảnh hợp lệ
        $allowed = ['jpg', 'jpeg', 'png', 'gif'];
        if (!in_array($extension, $allowed)) {
            $error = 'File upload phải là ảnh';
        }
        // Validate file upload dung lượng <= 2MB
        // 1MB = 1024KB = 1024 * 1024 B
        $size_mb = $avatar_arr['size'] / 1024 / 1024;
        $size_mb = round($size_mb, 2);
        if ($size_mb > 2) {
            $error = 'File upload dung lương phải <= 2MB';
        }
    }
    // + Lưu vào CSDL, upload file nếu có
    // chỉ khi ko có lỗi xảy ra
    if (empty($error)) {
        // Tạo biến chứa tên file
        $avatar = '';
        // - Xử lý upload file nếu có
        if ($avatar_arr['error'] == 0) {
            // Tạo thư mục chứa file sẽ upload vào
                $dir_upload = 'uploads';
                // Luôn check nếu chưa tồn tại thư mục thì mới tạo
                if (!file_exists($dir_upload)) {
                    mkdir($dir_upload);
                }
            // Sinh tên file mang tính duy nhất trc khi upload,
            // để tránh ghi đè file trùng tên
            $avatar = time() . "-" . $avatar_arr['name'];
            // Upload file: chuyển file từ thư mục tạm của XAMPP
            // -> đích
            move_uploaded_file($avatar_arr['tmp_name'],
                "$dir_upload/$avatar");
        }
        // - Xử lý lưu vào bảng students
        // + Viết truy vấn PDO
        $sql_insert = "INSERT INTO students(name, age,description, avatar) VALUES(:name ,:age,:note ,:avatar)";
        // + Cbi đối tượng truy vấn: prepare
        $obj_insert = $connection->prepare($sql_insert);
        // + [Tùy chọn] Tạo mảng để truyền giá trị vào tham số cho câu truy vấn:
        $inserts = [
            ':name' => $name,
            ':age' => $age,
            ':note' => $note,
            ':avatar' => $avatar
        ];
        // + Thực thi đối tượng truy vấn: execute
        $is_insert = $obj_insert->execute($inserts);
//    var_dump($is_insert);
        if ($is_insert) {
            $_SESSION['success'] = 'Thêm sv thành công';
            // Chuyển hướng
            header('Location: index.php');
            exit();
        } else {
            $error = 'Thêm sv thất bại';
        }
    }
}
?>
<h1>Thêm mới sinh viên</h1>
<h3 style="color: red"><?php echo $error; ?></h3>
<form action="" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td><a href="index.php">Về trang danh sách</a></td>
        </tr>
        <tr>
            <td>Họ tên</td>
            <td><input type="text" name="name" value="<?php echo isset($_POST['name']) ? $_POST['name'] : '' ?>"></td>
        </tr>
        <tr>
            <td>Tuổi</td>
            <td><input type="text" name="age" value="<?php echo isset($_POST['age']) ? $_POST['age'] : '' ?>"></td>
        </tr>
        <tr>
            <td>Ảnh đại diện</td>
            <td><input type="file" name="avatar"></td>
        </tr>
        <tr>
            <td>Mô tả sinh viên</td>
            <td><textarea name="note" id="" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Save" name="submit" style="background: green">
                <input type="reset" value="Reset" name="reset">
            </td>
        </tr>
    </table>
</form>


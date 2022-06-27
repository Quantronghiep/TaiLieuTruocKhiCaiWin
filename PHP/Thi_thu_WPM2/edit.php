<?php
session_start();
require_once 'database.php';

echo "<pre>";
print_r($_POST);
print_r($_FILES);
echo "</pre>";

$id = $_GET['id'];

$sql_select_one = "SELECT *FROM students where id = :id";
$obj_select_one = $connection->prepare($sql_select_one);
$selects = [
    ':id' => $id
];
// + Thực thi obj truy vấn:
$obj_select_one->execute($selects);
// + TRả về mảng kết hợp 1 chiều:
$student = $obj_select_one->fetch(PDO::FETCH_ASSOC);

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
            $error = 'File upload phải là ảnh   ';
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
        $avatar = $student['avatar']; // ảnh cũ
        // - Xử lý upload file nếu có
        if ($avatar_arr['error'] == 0) { // ảnh mới
            // Xóa ảnh cũ đi tránh rác hệ thống,
            // ký tự @ hack ko báo lỗi nếu xóa 1 file ko tồn tại
            @unlink('uploads/' . $avatar);
            // Bỏ qua bước tạo thư mục uploads vì luôn tồn tại r - đã xử lý khi thêm mới

            // Sinh tên file mang tính duy nhất trc khi upload,
            // để tránh ghi đè file trùng tên
            $avatar = time() . "-" . $avatar_arr['name'];
            // Upload file: chuyển file từ thư mục tạm của XAMPP
            // -> đích
            move_uploaded_file($avatar_arr['tmp_name'],
                "uploads/$avatar");
        }
        // - Tương tác với CSDL để update dữ liệu
        // + Viết truy vấn PDO
        $sql_update = "UPDATE students SET name=:name, age=:age , description=:note , avatar=:avatar WHERE id=:id";
        // + Cbi đối tượng truy vấn: prepare
        $obj_update = $connection->prepare($sql_update);
        // + [Tùy chọn] Tạo mảng để truyền giá trị vào tham số cho câu truy vấn:
        $updates = [
            ':name' => $name,
            ':age' => $age,
            ':note' => $note,
            ':avatar' => $avatar,
            ':id' => $id
        ];
        // + Thực thi đối tượng truy vấn: execute
        $is_update = $obj_update->execute($updates);
//    var_dump($is_insert);
        if ($is_update) {
            $_SESSION['success'] = 'Sửa sv thành công';
            // Chuyển hướng
            header('Location: index.php');
            exit();
        } else {
            $error = 'Sửa sv thất bại';
        }
    }
}

?>
<h1>Sửa sinh viên</h1>
<h3 style="color: red"><?php echo $error; ?></h3>
<form action="" method="post" enctype="multipart/form-data" id="form-id">
    <table>
        <tr>
            <td><a href="index.php">Về trang danh sách</a></td>
        </tr>
        <tr>
            <td>Họ tên</td>
            <td><input type="text" name="name" id="name" value="<?php echo $student['name'] ?>"></td>
        </tr>
        <tr>
            <td>Tuổi</td>
            <td><input type="text" name="age" id="age" value="<?php echo $student['age'] ?>" ></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="file" name="avatar"></td>
        </tr>
        <tr>
            <td>Ảnh đại diện</td>
            <td>
                <img id="avatar" src="uploads/<?php echo $student['avatar']; ?>"
                     height="80" />
            </td>
        </tr>
        <tr>
            <td>Mô tả sinh viên</td>
            <td><textarea name="note" id="note" cols="30" rows="10"><?php echo $student['description'] ?></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Save" name="submit" style="background: green">
                <input type="reset" value="Reset"  onclick="resetData()">
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript">
    function resetData() {
        let obj_form = document.getElementById('form-id');
        obj_form.addEventListener('reset',function(){
            document.getElementById("name").value = "";
            document.getElementById("age").value = "";
            document.getElementById("note").innerHTML = "";

            let avatar = document.getElementById("avatar");
            avatar.style.height = 0;
            event.preventDefault();
        })
    }
</script>


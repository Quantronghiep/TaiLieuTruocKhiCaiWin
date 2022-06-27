<?php
session_start();
require_once 'database.php';

?>
<?php
// Session dạng flash : hiển thị session ra rồi xóa luôn
if (isset($_SESSION['success'])) {
    echo $_SESSION['success'];
    unset($_SESSION['success']);
}

$sql_select_all = "SELECT * FROM students ORDER BY id ASC";
$obj_select_all = $connection->prepare($sql_select_all);
$obj_select_all->execute();
$students = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
?>
<h1>Danh sách sinh viên</h1> <br>
<a href="create.php">Thêm mới</a>
<table border="1" cellspacing="0" cellpadding="8">
    <tr>
        <th>Id</th>
        <th>Tên</th>
        <th>Tuổi</th>
        <th>Ảnh đại diện</th>
        <th>Mô tả sinh viên</th>
        <th>Ngày tạo</th>
        <th></th>
    </tr>
    <?php foreach ($students AS $student): ?>
        <tr>
            <td><?php echo $student['id']; ?></td>
            <td><?php echo $student['name']; ?></td>
            <td><?php echo $student['age']; ?></td>
            <td>
                <img src="uploads/<?php echo $student['avatar'] ?>" height="80px"/>
            </td>
            <td><?php echo $student['description']; ?></td>
            <td>
                <!--              09-01-2021 20:52:11-->
                <?php
                $created_at = date('d-M-Y H:i:s',strtotime($student['created_at']));
                echo $created_at;
                ?>
            </td>
            <td>
                <a href="edit.php?id=<?php echo $student['id']; ?>">Sửa</a>
                <a href="delete.php?id=<?php echo $student['id']; ?>" onclick="return confirm('Chắc chắn muốn xóa ?')">Xóa</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>

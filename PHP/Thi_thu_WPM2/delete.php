<?php
session_start();
require_once "database.php";

$id = $_GET['id'];

$sql_delete = "DELETE FROM students where id=:id";
$obj_delete = $connection->prepare($sql_delete);
$deletes =[
    ':id' => $id
];
$is_delete = $obj_delete->execute($deletes);

if ($is_delete) {
    $_SESSION['success'] = 'Xóa sv thành công';
} else {
    $_SESSION['error'] = 'Xóa sv thất bại';
}
header('Location: index.php');
exit();
?>;
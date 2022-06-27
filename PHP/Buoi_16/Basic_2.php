<?php
$number = 20 ;
// Hiển thị bảng HTML nếu $number > 0
//Hiện thị HTML dùng code PHP
//if($number >0 ){
//    echo "<table><tr><td>Data</td></tr> </table>";
//}
?>
<!--Hiển thị HTML bằng cú pháp viết tắt If-->
<?php if($number>0): ?>
    <table border="1" cellspacing="0" cellpadding="8">
        <tr>
            <td>Data1</td>
            <td>Data2</td>
        </tr>
    </table>
<?php endif; ?>
<!-- If ... else-->
<?php
$number =20 ;
echo $number >0 ? 'Number > 0' : 'Number < 0';
?>
<!--Cú pháp viết tắt if...else khi hiển thị HTML phức tạp-->
<?php if($number>0): ?>
    <h2>Number > 0</h2>
<?php else: ?>
    <h2>Number < 0</h2>
<?php endif; ?>

<?php
//if ... else if ... else >= 3 trg hợp
$number = 9 ;
if($number >=8 && $number <=10){
    echo "HSG";
}elseif( $number >=6.5){
    echo 'HSK';
}else{
    echo 'HSTB';
}
?>

<?php if($number >=8 && $number <=10): ?>
    <h2>HSG</h2>
<?php elseif( $number >=6.5): ?>
    <h2>HSK</h2>
<?php else: ?>
    <h2>HSTB</h2>
<?php endif; ?>

<!--switch case -->
<?php
$day = 3 ;
switch ($day){
    case 1 : echo 'Sunday'; break;
    case 2 : echo 'Monday'; break;
    case 3 : echo 'Thursday'; break;
    case 4 : echo 'Wednesday'; break;
    default: echo 'Unknown';
}

//3 . Vòng lặp
// - FOR
// While
//Do while

// với PHP rất ít khi dùng 3 vòng lặp trên , đặc thù PHP chỉ dùng vòng lặp khi thao tác với mảng là chính
// dùng foreach

// 4. Continue - Break : can thiệp vào quá trình lặp
// - Continue : bỏ qua lần lặp hiện tại , nhảy tới lần lặp kế tiếp , ko chạy code phía sau từ khóa
for($i=1 ; $i <=10 ; $i++){
    if($i >=4 && $i < 7){
        continue;
    }
    echo "<br> $i" ;
}
for($i=1 ; $i <=10 ; $i++){
    if($i <=10){
        continue;
    }
    echo "<br> $i" ;
}

// - Break : thoát hẳn vòng lặp
for($i=1 ; $i <=10 ; $i++){
    if($i ==8 || $i==3){
        break;
    }
    echo "<br> $i" ;
}
?>
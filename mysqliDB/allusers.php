<?php
    require_once 'functions.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<a href="adduser.html">添加用户</a>

<table style='text-align: left' border='1' >
    <tr><th>id</th><th>姓名</th><th>年龄</th><th>修改</th></tr>

<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/8/1
 * Time: 19:51
 */

//require_once 'functions.php';
$conn = connectDb();

//mysqli_select_db($conn,'myapp');
$result = mysqli_query($conn,"SELECT * FROM users  ");
$dataCount = mysqli_num_rows($result);


//echo $dataCount;
for ($i=0;$i<$dataCount;$i++){
    $result_arr = mysqli_fetch_assoc($result);

    $id = $result_arr['id'];
    $name = $result_arr['name'];
    $age = $result_arr['age'];

    echo "<tr><td>$id</td><td>$name</td><td>$age</td><td><a href='edituser.php?id=$id'>修改</a> <a href='deleteuser.php?id=$id'>删除</a></td></tr>";

//    print_r($result_arr);
//    echo '<br>';
}

?>

</table>
</body>
</html>

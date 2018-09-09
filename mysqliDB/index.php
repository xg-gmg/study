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
<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/7/31
 * Time: 19:55
 */
//mysql_connect();
//$conn = new  mysqli('localhost:3333','root','');
$conn = @mysqli_connect('localhost','root','');
if ($conn){
//    echo '连接成功';
//    $conn->select_db('myapp');

    mysqli_select_db($conn,'myapp');

//    $result = $conn->query("SELECT*FROM users");

//    $result = mysqli_query($conn,"SELECT id,name FROM users WHERE id=3");

//    $result_arr = mysqli_fetch_array($result);
//    $result_arr = mysqli_fetch_assoc($result);
//    print_r($result_arr);
//
//    $result_arr = mysqli_fetch_assoc($result);
//    print_r($result_arr);
//    echo '数据条数:'.mysqli_num_rows($result);

    /*
    $data_count = mysqli_num_rows($result);
    for ($i = 0;$i<=$data_count;$i++){
        $result_arr = mysqli_fetch_assoc($result);
        print_r($result_arr);
        echo '<br>';
    }

    */
    $result= mysqli_query($conn,"SELECT COUNT(*) FROM users WHERE name='xg'");
    if ($result){
        $result_arr = mysqli_fetch_array($result);
        echo '数据条数:'.$result_arr[0];
    }else{
        echo '查询失败';
    }




}else{
    echo '连接失败';
}
?>
</body>
</html>

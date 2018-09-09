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
 * Date: 2018/8/6
 * Time: 21:48
 */
//if (isset($_GET['id'])&&!empty($_GET['id'])){
//
//}

require_once 'functions.php';

if (!empty($_GET['id'])){
    $conn = connectDb();
    $id = intval($_GET['id']);
    $result = mysqli_query($conn,"SELECT*FROM users WHERE id =$id");
    if (@mysqli_errno()){
        die('can not connect mysqliDB');
    }
        $arr = mysqli_fetch_assoc($result);
//        print_r($arr);

}else{
    die('id not define');
}
?>

<form action="edituser_server.php" method="post">
    <div>用户ID:
        <input type="text" name="id" value="<?php echo $arr['id']; ?>">
    </div>
    <div>用户名：
        <input type="text" name="name" value="<?php echo $arr['name']; ?>">
    </div>
    <div>用户年纪：
        <input type="text" name="age" value="<?php echo $arr['age']; ?>">
    </div>
    <input type="submit"value="提交修改">
</form>
</body>
</html>

<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/8/7
 * Time: 10:44
 */
require_once 'functions.php';
if (empty($_GET['id'])){
    die('id is not define');
}else{
    $conn = connectDb();


    if (!$conn){
        die('can not connect mysqliDB');
    }else{
        $id = intval($_GET['id']);

        $result = mysqli_query($conn,"DELETE FROM users WHERE id = $id");
    }
    if(@mysqli_errno()){
        die('Fail to delete user with id ');
    }else{
        header("location:allusers.php");
    }

}


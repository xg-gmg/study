<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/8/6
 * Time: 21:04
 */

if (!isset($_POST[name])){
    die('user name not define');
}
if(!isset($_POST['age'])){
    die('user age not define');
}
$name = $_POST['name'];
if (empty($name)){
    die('user name is empty');
}
$age = $_POST['age'];
if (empty($age)){
    die('user age is empty');
}

require_once 'functions.php';
//connectDb();
$conn = connectDb();
$age = intval($age);

mysqli_query($conn,"INSERT INTO users(name,age) VALUES ('$name',$age)");
//mysqli_query($conn,"set users 'utf8'");
if (mysqli_errno($conn)){
    echo mysqli_error($conn);
}else{
    header("location:allusers.php");
}


<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/8/6
 * Time: 22:27
 */
require_once 'functions.php';
$conn = connectDb();

if (empty($_POST['id'])){
    die('id is empty');
}

if (empty($_POST['name'])){
    die('name is empty');
}

if (empty($_POST['age'])){
    die('age is empty');
}

$id = intval($_POST['id']);
$name = $_POST['name'];
$age = $_POST['age'];

mysqli_query($conn,"UPDATE users SET name='$name' ,age= $age WHERE id = $id");

if (@mysqli_errno()){
    echo mysqli_error();
}else{
    header("location:allusers.php");
}
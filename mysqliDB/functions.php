<?php
/**
 * Created by PhpStorm.
 * User: xg
 * Date: 2018/8/1
 * Time: 19:55
 */
require_once 'config.php';

function connectDb(){
    $conn = mysqli_connect(MYSQL_HOST,MYSQL_USER,MYSQL_PW);
    if (!$conn){
        die('function can not connect mysqliDB');
    }
    mysqli_select_db($conn,'myapp');
    return $conn;
}
<?php
include_once './lib/fun.php';
session_start();
header('content-type:text/html;charset=UTF-8');
$yz = "";
foreach($_SESSION["maked_yz"] as $key => $value){
$yz = $yz.$value;
}
session_destroy();



if(checkLogin())
{
    msg(1,'您已登录','index.php');
}

//表单进�?�了提交处理


if(!empty($_POST['username']))
{

    $username = trim($_POST['username']);//mysql_real_escape_string()进�?�过�?
    $password = trim($_POST['password']);
    $yanzhencode=trim($_POST['yanzhenma']);
    //判断用户名不能为�?
    

    if(!$username)
    {
        msg(2, '用户名不能为空?');
    }

    if(!$password)
    {
        msg(2, '密码不能为空');

    }
    
    if(!$yanzhencode)
    {
        msg(2, '验证码不能为空');

    }

    if($_POST['yanzhenma']==$yz){
       
    }else{ msg(2, '验证码不正确?');}

    //数据库连�?

    $con = mysqlInit('127.0.0.1', 'root', '', 'carbirth');

    if(!$con)
    {
        echo mysqli_errno();
        exit;
    }

    //根据用户名查询用�?
    $sql = "SELECT * FROM `im_user` WHERE `username` = '{$username}' LIMIT 1";

    $obj = mysqli_query($con,$sql);
    $result = mysqli_fetch_assoc($obj);

    if(is_array($result) && !empty($result))
    {
        if(createPassword($password) === $result['password'])
        {
            $_SESSION['user'] = $result;
            header('Location:index.php');
            exit;
        }
        else
        {
            msg(2, '密码不正确,请重新输入?');
        }
    }
    else
    {
        msg(2, '用户不存在?,请重新输入?');

    }


}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>M-GALLARY|用户登录</title>
    <link type="text/css" rel="stylesheet" href="./static/css/common.css">
    <link type="text/css" rel="stylesheet" href="./static/css/add.css">
    <link rel="stylesheet" type="text/css" href="./static/css/login.css">
</head>
<body>
<div class="header">
    <div class="logo f1">
        <img src="./static/image/logo.png">
    </div>
    <div class="auth fr">
        <ul>
            <li><a href="login.php">登录</a></li>
            <li><a href="register.php">注册</a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="center">
        <div class="center-login">
            <div class="login-banner">
                <a href="#"><img src="./static/image/login_banner.png" alt=""></a>
            </div>
            <div class="user-login">
                <div class="user-box">
                    <div class="user-title">
                        <p>用户登录</p>
                    </div>
                    <form class="login-table" name="login" id="login-form" action="login.php" method="post">
                        <div class="login-left">
                            <label class="username">用户名</label>
                            <input type="text" class="yhmiput" name="username" placeholder="Username" id="username">
                        </div>
                        <div class="login-right">
                            <label class="passwd">密码</label>
                            <input type="password" class="yhmiput" name="password" placeholder="Password" id="password">
                        </div>
                        <div class="login-right">
                        <input type="text" name="yanzhenma" class="form-control yanzhen-code yhmiput" style="width:100px;position:relative;left:57px;top:-10px;margin-right:72px" placeholder="验证码" >
                        <img class = 'yanzheng-png' id="yanzhenma" src = "yanzhen.php">
                        </div>

                        <div class="login-btn">
                            <button type="submit">登录</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
<p><span>CAR-BRITH</span>©2019 POWERED BY HFUU</p>
</div>

</body>
<script src="./static/js/jquery-1.10.2.min.js"></script>
<script src="./static/js/layer/layer.js"></script>
<script>
    $(function () {
        $('#login-form').submit(function () {
            var username = $('#username').val(),
                password = $('#password').val();
            if (username == '' || username.length <= 0) {
                layer.tips('用户名不能为�?', '#username', {time: 2000, tips: 2});
                $('#username').focus();
                return false;
            }

            if (password == '' || password.length <= 0) {
                layer.tips('密码不能为空', '#password', {time: 2000, tips: 2});
                $('#password').focus();
                return false;
            }


            return true;
        })
        var check_img = document.getElementById("yanzhenma");
        check_img.addEventListener("click",function(){
        this.src = "yanzhen.php";})
})


</script>

</html>
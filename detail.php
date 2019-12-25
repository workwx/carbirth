<?php
include_once './lib/fun.php';

$goodsId = isset($_GET['id']) && is_numeric($_GET['id']) ? intval($_GET['id']) : '';

//如果id不存在 跳转到商品列表
if(!$goodsId)
{
    msg(2,'参数非法','index.php');
}

//根据商品id查询商品信息
$con = mysqlInit('127.0.0.1', 'root', '', 'carbirth');

$sql = "SELECT * FROM `im_goods` WHERE `id` = {$goodsId}";
$obj = mysqli_query($con,$sql);

//当根据id查询商品信息为空 跳转商品列表页
if(!$goods = mysqli_fetch_assoc($obj))
{
    msg(2,'画品不存在','index.php');
}

//根据用户id查询发布人
unset($sql,$obj);
$sql = "select * from `im_user` where `id`='{$goods['user_id']}'";
$obj = mysqli_query($con,$sql);
$user= mysqli_fetch_assoc($obj);


//更新浏览次数

unset($sql,$obj);

$sql = "update `im_goods` set `view`=`view`+1 where `id`={$goods['id']}";
mysqli_query($con,$sql);



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>M-GALLARY|<?php echo $goods['name']?></title>
    <link rel="stylesheet" type="text/css" href="./static/css/common.css" />
    <link rel="stylesheet" type="text/css" href="./static/css/detail.css" />
</head>
<body class="bgf8">
<div class="header">
    <div class="logo f1">
        <img src="./static/image/logo.png">
    </div>
    <div class="auth fr">
        <ul>
            <li><a href="#">登录</a></li>
            <li><a href="#">注册</a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="section" style="margin-top:20px;">
        <div class="width1200">
            <div class="fl"><img src="<?php echo $goods['pic']?>" width="720px" height="432px"/></div>
            <div class="fl sec_intru_bg">
                <dl>
                    <dt><?php echo $goods['name']?></dt>
                    <dd>
                        <p>发布人：<span><?php echo $user['username']?></span></p>
                        <p>发布时间：<span><?php echo date('Y年m月d日',$goods['create_time'])?></span></p>
                        <p>修改时间：<span><?php echo date('Y年m月d日',$goods['update_time'])?></span></p>
                        <p>浏览次数：<span><?php echo $goods['view']?></span></p>
                    </dd>
                </dl>
                <ul>
                    <li>售价：<br/><span class="price"><?php echo $goods['price'] ?></span>元</li>
                    <li class="btn"><a href="javascript:;" class="btn btn-bg-red" style="margin-left:38px;">立即购买</a></li>
                    <li class="btn"><a href="javascript:;" class="btn btn-sm-white" style="margin-left:8px;">收藏</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="secion_words">
        <div class="width1200">
            <div class="secion_wordsCon">
                <?php echo $goods['content']?>
            </div>
        </div>
    </div>
</div>
<div class="footer">
<p><span>CAR-BRITH</span>©2019 POWERED BY HFUU</p>
</div>
</div>
</body>
</html>


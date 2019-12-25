<?php
//编辑商品
include_once './lib/fun.php';

if(!checkLogin())
{
    msg(2, '请登�?', 'login.php');
}

//表单进�?�了提交处理
if(!empty($_POST['name']))
{
    $con = mysqlInit('127.0.0.1', 'root', '', 'carbirth');


    if(!$goodsId = intval($_POST['id']))
    {
        msg(2, '参数非法');
    }

    //根据商品id校验商品信息
    $sql = "SELECT * FROM `im_goods` WHERE `id` = {$goodsId}";
    $obj = mysqli_query($con,$sql);

    //当根据id查�?�商品信�?为空 跳转商品列表�?
    if(!$goods = mysqli_fetch_assoc($obj))
    {
        msg(2, '画品不存在?', 'index.php');
    }

    //处理表单数据
    //画品名称
    $name = trim($_POST['name']);
    //画品价格i
    $price = intval($_POST['price']);
    //画品简�?
    $des = trim($_POST['des']);
    //画品详情
    $content =trim($_POST['content']);

    $nameLength = mb_strlen($name, 'utf-8');
    if($nameLength <= 0 || $nameLength > 30)
    {
        msg(2, '画品名应在?1-30字�?�之�?');
    }

    if($price <= 0 || $price > 999999999)
    {
        msg(2, '画品名称应小�?999999999');
    }

    $desLength = mb_strlen($des, 'utf-8');
    if($desLength <= 0 || $desLength > 100)
    {
        msg(2, '画品简介应�?1-100字�?�之�?');
    }

    if(empty($content))
    {
        msg(2, '画品详情不能为空');
    }


    //更新数组
    $update = array(
        'name'    => $name,
        'price'   => $price,
        'des'     => $des,
        'content' => $content
    );

    //仅当用户选择上传图片 才进行图片上传�?�理
    if($_FILES['file']['size'] > 0)
    {
        $pic = imgUpload($_FILES['file']);
        $update['pic'] = $pic;
    }


    //�?更新�?用户�?改的信息 对比数据库数�?跟用户表单数�?

    foreach($update as $k => $v)
    {
        if($goods[$k] == $v)//对应key相等 删除要更新的字�??
        {
            unset($update[$k]);
        }
    }

    //对比2�?数组 如果没有需要更新的字�??
    if(empty($update))
    {
        msg(1, '操作成功', 'edit.php?id=' . $goodsId);
    }


    $updateSql = '';
    foreach($update as $k => $v)
    {
        $updateSql .= "`{$k}` = '{$v}' ,";
    }
    //去除多余 ,
    $updateSql = rtrim($updateSql, ',');

    unset($sql, $obj, $result);
    $sql = "UPDATE `im_goods` SET {$updateSql} WHERE `id` = {$goodsId}";

    //当更新成�?
    if($result = mysqli_query($sql))
    {
        //mysql_affected_rows();//影响行数
        msg(1, '操作成功', 'edit.php?id=' . $goodsId);
    }
    else
    {
        msg(2, '操作成功', 'edit.php?id=' . $goodsId);
    }


}
else
{
    msg(2, '�?由非�?', 'index.php');
}
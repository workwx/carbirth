<?php
session_start();
$num = array();
$res = imagecreate(100,34);
//这是图像的背景
imagecolorallocate($res,240,240,240);
for($i = 0;$i<4;$i++){
    $num[$i] = dechex(rand(0,15));
	$x = mt_rand(1,8)+100*$i/4;
	$y = mt_rand(1,8);
$col = imagecolorallocate($res,mt_rand(0,150),mt_rand(0,150),mt_rand(0,150));
imagestring($res,4,$x,$y,$num[$i],$col);
}
$_SESSION["maked_yz"] = $num;
header('content-type:image/png');
imagepng($res);
imagedestroy($res);
?>
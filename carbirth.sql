-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-12-25 08:57:05
-- 服务器版本： 5.7.24
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `carbirth`
--

-- --------------------------------------------------------

--
-- 表的结构 `im_goods`
--

DROP TABLE IF EXISTS `im_goods`;
CREATE TABLE IF NOT EXISTS `im_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `price` int(11) NOT NULL COMMENT '商品价格',
  `pic` varchar(255) NOT NULL COMMENT '商品图片',
  `des` varchar(200) NOT NULL COMMENT '商品简介',
  `content` longtext NOT NULL COMMENT '商品详情信息',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `im_goods`
--

INSERT INTO `im_goods` (`id`, `name`, `price`, `pic`, `des`, `content`, `user_id`, `create_time`, `update_time`, `view`) VALUES
(12, '瑞虎7', 85900, 'http://localhost/mall/static/file/2019/1224/5e021e85907ab7180.jpg', '全新瑞虎7基本保留了此前车展概念车的设计元素，使用了奇瑞家族最新的“日曜星河”的前脸造型，大尺寸多边形的点状星阵前格栅，搭配矩阵式LED大灯，看上去颇具科技感与时尚感。', '<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	车身侧面，全新一代瑞虎7采用了时下流行的悬浮式车顶设计，并且车身腰线笔直锋利，使得侧身线条极为流畅、动感。而在颜色方面，全新一代瑞虎7提供了双色车身，进一步拉近了与年轻消费者的距离。\r\n</p>\r\n<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	其他外部细节方面，新车还将提供全景天窗、19英寸轮圈以及贯穿式LED尾灯等功能配置。此外还搭配双边共两出式镀铬排气。尺寸方面，全新一代瑞虎7家族的长宽高为4500/1842/1746mm，轴距为2670mm。\r\n</p>', 4, 1577197189, 1577197189, 25),
(13, '奔驰GLE', 727800, 'http://localhost/mall/static/file/2019/1224/5e02214bb1ee29065.jpg', '近日，梅赛德斯-奔驰旗下奔驰GLE新增两款入门车型。据了解，此次增加的车型分别是GLE 350 4MATIC动感型和动感型特别版', '<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:18px;\">奔驰GLE入门价格从72.78万元降到了70.98万元，此次上市的两款新车型外观设计与此前车型一直，区别主要在配置上。与售价72.78万元的原入门车型GLE 350 4MATIC时尚型相比，售价70.98万元的GLE 350 4MATIC动感型在配置上取消了AMG车身风格组件（含车身同色包围）、空气悬架、高光炭灰色椴木木饰、智能驻车功系统，全景天窗变为选装项目，但增加了后排座椅前后调节功能，前轮胎升级为255/50 R19规格。</span><span style=\"color:#333333;font-family:&quot;font-size:18px;\"></span>\r\n</p>', 4, 1577197899, 1577197899, 10),
(14, '吉利icon银河限量版', 132020, 'http://localhost/mall/static/file/2019/1224/5e0221d091c589252.jpg', '近日，吉利BMA架构第二款SUV：icon银河限量版车型率先上市，共推出1款车型，售价为13.202万元，并将于2020年1月1日开启交付。', '<span style=\"color:#333333;font-family:&quot;font-size:18px;\">吉利icon银河限量版在上月开幕的2019广州车展中开启预售抢订，限量2020台，预售开启后仅15分17秒，即被抢订一空。2020台吉利icon“银河限量版”除了拥有超前设计、BMA模块化架构下打造的“新三大件”以外，还独享特制的银河星舰限量灰涂装、激光雕刻纪念装饰的银河星舰科技座舱、19英寸银河限量专属轮毂、19英寸马牌高端SUV轮胎以及精准运动底盘调校。</span>', 4, 1577198032, 1577198032, 0),
(15, '吉利远景', 47900, 'http://localhost/mall/static/file/2019/1224/5e022277f1f143684.jpg', '近日拍摄到了最新的2020款车型，新车并非换代车型，而是属于小改款，整体造型无太大变化，但细节上的修饰让精致感油然而生，卖相更好了，让我们一起来看看2020款吉利远景。', '<span style=\"color:#333333;font-family:&quot;font-size:18px;\">由于是基于现款车型的小改款，所以整体风格依旧保持了吉利家族式的设计，水波涟漪型的中网相信大家依旧很熟悉了，环形镀铬饰条进行了细微的调整，让整个前脸的精致感提升许多，并且升级了全黑配色的吉利最信Logo。</span><span style=\"color:#333333;font-family:&quot;font-size:18px;\">前保险杠下方是前脸改动最大的地方，雾灯的样式由上一年款的横置式样变为了现在的竖直式样，并且</span><a href=\"https://www.maiche.com/news/detail/1283079.html\" target=\"_blank\">LED</a><span style=\"color:#333333;font-family:&quot;font-size:18px;\">数量也增加到了24颗，无论视觉效果还是警示强度都进一步加强，大灯组仍然为卤素光源，维持上一年款的水平，考虑到售价与定位是没有问题的。</span>', 4, 1577198199, 1577198199, 0),
(16, '一汽丰田奕泽EV动力', 120000, 'http://localhost/mall/static/file/2019/1224/5e022314d0adc2125.jpg', '近日，一汽丰田奕泽IZOA EV的动力曝光。据了解，从工信部曝光的消息来看一汽丰田奕泽IZOA EV将搭载一台最大功率为150kW的驱动电机，最高车速为160km/h。', '<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	新车驱动电机搭载了一台由AW（苏州）汽车零部件有限公司生产的驱动电机，其最大功率为150kW（204Ps）。\r\n</p>\r\n<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	一汽丰田奕泽IZOA EV在2019上海车展发布，在外观上与燃油版差别不大，前脸采用了电动车惯用的封闭式格栅。在选装配置中，该车还将提供前雾灯、LED光源前大灯、天窗等配置。该车的车身尺寸长宽高分别为4405/1795/1575mm，轴距为2640m。\r\n</p>', 4, 1577198356, 1577198356, 0),
(17, '一汽-大众新迈腾', 186100, 'http://localhost/mall/static/file/2019/1224/5e0223d3ea2f51973.jpg', '12月18日，一汽-大众新款迈腾正式上市，作为中期改款版本，新迈腾更新了海外版最新的设计语言，并针对配置进行了一定的提升。', '<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	外观方面，新迈腾的造型融入了欧版Passat中期改款的最新设计元素，针对前脸的进气格栅和前包围进行了全新设计。而大灯方面，虽然整体造型变化不大，但内部灯组却进行了重新布局，并提供有LED矩阵式Matrix光源。\r\n</p>\r\n<div>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:18px;\">车身尺寸，新款迈腾GTE的长宽高分别为4865/1832/1469mm，</span>轴距<span style=\"color:#333333;font-family:&quot;font-size:18px;\">为2871mm。新车采用了与燃油版高配车型相同的18寸轮圈，具体规格为235/45 R18。除此之外，新车在前翼子板和后备厢处均增加GTE专属LOGO。</span>\r\n</div>', 4, 1577198547, 1577198547, 0),
(18, '凯迪拉克CT4-V', 279700, 'http://localhost/mall/static/file/2019/1225/5e02b51a7f0689173.jpg', '家热烈讨论凯迪拉克的一个重要原因是，它便宜啊。所以每当C家有性能版车型消息的时候，我们总是很兴奋，这给了那群渴望AMG、M、RS车系高性能，手中又预算不够的人们一个期盼。', '<span style=\"color:#333333;font-family:&quot;font-size:18px;\">11月</span><a href=\"https://www.maiche.com/s4576/\" target=\"_blank\">CT4</a><span style=\"color:#333333;font-family:&quot;font-size:18px;\">-V和</span><a href=\"https://www.maiche.com/s4626/\" target=\"_blank\">CT5</a><span style=\"color:#333333;font-family:&quot;font-size:18px;\">-V都在北美发布，但动力参数似乎不太给力。这次海外媒体曝光了一些谍照，猜测这两款车可能在动力上都会有更新。</span>\r\n<p style=\"font-family:&quot;text-indent:2em;font-size:18px;color:#333333;\">\r\n	先说CT-4，目前的2.7T<a href=\"https://www.maiche.com/news/detail/1283179.html\" target=\"_blank\">发动机</a>可能会被一台3.0T替代，没错就是CT5-V上那台。<a href=\"https://www.maiche.com/news/detail/1283514.html\" target=\"_blank\">功率</a>达到360匹，<a href=\"https://www.maiche.com/news/detail/1283525.html\" target=\"_blank\">扭矩</a>达到550Nm以上。\r\n</p>\r\n<div>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:18px;\">而CT5-V可能还会推出CT5-V plus版，就像AMG&nbsp;</span><a href=\"https://www.maiche.com/s123/\" target=\"_blank\">s</a><span style=\"color:#333333;font-family:&quot;font-size:18px;\">那样。动力可能会是</span><a href=\"https://www.maiche.com/s2301/\" target=\"_blank\">CT6</a><span style=\"color:#333333;font-family:&quot;font-size:18px;\">-V的那台4.2T V8发动机，功率参数接近550匹，扭矩在700Nm左右。</span>\r\n</div>', 4, 1577235738, 1577235738, 0),
(19, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b6c6738321800.jpg', '测试分页', '测试分页', 4, 1577236166, 1577236166, 0),
(20, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b6df8a12c7829.jpg', '测试分页', '测试分页', 4, 1577236191, 1577236191, 0),
(21, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b6f323a714666.jpg', '测试分页', '测试分页', 4, 1577236211, 1577236211, 0),
(22, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b709a57d87542.png', '测试分页', '测试分页', 4, 1577236233, 1577236233, 0),
(23, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b724d0d506474.jpg', '测试分页', '测试分页', 4, 1577236260, 1577236260, 0),
(24, '测试', 4000, 'http://localhost/mall/static/file/2019/1225/5e02b740416813625.jpg', '测试分页', '测试分页', 4, 1577236288, 1577236288, 0);

-- --------------------------------------------------------

--
-- 表的结构 `im_user`
--

DROP TABLE IF EXISTS `im_user`;
CREATE TABLE IF NOT EXISTS `im_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `im_user`
--

INSERT INTO `im_user` (`id`, `username`, `password`, `create_time`) VALUES
(2, 'ss', 'a02daa14133ae6bd41e1eae87eef2e11', 1487602448),
(3, 'ssss', 'a02daa14133ae6bd41e1eae87eef2e11', 1487678308),
(4, 'wx', '12ce9d519127b4e7d66bd48f5ae63662', 1577182970);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

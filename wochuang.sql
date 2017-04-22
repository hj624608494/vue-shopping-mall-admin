-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-21 21:40:27
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wochuang`
--

DROP Database IF EXISTS `wochuang`;
CREATE Database `wochuang` DEFAULT CHARSET=utf8;
use `wochuang`;
-- --------------------------------------------------------

--
-- 表的结构 `think_address`
--

CREATE TABLE IF NOT EXISTS `think_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `createtime` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_address`
--

INSERT INTO `think_address` (`id`, `uid`, `name`, `phone`, `address`, `province`, `city`, `area`, `street`, `createtime`) VALUES
(131, 143, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', '2017-04-10 13:51:06'),
(135, 158, 'a', 'a', '锕', 'a', 'a', 'a', '阿', '2017-04-15 15:11:18'),
(136, 175, 'w', '15877729671', 'sad', 'guangxi', 'asd', 'asd', 'sad', '2017-04-17 17:52:18'),
(137, 176, '1', '1', '1', '1', '1', '1', '1', '2017-04-20 21:30:05'),
(110, 153, 'ssss', 'ssss', 'ssss', 'ssss', 'ssss', 'ssss', 'ssss', '2017-04-08 11:59:59'),
(111, 153, 'H', '18624000315', '1号', '黑龙江', '黑河', '孙吴', '中央街', '2017-04-10 09:43:37');

-- --------------------------------------------------------

--
-- 表的结构 `think_classify`
--

CREATE TABLE IF NOT EXISTS `think_classify` (
  `id` int(11) unsigned zerofill NOT NULL,
  `text` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `sort` varchar(11) NOT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_classify`
--

INSERT INTO `think_classify` (`id`, `text`, `image`, `createtime`, `sort`, `link`) VALUES
(00000000078, '珠宝首饰1', 'http://192.168.1.122/tp/public/uploads/images/classify/20170417/149240863558f4593b131f3.png', '2017-04-17 13:56:12', '1', NULL),
(00000000079, '手机数码', 'http://192.168.1.122/tp/public/uploads/images/classify/20170417/149240859558f45913ac146.png', '2017-04-17 13:56:38', '2', NULL),
(00000000080, '汽车', 'http://192.168.1.122/tp/public/uploads/images/classify/20170417/149240861158f459238c590.png', '2017-04-17 13:56:55', '3', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `think_goods`
--

CREATE TABLE IF NOT EXISTS `think_goods` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `introduce` varchar(200) DEFAULT '',
  `price` decimal(10,2) NOT NULL,
  `attr` varchar(1000) NOT NULL,
  `number` text NOT NULL,
  `images` varchar(1500) NOT NULL,
  `content` longtext,
  `createtime` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `produce` varchar(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_goods`
--

INSERT INTO `think_goods` (`id`, `name`, `introduce`, `price`, `attr`, `number`, `images`, `content`, `createtime`, `status`, `cid`, `produce`) VALUES
(217, '2', '22', '2.00', '[{"name":"2","valueList":[{"name":"2"}]}]', '[{"number":"12","attrValues":["2"]}]', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', '<p>22</p>', '2017-04-17 10:52:53', 'true', 39, 'true');

-- --------------------------------------------------------

--
-- 表的结构 `think_manager`
--

CREATE TABLE IF NOT EXISTS `think_manager` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_manager`
--

INSERT INTO `think_manager` (`id`, `username`, `password`, `createtime`) VALUES
(169, 'abc', '21232f297a57a5a743894a0e4a801fc3', '2017-04-17 13:52:46'),
(125, 'aa', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:20'),
(124, 'a', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:15'),
(123, 'hanjie', 'e98f4b9d76a7c7fb442e140cc1e11ddc', '2017-04-10 13:13:59'),
(122, 'qwety', '11faf9d01cb38681b2274f4cdc64a37b', '2017-04-07 14:06:16'),
(93, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-03-30 20:53:02'),
(127, 'aaaa', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:24'),
(128, 'aaaaa', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:26'),
(139, 'bb', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:47'),
(140, 'bbb', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:50'),
(141, 'bbbb', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:52'),
(142, 'bbbbb', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:19:54'),
(156, 'c', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:20:20'),
(157, 'cc', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:20:23'),
(158, 'ccc', '0cc175b9c0f1b6a831c399e269772661', '2017-04-11 22:20:24');

-- --------------------------------------------------------

--
-- 表的结构 `think_order`
--

CREATE TABLE IF NOT EXISTS `think_order` (
  `id` int(11) NOT NULL,
  `order_sn` varchar(25) NOT NULL,
  `order_status` varchar(10) NOT NULL,
  `pay_status` varchar(10) NOT NULL,
  `attr` text NOT NULL,
  `pay_type` varchar(10) NOT NULL,
  `pay_id` varchar(50) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `address_id` int(11) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `good_id` int(11) NOT NULL,
  `good_price` float(10,2) NOT NULL,
  `good_number` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `images` varchar(1500) DEFAULT NULL,
  `order_total` float(11,0) NOT NULL,
  `expressName` varchar(30) DEFAULT NULL,
  `expressNumber` varchar(30) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_order`
--

INSERT INTO `think_order` (`id`, `order_sn`, `order_status`, `pay_status`, `attr`, `pay_type`, `pay_id`, `createtime`, `address_id`, `userName`, `phone`, `address`, `province`, `city`, `area`, `street`, `good_id`, `good_price`, `good_number`, `name`, `images`, `order_total`, `expressName`, `expressNumber`, `user_id`) VALUES
(235, '201704151510122168', '待发货', '待支付', '{"7":"7"}', '', NULL, '2017-04-15 15:10:12', 134, '韩杰', '15901592673', '郑平路宏福科技园6楼', '北京', '北京', '昌平', '郑平路宏福科技园', 209, 7.00, 1, '7', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170415\\/149222627158f190df3eba5.png"]', 7, NULL, NULL, 158),
(236, '201704151511206765', '待发货', '待支付', '{"66":"66"}', '', NULL, '2017-04-15 15:11:20', 135, 'a', 'a', '锕', 'a', 'a', 'a', '阿', 208, 66.00, 1, '66', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170415\\/149222375258f1870805352.png"]', 66, NULL, NULL, 158),
(237, '201704151632067117', '待发货', '待支付', '{"33":"333"}', '', NULL, '2017-04-15 16:32:06', 135, 'a', 'a', '锕', 'a', 'a', 'a', '阿', 207, 33.00, 2, '33', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170414\\/149216366758f09c53a4c85.png"]', 66, NULL, NULL, 158),
(238, '201704171127299836', '待发货', '已支付', '{"2":"2"}', '支付宝', 'ch_iL8SOGOSSefD0KSSq9azv988', '2017-04-17 11:27:29', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 217, 2.00, 1, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 2, NULL, NULL, 143),
(239, '201704171346405852', '已发货', '已支付', '{"2":"2"}', '支付宝', 'ch_zn1WnT5WrL8Km58GC4vnnbfL', '2017-04-17 13:46:40', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 217, 2.00, 1, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 2, '啊啊啊', '踩踩踩', 143),
(240, '201704171932052153', '待发货', '待支付', '{"2":"2"}', '', NULL, '2017-04-17 19:32:05', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 217, 2.00, 3, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 6, NULL, NULL, 143),
(241, '201704171948191110', '待发货', '待支付', '{"2":"2"}', '', NULL, '2017-04-17 19:48:19', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 217, 2.00, 2, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 4, NULL, NULL, 143),
(234, '201704151502105867', '已发货', '已支付', '{"1":"1"}', '支付宝', 'ch_Hmbj10nXfPCSP4ajX98qP4yD', '2017-04-15 15:02:10', 134, '韩杰', '15901592673', '郑平路宏福科技园6楼', '北京', '北京', '昌平', '郑平路宏福科技园', 210, 1.00, 1, '1', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170415\\/149222635358f191314d613.png"]', 1, 'c''c''c', 'c''c''c', 158),
(242, '201704202130406646', '已发货', '已支付', '{"2":"2"}', '支付宝', 'ch_bPWDCOb1ivz9HOqz9SPyfHaD', '2017-04-20 21:30:40', 137, '1', '1', '1', '1', '1', '1', '1', 145, 77.00, 2, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 154, '圆通', '132456789', 176),
(243, '201704202133028594', '待发货', '待支付', '{"2":"2"}', '', NULL, '2017-04-20 21:33:02', 137, '1', '1', '1', '1', '1', '1', '1', 145, 77.00, 5, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 385, NULL, NULL, 176),
(244, '201704202133397504', '待发货', '已支付', '{"2":"2"}', '微信', 'ch_Tiz58C4uvnv5KWDeL8bzzPOS', '2017-04-20 21:33:39', 137, '1', '1', '1', '1', '1', '1', '1', 217, 2.00, 7, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 14, NULL, NULL, 176),
(245, '201704210959269237', '待发货', '待支付', '{"2":"2"}', '', NULL, '2017-04-21 09:59:26', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 145, 77.00, 2, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 154, NULL, NULL, 143),
(246, '201704211000159917', '待发货', '已支付', '{"2":"2"}', '支付宝', 'ch_0044u54ejbrHerjLm5qLWDmD', '2017-04-21 10:00:15', 131, 'name', 'tel', 'xiangxi', 'sheng', 'shi', 'qu', 'jiedao', 145, 77.00, 2, '2', '["http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png","http:\\/\\/192.168.1.122\\/tp\\/public\\/uploads\\/images\\/goods\\/20170417\\/149239845558f4317770d94.png"]', 154, NULL, NULL, 143);

-- --------------------------------------------------------

--
-- 表的结构 `think_sale`
--

CREATE TABLE IF NOT EXISTS `think_sale` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createtime` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_sale`
--

INSERT INTO `think_sale` (`id`, `good_id`, `price`, `createtime`) VALUES
(138, 206, '22.00', '2017-04-14 20:44:50'),
(134, 188, '1.00', '2017-04-13 10:56:12'),
(143, 213, '33.00', '2017-04-17 10:29:42'),
(139, 204, '22.00', '2017-04-14 20:44:53'),
(140, 203, '22.00', '2017-04-14 20:44:58'),
(141, 202, '11.00', '2017-04-14 20:45:38'),
(142, 201, '1.00', '2017-04-14 20:45:53'),
(145, 217, '77.00', '2017-04-17 13:59:17');

-- --------------------------------------------------------

--
-- 表的结构 `think_slider`
--

CREATE TABLE IF NOT EXISTS `think_slider` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `text` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `sort` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `good_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_slider`
--

INSERT INTO `think_slider` (`id`, `type`, `image`, `text`, `createtime`, `sort`, `link`, `good_id`) VALUES
(159, '首页中部幻灯片', 'http://127.0.0.1/wochuang/public/uploads/images/slider/20170420/149269372858f8b2e013deb.png', '1111', '2017-04-20 21:09:01', 1, '11111', 0),
(149, '首页顶部幻灯片', 'http://127.0.0.1/wochuang/public/uploads/images/slider/20170417/149240198558f43f41a3bae.jpg', '5', '2017-04-17 12:06:27', 5, '5', 0),
(150, '首页底部幻灯片', 'http://127.0.0.1/wochuang/public/uploads/images/slider/20170417/149240744258f45492bedeb.jpg', '6', '2017-04-17 13:37:29', 6, '6', 0),
(157, '首页顶部幻灯片', 'http://127.0.0.1/wochuang/public/uploads/images/slider/20170420/149269300858f8b010774e3.jpg', '11111', '2017-04-20 20:56:54', 11, '111', 0),
(160, '首页顶部幻灯片', 'http://127.0.0.1/wochuang/public/uploads/images/slider/20170420/149269393758f8b3b1df9f2.png', '222', '2017-04-20 21:12:27', 2, '222', 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_users`
--

CREATE TABLE IF NOT EXISTS `think_users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `createtime` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_users`
--

INSERT INTO `think_users` (`id`, `email`, `password`, `nickname`, `createtime`) VALUES
(143, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, '2017-03-15 15:52:12'),
(158, '228817417@qq.com', 'cb2de6a3de3163cfa7d7fdfd2d51bbdf', NULL, '2017-04-14 19:48:07'),
(160, 'ba', '', '', '0000-00-00 00:00:00'),
(161, 'ddddd', '', '', '0000-00-00 00:00:00'),
(162, 'dzxc', '', '', '0000-00-00 00:00:00'),
(163, 'easd', '', '', '0000-00-00 00:00:00'),
(164, 'fasd', '', '', '0000-00-00 00:00:00'),
(165, 'g', '', '', '0000-00-00 00:00:00'),
(176, '834523248@qq.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2017-04-20 21:29:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `think_address`
--
ALTER TABLE `think_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_classify`
--
ALTER TABLE `think_classify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_goods`
--
ALTER TABLE `think_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_manager`
--
ALTER TABLE `think_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_order`
--
ALTER TABLE `think_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_sale`
--
ALTER TABLE `think_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_slider`
--
ALTER TABLE `think_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_users`
--
ALTER TABLE `think_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `think_address`
--
ALTER TABLE `think_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `think_classify`
--
ALTER TABLE `think_classify`
  MODIFY `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `think_goods`
--
ALTER TABLE `think_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT for table `think_manager`
--
ALTER TABLE `think_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `think_order`
--
ALTER TABLE `think_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `think_sale`
--
ALTER TABLE `think_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `think_slider`
--
ALTER TABLE `think_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `think_users`
--
ALTER TABLE `think_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=177;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

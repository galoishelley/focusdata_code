-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-02 22:33:31
-- 服务器版本： 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `focusdata`
--
CREATE DATABASE IF NOT EXISTS `focusdata` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `focusdata`;

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin`
--

DROP TABLE IF EXISTS `fd_admin`;
CREATE TABLE IF NOT EXISTS `fd_admin` (
  `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMIN_NAME` varchar(50) NOT NULL,
  `ADMIN_PWD` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_admin`
--

INSERT INTO `fd_admin` (`ADMIN_ID`, `ADMIN_NAME`, `ADMIN_PWD`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'admin', 'ADMIN', '', '0000-00-00 00:00:00', 'admin', '2016-09-01 14:51:23');

-- --------------------------------------------------------

--
-- 表的结构 `fd_clinic_user`
--

DROP TABLE IF EXISTS `fd_clinic_user`;
CREATE TABLE IF NOT EXISTS `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLINIC_USER_NAME` varchar(50) NOT NULL,
  `CLINIC_USER_PWD` varchar(50) NOT NULL,
  `CLINIC_USER_MAIL` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CLINIC_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_NAME`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_ADDR`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'shelleymyl1', 'myl1102', 'shelleymyl@gmail.com11', '市诊所1', '吉林省长春市前进大街8811号1', 0, NULL, 'shelleymyl', '2016-08-13 12:11:10', 'admin', '2016-09-01 16:28:01'),
(2, 'shelleymyle1', 'myl1102', 'shelleymyl@gmail.com1', '市诊所1', '南阳路88号1', 0, NULL, 'shelleymyl', '2016-08-13 12:11:39', 'admin', '2016-09-01 16:14:34'),
(3, 'shelleymylee1', 'myl1102', 'shelleymyl@gmail.com1', '朝阳区诊所1', '朝阳区1', 0, NULL, 'shelleymyl', '2016-08-13 12:11:50', 'admin', '2016-09-01 16:13:59'),
(4, 'shelleymyl221', 'myl1102', 'shelleymyl@gmail.com1', '绿园区诊所1', '绿园区1', 1, NULL, 'shelleymyl', '2016-08-15 12:08:47', 'admin', '2016-09-01 16:20:53'),
(5, 'yinxin', 'yinxin', 'shelleymyl@gmail.com', '1', '1', 0, NULL, 'shelleymyl', '2016-08-24 16:28:50', 'shelleymyl', '2016-08-24 16:28:50'),
(6, 'Miaoyl', 'myl1102', 'shelleymyl@gmail.com', '1', '1', 0, NULL, 'shelleymyl', '2016-08-24 16:31:50', 'shelleymyl', '2016-08-24 16:31:50'),
(7, 'shelleymyl111', 'myl1102111', 'shelleymyl@gmail.com', '1', '1', 0, NULL, 'shelleymyl', '2016-08-24 16:33:17', 'shelleymyl', '2016-08-24 16:33:17'),
(8, 'yinxin123', 'yinxin123', 'shelleymyl@gmail.com', '1', '1', 1, NULL, 'yinxin123', '2016-08-24 21:42:45', 'admin', '2016-09-01 16:22:38'),
(9, 'mao', 'mao', 'shelleymyl@gmail.com', '1', '1', 0, NULL, 'mao', '2016-08-24 21:43:42', 'mao', '2016-08-24 21:43:42'),
(10, 'miao', 'miao', 'shelleymyl@gmail.com', '1', '1', 0, NULL, 'miao', '2016-09-01 15:07:02', 'miao', '2016-09-01 15:07:02'),
(11, 'admin', 'admin', 'shelleymyl@gmail.com', '1', '1', 1, NULL, 'admin', '2016-09-01 16:53:28', 'admin', '2016-09-01 16:53:28');

-- --------------------------------------------------------

--
-- 表的结构 `fd_customer_user`
--

DROP TABLE IF EXISTS `fd_customer_user`;
CREATE TABLE IF NOT EXISTS `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_USER_PWD` varchar(50) NOT NULL,
  `CUSTOMER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_GENDER` varchar(10) NOT NULL,
  `CUSTOMER_BIRTHDAY` varchar(50) NOT NULL,
  `CUSTOMER_ADDR` varchar(200) NOT NULL,
  `CUSTOMER_PHONE_NO` varchar(50) NOT NULL,
  `MEDICAL_CARD_NO` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL DEFAULT '1',
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_NAME`, `CUSTOMER_USER_PWD`, `CUSTOMER_NAME`, `CUSTOMER_GENDER`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(25, 'shelleymyl111123', 'myl1102', '尹小猫', '男', '1985-11-021111123', '碧水云天12#80611123', '1350089823411123', '123456678911123', 0, '', 'shelleymyl', '2016-08-12 22:50:01', 'shelleymyl', '2016-08-12 22:50:01'),
(26, 'xinsj', '123', '尹小猫', '男', '19831111', '吉林长春', '18686420139', '123456789', 1, '', 'shelleymyl', '2016-08-13 10:40:17', 'shelleymyl', '2016-08-13 10:40:17'),
(27, 'xinsj', 'myl1102', '尹小猫', '男', '19831111', '吉林长春', '18686420139', '123456789', 1, '', 'shelleymyl', '2016-08-13 11:13:37', 'shelleymyl', '2016-08-13 11:13:37'),
(28, 'sb', 'sb', '尹小猫', '女', '831007', '白城', '13500898234', '789', 1, '', 'shelleymyl', '2016-08-13 11:15:52', 'shelleymyl', '2016-08-13 11:15:52'),
(29, '你好', 'myl1102', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'shelleymyl', '2016-08-13 11:35:21', 'shelleymyl', '2016-08-13 11:35:21'),
(30, '你要', 'myl1102', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'shelleymyl', '2016-08-13 11:35:35', 'shelleymyl', '2016-08-13 11:35:35'),
(31, 'miaoyl', 'miaoyl', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'shelleymyl', '2016-08-24 16:24:34', 'shelleymyl', '2016-08-24 16:24:34'),
(32, 'yinxin', 'yinxin', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'shelleymyl', '2016-08-24 16:28:24', 'shelleymyl', '2016-08-24 16:28:24'),
(33, 'admin', 'admin', '尹小猫', '女', '1ee111', '1e111', '1eeeee111', '1e111', 1, '', 'admin', '2016-08-24 21:15:18', 'admin', '2016-08-29 22:22:52'),
(34, 'admin123', 'admin123', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'admin123', '2016-08-24 21:19:27', 'admin123', '2016-08-24 21:19:27'),
(35, 'yinxin123', 'yinxin123', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'yinxin123', '2016-08-24 21:29:08', 'yinxin123', '2016-08-24 21:29:08'),
(36, '333', 'mao', '尹小猫', '男', '11', '11', '11', '11', 1, '', 'mao', '2016-08-24 21:43:29', 'mao', '2016-08-24 21:43:29'),
(37, 'nihao', 'nihao', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'nihao', '2016-08-24 23:11:19', 'nihao', '2016-08-24 23:11:19'),
(38, '333', '333', '尹小猫', '男', '1', '1', '1', '1', 1, '', '333', '2016-08-26 15:28:57', '333', '2016-08-26 15:28:57'),
(39, '7', '7', '尹小猫', '男', '1', '1', '1', '1', 1, '', '7', '2016-08-26 15:29:42', '7', '2016-08-26 15:29:42'),
(40, '6', '6', '尹小猫', '男', '1', '1', '1', '1', 1, '', '6', '2016-08-26 15:29:58', '6', '2016-08-26 15:29:58'),
(41, 'ee', 'ee', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'ee', '2016-08-26 15:30:31', 'ee', '2016-08-26 15:30:31'),
(42, 'dd', 'dd', '尹小猫', '男', '1', '1', '1', '1', 1, '', 'dd', '2016-08-26 15:30:41', 'dd', '2016-08-26 15:30:41'),
(43, '1', '111', '尹小猫', '男', '1985-11-02', '1', '1', '1', 0, '', '1', '2016-08-26 15:34:17', '1', '2016-08-29 21:44:03'),
(44, 'e', 'e', '尹小猫', '男', 'e', 'e', 'e', 'e', 1, '', 'e', '2016-08-26 15:38:19', 'e', '2016-08-26 15:38:19'),
(45, 'd', 'd', '尹小猫', '男', 'd', 'd', 'd', 'd', 1, '', 'd', '2016-08-26 15:39:13', 'd', '2016-08-26 15:39:13'),
(46, '33', '33', '尹小猫', '男', '3', '3', '3', '3', 1, '', '33', '2016-08-26 15:41:37', '33', '2016-08-26 15:41:37'),
(47, '3', '3', '尹小猫', '男', '33', '3', '3', '3', 1, '', '3', '2016-08-26 15:44:41', '3', '2016-08-26 15:44:41'),
(48, '323', '3', '尹小猫', '男', '3', '33', '3', '3', 1, '', '323', '2016-08-26 15:45:19', '323', '2016-08-26 15:45:19'),
(49, '444', '44', '尹小猫', '男', '44', '4', '4', '4', 1, '', '444', '2016-08-26 16:23:48', '444', '2016-08-26 16:23:48'),
(50, '饿', 'e', '尹小猫', '男', 'e', 'e', '男', '等等', 1, '', '饿', '2016-08-26 19:20:02', '饿', '2016-08-26 19:20:02'),
(51, '444444', '44444', '尹小猫', '男', '1', '1', '1', '1', 1, '', '444444', '2016-08-26 19:33:30', '444444', '2016-08-26 19:33:30'),
(52, '111111111111111111', '11', '尹小猫', '男', '1', '1', '1', '1', 1, '', '111111111111111111', '2016-08-26 19:38:00', '111111111111111111', '2016-08-26 19:38:00'),
(53, '5555555555', '5', '尹小猫', '男', '5', '5', '5', '5', 1, '', '5555555555', '2016-08-26 19:38:50', '5555555555', '2016-08-26 19:38:50'),
(54, '6666666666666', '6', '尹小猫', '男', '6', '6', '6', '6', 1, '', '6666666666666', '2016-08-26 19:40:29', '6666666666666', '2016-08-26 19:40:29'),
(55, '22222222', '22', '尹小猫', '男', '2', '2', '2', '2', 1, '', '22222222', '2016-08-26 19:41:50', '22222222', '2016-08-26 19:41:50'),
(56, '44444444444444', '4', '尹小猫', '男', '4', '4', '4', '4', 1, '', '44444444444444', '2016-08-26 19:44:33', '44444444444444', '2016-08-26 19:44:33'),
(57, '77777', '77', '尹小猫', '男', '7', '7', '7', '7', 1, '', '77777', '2016-08-26 19:46:32', '77777', '2016-08-26 19:46:32'),
(58, '5555555555555', '5', '尹小猫', '男', '5', '55', '5', '5', 1, '', '5555555555555', '2016-08-26 19:46:48', '5555555555555', '2016-08-26 19:46:48'),
(59, '44', '4', '尹小猫', '男', '4', '4', '4', '4', 1, '', '44', '2016-08-26 19:48:19', '44', '2016-08-26 19:48:19'),
(60, '333333333', '3', '尹小猫', '男', '3', '3', '3', '3', 1, '', '333333333', '2016-08-26 19:49:25', '333333333', '2016-08-26 19:49:25'),
(61, '88888888888', '8', '尹小猫', '男', '8', '8', '8', '8', 1, '', '88888888888', '2016-08-26 19:50:51', '88888888888', '2016-08-26 19:50:51'),
(62, '66666', '6', '尹小猫', '男', '6', '6', '666', '6', 1, '', '66666', '2016-08-26 19:52:22', '66666', '2016-08-26 19:52:22'),
(63, '8788888', '8888', '尹小猫', '男', '88', '8', '88', '8', 1, '', '8788888', '2016-08-26 19:53:01', '8788888', '2016-08-26 19:53:01'),
(64, '8888888888888', '8', '尹小猫', '男', '8', '8', '8', '8', 1, '', '8888888888888', '2016-08-26 19:53:54', '8888888888888', '2016-08-26 19:53:54'),
(65, '888888888888888', '8', '尹小猫', '男', '8', '8', '8', '8', 1, '', '888888888888888', '2016-08-26 20:00:12', '888888888888888', '2016-08-26 20:00:12'),
(66, '88888888888888888888', '5', '尹小猫', '男', '5', '55', '5', '5', 1, '', '88888888888888888888', '2016-08-26 20:04:46', '88888888888888888888', '2016-08-26 20:04:46'),
(67, '111111111111', '1', '尹小猫', '男', '1', '1', '111', '1', 1, '', '111111111111', '2016-08-26 20:11:23', '111111111111', '2016-08-26 20:11:23'),
(68, '3333333333', '3', '尹小猫', '男', '3', '3', '3', '3', 1, '', '3333333333', '2016-08-26 20:16:44', '3333333333', '2016-08-26 20:16:44'),
(69, '33333333333', '3', '尹小猫', '男', '3', '335', '3', '3', 0, '', '33333333333', '2016-08-26 20:17:52', 'admin', '2016-09-01 22:08:32'),
(70, '66666666666', '6', '尹小猫', '男', '6', '6', '6', '6', 0, '', '66666666666', '2016-08-26 20:19:17', 'admin', '2016-09-01 22:08:15'),
(71, '333333333333', '3', '尹小猫', '男', '3', '3', '3e', '3', 0, '', '333333333333', '2016-08-26 20:20:19', 'admin', '2016-09-01 22:09:06'),
(72, '呃1', '3', '尹小猫1', '女', '1', '1', '1', '1', 0, '', '呃呃呃呃呃呃呃呃呃呃呃呃', '2016-08-26 20:22:52', 'admin', '2016-09-01 22:11:34'),
(73, '呃呃呃呃呃呃呃呃呃呃呃呃饿', 'eeeee', '尹小猫', '男', '3', '3', '3', '3', 0, '', '呃呃呃呃呃呃呃呃呃呃呃呃饿', '2016-08-26 20:29:01', '呃呃呃呃呃呃呃呃呃呃呃呃饿', '2016-08-26 20:29:01'),
(74, '1112', '1', '尹小猫', '男', '1', '1', '1', '1', 0, '', '1112', '2016-08-26 20:32:54', '1112', '2016-08-26 20:32:54'),
(75, '44444444444', '3', '尹小猫', '男', '3', '3', '3', '3', 0, '', '44444444444', '2016-08-26 20:47:30', '44444444444', '2016-08-26 20:47:30'),
(76, 'miaomiao1', '1', '尹小猫1', '女', '11', '11', '11', '11', 0, '', 'miaomiao', '2016-09-01 15:06:45', 'admin', '2016-09-01 21:44:20');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_appointment_status`
--

DROP TABLE IF EXISTS `fd_dict_appointment_status`;
CREATE TABLE IF NOT EXISTS `fd_dict_appointment_status` (
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPOINTMENT_STATUS` varchar(50) NOT NULL,
  PRIMARY KEY (`APPOINTMENT_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_appointment_status`
--

INSERT INTO `fd_dict_appointment_status` (`APPOINTMENT_STATUS_ID`, `APPOINTMENT_STATUS`) VALUES
(1, '已预约'),
(2, '取消预约'),
(3, '已就诊'),
(4, '未就诊');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_log_type`
--

DROP TABLE IF EXISTS `fd_dict_log_type`;
CREATE TABLE IF NOT EXISTS `fd_dict_log_type` (
  `LOG_TYPE_ID` int(11) NOT NULL,
  `LOG_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`LOG_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_search`
--

DROP TABLE IF EXISTS `fd_dict_search`;
CREATE TABLE IF NOT EXISTS `fd_dict_search` (
  `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEARCH_CONTENT` varchar(50) NOT NULL,
  PRIMARY KEY (`SEARCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_search`
--

INSERT INTO `fd_dict_search` (`SEARCH_ID`, `SEARCH_CONTENT`) VALUES
(1, '诊所区域'),
(2, '诊所名称'),
(3, '医生类别'),
(4, '医生姓名'),
(5, '预约时间'),
(6, '医生距离');

-- --------------------------------------------------------

--
-- 表的结构 `fd_doctor`
--

DROP TABLE IF EXISTS `fd_doctor`;
CREATE TABLE IF NOT EXISTS `fd_doctor` (
  `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DOCTOR_GENDER` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `DOCTOR_PHOTO` varchar(200) NOT NULL,
  `DOCTOR_INFO` varchar(2000) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_doctor`
--

INSERT INTO `fd_doctor` (`DOCTOR_ID`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DOCTOR_GENDER`, `ACTIVE_STATUS`, `DOCTOR_PHOTO`, `DOCTOR_INFO`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, '牙科', '尹鑫', '女', 0, 'page1_pic2.jpg', '如果尽早治疗，根本不需要麻醉，补牙过程也异常简单，因为没有腐蚀到牙神经；而如果牙齿腐蚀的比较厉害接触要牙神经再来就诊，首先在治疗之前疼痛感比较强烈而且会伴随牙周炎等口腔炎症，麻醉过程中不会疼痛只会有肿胀感，麻醉后还是有一些不适。11', '', 'admin', '2016-08-16 00:00:00', 'shelleymyl1', '2016-08-31 21:08:10'),
(2, '内科', '苗亚柳', '女', 1, 'miaoyl.jpg', 'good doctor', '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, '牙科', '尹小猫', '女', 1, 'page1_pic2.jpg', '多张图片上传,显示...jquery多图片上传所属分类:输入-上传5041520085分享到:查看演示立即下载插件描述:多张图片上传,显示html部分', '1', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, '牙科', '尹小耗', '男', 1, 'page1_pic3.jpg', '骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了。', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(5, '外科', 'hello', '女', 1, 'page1_pic4.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, '外科', 'world', '女', 1, 'page2_pic1.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(7, '外科', 'world php', '女', 1, 'page2_pic2.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(8, '外科', 'hello php', '女', 1, 'page2_pic3.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(9, '外科', 'nihap', '女', 1, 'page2_pic4.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10, '外科', '测试', '女', 1, 'page2_pic9.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, '外科', '测试1', '女', 1, 'page2_pic8.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fd_function`
--

DROP TABLE IF EXISTS `fd_function`;
CREATE TABLE IF NOT EXISTS `fd_function` (
  `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUNCTION_CODE` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_log`
--

DROP TABLE IF EXISTS `fd_log`;
CREATE TABLE IF NOT EXISTS `fd_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_TYPE_ID` int(11) NOT NULL,
  `FUNCTION_ID` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `LOG_CONTENT` varchar(200) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_clinic_doctor`
--

DROP TABLE IF EXISTS `fd_rel_clinic_doctor`;
CREATE TABLE IF NOT EXISTS `fd_rel_clinic_doctor` (
  `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLINIC_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CLINIC_DOCTOR_ID`),
  KEY `FK_fd_rel_clinic_doctor_1` (`DOCTOR_ID`),
  KEY `FK_fd_rel_clinic_doctor_2` (`CLINIC_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_clinic_doctor`
--

INSERT INTO `fd_rel_clinic_doctor` (`CLINIC_DOCTOR_ID`, `CLINIC_USER_ID`, `DOCTOR_ID`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 1, 1, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 2, 2, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 1, 3, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, 2, 4, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(5, 2, 5, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, 3, 6, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(7, 2, 7, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(8, 3, 8, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(9, 2, 9, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10, 3, 10, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, 2, 11, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_appointment`
--

DROP TABLE IF EXISTS `fd_rel_customer_appointment`;
CREATE TABLE IF NOT EXISTS `fd_rel_customer_appointment` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`),
  KEY `FK_fd_rel_customer_appointment_1` (`CUSTOMER_USER_ID`),
  KEY `FK_fd_rel_customer_appointment_2` (`DOCTOR_ID`),
  KEY `FK_fd_rel_customer_appointment_3` (`DOCTOR_APPOINTMENT_TIME_ID`),
  KEY `FK_fd_rel_customer_appointment_4` (`APPOINTMENT_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_customer_appointment`
--

INSERT INTO `fd_rel_customer_appointment` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(3, 25, 4, 22, 2, '', 'shelleymyl', '2016-08-23 19:12:50', 'shelleymyl', '2016-08-23 19:12:50'),
(4, 25, 7, 26, 2, '', 'shelleymyl', '2016-08-23 19:16:11', 'shelleymyl', '2016-08-23 19:16:11'),
(5, 25, 10, 29, 2, '', 'shelleymyl', '2016-08-23 19:17:15', 'shelleymyl', '2016-08-23 19:17:15'),
(6, 25, 11, 32, 2, '', 'shelleymyl', '2016-08-23 19:22:55', 'shelleymyl', '2016-08-23 19:22:55'),
(7, 25, 11, 30, 2, '', 'shelleymyl', '2016-08-23 19:23:32', 'shelleymyl', '2016-08-23 19:23:32'),
(8, 25, 7, 26, 2, '', 'shelleymyl', '2016-08-23 19:23:51', 'shelleymyl', '2016-08-23 19:23:51'),
(9, 25, 7, 26, 2, '', 'shelleymyl', '2016-08-23 21:13:40', 'shelleymyl', '2016-08-23 21:13:40'),
(10, 25, 7, 26, 2, '', 'shelleymyl', '2016-08-23 21:14:57', 'shelleymyl', '2016-08-23 21:14:57'),
(11, 25, 8, 27, 2, '', 'shelleymyl', '2016-08-23 21:16:12', 'shelleymyl', '2016-08-23 21:16:12'),
(12, 25, 8, 27, 2, '', 'shelleymyl', '2016-08-23 21:16:32', 'shelleymyl', '2016-08-23 21:16:32'),
(13, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:09:33', 'shelleymyl', '2016-08-24 09:09:33'),
(14, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:26:26', 'shelleymyl', '2016-08-24 09:26:26'),
(15, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:26:31', 'shelleymyl', '2016-08-24 09:26:31'),
(16, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:26:56', 'shelleymyl', '2016-08-24 09:26:56'),
(17, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:27:18', 'shelleymyl', '2016-08-24 09:27:18'),
(18, 25, 4, 22, 2, '', 'shelleymyl', '2016-08-24 09:28:27', 'shelleymyl', '2016-08-24 09:28:27'),
(19, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:29:39', 'shelleymyl', '2016-08-24 09:29:39'),
(20, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:30:06', 'shelleymyl', '2016-08-24 09:30:06'),
(21, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:32:07', 'shelleymyl', '2016-08-24 09:32:07'),
(22, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:32:18', 'shelleymyl', '2016-08-24 09:32:18'),
(23, 25, 3, 24, 2, '', 'shelleymyl', '2016-08-24 09:33:21', 'shelleymyl', '2016-08-24 09:33:21'),
(24, 25, 3, 21, 2, '', 'shelleymyl', '2016-08-24 09:35:20', 'shelleymyl', '2016-08-24 09:35:20'),
(25, 25, 2, 3, 2, '', 'shelleymyl', '2016-08-24 09:49:42', 'shelleymyl', '2016-08-24 09:49:42'),
(26, 25, 11, 31, 2, '', 'shelleymyl', '2016-08-24 09:50:40', 'shelleymyl', '2016-08-24 09:50:40'),
(27, 25, 9, 28, 2, '', 'shelleymyl', '2016-08-24 10:00:14', 'shelleymyl', '2016-08-24 10:00:14'),
(28, 25, 1, 13, 2, '', 'shelleymyl', '2016-08-24 10:40:20', 'shelleymyl', '2016-08-24 10:40:20'),
(29, 25, 1, 4, 2, '', 'shelleymyl', '2016-08-24 11:57:25', 'shelleymyl', '2016-08-24 11:57:25'),
(30, 25, 1, 2, 2, '', 'shelleymyl', '2016-08-24 13:23:05', 'shelleymyl', '2016-08-24 13:23:05'),
(31, 25, 1, 5, 2, '', 'shelleymyl', '2016-08-24 16:24:07', 'shelleymyl', '2016-08-24 16:24:07'),
(32, 25, 1, 6, 2, '', 'shelleymyl', '2016-08-24 19:44:31', 'shelleymyl', '2016-08-24 19:44:31'),
(33, 36, 1, 6, 2, '', 'mao', '2016-08-24 22:51:23', 'mao', '2016-08-24 22:51:23'),
(34, 37, 3, 24, 1, '', 'nihao', '2016-08-24 23:13:16', 'nihao', '2016-08-24 23:13:16'),
(35, 37, 3, 21, 1, '', 'nihao', '2016-08-24 23:14:33', 'nihao', '2016-08-24 23:14:33'),
(36, 72, 3, 24, 1, '', '0', '2016-08-26 20:22:56', '0', '2016-08-26 20:22:56'),
(37, 73, 3, 24, 1, '', '0', '2016-08-26 20:29:05', '0', '2016-08-26 20:29:05'),
(38, 74, 3, 24, 1, '', '1112', '2016-08-26 20:32:57', '1112', '2016-08-26 20:32:57'),
(39, 36, 11, 30, 2, '', 'mao', '2016-08-26 20:46:25', 'mao', '2016-08-26 20:46:25'),
(40, 75, 11, 30, 2, '', '2147483647', '2016-08-26 20:47:31', '2147483647', '2016-08-26 20:47:31'),
(41, 75, 6, 25, 2, '', '44444444444', '2016-08-26 20:49:02', '44444444444', '2016-08-26 20:49:02'),
(42, 75, 2, 3, 2, '', '44444444444', '2016-08-26 20:49:14', '44444444444', '2016-08-26 20:49:14'),
(43, 33, 4, 22, 2, '', 'admin', '2016-08-29 22:18:58', 'admin', '2016-08-29 22:18:58'),
(44, 33, 6, 25, 1, '', 'admin', '2016-08-29 22:41:15', 'admin', '2016-08-29 22:41:15');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_appointment_his`
--

DROP TABLE IF EXISTS `fd_rel_customer_appointment_his`;
CREATE TABLE IF NOT EXISTS `fd_rel_customer_appointment_his` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` varchar(50) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_customer_appointment_his`
--

INSERT INTO `fd_rel_customer_appointment_his` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `OPERATOR_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-23 19:10:16', 'shelleymyl', '2016-08-23 19:10:16'),
(2, 25, 4, 22, '1', 'A', '', 'shelleymyl', '2016-08-23 19:12:50', 'shelleymyl', '2016-08-23 19:12:50'),
(3, 25, 7, 26, '1', 'A', '', 'shelleymyl', '2016-08-23 19:16:11', 'shelleymyl', '2016-08-23 19:16:11'),
(4, 25, 10, 29, '1', 'A', '', 'shelleymyl', '2016-08-23 19:17:15', 'shelleymyl', '2016-08-23 19:17:15'),
(5, 25, 11, 32, '1', 'A', '', 'shelleymyl', '2016-08-23 19:22:55', 'shelleymyl', '2016-08-23 19:22:55'),
(6, 25, 11, 30, '1', 'A', '', 'shelleymyl', '2016-08-23 19:23:32', 'shelleymyl', '2016-08-23 19:23:32'),
(7, 25, 7, 26, '1', 'A', '', 'shelleymyl', '2016-08-23 19:23:51', 'shelleymyl', '2016-08-23 19:23:51'),
(8, 25, 7, 26, '1', 'A', '', 'shelleymyl', '2016-08-23 21:13:40', 'shelleymyl', '2016-08-23 21:13:40'),
(9, 25, 7, 26, '1', 'A', '', 'shelleymyl', '2016-08-23 21:14:57', 'shelleymyl', '2016-08-23 21:14:57'),
(10, 25, 8, 27, '1', 'A', '', 'shelleymyl', '2016-08-23 21:16:12', 'shelleymyl', '2016-08-23 21:16:12'),
(11, 25, 8, 27, '1', 'A', '', 'shelleymyl', '2016-08-23 21:16:32', 'shelleymyl', '2016-08-23 21:16:32'),
(12, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:09:33', 'shelleymyl', '2016-08-24 09:09:33'),
(13, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:26:26', 'shelleymyl', '2016-08-24 09:26:26'),
(14, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:26:31', 'shelleymyl', '2016-08-24 09:26:31'),
(15, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:26:56', 'shelleymyl', '2016-08-24 09:26:56'),
(16, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:27:18', 'shelleymyl', '2016-08-24 09:27:18'),
(17, 25, 4, 22, '1', 'A', '', 'shelleymyl', '2016-08-24 09:28:27', 'shelleymyl', '2016-08-24 09:28:27'),
(18, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:29:39', 'shelleymyl', '2016-08-24 09:29:39'),
(19, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:30:06', 'shelleymyl', '2016-08-24 09:30:06'),
(20, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:32:07', 'shelleymyl', '2016-08-24 09:32:07'),
(21, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:32:18', 'shelleymyl', '2016-08-24 09:32:18'),
(22, 25, 3, 24, '1', 'A', '', 'shelleymyl', '2016-08-24 09:33:21', 'shelleymyl', '2016-08-24 09:33:21'),
(23, 25, 3, 21, '1', 'A', '', 'shelleymyl', '2016-08-24 09:35:20', 'shelleymyl', '2016-08-24 09:35:20'),
(24, 25, 2, 3, '1', 'A', '', 'shelleymyl', '2016-08-24 09:49:42', 'shelleymyl', '2016-08-24 09:49:42'),
(25, 25, 11, 31, '1', 'A', '', 'shelleymyl', '2016-08-24 09:50:40', 'shelleymyl', '2016-08-24 09:50:40'),
(26, 25, 9, 28, '1', 'A', '', 'shelleymyl', '2016-08-24 10:00:14', 'shelleymyl', '2016-08-24 10:00:14'),
(27, 25, 1, 13, '1', 'A', '', 'shelleymyl', '2016-08-24 10:40:20', 'shelleymyl', '2016-08-24 10:40:20'),
(28, 25, 1, 4, '1', 'A', '', 'shelleymyl', '2016-08-24 11:57:25', 'shelleymyl', '2016-08-24 11:57:25'),
(29, 25, 1, 2, '1', 'A', '', 'shelleymyl', '2016-08-24 13:23:05', 'shelleymyl', '2016-08-24 13:23:05'),
(30, 25, 1, 5, '1', 'A', '', 'shelleymyl', '2016-08-24 16:24:07', 'shelleymyl', '2016-08-24 16:24:07'),
(31, 25, 1, 6, '1', 'A', '', 'shelleymyl', '2016-08-24 19:44:31', 'shelleymyl', '2016-08-24 19:44:31'),
(32, 36, 1, 6, '1', 'A', '', 'mao', '2016-08-24 22:51:23', 'mao', '2016-08-24 22:51:23'),
(33, 37, 3, 24, '1', 'A', '', 'nihao', '2016-08-24 23:13:16', 'nihao', '2016-08-24 23:13:16'),
(34, 37, 3, 21, '1', 'A', '', 'nihao', '2016-08-24 23:14:33', 'nihao', '2016-08-24 23:14:33'),
(35, 72, 3, 24, '1', 'A', '', '0', '2016-08-26 20:22:56', '0', '2016-08-26 20:22:56'),
(36, 73, 3, 24, '1', 'A', '', '0', '2016-08-26 20:29:05', '0', '2016-08-26 20:29:05'),
(37, 74, 3, 24, '1', 'A', '', '1112', '2016-08-26 20:32:57', '1112', '2016-08-26 20:32:57'),
(38, 36, 11, 30, '1', 'A', '', 'mao', '2016-08-26 20:46:25', 'mao', '2016-08-26 20:46:25'),
(39, 75, 11, 30, '1', 'A', '', '2147483647', '2016-08-26 20:47:31', '2147483647', '2016-08-26 20:47:31'),
(40, 75, 6, 25, '1', 'A', '', '44444444444', '2016-08-26 20:49:02', '44444444444', '2016-08-26 20:49:02'),
(41, 75, 2, 3, '1', 'A', '', '44444444444', '2016-08-26 20:49:14', '44444444444', '2016-08-26 20:49:14'),
(42, 33, 4, 22, '1', 'A', '', 'admin', '2016-08-29 22:18:58', 'admin', '2016-08-29 22:18:58'),
(43, 33, 6, 25, '1', 'A', '', 'admin', '2016-08-29 22:41:15', 'admin', '2016-08-29 22:41:15');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_doctor`
--

DROP TABLE IF EXISTS `fd_rel_customer_doctor`;
CREATE TABLE IF NOT EXISTS `fd_rel_customer_doctor` (
  `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_DOCTOR_ID`),
  KEY `FK_fd_rel_customer_doctor_1` (`CUSTOMER_USER_ID`),
  KEY `FK_fd_rel_customer_doctor_2` (`DOCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_customer_doctor`
--

INSERT INTO `fd_rel_customer_doctor` (`CUSTOMER_DOCTOR_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(15, 43, 1, '', '1', '2016-08-29 20:35:00', '1', '2016-08-29 20:35:00'),
(17, 33, 4, '', 'admin', '2016-08-29 22:41:29', 'admin', '2016-08-29 22:41:29');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_doctor_appointment_time`
--

DROP TABLE IF EXISTS `fd_rel_doctor_appointment_time`;
CREATE TABLE IF NOT EXISTS `fd_rel_doctor_appointment_time` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` date NOT NULL,
  `APPOINTMENT_TIME` time NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`),
  KEY `FK_fd_rel_doctor_appointment_time_1` (`DOCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_doctor_appointment_time`
--

INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_DATE`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 1, '2016-08-30', '08:30:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 1, '2016-08-30', '09:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 2, '2016-08-30', '08:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(4, 1, '2016-08-30', '08:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(5, 1, '2016-08-30', '09:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(6, 1, '2016-08-30', '10:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(7, 1, '2016-08-30', '10:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(8, 1, '2016-09-25', '11:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(9, 1, '2016-08-30', '11:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(10, 1, '2016-08-30', '12:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(11, 1, '2016-08-30', '12:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(12, 1, '2016-08-30', '13:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(13, 1, '2016-08-30', '13:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(14, 1, '2016-08-30', '14:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(15, 1, '2016-08-30', '14:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(16, 1, '2016-08-30', '15:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(17, 1, '2016-08-30', '15:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(18, 1, '2016-08-30', '16:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(19, 1, '2016-08-30', '16:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(20, 1, '2016-09-30', '17:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(21, 3, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(22, 4, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(23, 5, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(24, 3, '2016-08-30', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(25, 6, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(26, 7, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(27, 8, '2016-08-30', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(28, 9, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(29, 10, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(30, 11, '2016-08-30', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(31, 11, '2016-08-30', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(32, 11, '2016-08-30', '09:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_doctor_appointment_time_his`
--

DROP TABLE IF EXISTS `fd_rel_doctor_appointment_time_his`;
CREATE TABLE IF NOT EXISTS `fd_rel_doctor_appointment_time_his` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` datetime NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_role`
--

DROP TABLE IF EXISTS `fd_role`;
CREATE TABLE IF NOT EXISTS `fd_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_save_search`
--

DROP TABLE IF EXISTS `fd_save_search`;
CREATE TABLE IF NOT EXISTS `fd_save_search` (
  `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `SEARCH_NAME` varchar(50) NOT NULL,
  `CLINIC_ADDR` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(50) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `APPOINTMENT_TIME` varchar(50) NOT NULL,
  `DISTANCE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_SEARCH_ID`),
  KEY `FK_FD_SAVE_SEARCH_1` (`CUSTOMER_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_save_search`
--

INSERT INTO `fd_save_search` (`CUSTOMER_SEARCH_ID`, `CUSTOMER_USER_ID`, `SEARCH_NAME`, `CLINIC_ADDR`, `CLINIC_NAME`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `APPOINTMENT_TIME`, `DISTANCE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(13, 33, '', '朝阳区', '', '', '', '', 'ANAY', 'admin', '2016-08-29 22:34:35', 'admin', '2016-08-29 22:34:35');

-- --------------------------------------------------------

--
-- 表的结构 `fd_user`
--

DROP TABLE IF EXISTS `fd_user`;
CREATE TABLE IF NOT EXISTS `fd_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(50) NOT NULL,
  `LOGIN_PWD` varchar(50) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `USER_GENDER` varchar(50) NOT NULL,
  `USER_TEL` varchar(50) NOT NULL,
  `ROLE_ID` varchar(50) NOT NULL,
  `USER_ADDR` varchar(200) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CONTAIN_USER` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 限制导出的表
--

--
-- 限制表 `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  ADD CONSTRAINT `FK_fd_rel_clinic_doctor_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `fd_doctor` (`DOCTOR_ID`),
  ADD CONSTRAINT `FK_fd_rel_clinic_doctor_2` FOREIGN KEY (`CLINIC_USER_ID`) REFERENCES `fd_clinic_user` (`CLINIC_USER_ID`);

--
-- 限制表 `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  ADD CONSTRAINT `FK_fd_rel_customer_appointment_1` FOREIGN KEY (`CUSTOMER_USER_ID`) REFERENCES `fd_customer_user` (`CUSTOMER_USER_ID`),
  ADD CONSTRAINT `FK_fd_rel_customer_appointment_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `fd_doctor` (`DOCTOR_ID`),
  ADD CONSTRAINT `FK_fd_rel_customer_appointment_3` FOREIGN KEY (`DOCTOR_APPOINTMENT_TIME_ID`) REFERENCES `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`),
  ADD CONSTRAINT `FK_fd_rel_customer_appointment_4` FOREIGN KEY (`APPOINTMENT_STATUS_ID`) REFERENCES `fd_dict_appointment_status` (`APPOINTMENT_STATUS_ID`);

--
-- 限制表 `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  ADD CONSTRAINT `FK_fd_rel_customer_doctor_1` FOREIGN KEY (`CUSTOMER_USER_ID`) REFERENCES `fd_customer_user` (`CUSTOMER_USER_ID`),
  ADD CONSTRAINT `FK_fd_rel_customer_doctor_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `fd_doctor` (`DOCTOR_ID`);

--
-- 限制表 `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  ADD CONSTRAINT `FK_fd_rel_doctor_appointment_time_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `fd_doctor` (`DOCTOR_ID`);

--
-- 限制表 `fd_save_search`
--
ALTER TABLE `fd_save_search`
  ADD CONSTRAINT `FK_FD_SAVE_SEARCH_1` FOREIGN KEY (`CUSTOMER_USER_ID`) REFERENCES `fd_customer_user` (`CUSTOMER_USER_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

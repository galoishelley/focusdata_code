-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-16 18:34:52
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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00', 'admin', '2016-09-09 16:47:07');

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
  `CLINIC_POSTCODE` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CLINIC_USER_ID`),
  KEY `FK_fd_clinic_user_2` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_NAME`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_ADDR`, `CLINIC_POSTCODE`, `CLINIC_SUBURB`, `STATE_ID`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'shelleymyl', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com11', '中华人民共和国吉林省长春市吉林大学第一医院', '吉林省长春市前进大街8811号1', '130066', '绿园区', 5, 0, NULL, 'shelleymyl', '2016-08-13 12:11:10', 'admin', '2016-09-13 14:56:01'),
(2, 'shelleymyl', '3d9017e3b14d093e63b205487bee0354', 'shelleymyl@gmail.com', '市诊所', '南阳路88号', '130012', '绿园区', 2, 0, NULL, 'shelleymyl', '2016-08-13 12:11:39', 'admin', '2016-09-11 21:50:55'),
(3, 'shelleymylee1', '80db46b43939c503e20d5c28b61a689e', 'shelleymyl@gmail.com', '朝阳区诊所1', '朝阳区1', '130012', '绿园区', 8, 0, NULL, 'shelleymyl', '2016-08-13 12:11:50', 'admin', '2016-09-11 21:50:22'),
(4, 'shelleymyl221', 'myl1102', 'shelleymyl@gmail.com1', '绿园区诊所1', '绿园区1', '130012', '绿园区', 2, 0, NULL, 'shelleymyl', '2016-08-15 12:08:47', 'admin', '2016-09-01 16:20:53'),
(5, 'yinxin', 'yinxin', 'shelleymyl@gmail.com', '1', '1', '130012', '朝阳区', 2, 1, NULL, 'shelleymyl', '2016-08-24 16:28:50', 'shelleymyl', '2016-08-24 16:28:50'),
(6, 'Miaoyl', 'bdfb51e038e40bde21cbd1219c971b55', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 3, 1, NULL, 'shelleymyl', '2016-08-24 16:31:50', 'admin', '2016-09-10 10:47:19'),
(7, 'shelleymyl111', 'myl1102111', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 1, NULL, 'shelleymyl', '2016-08-24 16:33:17', 'shelleymyl', '2016-08-24 16:33:17'),
(8, 'yinxin123', 'yinxin123', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 7, 1, NULL, 'yinxin123', '2016-08-24 21:42:45', 'admin', '2016-09-10 10:47:06'),
(9, 'mao', 'mao', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 0, NULL, 'mao', '2016-08-24 21:43:42', 'admin', '2016-09-13 15:59:18'),
(10, 'miao', 'miao', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 0, NULL, 'miao', '2016-09-01 15:07:02', 'miao', '2016-09-01 15:07:02'),
(11, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '吉大一院', '碧水云天14#3门806室', '130012', '绿园区', 2, 1, NULL, 'admin', '2016-09-01 16:53:28', 'admin', '2016-09-13 14:08:13'),
(12, 'fuy', '1', 'shelleymyl@gmail.com', '吉林大学第一医院', '新民广场1102号', '130012', '绿园区', 2, 1, NULL, 'fuy', '2016-09-06 10:30:19', 'admin', '2016-09-06 11:26:52'),
(13, 'miaoyz', '422a1cd6e66f71337187fe049e7e64a8', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 1, 1, NULL, 'miaoyz', '2016-09-08 23:14:42', 'admin', '2016-09-10 10:52:03'),
(14, '111', '6512bd43d9caa6e02c990b0a82652dca', 'shelleymyl@gmail.com', '1', '11', '130012', '绿园区', 3, 1, NULL, '111', '2016-09-12 21:32:27', '111', '2016-09-12 21:32:27'),
(15, '耗子想猫猫', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '吉林人民诊所', '人民大街881号', '130012', '绿园区', 1, 1, NULL, '耗子想猫猫', '2016-09-12 21:33:01', '耗子想猫猫', '2016-09-12 21:39:39'),
(16, '小石头', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '南阳路诊所', '南阳路881号', '130012', '绿园区', 4, 1, NULL, '小石头', '2016-09-13 09:28:26', '小石头', '2016-09-13 09:28:26'),
(17, '123', 'c4ca4238a0b923820dcc509a6f75849b', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 3, 1, NULL, '123', '2016-09-13 10:15:38', '123', '2016-09-13 10:15:38'),
(18, '123222', '202cb962ac59075b964b07152d234b70', 'shelleymyl@gmail.com', '1', '1', '130012', '', 3, 1, NULL, '123222', '2016-09-13 10:16:35', '123222', '2016-09-13 10:16:35'),
(19, '11', 'c4ca4238a0b923820dcc509a6f75849b', 'shelleymyl@gmail.com', '1', '1', '130088', '绿园区1', 2, 1, NULL, '11', '2016-09-13 10:21:04', 'admin', '2016-09-13 14:55:41');

-- --------------------------------------------------------

--
-- 表的结构 `fd_customer_user`
--

DROP TABLE IF EXISTS `fd_customer_user`;
CREATE TABLE IF NOT EXISTS `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_USER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_USER_PWD` varchar(50) NOT NULL,
  `CUSTOMER_USER_MAIL` varchar(50) NOT NULL,
  `CUSTOMER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_GENDER` varchar(10) NOT NULL,
  `CUSTOMER_BIRTHDAY` varchar(50) NOT NULL,
  `CUSTOMER_ADDR` varchar(200) NOT NULL,
  `CUSTOMER_POSTCODE` varchar(50) NOT NULL,
  `CUSTOMER_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `CUSTOMER_PHONE_NO` varchar(50) NOT NULL,
  `MEDICAL_CARD_NO` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL DEFAULT '1',
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_USER_ID`),
  KEY `FK_fd_customer_user_7` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_NAME`, `CUSTOMER_USER_PWD`, `CUSTOMER_USER_MAIL`, `CUSTOMER_NAME`, `CUSTOMER_GENDER`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_POSTCODE`, `CUSTOMER_SUBURB`, `STATE_ID`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(25, 'shelleymyl111123', 'myl1102', 'shelleymyl@gmail.com', '尹小猫', '男', '1985-11-021111123', '碧水云天12#80611123', '', '', 1, '1350089823411123', '123456678911123', 0, '', 'shelleymyl', '2016-08-12 22:50:01', 'shelleymyl', '2016-08-12 22:50:01'),
(26, 'xinsj', '123', 'shelleymyl@gmail.com', '尹小猫', '男', '19831111', '吉林长春', '', '', 1, '18686420139', '123456789', 1, '', 'shelleymyl', '2016-08-13 10:40:17', 'shelleymyl', '2016-08-13 10:40:17'),
(27, 'xinsj', 'myl1102', 'shelleymyl@gmail.com', '尹小猫', '男', '19831111', '吉林长春', '', '', 1, '18686420139', '123456789', 1, '', 'shelleymyl', '2016-08-13 11:13:37', 'shelleymyl', '2016-08-13 11:13:37'),
(28, 'sb', 'eaf15b474d3fd3cf367dd6ac05bc8ed9', 'shelleymyl@gmail.com', '尹小猫', '女', '831007', '白城', '', '', 1, '13500898234', '789', 1, '', 'shelleymyl', '2016-08-13 11:15:52', 'admin', '2016-09-09 16:42:52'),
(29, '你好', 'myl1102', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'shelleymyl', '2016-08-13 11:35:21', 'shelleymyl', '2016-08-13 11:35:21'),
(30, '你要', 'myl1102', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'shelleymyl', '2016-08-13 11:35:35', 'shelleymyl', '2016-08-13 11:35:35'),
(31, 'miaoyl', 'miaoyl', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'shelleymyl', '2016-08-24 16:24:34', 'shelleymyl', '2016-08-24 16:24:34'),
(32, 'yinxin', 'yinxin', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'shelleymyl', '2016-08-24 16:28:24', 'shelleymyl', '2016-08-24 16:28:24'),
(33, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '尹小猫', '女', '1985-11-02', '我的家园36#102', '130022', '朝阳区', 2, '1eeeee111', '1e111', 0, '', 'admin', '2016-08-24 21:15:18', 'admin', '2016-09-13 14:13:54'),
(34, 'admin123', 'admin123', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 0, '', 'admin123', '2016-08-24 21:19:27', 'admin123', '2016-08-24 21:19:27'),
(35, 'yinxin123', 'yinxin123', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'yinxin123', '2016-08-24 21:29:08', 'yinxin123', '2016-08-24 21:29:08'),
(36, '333', 'mao', 'shelleymyl@gmail.com', '尹小猫', '男', '11', '11', '', '', 1, '11', '11', 1, '', 'mao', '2016-08-24 21:43:29', 'mao', '2016-08-24 21:43:29'),
(37, 'nihao', 'nihao', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'nihao', '2016-08-24 23:11:19', 'nihao', '2016-08-24 23:11:19'),
(38, '333', '333', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', '333', '2016-08-26 15:28:57', '333', '2016-08-26 15:28:57'),
(39, '7', '7', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', '7', '2016-08-26 15:29:42', '7', '2016-08-26 15:29:42'),
(40, '6', '6', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', '6', '2016-08-26 15:29:58', '6', '2016-08-26 15:29:58'),
(41, 'ee', 'ee', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'ee', '2016-08-26 15:30:31', 'ee', '2016-08-26 15:30:31'),
(42, 'dd', 'dd', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'dd', '2016-08-26 15:30:41', 'dd', '2016-08-26 15:30:41'),
(43, '1', '111', 'shelleymyl@gmail.com', '尹小猫', '男', '1985-11-02', '1', '', '', 1, '1', '1', 0, '', '1', '2016-08-26 15:34:17', '1', '2016-08-29 21:44:03'),
(44, 'e', 'e', 'shelleymyl@gmail.com', '尹小猫', '男', 'e', 'e', '', '', 1, 'e', 'e', 1, '', 'e', '2016-08-26 15:38:19', 'e', '2016-08-26 15:38:19'),
(45, 'd', 'd', 'shelleymyl@gmail.com', '尹小猫', '男', 'd', 'd', '', '', 1, 'd', 'd', 1, '', 'd', '2016-08-26 15:39:13', 'd', '2016-08-26 15:39:13'),
(46, '33', '33', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3', '3', 1, '', '33', '2016-08-26 15:41:37', '33', '2016-08-26 15:41:37'),
(47, '3', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '33', '3', '', '', 1, '3', '3', 1, '', '3', '2016-08-26 15:44:41', '3', '2016-08-26 15:44:41'),
(48, '323', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '33', '', '', 1, '3', '3', 1, '', '323', '2016-08-26 15:45:19', '323', '2016-08-26 15:45:19'),
(49, '444', '44', 'shelleymyl@gmail.com', '尹小猫', '男', '44', '4', '', '', 1, '4', '4', 1, '', '444', '2016-08-26 16:23:48', '444', '2016-08-26 16:23:48'),
(50, '饿', 'e', 'shelleymyl@gmail.com', '尹小猫', '男', 'e', 'e', '', '', 1, '男', '等等', 1, '', '饿', '2016-08-26 19:20:02', '饿', '2016-08-26 19:20:02'),
(51, '444444', '44444', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', '444444', '2016-08-26 19:33:30', '444444', '2016-08-26 19:33:30'),
(52, '111111111111111111', '11', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 1, '', '111111111111111111', '2016-08-26 19:38:00', '111111111111111111', '2016-08-26 19:38:00'),
(53, '5555555555', '5', 'shelleymyl@gmail.com', '尹小猫', '男', '5', '5', '', '', 1, '5', '5', 1, '', '5555555555', '2016-08-26 19:38:50', '5555555555', '2016-08-26 19:38:50'),
(54, '6666666666666', '6', 'shelleymyl@gmail.com', '尹小猫', '男', '6', '6', '', '', 1, '6', '6', 1, '', '6666666666666', '2016-08-26 19:40:29', '6666666666666', '2016-08-26 19:40:29'),
(55, '22222222', '22', 'shelleymyl@gmail.com', '尹小猫', '男', '2', '2', '', '', 1, '2', '2', 1, '', '22222222', '2016-08-26 19:41:50', '22222222', '2016-08-26 19:41:50'),
(56, '44444444444444', '4', 'shelleymyl@gmail.com', '尹小猫', '男', '4', '4', '', '', 1, '4', '4', 1, '', '44444444444444', '2016-08-26 19:44:33', '44444444444444', '2016-08-26 19:44:33'),
(57, '77777', '77', 'shelleymyl@gmail.com', '尹小猫', '男', '7', '7', '', '', 1, '7', '7', 1, '', '77777', '2016-08-26 19:46:32', '77777', '2016-08-26 19:46:32'),
(58, '5555555555555', '5', 'shelleymyl@gmail.com', '尹小猫', '男', '5', '55', '', '', 1, '5', '5', 1, '', '5555555555555', '2016-08-26 19:46:48', '5555555555555', '2016-08-26 19:46:48'),
(59, '44', '4', 'shelleymyl@gmail.com', '尹小猫', '男', '4', '4', '', '', 1, '4', '4', 1, '', '44', '2016-08-26 19:48:19', '44', '2016-08-26 19:48:19'),
(60, '333333333', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3', '3', 1, '', '333333333', '2016-08-26 19:49:25', '333333333', '2016-08-26 19:49:25'),
(61, '88888888888', '8', 'shelleymyl@gmail.com', '尹小猫', '男', '8', '8', '', '', 1, '8', '8', 1, '', '88888888888', '2016-08-26 19:50:51', '88888888888', '2016-08-26 19:50:51'),
(62, '66666', '6', 'shelleymyl@gmail.com', '尹小猫', '男', '6', '6', '', '', 1, '666', '6', 1, '', '66666', '2016-08-26 19:52:22', '66666', '2016-08-26 19:52:22'),
(63, '8788888', '8888', 'shelleymyl@gmail.com', '尹小猫', '男', '88', '8', '', '', 1, '88', '8', 1, '', '8788888', '2016-08-26 19:53:01', '8788888', '2016-08-26 19:53:01'),
(64, '8888888888888', '8', 'shelleymyl@gmail.com', '尹小猫', '男', '8', '8', '', '', 1, '8', '8', 1, '', '8888888888888', '2016-08-26 19:53:54', '8888888888888', '2016-08-26 19:53:54'),
(65, '888888888888888', '8', 'shelleymyl@gmail.com', '尹小猫', '男', '8', '8', '', '', 1, '8', '8', 1, '', '888888888888888', '2016-08-26 20:00:12', '888888888888888', '2016-08-26 20:00:12'),
(66, '88888888888888888888', '5', 'shelleymyl@gmail.com', '尹小猫', '男', '5', '55', '', '', 1, '5', '5', 1, '', '88888888888888888888', '2016-08-26 20:04:46', '88888888888888888888', '2016-08-26 20:04:46'),
(67, '111111111111', '1', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '111', '1', 1, '', '111111111111', '2016-08-26 20:11:23', '111111111111', '2016-08-26 20:11:23'),
(68, '3333333333', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3', '3', 1, '', '3333333333', '2016-08-26 20:16:44', '3333333333', '2016-08-26 20:16:44'),
(69, '33333333333', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '335', '', '', 1, '3', '3', 0, '', '33333333333', '2016-08-26 20:17:52', 'admin', '2016-09-01 22:08:32'),
(70, '66666666666', '6', 'shelleymyl@gmail.com', '尹小猫', '男', '6', '6', '', '', 1, '6', '6', 0, '', '66666666666', '2016-08-26 20:19:17', 'admin', '2016-09-01 22:08:15'),
(71, '333333333333', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3e', '3', 0, '', '333333333333', '2016-08-26 20:20:19', 'admin', '2016-09-01 22:09:06'),
(72, '呃1', '3', 'shelleymyl@gmail.com', '尹小猫1', '女', '1', '1', '', '', 1, '1', '1', 0, '', '呃呃呃呃呃呃呃呃呃呃呃呃', '2016-08-26 20:22:52', 'admin', '2016-09-01 22:11:34'),
(73, '呃呃呃呃呃呃呃呃呃呃呃呃饿', 'eeeee', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3', '3', 0, '', '呃呃呃呃呃呃呃呃呃呃呃呃饿', '2016-08-26 20:29:01', '呃呃呃呃呃呃呃呃呃呃呃呃饿', '2016-08-26 20:29:01'),
(74, '1112', '1', 'shelleymyl@gmail.com', '尹小猫', '男', '1', '1', '', '', 1, '1', '1', 0, '', '1112', '2016-08-26 20:32:54', '1112', '2016-08-26 20:32:54'),
(75, '44444444444', '3', 'shelleymyl@gmail.com', '尹小猫', '男', '3', '3', '', '', 1, '3', '3', 0, '', '44444444444', '2016-08-26 20:47:30', '44444444444', '2016-08-26 20:47:30'),
(76, 'miaomiao1', '1', 'shelleymyl@gmail.com', '尹小猫1', '女', '11', '11', '', '', 1, '11', '11', 0, '', 'miaomiao', '2016-09-01 15:06:45', 'admin', '2016-09-01 21:44:20'),
(77, '111', '111', 'shelleymyl@gmail.com', '1', '男', '', '1', '', '', 1, '1', '1', 1, '', '111', '2016-09-04 23:20:25', '111', '2016-09-04 23:20:25'),
(78, '222', '222', 'shelleymyl@gmail.com', '1', '男', '', '1', '', '', 1, '1', '1', 1, '', '222', '2016-09-04 23:21:58', '222', '2016-09-04 23:21:58'),
(79, '11', '11', 'shelleymyl@gmail.com', '11', '男', '', '1', '', '', 1, '1', '1', 1, '', '11', '2016-09-05 19:40:58', '11', '2016-09-05 19:40:58'),
(80, '1111', '1111', 'shelleymyl@gmail.com', '11', '男', '', '1', '', '', 1, '1', '1', 1, '', '1111', '2016-09-05 19:43:46', '1111', '2016-09-05 19:43:46'),
(81, '11111', '11111', 'shelleymyl@gmail.com', '11111', '男', '11111', '11111', '', '', 1, '11111', '11111', 1, '', '11111', '2016-09-05 20:04:19', '11111', '2016-09-05 20:04:19'),
(82, 'miaoys', '1', 'shelleymyl@gmail.com', '苗亚松', '男', '1988-7-30', '长春', '', '', 1, '13500898235', '123456789', 1, '', 'miaoys', '2016-09-05 20:45:47', 'miaoys', '2016-09-05 21:12:04'),
(83, 'xingsj', '1', 'shelleymyl@gmail.com1', '邢素杰', '女', '1965-11-4', '吉林长春', '', '', 1, '13500898234', '123456789', 0, '', 'xingsj', '2016-09-06 10:22:47', 'admin', '2016-09-09 15:29:15'),
(84, '1111111', 'helloworld', 'shelleymyl@gmail.com', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '1111111', '2016-09-08 22:53:32', '1111111', '2016-09-08 22:53:32'),
(85, 'maomao', 'e2145387bcc7842edef4ccecc34b7da4', 'shelleymyl@gmail.com', '猫猫', '男', '1', '1222222222222222', '', '', 1, '1', '1', 1, '', 'maomao', '2016-09-08 23:00:42', 'admin', '2016-09-09 15:41:51'),
(86, 'kitty', 'a2l0dHk=', 'shelleymyl@gmail.com', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'kitty', '2016-09-08 23:06:11', 'kitty', '2016-09-08 23:06:11'),
(87, 'miaoyz', '8da159974055eaa011272bd7b0d8fe0e', 'shelleymyl@gmail.com', 'miaoyz', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'miaoyz', '2016-09-08 23:13:02', 'admin', '2016-09-09 09:54:49'),
(88, 'eeeeee', '08a4415e9d594ff960030b921d42b91e', '', 'miaoyl', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'eeeeee', '2016-09-09 09:46:47', 'admin', '2016-09-09 09:57:13'),
(89, 'wwwwwwww', 'e34a8899ef6468b74f8a1048419ccc8b', '', '', '女', '1', '1', '', '', 1, '1', '1', 1, '', 'wwwwwwww', '2016-09-09 09:46:54', 'admin', '2016-09-09 15:13:00'),
(90, 'adminadmin', '21232f297a57a5a743894a0e4a801fc3', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', 'adminadmin', '2016-09-09 09:47:07', 'adminadmin', '2016-09-09 09:47:07'),
(91, '11111111', '698d51a19d8a121ce581499d7b701668', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '11111111', '2016-09-09 09:47:42', '11111111', '2016-09-09 09:47:42'),
(92, '2222222222', '934b535800b1cba8f96a5d72f72f1611', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '2222222222', '2016-09-09 09:47:52', '2222222222', '2016-09-09 09:47:52'),
(93, '33333333', '2be9bd7a3434f7038ca27d1918de58bd', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '33333333', '2016-09-09 09:47:58', '33333333', '2016-09-09 09:47:58'),
(94, '4444444444', 'dcb64c94e1b81cd1cd3eb4a73ad27d99', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '4444444444', '2016-09-09 09:48:03', '4444444444', '2016-09-09 09:48:03'),
(95, '55555555', '9079b6ee1d5ca04ab00e44e877a222ee', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '55555555', '2016-09-09 09:48:09', '55555555', '2016-09-09 09:48:09'),
(96, '6666666666', 'fae0b27c451c728867a567e8c1bb4e53', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '6666666666', '2016-09-09 09:48:15', '6666666666', '2016-09-09 09:48:15'),
(97, '77', '28dd2c7955ce926456240b2ff0100bde', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '77', '2016-09-09 09:48:24', '77', '2016-09-09 09:48:24'),
(98, '88', '2a38a4a9316c49e5a833517c45d31070', '', '', '男', '1', '1', '', '', 1, '1', '1', 1, '', '88', '2016-09-09 09:48:30', '88', '2016-09-09 09:48:30'),
(99, '99', 'cdb7e60ab6b01f0071b3d0ecfd82d6b5', 'EMAIL', '99', '女', '1', '1', '', '', 8, '1', '1', 1, '', '99', '2016-09-09 09:48:35', 'admin', '2016-09-11 21:33:21'),
(100, 'xinxin', '21232f297a57a5a743894a0e4a801fc3', '', '', '男', '1985-11-02', '1', '1', '1', 3, '1', '1', 1, '', 'xinxin', '2016-09-12 16:42:14', 'xinxin', '2016-09-12 16:42:14'),
(101, 'xinxin', '21232f297a57a5a743894a0e4a801fc3', '', '', '男', '1985-11-02', '1', '1', '1', 3, '1', '1', 1, '', 'xinxin', '2016-09-12 16:42:14', 'xinxin', '2016-09-12 16:42:14'),
(102, 'xinxin123', '21232f297a57a5a743894a0e4a801fc3', '', '', '男', '1', '1', '1', '1', 6, '1', '1', 1, '', 'xinxin123', '2016-09-12 16:44:06', 'xinxin123', '2016-09-12 16:44:06'),
(103, '想耗子', '21232f297a57a5a743894a0e4a801fc3', '', '', '男', '1985-11-02', '碧水云天14#3门806', '220013', '绿园区', 7, '13500898234', '123456789', 1, '', '想耗子', '2016-09-12 16:48:36', '想耗子', '2016-09-12 16:48:36'),
(104, '想猫猫', '37b57a830c2c7c69adbfba4ace0603a6', 'shelleymyl@gmail.com', '尹鑫', '女', '1983-11-11', '我的家园36#102', '130022', '南关区', 3, '13500898234', '123456789', 0, '', '想猫猫', '2016-09-12 16:52:17', '想猫猫', '2016-09-12 20:41:36'),
(105, 'miaoyl123', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', 'miaoyl123', '2016-09-12 17:48:08', 'miaoyl123', '2016-09-12 17:48:08'),
(106, '1111111111111', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '1111111111111', '2016-09-12 21:26:12', '1111111111111', '2016-09-12 21:26:12'),
(107, '小石头', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', 'Andrew', '男', '2015-11-25', '碧水云天14#3门806', '130012', '绿园区', 3, '13500898234', '1234567890', 1, '', '小石头', '2016-09-13 09:38:34', '小石头', '2016-09-13 09:38:34'),
(108, 'shitou', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', 'andrew', '男', '2015-11-25', '碧水云天', '130012', '绿园区', 2, '13500898234', '123456', 1, '', 'shitou', '2016-09-13 09:40:23', 'shitou', '2016-09-13 09:40:23'),
(109, '123', '202cb962ac59075b964b07152d234b70', '123', '123', '男', '1', '1', '1', '1', 2, '1', '1', 0, '', '123', '2016-09-13 09:42:27', 'admin', '2016-09-13 16:00:20'),
(110, '123456', '202cb962ac59075b964b07152d234b70', '123', '123', '男', '1985-11-02', '人民大街881号', '888888', '南关区', 2, '13500898234', '123', 0, '', '123456', '2016-09-13 09:44:08', 'admin', '2016-09-13 15:58:38'),
(111, '12345678', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '12345678', '2016-09-13 09:44:33', '12345678', '2016-09-13 09:44:33'),
(112, '1234788990', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '3', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '1234788990', '2016-09-13 09:49:10', '1234788990', '2016-09-13 09:49:10'),
(113, '54545454', 'a87ff679a2f3e71d9181a67b7542122c', '7', '7', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '54545454', '2016-09-13 09:57:51', '54545454', '2016-09-13 09:57:51'),
(114, '1113', '6512bd43d9caa6e02c990b0a82652dca', '111', '11', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '1113', '2016-09-13 10:02:31', '1113', '2016-09-13 10:02:31'),
(115, '2224', 'c81e728d9d4c2f636f067f89cc14862c', '22', '2', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '2224', '2016-09-13 10:03:15', '2224', '2016-09-13 10:03:15'),
(116, '1212', 'c81e728d9d4c2f636f067f89cc14862c', '2', '2', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '1212', '2016-09-13 10:06:18', '1212', '2016-09-13 10:06:18'),
(117, '12', 'c81e728d9d4c2f636f067f89cc14862c', '2', '2', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '12', '2016-09-13 10:06:51', '12', '2016-09-13 10:06:51'),
(118, '123123', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '123123', '2016-09-13 10:08:12', '123123', '2016-09-13 10:08:12'),
(119, '123456123', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '123456123', '2016-09-13 10:09:30', '123456123', '2016-09-13 10:09:30'),
(120, '1222', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '男', '1', '1', '1', '1', 3, '1', '1', 1, '', '1222', '2016-09-13 10:18:38', '1222', '2016-09-13 10:18:38');

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
-- 表的结构 `fd_dict_state`
--

DROP TABLE IF EXISTS `fd_dict_state`;
CREATE TABLE IF NOT EXISTS `fd_dict_state` (
  `STATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATE_NAME` varchar(50) NOT NULL,
  `STATE_POSTCODE` varchar(50) NOT NULL,
  PRIMARY KEY (`STATE_ID`),
  UNIQUE KEY `STATE_NAME` (`STATE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_state`
--

INSERT INTO `fd_dict_state` (`STATE_ID`, `STATE_NAME`, `STATE_POSTCODE`) VALUES
(1, 'QLD', ''),
(2, 'NSW', ''),
(3, 'ACT', ''),
(4, 'NT', ''),
(5, 'SA', ''),
(6, 'TAS', ''),
(7, 'VIC', ''),
(8, 'WA', '');

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
(1, '牙科', '尹鑫', '男', 1, 'miaoyl.jpg', '如果尽早治疗，根本不需要麻醉，补牙过程也异常简单，因为没有腐蚀到牙神经；而如果牙齿腐蚀的比较厉害接触要牙神经再来就诊，首先在治疗之前疼痛感比较强烈而且会伴随牙周炎等口腔炎症，麻醉过程中不会疼痛只会有肿胀感，麻醉后还是有一些不适。', '', 'admin', '2016-08-16 00:00:00', 'shelleymyl1', '2016-08-31 21:08:10'),
(2, '内科1', '苗亚柳1', '男', 1, 'bg_pic.jpg', 'gooddoctor0', '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, '牙科', '尹小猫', '女', 1, 'page1_pic3.jpg', '多张图片上传,显示...jquery多图片上传所属分类:输入-上传5041520085分享到:查看演示立即下载插件描述:多张图片上传,显示html部分', '1', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, '牙科', '尹小耗', '男', 1, 'page1_pic3.jpg', '骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了。', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(5, '外科1', 'helloworld', '男', 1, 'page1_pic4.jpg', '1111', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, '外科', 'world', '女', 1, 'page2_pic1.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(7, '外科', 'world php', '女', 1, 'page2_pic2.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(8, '外科', 'hello php', '女', 0, 'page2_pic3.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(9, '外科', 'nihap', '女', 1, 'page2_pic4.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10, '外科', '测试', '女', 1, 'page2_pic9.jpg', '123', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, '外科', '测试1', '女', 1, 'page2_pic8.jpg', 'datatables采用bootstrap的tab方式，表头会缩在一起，为什么？#9', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

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
(11, 11, 11, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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
(44, 33, 6, 25, 1, '', 'admin', '2016-08-29 22:41:15', 'admin', '2016-08-29 22:41:15'),
(45, 77, 8, 27, 1, '', '111', '2016-09-04 23:20:29', '111', '2016-09-04 23:20:29'),
(46, 78, 8, 27, 2, '', '222', '2016-09-04 23:22:03', '222', '2016-09-04 23:22:03'),
(47, 79, 1, 2, 1, '', '11', '2016-09-05 19:41:05', '11', '2016-09-05 19:41:05'),
(48, 80, 1, 1, 1, '', '1111', '2016-09-05 19:43:53', '1111', '2016-09-05 19:43:53'),
(49, 81, 5, 23, 1, '', '11111', '2016-09-05 20:04:20', '11111', '2016-09-05 20:04:20'),
(50, 82, 5, 23, 2, '', '0', '2016-09-05 20:45:48', '0', '2016-09-05 20:45:48'),
(51, 83, 11, 31, 2, '', '0', '2016-09-06 10:22:49', '0', '2016-09-06 10:22:49'),
(52, 33, 5, 23, 1, '', 'admin', '2016-09-06 12:54:27', 'admin', '2016-09-06 12:54:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

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
(43, 33, 6, 25, '1', 'A', '', 'admin', '2016-08-29 22:41:15', 'admin', '2016-08-29 22:41:15'),
(44, 77, 8, 27, '1', 'A', '', '111', '2016-09-04 23:20:29', '111', '2016-09-04 23:20:29'),
(45, 78, 8, 27, '1', 'A', '', '222', '2016-09-04 23:22:03', '222', '2016-09-04 23:22:03'),
(46, 79, 1, 2, '1', 'A', '', '11', '2016-09-05 19:41:05', '11', '2016-09-05 19:41:05'),
(47, 80, 1, 1, '1', 'A', '', '1111', '2016-09-05 19:43:53', '1111', '2016-09-05 19:43:53'),
(48, 81, 5, 23, '1', 'A', '', '11111', '2016-09-05 20:04:20', '11111', '2016-09-05 20:04:20'),
(49, 82, 5, 23, '1', 'A', '', '0', '2016-09-05 20:45:48', '0', '2016-09-05 20:45:48'),
(50, 83, 11, 31, '1', 'A', '', '0', '2016-09-06 10:22:49', '0', '2016-09-06 10:22:49'),
(51, 33, 5, 23, '1', 'A', '', 'admin', '2016-09-06 12:54:27', 'admin', '2016-09-06 12:54:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_customer_doctor`
--

INSERT INTO `fd_rel_customer_doctor` (`CUSTOMER_DOCTOR_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(15, 43, 1, '', '1', '2016-08-29 20:35:00', '1', '2016-08-29 20:35:00'),
(17, 33, 4, '', 'admin', '2016-08-29 22:41:29', 'admin', '2016-08-29 22:41:29'),
(19, 82, 7, '', 'miaoys', '2016-09-05 21:23:14', 'miaoys', '2016-09-05 21:23:14'),
(21, 33, 5, '', 'admin', '2016-09-06 12:54:26', 'admin', '2016-09-06 12:54:26');

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
(1, 1, '2016-09-05', '08:30:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 1, '2016-09-05', '09:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 2, '2016-09-04', '08:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(4, 1, '2016-09-04', '08:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(5, 1, '2016-09-04', '09:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(6, 1, '2016-09-04', '10:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(7, 1, '2016-09-04', '10:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(8, 1, '2016-09-04', '11:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(9, 1, '2016-09-04', '11:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(10, 1, '2016-09-04', '12:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(11, 1, '2016-09-04', '12:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(12, 1, '2016-09-04', '13:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(13, 1, '2016-09-04', '13:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(14, 1, '2016-09-04', '14:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(15, 1, '2016-09-04', '14:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(16, 1, '2016-09-04', '15:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(17, 1, '2016-09-04', '15:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(18, 1, '2016-09-04', '16:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(19, 1, '2016-09-04', '16:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(20, 1, '2016-09-04', '17:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(21, 3, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(22, 4, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(23, 5, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(24, 3, '2016-09-04', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(25, 6, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(26, 7, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(27, 8, '2016-09-04', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(28, 9, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(29, 10, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(30, 11, '2016-09-04', '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(31, 11, '2016-09-04', '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(32, 11, '2016-09-04', '09:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00');

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
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `STATE_NAME` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(50) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DISTANCE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_SEARCH_ID`),
  KEY `FK_FD_SAVE_SEARCH_1` (`CUSTOMER_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_save_search`
--

INSERT INTO `fd_save_search` (`CUSTOMER_SEARCH_ID`, `CUSTOMER_USER_ID`, `SEARCH_NAME`, `CLINIC_SUBURB`, `STATE_NAME`, `CLINIC_NAME`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DISTANCE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(15, 82, '', '', 'ACT', '', '', '', 'ANAY', 'miaoys', '2016-09-05 21:46:22', 'miaoys', '2016-09-05 21:46:22'),
(16, 82, '', '', 'ACT', '', '', '', 'ANAY', 'miaoys', '2016-09-05 21:47:10', 'miaoys', '2016-09-05 21:47:10'),
(18, 83, '', '', 'ACT', '市', '牙科', '鑫', 'ANAY', 'xingsj', '2016-09-06 10:24:30', 'xingsj', '2016-09-06 10:24:30'),
(24, 33, '', '朝阳区', 'ACT', '人民诊所', '外科', '尹小猫', '5km', 'admin', '2016-09-13 20:22:49', 'admin', '2016-09-13 20:22:49'),
(26, 33, '', '朝阳区', 'ACT', '人民诊所', '内科1', '尹小猫', '5km', 'admin', '2016-09-13 20:24:19', 'admin', '2016-09-13 20:24:19'),
(27, 33, '', '绿园区', 'ACT', '2', '内科1', '2', '5km', 'admin', '2016-09-13 20:35:02', 'admin', '2016-09-13 20:35:02'),
(28, 33, '', '', 'ACT', '2', '内科1', '2', '5km', 'admin', '2016-09-13 20:35:06', 'admin', '2016-09-13 20:35:06');

-- --------------------------------------------------------

--
-- 表的结构 `fd_service`
--

DROP TABLE IF EXISTS `fd_service`;
CREATE TABLE IF NOT EXISTS `fd_service` (
  `SERVICE_CODE` int(11) NOT NULL AUTO_INCREMENT,
  `SERVICE_ID` varchar(50) NOT NULL,
  `DES` varchar(50) NOT NULL,
  `SERVICE_JS` varchar(50) NOT NULL,
  `URL` varchar(50) NOT NULL,
  `INPUT_PARA` varchar(300) NOT NULL,
  `OUTPUT_PARA` varchar(50) NOT NULL,
  `NOTE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`SERVICE_CODE`),
  UNIQUE KEY `SERVICE_ID` (`SERVICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_service`
--

INSERT INTO `fd_service` (`SERVICE_CODE`, `SERVICE_ID`, `DES`, `SERVICE_JS`, `URL`, `INPUT_PARA`, `OUTPUT_PARA`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(4, 'UI01', '用户登录', 'sign_in.js', 'url: "classes/class.sign_in.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(5, 'UI02', '获取用户详细信息(条件用户名)', 'appointmentDoctor.js', 'url: "classes/class.UserDetail.php",', 'username: username', '用户详细信息', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(6, 'UI03', '获取用户详细信息(条件用户ID)', 'userUpdPersonInfo.js', 'url: "classes/class.UserDetail.php",', 'action_type: "view", CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(7, 'UU01', '个人用户注册(游客通过预约,自动注册)', 'appointmentDoctor.js', 'url: "classes/class.sign_up_person.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(8, 'UU02', '个人用户注册(通过注册页面注册)', 'sign_up_person.js', 'url: "classes/class.sign_up_person.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(9, 'UU03', '修改个人用户信息', 'userUpdPersonInfo.j', 'url: "classes/class.UserDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(10, 'UU04', '修改个人用户密码', 'userUpdPersonPwd.js', 'url: "classes/class.UserDetail.php",', 'action_type:"update", CUSTOMER_USER_ID:fd_userid, CUSTOMER_USER_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(11, 'CU01', '诊所用户注册', 'sign_up_clinic.js', 'url: "classes/class.signup_clinic.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(12, 'CU02', '获取诊所用户详细信息', 'clinicUpdUserInfo.js', 'url: "classes/class.ClinicDetail.php",', 'action_type: "view",\r\nCLINIC_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(13, 'CU03', '修改诊所用户信息', 'clinicUpdUserInfo.js', 'url: "classes/class.ClinicDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(16, 'CU04', '修改诊所用户密码', 'clinicUpdUserPwd.js', 'url: "classes/class.ClinicDetail.php",', 'action_type:"update",\r\nCLINIC_USER_ID:fd_userid,\r\nCLINIC_USER_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(17, 'CU05', '诊所用户搜索医生', 'clinicQryDoctor.js', 'url: "classes/class.ClinicOprDoctor.php",', 'CLINIC_USER_ID: fd_userid,\r\n    DOCTOR_TYPE: $(''#DOCTOR_TYPE'').val(),\r\n    DOCTOR_NAME: $(''#DOCTOR_NAME'').val(),', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(18, 'CU06', '修改医生为inactive/active', 'clinicQryDoctor.js', 'url: "classes/class.ClinicOprDoctor.php",', 'action_type: "update",\r\n      ACTIVE_STATUS: 0|1,\r\n      DOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(19, 'CU07', '修改医生基本信息', 'clinicUpdDoctorDetail.js', 'url: "classes/class.ClinicOprDoctor.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(20, 'SD01', '搜索医生(主页全体条件 or)', 'searchDoctor.js', 'url: "classes/class.searchDoctor.php",', '见首页输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 0 查询条件or', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(21, 'SD02', '搜索医生(主页全体条件 and)', 'searchDoctor.js', 'url: "classes/class.searchDoctor.php",', '搜索医生也点击搜索按钮，全体输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 1 查询条件and', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(22, 'ST01', '搜索医生预约时间ID(条件医生ID,预约时间日期，时间)', 'appointmentDoctor.js', 'url: "classes/class.searchAppTimeID.php",', 'DOCTOR_ID: $(''#DOCTOR_ID'').val(),\r\nAPPOINTMENT_DATE:\r\nAPPOINTMENT_TIME: radio_txt', '搜索医生预约时间ID', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(23, 'SP01', '搜索预约状态（填充下拉框）', 'userAppointmentRecoder.js', 'url: "classes/class.getAppointmentStatus.php",', 'para="";', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(24, 'SP02', '搜索预约记录', 'userAppointmentRecoder.js', 'url: "classes/class.AppointmentRecoder.php",', 'CUSTOMER_USER_ID: userid,\r\nCREATE_DATE_BEGIN:  $(''#begin_time'').val(),\r\nCREATE_DATE_END:  $(''#end_time'').val(),\r\nAPPOINTMENT_STATUS_ID : $(''#app_status'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(25, 'AD01', '预约医生', 'appointmentDoctor.js', 'url: "classes/class.appointmentDoctor.php",', 'action_type: ""create"",\r\nCUSTOMER_USER_NAME: $(''#CUSTOMER_USER_NAME'').val(),\r\nCUSTOMER_USER_PWD: $(''#CUSTOMER_USER_PWD'').val(),\r\nCUSTOMER_USER_ID: custom_user_id,\r\nDOCTOR_ID: $(''#DOCTOR_ID'').val(),\r\nDOCTOR_APPOINTMENT_TIME_ID:time_id,\r\nAPPOINTMENT_STATUS_ID:1', '预约成功', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(26, 'AD02', '取消预约', 'userAppointmentRecoder.js', 'url: "classes/class.AppointmentRecoder.php",', 'action_type: ""update"",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID,\r\nCREATE_DATE: CREATE_DATE', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(27, 'S001', '收藏医生', 'appointmentDoctor.js', 'url: "classes/class.saveDoctor.php",', 'action_type:""create"",\r\nCUSTOMER_USER_ID:$(''#CUSTOMER_USER_ID'').val(),\r\nDOCTOR_ID:$(''#DOCTOR_ID'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(28, 'S002', '搜索收藏的医生', 'userSaveDoctor.js', 'url: "classes/class.saveDoctor.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(29, 'S003', '删除收藏医生', 'userSaveDoctor.js', 'url: "classes/class.saveDoctor.php",', 'action_type: ""remove"",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(30, 'SS01', '保存为常用搜索条件', 'searchDoctor.js', 'url: "classes/class.saveSearch.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(31, 'SS02', '搜索常用搜索条件', 'userSaveSearch.js', 'url: "classes/class.saveSearch.php",', 'CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(32, 'SS03', '删除常用搜索条件', 'userSaveSearch.js', 'url: "classes/class.saveSearch.php",', 'action_type: "remove",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nCUSTOMER_SEARCH_ID: CUSTOMER_SEARCH_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(36, 'AU01', '修改管理员密码', 'adminUpdPwd.js', 'url: "classes/class.AdminDetail.php",', 'action_type: "update",\r\nADMIN_ID:fd_userid,\r\nADMIN_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(37, 'AU02', '查询诊所用户', 'adminQryClinic.js', 'url: "classes/class.ClinicDetail.php",', '页面输入条件', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(38, 'AU03', '查询个人用户', 'adminQryUser.js', 'url: "classes/class.UserDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(39, 'AU06', '修改诊所用户为inactive/active', 'adminQryClinic.js', 'url: "classes/class.ClinicDetail.php",', 'action_type: "update_active",\r\nACTIVE_STATUS: 0,\r\nCLINIC_USER_ID: CLINIC_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(40, 'AU07', '修改个人用户为inactive/active', 'adminQryUser.js', 'url: "classes/class.UserDetail.php",', 'action_type: "update_active",\r\nACTIVE_STATUS: 1/0,\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(41, 'SSTE', '填充州下拉列表', 'adminQryUser.js', 'url: "classes/class.getState.php",', '空', '州所有内容', '全部查询，无需条件', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(42, 'SDTY', '填充医生类别', 'adminQryDoctor.js', 'url: "classes/class.getDoctorType.php",', '无', '医生所有类别', '查询全部内容', 'admin', '2016-09-10 00:00:00', 'admin', '2016-09-10 00:00:00'),
(43, 'SSUB', '填充区', 'userSaveDoctor.js', 'url: "classes/class.getSuburb.php",', '无', '全部诊所区', '查询全部，无条件', 'admin', '2016-09-13 00:00:00', 'admin', '2016-09-13 00:00:00');

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
-- 限制表 `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD CONSTRAINT `FK_fd_clinic_user_2` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

--
-- 限制表 `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD CONSTRAINT `FK_fd_customer_user_7` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

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

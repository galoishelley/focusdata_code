-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-24 23:25:51
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

CREATE TABLE `fd_admin` (
  `ADMIN_NAME` varchar(50) NOT NULL,
  `ADMIN_PWD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_admin`
--

INSERT INTO `fd_admin` (`ADMIN_NAME`, `ADMIN_PWD`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `fd_clinic_user`
--

CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL,
  `CLINIC_USER_NAME` varchar(50) NOT NULL,
  `CLINIC_USER_PWD` varchar(50) NOT NULL,
  `CLINIC_USER_MAIL` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_NAME`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_ADDR`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'shelleymyl', 'myl1102', 'shelleymyl@gmail.com', '省人民诊所', '吉林省长春市前进大街881号', NULL, 'shelleymyl', '2016-08-13 12:11:10', 'shelleymyl', '2016-08-13 12:11:10'),
(2, 'shelleymyle', 'myl1102', 'shelleymyl@gmail.com', '市诊所', '南阳路88号', NULL, 'shelleymyl', '2016-08-13 12:11:39', 'shelleymyl', '2016-08-13 12:11:39'),
(3, 'shelleymylee', 'myl1102', 'shelleymyl@gmail.com', '朝阳区诊所', '朝阳区', NULL, 'shelleymyl', '2016-08-13 12:11:50', 'shelleymyl', '2016-08-13 12:11:50'),
(4, 'shelleymyl22', 'myl1102', 'shelleymyl@gmail.com', '绿园区诊所', '绿园区', NULL, 'shelleymyl', '2016-08-15 12:08:47', 'shelleymyl', '2016-08-15 12:08:47'),
(5, 'yinxin', 'yinxin', 'shelleymyl@gmail.com', '1', '1', NULL, 'shelleymyl', '2016-08-24 16:28:50', 'shelleymyl', '2016-08-24 16:28:50'),
(6, 'Miaoyl', 'myl1102', 'shelleymyl@gmail.com', '1', '1', NULL, 'shelleymyl', '2016-08-24 16:31:50', 'shelleymyl', '2016-08-24 16:31:50'),
(7, 'shelleymyl111', 'myl1102111', 'shelleymyl@gmail.com', '1', '1', NULL, 'shelleymyl', '2016-08-24 16:33:17', 'shelleymyl', '2016-08-24 16:33:17'),
(8, 'yinxin123', 'yinxin123', 'shelleymyl@gmail.com', '1', '1', NULL, 'yinxin123', '2016-08-24 21:42:45', 'yinxin123', '2016-08-24 21:42:45'),
(9, 'mao', 'mao', 'shelleymyl@gmail.com', '1', '1', NULL, 'mao', '2016-08-24 21:43:42', 'mao', '2016-08-24 21:43:42');

-- --------------------------------------------------------

--
-- 表的结构 `fd_customer_user`
--

CREATE TABLE `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `CUSTOMER_USER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_USER_PWD` varchar(50) NOT NULL,
  `CUSTOMER_BIRTHDAY` varchar(50) NOT NULL,
  `CUSTOMER_GENDER` varchar(10) NOT NULL,
  `CUSTOMER_ADDR` varchar(200) NOT NULL,
  `CUSTOMER_PHONE_NO` varchar(50) NOT NULL,
  `MEDICAL_CARD_NO` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_NAME`, `CUSTOMER_USER_PWD`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_GENDER`, `CUSTOMER_ADDR`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(25, 'shelleymyl', 'myl1102', '1985-11-02', '男', '碧水云天12#806', '13500898234', '1234566789', '', 'shelleymyl', '2016-08-12 22:50:01', 'shelleymyl', '2016-08-12 22:50:01'),
(26, 'xinsj', '123', '19831111', '男', '吉林长春', '18686420139', '123456789', '', 'shelleymyl', '2016-08-13 10:40:17', 'shelleymyl', '2016-08-13 10:40:17'),
(27, 'xinsj', 'myl1102', '19831111', '男', '吉林长春', '18686420139', '123456789', '', 'shelleymyl', '2016-08-13 11:13:37', 'shelleymyl', '2016-08-13 11:13:37'),
(28, 'sb', 'sb', '831007', '女', '白城', '13500898234', '789', '', 'shelleymyl', '2016-08-13 11:15:52', 'shelleymyl', '2016-08-13 11:15:52'),
(29, '你好', 'myl1102', '1', '男', '1', '1', '1', '', 'shelleymyl', '2016-08-13 11:35:21', 'shelleymyl', '2016-08-13 11:35:21'),
(30, '你要', 'myl1102', '1', '男', '1', '1', '1', '', 'shelleymyl', '2016-08-13 11:35:35', 'shelleymyl', '2016-08-13 11:35:35'),
(31, 'miaoyl', 'miaoyl', '1', '男', '1', '1', '1', '', 'shelleymyl', '2016-08-24 16:24:34', 'shelleymyl', '2016-08-24 16:24:34'),
(32, 'yinxin', 'yinxin', '1', '男', '1', '1', '1', '', 'shelleymyl', '2016-08-24 16:28:24', 'shelleymyl', '2016-08-24 16:28:24'),
(33, 'admin', 'admin', '1', '男', '1', '1', '1', '', 'admin', '2016-08-24 21:15:18', 'admin', '2016-08-24 21:15:18'),
(34, 'admin123', 'admin123', '1', '男', '1', '1', '1', '', 'admin123', '2016-08-24 21:19:27', 'admin123', '2016-08-24 21:19:27'),
(35, 'yinxin123', 'yinxin123', '1', '男', '1', '1', '1', '', 'yinxin123', '2016-08-24 21:29:08', 'yinxin123', '2016-08-24 21:29:08'),
(36, 'mao', 'mao', '1', '男', '1', '1', '1', '', 'mao', '2016-08-24 21:43:29', 'mao', '2016-08-24 21:43:29'),
(37, 'nihao', 'nihao', '1', '男', '1', '1', '1', '', 'nihao', '2016-08-24 23:11:19', 'nihao', '2016-08-24 23:11:19');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_appointment_status`
--

CREATE TABLE `fd_dict_appointment_status` (
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `fd_dict_log_type` (
  `LOG_TYPE_ID` int(11) NOT NULL,
  `LOG_TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_search`
--

CREATE TABLE `fd_dict_search` (
  `SEARCH_ID` int(11) NOT NULL,
  `SEARCH_CONTENT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_doctor`
--

CREATE TABLE `fd_doctor` (
  `DOCTOR_ID` int(11) NOT NULL,
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
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_doctor`
--

INSERT INTO `fd_doctor` (`DOCTOR_ID`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DOCTOR_GENDER`, `ACTIVE_STATUS`, `DOCTOR_PHOTO`, `DOCTOR_INFO`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, '牙科', '尹鑫', '男', 1, 'page1_pic2.jpg', '如果尽早治疗，根本不需要麻醉，补牙过程也异常简单，因为没有腐蚀到牙神经；而如果牙齿腐蚀的比较厉害接触要牙神经再来就诊，首先在治疗之前疼痛感比较强烈而且会伴随牙周炎等口腔炎症，麻醉过程中不会疼痛只会有肿胀感，麻醉后还是有一些不适。', '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, '内科', '苗亚柳', '女', 1, 'miaoyl.jpg', 'good doctor', '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, '牙科', '尹小猫', '女', 1, 'page1_pic2.jpg', '11', '1', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, '牙科', '尹小耗', '男', 1, 'page1_pic3.jpg', '', '', 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
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

CREATE TABLE `fd_function` (
  `FUNCTION_ID` int(11) NOT NULL,
  `FUNCTION_CODE` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_log`
--

CREATE TABLE `fd_log` (
  `LOG_ID` int(11) NOT NULL,
  `LOG_TYPE_ID` int(11) NOT NULL,
  `FUNCTION_ID` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `LOG_CONTENT` varchar(200) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_clinic_doctor`
--

CREATE TABLE `fd_rel_clinic_doctor` (
  `CLINIC_DOCTOR_ID` int(11) NOT NULL,
  `CLINIC_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `fd_rel_customer_appointment` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_customer_appointment`
--

INSERT INTO `fd_rel_customer_appointment` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(3, 25, 4, 22, 2, '', 'shelleymyl', '2016-08-23 19:12:50', 'shelleymyl', '2016-08-23 19:12:50'),
(4, 25, 7, 26, 3, '', 'shelleymyl', '2016-08-23 19:16:11', 'shelleymyl', '2016-08-23 19:16:11'),
(5, 25, 10, 29, 1, '', 'shelleymyl', '2016-08-23 19:17:15', 'shelleymyl', '2016-08-23 19:17:15'),
(6, 25, 11, 32, 4, '', 'shelleymyl', '2016-08-23 19:22:55', 'shelleymyl', '2016-08-23 19:22:55'),
(7, 25, 11, 30, 1, '', 'shelleymyl', '2016-08-23 19:23:32', 'shelleymyl', '2016-08-23 19:23:32'),
(8, 25, 7, 26, 1, '', 'shelleymyl', '2016-08-23 19:23:51', 'shelleymyl', '2016-08-23 19:23:51'),
(9, 25, 7, 26, 1, '', 'shelleymyl', '2016-08-23 21:13:40', 'shelleymyl', '2016-08-23 21:13:40'),
(10, 25, 7, 26, 1, '', 'shelleymyl', '2016-08-23 21:14:57', 'shelleymyl', '2016-08-23 21:14:57'),
(11, 25, 8, 27, 1, '', 'shelleymyl', '2016-08-23 21:16:12', 'shelleymyl', '2016-08-23 21:16:12'),
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
(35, 37, 3, 21, 1, '', 'nihao', '2016-08-24 23:14:33', 'nihao', '2016-08-24 23:14:33');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_appointment_his`
--

CREATE TABLE `fd_rel_customer_appointment_his` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` varchar(50) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(34, 37, 3, 21, '1', 'A', '', 'nihao', '2016-08-24 23:14:33', 'nihao', '2016-08-24 23:14:33');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_doctor`
--

CREATE TABLE `fd_rel_customer_doctor` (
  `CUSTOMER_DOCTOR_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_customer_search`
--

CREATE TABLE `fd_rel_customer_search` (
  `CUSTOMER_SEARCH_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `SEARCH_ID` int(11) NOT NULL,
  `SEARCH_VALUE` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_doctor_appointment_time`
--

CREATE TABLE `fd_rel_doctor_appointment_time` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_TIME` time NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_rel_doctor_appointment_time`
--

INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 1, '08:30:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 1, '09:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 2, '08:00:00', 1, '', 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(4, 1, '08:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(5, 1, '09:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(6, 1, '10:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(7, 1, '10:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(8, 1, '11:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(9, 1, '11:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(10, 1, '12:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(11, 1, '12:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(12, 1, '13:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(13, 1, '13:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(14, 1, '14:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(15, 1, '14:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(16, 1, '15:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(17, 1, '15:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(18, 1, '16:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(19, 1, '16:30:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(20, 1, '17:00:00', 1, '', 'admin', '2016-08-17 00:00:00', 'admin', '2016-08-17 00:00:00'),
(21, 3, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(22, 4, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(23, 5, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(24, 3, '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(25, 6, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(26, 7, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(27, 8, '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(28, 9, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(29, 10, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(30, 11, '08:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(31, 11, '07:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00'),
(32, 11, '09:00:00', 1, '', 'admin', '2016-08-22 08:00:00', 'admin', '2016-08-22 08:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fd_rel_doctor_appointment_time_his`
--

CREATE TABLE `fd_rel_doctor_appointment_time_his` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` datetime NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_role`
--

CREATE TABLE `fd_role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fd_user`
--

CREATE TABLE `fd_user` (
  `USER_ID` int(11) NOT NULL,
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
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD PRIMARY KEY (`CLINIC_USER_ID`);

--
-- Indexes for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD PRIMARY KEY (`CUSTOMER_USER_ID`);

--
-- Indexes for table `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  ADD PRIMARY KEY (`APPOINTMENT_STATUS_ID`);

--
-- Indexes for table `fd_dict_log_type`
--
ALTER TABLE `fd_dict_log_type`
  ADD PRIMARY KEY (`LOG_TYPE_ID`);

--
-- Indexes for table `fd_dict_search`
--
ALTER TABLE `fd_dict_search`
  ADD PRIMARY KEY (`SEARCH_ID`);

--
-- Indexes for table `fd_doctor`
--
ALTER TABLE `fd_doctor`
  ADD PRIMARY KEY (`DOCTOR_ID`);

--
-- Indexes for table `fd_function`
--
ALTER TABLE `fd_function`
  ADD PRIMARY KEY (`FUNCTION_ID`);

--
-- Indexes for table `fd_log`
--
ALTER TABLE `fd_log`
  ADD PRIMARY KEY (`LOG_ID`);

--
-- Indexes for table `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  ADD PRIMARY KEY (`CLINIC_DOCTOR_ID`),
  ADD KEY `FK_fd_rel_clinic_doctor_1` (`DOCTOR_ID`),
  ADD KEY `FK_fd_rel_clinic_doctor_2` (`CLINIC_USER_ID`);

--
-- Indexes for table `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  ADD PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_1` (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_2` (`DOCTOR_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_3` (`DOCTOR_APPOINTMENT_TIME_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_4` (`APPOINTMENT_STATUS_ID`);

--
-- Indexes for table `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  ADD PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`);

--
-- Indexes for table `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  ADD PRIMARY KEY (`CUSTOMER_DOCTOR_ID`);

--
-- Indexes for table `fd_rel_customer_search`
--
ALTER TABLE `fd_rel_customer_search`
  ADD PRIMARY KEY (`CUSTOMER_SEARCH_ID`);

--
-- Indexes for table `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  ADD PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`),
  ADD KEY `FK_fd_rel_doctor_appointment_time_1` (`DOCTOR_ID`);

--
-- Indexes for table `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  ADD PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`);

--
-- Indexes for table `fd_role`
--
ALTER TABLE `fd_role`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `fd_user`
--
ALTER TABLE `fd_user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  MODIFY `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  MODIFY `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  MODIFY `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `fd_doctor`
--
ALTER TABLE `fd_doctor`
  MODIFY `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `fd_function`
--
ALTER TABLE `fd_function`
  MODIFY `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_log`
--
ALTER TABLE `fd_log`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  MODIFY `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  MODIFY `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_search`
--
ALTER TABLE `fd_rel_customer_search`
  MODIFY `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_role`
--
ALTER TABLE `fd_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_user`
--
ALTER TABLE `fd_user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;
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
-- 限制表 `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  ADD CONSTRAINT `FK_fd_rel_doctor_appointment_time_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `fd_doctor` (`DOCTOR_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

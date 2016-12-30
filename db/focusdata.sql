-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2016 at 05:11 AM
-- Server version: 10.1.10-MariaDB
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get7daysTimeslots` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50))  READS SQL DATA
BEGIN 
  IF ( DATEIN >= CURRENT_DATE() + 4 ) THEN 
    SELECT t1.APPOINTMENT_DATE, 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME, 
           t4.CLINIC_NAME, 
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t5.STATE_NAME, 
           t1.APPOINTMENT_TIME 
    FROM   fd_rel_doctor_appointment_time t1 
           LEFT JOIN fd_doctor t2 
                  ON t1.DOCTOR_ID = t2.DOCTOR_ID 
           LEFT JOIN fd_rel_clinic_doctor t3 
                  ON t2.DOCTOR_ID = t3.DOCTOR_ID 
           LEFT JOIN fd_clinic_user t4 
                  ON t3.CLINIC_USER_ID = t4.CLINIC_USER_ID 
           LEFT JOIN fd_dict_state t5 
                  ON t4.STATE_ID = t5.STATE_ID 
    WHERE  t1.ACTIVE_STATUS = 1 
           AND t1.APPOINTMENT_DATE >= DATEIN - 3 
           AND t1.APPOINTMENT_DATE <= DATEIN + 3 
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME = CLINICNAMEIN 
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME = DOCTORNAMEIN 
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
    ORDER BY t1.APPOINTMENT_DATE asc, 
              t1.DOCTOR_ID asc, 
              t1.APPOINTMENT_TIME asc; 
  ELSE 
    SELECT t1.APPOINTMENT_DATE, 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME, 
           t4.CLINIC_NAME, 
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t5.STATE_NAME, 
           t1.APPOINTMENT_TIME 
    FROM   fd_rel_doctor_appointment_time t1 
           LEFT JOIN fd_doctor t2 
                  ON t1.DOCTOR_ID = t2.DOCTOR_ID 
           LEFT JOIN fd_rel_clinic_doctor t3 
                  ON t2.DOCTOR_ID = t3.DOCTOR_ID 
           LEFT JOIN fd_clinic_user t4 
                  ON t3.CLINIC_USER_ID = t4.CLINIC_USER_ID 
           LEFT JOIN fd_dict_state t5 
                  ON t4.STATE_ID = t5.STATE_ID 
    WHERE  t1.ACTIVE_STATUS = 1 
           AND t1.APPOINTMENT_DATE >= CURRENT_DATE() 
           AND t1.APPOINTMENT_DATE <= DATEIN + 6 
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME = CLINICNAMEIN 
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME = DOCTORNAMEIN 
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
    ORDER BY t1.APPOINTMENT_DATE asc, 
              t1.DOCTOR_ID asc, 
              t1.APPOINTMENT_TIME asc; 
  END IF; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ap_patient`
--

CREATE TABLE `ap_patient` (
  `id` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_mobile` varchar(50) NOT NULL,
  `medicare_no` varchar(50) NOT NULL,
  `medicare_ref` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ap_patient`
--

INSERT INTO `ap_patient` (`id`, `CUSTOMER_USER_ID`, `title`, `first_name`, `last_name`, `gender`, `dob`, `email`, `phone_mobile`, `medicare_no`, `medicare_ref`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(22, 184, 'Mr', 'x', 'x', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-10-03 18:42:22', '', '0000-00-00 00:00:00'),
(23, 187, 'Mr', 'xin', 'yin', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-12-02 09:59:13', '', '0000-00-00 00:00:00'),
(24, 205, 'Miss', '1555', '1', 'F', '1999-11-11', '2@2.com', '0412341234', '1231231231', '1', '2@2.com', '2016-12-26 13:34:04', '2@2.com', '2016-12-26 13:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `fd_admin`
--

CREATE TABLE `fd_admin` (
  `ADMIN_ID` int(11) NOT NULL,
  `ADMIN_NAME` varchar(50) NOT NULL,
  `ADMIN_PWD` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_admin`
--

INSERT INTO `fd_admin` (`ADMIN_ID`, `ADMIN_NAME`, `ADMIN_PWD`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00', 'admin', '2016-09-24 17:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `fd_clinic_user`
--

CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL,
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
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_ADDR`, `CLINIC_POSTCODE`, `CLINIC_SUBURB`, `STATE_ID`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(26, '0cc175b9c0f1b6a831c399e269772661', 'a@a.com', 'b', 'b', 'b', 'b', 2, 1, NULL, 'a@a.com', '2016-12-20 12:28:56', 'a@a.com', '2016-12-20 12:29:06'),
(27, '703b649e9a6f92dbde6cf51078ed44f4', 's@gmail.com', 'sb', 'sb', 'sb', 'sb', 3, 1, NULL, 's@gmail.com', '2016-12-20 16:52:14', 'admin', '2016-12-26 05:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `fd_customer_user`
--

CREATE TABLE `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `CUSTOMER_USER_PWD` varchar(50) NOT NULL,
  `CUSTOMER_USER_MAIL` varchar(50) NOT NULL,
  `CUSTOMER_FIRSTNAME` varchar(50) NOT NULL,
  `CUSTOMER_LASTNAME` varchar(50) NOT NULL,
  `TITLE_ID` int(11) NOT NULL,
  `GENDER_ID` int(11) NOT NULL,
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
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_PWD`, `CUSTOMER_USER_MAIL`, `CUSTOMER_FIRSTNAME`, `CUSTOMER_LASTNAME`, `TITLE_ID`, `GENDER_ID`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_POSTCODE`, `CUSTOMER_SUBURB`, `STATE_ID`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(200, 'c4ca4238a0b923820dcc509a6f75849b', '1@1.com', '1', '1', 0, 0, '11/11/1111', '1', '1', '1', 3, '1', '1231231231', 1, '', '1@1.com', '2016-12-20 12:56:38', '1@1.com', '2016-12-20 12:56:38'),
(201, 'c81e728d9d4c2f636f067f89cc14862c', '2@gmail.com', '', '', 1, 1, '22/22/2222', '2', '2', '2', 2, '222', '1231231231', 1, '', '2@gmail.com', '2016-12-20 14:45:15', '2@gmail.com', '2016-12-20 14:45:41'),
(202, 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3@gmail.com', '4', '4', 3, 1, '33/33/3333', '4', '4', '4', 8, '4', '1231231231', 1, '', '3@gmail.com', '2016-12-20 14:47:55', '3@gmail.com', '2016-12-20 14:48:29'),
(203, 'e4da3b7fbbce2345d7772b0674a318d5', '4@gmail.com', '4', '4', 0, 0, '44/44/4444', '4', '4', '4', 1, '4', '1231231231', 1, '', '4@gmail.com', '2016-12-20 16:43:27', '4@gmail.com', '2016-12-20 16:43:57'),
(204, 'a39401275d1b300aa789fb22aea4148a', 'flash@gmail.com', 'flash', 'flash', 0, 0, '11/11/1111', '1', '1', '1', 3, '1', '1231231231', 1, '', 'flash@gmail.com', '2016-12-26 08:24:50', 'flash@gmail.com', '2016-12-26 08:24:50'),
(205, 'c81e728d9d4c2f636f067f89cc14862c', '2@2.com', '1update', '1', 3, 1, '1999-11-11', '', '', '', 1, '0412341234', '1231231231', 1, '', '2@2.com', '2016-12-26 13:32:16', '2@2.com', '2016-12-26 13:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_appointment_status`
--

CREATE TABLE `fd_dict_appointment_status` (
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_appointment_status`
--

INSERT INTO `fd_dict_appointment_status` (`APPOINTMENT_STATUS_ID`, `APPOINTMENT_STATUS`) VALUES
(1, 'booked'),
(2, 'cancelled'),
(3, '已就诊'),
(4, '未就诊');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_gender_ch`
--

CREATE TABLE `fd_dict_gender_ch` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_gender_ch`
--

INSERT INTO `fd_dict_gender_ch` (`GENDER_ID`, `GENDER_NAME`) VALUES
(0, '男'),
(1, '女');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_gender_en`
--

CREATE TABLE `fd_dict_gender_en` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_gender_en`
--

INSERT INTO `fd_dict_gender_en` (`GENDER_ID`, `GENDER_NAME`) VALUES
(0, 'Male'),
(1, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_log_type`
--

CREATE TABLE `fd_dict_log_type` (
  `LOG_TYPE_ID` int(11) NOT NULL,
  `LOG_TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_search`
--

CREATE TABLE `fd_dict_search` (
  `SEARCH_ID` int(11) NOT NULL,
  `SEARCH_CONTENT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_search`
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
-- Table structure for table `fd_dict_state`
--

CREATE TABLE `fd_dict_state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE_NAME` varchar(50) NOT NULL,
  `STATE_POSTCODE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_state`
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
-- Table structure for table `fd_dict_title`
--

CREATE TABLE `fd_dict_title` (
  `TITLE_ID` int(11) NOT NULL,
  `TITLE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_title`
--

INSERT INTO `fd_dict_title` (`TITLE_ID`, `TITLE_NAME`) VALUES
(0, 'Mr'),
(1, 'Mrs'),
(2, 'Ms'),
(3, 'Miss'),
(4, 'Master'),
(5, 'Dr');

-- --------------------------------------------------------

--
-- Table structure for table `fd_doctor`
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
  `DOCTOR_ID_IMPORT` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_doctor`
--

INSERT INTO `fd_doctor` (`DOCTOR_ID`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DOCTOR_GENDER`, `ACTIVE_STATUS`, `DOCTOR_PHOTO`, `DOCTOR_INFO`, `NOTE`, `DOCTOR_ID_IMPORT`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(61337, 'GP', '孙思邈', '', 1, 'img/doctors/test_sunsimiao.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61338, 'GP', '华佗', '', 1, 'img/doctors/test_huatuo.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61339, 'GP', '扁鹊', '', 1, 'img/doctors/test_bianque.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61340, 'GP', '李时珍', '', 1, 'img/doctors/test_lishizhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_function`
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
-- Table structure for table `fd_log`
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
-- Table structure for table `fd_rel_clinic_doctor`
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
-- Dumping data for table `fd_rel_clinic_doctor`
--

INSERT INTO `fd_rel_clinic_doctor` (`CLINIC_DOCTOR_ID`, `CLINIC_USER_ID`, `DOCTOR_ID`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 1, 61337, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 1, 61338, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 1, 61339, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, 1, 61340, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(5, 2, 5, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, 3, 6, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(7, 2, 7, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(8, 3, 8, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(9, 2, 9, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10, 3, 10, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, 11, 11, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_appointment`
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
-- Dumping data for table `fd_rel_customer_appointment`
--

INSERT INTO `fd_rel_customer_appointment` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 187, 61339, 15234, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59'),
(2, 187, 61339, 15210, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18'),
(3, 187, 61339, 15205, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46'),
(4, 187, 61339, 15209, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29'),
(5, 187, 61340, 15216, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_appointment_his`
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
-- Dumping data for table `fd_rel_customer_appointment_his`
--

INSERT INTO `fd_rel_customer_appointment_his` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `OPERATOR_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(85, 184, 1, 36, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-10-03 18:42:45', 'fudanyinxin@gmail.com', '2016-10-03 18:42:45'),
(86, 184, 1, 37, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-10-03 18:43:02', 'fudanyinxin@gmail.com', '2016-10-03 18:43:02'),
(87, 185, 61337, 15068, '1', 'A', '', 'kitty', '2016-11-12 07:33:36', 'kitty', '2016-11-12 07:33:36'),
(88, 186, 61337, 15130, '1', 'A', '', 'dodo', '2016-11-12 07:46:31', 'dodo', '2016-11-12 07:46:31'),
(89, 187, 61337, 15132, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 06:29:43', 'fudanyinxin@gmail.com', '2016-12-11 06:29:43'),
(90, 187, 0, 15132, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 06:32:26', 'fudanyinxin@gmail.com', '2016-12-11 06:32:26'),
(91, 187, 61337, 15184, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:05:02', 'fudanyinxin@gmail.com', '2016-12-11 09:05:02'),
(92, 187, 61337, 15190, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:06:26', 'fudanyinxin@gmail.com', '2016-12-11 09:06:26'),
(93, 187, 61337, 15198, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:17:24', 'fudanyinxin@gmail.com', '2016-12-11 09:17:24'),
(94, 187, 61337, 15191, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:46:33', 'fudanyinxin@gmail.com', '2016-12-11 09:46:33'),
(95, 187, 61337, 15192, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:01', 'fudanyinxin@gmail.com', '2016-12-11 09:49:01'),
(96, 187, 61337, 15193, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:14', 'fudanyinxin@gmail.com', '2016-12-11 09:49:14'),
(97, 187, 61337, 15194, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:22', 'fudanyinxin@gmail.com', '2016-12-11 09:49:22'),
(98, 187, 61337, 15195, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:33', 'fudanyinxin@gmail.com', '2016-12-11 09:49:33'),
(99, 187, 61337, 15196, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 11:07:26', 'fudanyinxin@gmail.com', '2016-12-11 11:07:26'),
(100, 189, 0, 15197, '1', 'A', '', 'qwe', '2016-12-11 12:49:48', 'qwe', '2016-12-11 12:49:48'),
(101, 189, 61337, 15197, '1', 'A', '', 'qwe', '2016-12-11 12:49:51', 'qwe', '2016-12-11 12:49:51'),
(102, 190, 61339, 15187, '1', 'A', '', 'lop', '2016-12-11 12:51:40', 'lop', '2016-12-11 12:51:40'),
(103, 191, 61339, 15189, '1', 'A', '', 'dongfangbubai', '2016-12-11 12:53:36', 'dongfangbubai', '2016-12-11 12:53:36'),
(104, 191, 61337, 15134, '1', 'A', '', 'dongfangbubai', '2016-12-11 12:53:54', 'dongfangbubai', '2016-12-11 12:53:54'),
(105, 187, 61339, 15234, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59'),
(106, 187, 61339, 15210, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18'),
(107, 187, 61339, 15205, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46'),
(108, 187, 61339, 15209, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29'),
(109, 187, 61340, 15216, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_doctor`
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

--
-- Dumping data for table `fd_rel_customer_doctor`
--

INSERT INTO `fd_rel_customer_doctor` (`CUSTOMER_DOCTOR_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 187, 61338, '', 'fudanyinxin@gmail.com', '2016-12-12 15:41:43', 'fudanyinxin@gmail.com', '2016-12-12 15:41:43'),
(2, 187, 61339, '', 'fudanyinxin@gmail.com', '2016-12-12 17:49:43', 'fudanyinxin@gmail.com', '2016-12-12 17:49:43'),
(3, 187, 61337, '', 'fudanyinxin@gmail.com', '2016-12-13 04:56:19', 'fudanyinxin@gmail.com', '2016-12-13 04:56:19'),
(4, 187, 61340, '', 'fudanyinxin@gmail.com', '2016-12-13 06:03:32', 'fudanyinxin@gmail.com', '2016-12-13 06:03:32'),
(5, 0, 61338, '', 'fudanyinxin@gmail.com', '2016-12-14 07:54:12', 'fudanyinxin@gmail.com', '2016-12-14 07:54:12'),
(6, 0, 61338, '', 'fudanyinxin@gmail.com', '2016-12-14 07:54:19', 'fudanyinxin@gmail.com', '2016-12-14 07:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_doctor_appointment_time`
--

CREATE TABLE `fd_rel_doctor_appointment_time` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` date NOT NULL,
  `APPOINTMENT_TIME` time NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `REQUESTING_FLAG` int(11) NOT NULL,
  `REQUESTING_USER_ID` int(11) NOT NULL,
  `SUCCESSFUL_FLAG` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_rel_doctor_appointment_time`
--

INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_DATE`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `REQUESTING_FLAG`, `REQUESTING_USER_ID`, `SUCCESSFUL_FLAG`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(15124, 61337, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15125, 61337, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15126, 61337, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15127, 61337, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15128, 61337, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15129, 61337, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15199, 61338, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15200, 61338, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15201, 61338, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15202, 61338, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15203, 61338, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15204, 61338, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15205, 61339, '2016-12-14', '09:00:00', 0, '', 0, 0, 2, '', '0000-00-00 00:00:00', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46'),
(15206, 61339, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15207, 61339, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15208, 61339, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15209, 61339, '2016-12-14', '14:00:00', 0, '', 0, 0, 0, '', '0000-00-00 00:00:00', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29'),
(15210, 61339, '2016-12-14', '15:00:00', 0, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15211, 61340, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15212, 61340, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15213, 61340, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15214, 61340, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15215, 61340, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15216, 61340, '2016-12-14', '15:00:00', 0, '', 0, 0, 0, '', '0000-00-00 00:00:00', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02'),
(15217, 61337, '2016-12-15', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15218, 61337, '2016-12-15', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15219, 61337, '2016-12-15', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15220, 61337, '2016-12-15', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15221, 61337, '2016-12-15', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15222, 61337, '2016-12-15', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15223, 61338, '2016-12-16', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15224, 61338, '2016-12-16', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15225, 61338, '2016-12-16', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15226, 61338, '2016-12-16', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15227, 61338, '2016-12-16', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15228, 61338, '2016-12-16', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15229, 61339, '2016-12-17', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15230, 61339, '2016-12-17', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15231, 61339, '2016-12-17', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15232, 61339, '2016-12-17', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15233, 61339, '2016-12-17', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15234, 61339, '2016-12-17', '15:00:00', 0, '', 0, 0, 0, '', '0000-00-00 00:00:00', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_doctor_appointment_time_his`
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
-- Table structure for table `fd_role`
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
-- Table structure for table `fd_save_search`
--

CREATE TABLE `fd_save_search` (
  `CUSTOMER_SEARCH_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `SEARCH_NAME` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(50) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DISTANCE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_save_search`
--

INSERT INTO `fd_save_search` (`CUSTOMER_SEARCH_ID`, `CUSTOMER_USER_ID`, `SEARCH_NAME`, `CLINIC_SUBURB`, `STATE_ID`, `CLINIC_NAME`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DISTANCE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `fd_service`
--

CREATE TABLE `fd_service` (
  `SERVICE_CODE` int(11) NOT NULL,
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
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_service`
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
-- Table structure for table `fd_user`
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
-- Indexes for table `ap_patient`
--
ALTER TABLE `ap_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_admin`
--
ALTER TABLE `fd_admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD PRIMARY KEY (`CLINIC_USER_ID`),
  ADD KEY `FK_fd_clinic_user_2` (`STATE_ID`);

--
-- Indexes for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD PRIMARY KEY (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_customer_user_7` (`STATE_ID`);

--
-- Indexes for table `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  ADD PRIMARY KEY (`APPOINTMENT_STATUS_ID`);

--
-- Indexes for table `fd_dict_gender_ch`
--
ALTER TABLE `fd_dict_gender_ch`
  ADD PRIMARY KEY (`GENDER_ID`);

--
-- Indexes for table `fd_dict_gender_en`
--
ALTER TABLE `fd_dict_gender_en`
  ADD PRIMARY KEY (`GENDER_ID`);

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
-- Indexes for table `fd_dict_state`
--
ALTER TABLE `fd_dict_state`
  ADD PRIMARY KEY (`STATE_ID`),
  ADD UNIQUE KEY `STATE_NAME` (`STATE_NAME`);

--
-- Indexes for table `fd_dict_title`
--
ALTER TABLE `fd_dict_title`
  ADD PRIMARY KEY (`TITLE_ID`);

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
  ADD PRIMARY KEY (`CUSTOMER_DOCTOR_ID`),
  ADD KEY `FK_fd_rel_customer_doctor_1` (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_rel_customer_doctor_2` (`DOCTOR_ID`);

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
-- Indexes for table `fd_save_search`
--
ALTER TABLE `fd_save_search`
  ADD PRIMARY KEY (`CUSTOMER_SEARCH_ID`),
  ADD KEY `FK_FD_SAVE_SEARCH_1` (`CUSTOMER_USER_ID`);

--
-- Indexes for table `fd_service`
--
ALTER TABLE `fd_service`
  ADD PRIMARY KEY (`SERVICE_CODE`),
  ADD UNIQUE KEY `SERVICE_ID` (`SERVICE_ID`);

--
-- Indexes for table `fd_user`
--
ALTER TABLE `fd_user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ap_patient`
--
ALTER TABLE `ap_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `fd_admin`
--
ALTER TABLE `fd_admin`
  MODIFY `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  MODIFY `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  MODIFY `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  MODIFY `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fd_dict_search`
--
ALTER TABLE `fd_dict_search`
  MODIFY `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `fd_dict_state`
--
ALTER TABLE `fd_dict_state`
  MODIFY `STATE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `fd_doctor`
--
ALTER TABLE `fd_doctor`
  MODIFY `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61341;
--
-- AUTO_INCREMENT for table `fd_function`
--
ALTER TABLE `fd_function`
  MODIFY `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_log`
--
ALTER TABLE `fd_log`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  MODIFY `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  MODIFY `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15235;
--
-- AUTO_INCREMENT for table `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_role`
--
ALTER TABLE `fd_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_save_search`
--
ALTER TABLE `fd_save_search`
  MODIFY `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fd_service`
--
ALTER TABLE `fd_service`
  MODIFY `SERVICE_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `fd_user`
--
ALTER TABLE `fd_user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD CONSTRAINT `FK_fd_clinic_user_2` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

--
-- Constraints for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD CONSTRAINT `FK_fd_customer_user_7` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-03-04 15:41:26
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

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
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get7daysTimeslots` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50))  READS SQL DATA
BEGIN 
  IF ( DATEIN >= CURRENT_DATE() + 4 ) THEN 
    SELECT t1.APPOINTMENT_DATE, 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME,
           t8.LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME, 
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
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
           LEFT JOIN (
		   select t6.DOCTOR_ID,GROUP_CONCAT(t7.LANGUAGE_NAME  SEPARATOR ',') as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
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
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
    ORDER BY t1.APPOINTMENT_DATE asc, 
              t1.DOCTOR_ID asc, 
              t1.APPOINTMENT_TIME asc; 
  ELSE 
    SELECT t1.APPOINTMENT_DATE, 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME, 
           t8.LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME, 
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
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
           LEFT JOIN (
		   select t6.DOCTOR_ID,GROUP_CONCAT(t7.LANGUAGE_NAME  SEPARATOR ',') as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
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
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
    ORDER BY t1.APPOINTMENT_DATE asc, 
              t1.DOCTOR_ID asc, 
              t1.APPOINTMENT_TIME asc; 
  END IF; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `ap_patient`
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
-- 转存表中的数据 `ap_patient`
--

INSERT INTO `ap_patient` (`id`, `CUSTOMER_USER_ID`, `title`, `first_name`, `last_name`, `gender`, `dob`, `email`, `phone_mobile`, `medicare_no`, `medicare_ref`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(22, 184, 'Mr', 'x', 'x', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-10-03 18:42:22', '', '0000-00-00 00:00:00'),
(23, 187, 'Mr', 'xin', 'yin', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-12-02 09:59:13', '', '0000-00-00 00:00:00'),
(24, 205, 'Miss', '1555', '1', 'F', '1999-11-11', '2@2.com', '0412341234', '1231231231', '1', '2@2.com', '2016-12-26 13:34:04', '2@2.com', '2016-12-26 13:41:26');

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin`
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
-- 转存表中的数据 `fd_admin`
--

INSERT INTO `fd_admin` (`ADMIN_ID`, `ADMIN_NAME`, `ADMIN_PWD`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00', 'admin', '2016-09-24 17:53:48');

-- --------------------------------------------------------

--
-- 表的结构 `fd_clinic_user`
--

CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL,
  `CLINIC_USER_PWD` varchar(50) NOT NULL,
  `CLINIC_USER_MAIL` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(200) NOT NULL,
  `CLINIC_PHOTO` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `CLINIC_POSTCODE` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `CLINIC_LAT` varchar(20) NOT NULL,
  `CLINIC_LNG` varchar(20) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_PHOTO`, `CLINIC_ADDR`, `CLINIC_POSTCODE`, `CLINIC_SUBURB`, `CLINIC_LAT`, `CLINIC_LNG`, `STATE_ID`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, '89634c352f3a1dc151e8cd19a859f27a', 'bencaotang@gmail.com', 'Box Hill Superclinic', 'img/clinics/test_bencaotang.jpg', '810 Whitehorse Road', '3127', 'Box Hill', '', '', 7, 1, NULL, 'bencaotang@gmail.com', '2017-01-23 08:37:39', 'bencaotang@gmail.com', '2017-01-23 08:37:39'),
(2, '25ccd325869097a683e3466ffcaf31cf', 'baozhilin@gmail.com', 'Box Hill Medical Centre', 'img/clinics/test_baozhilin.jpg', '528 Station Street', '3128', 'Box Hill', '', '', 7, 1, NULL, 'baozhilin@gmail.com', '2017-01-20 13:16:46', 'baozhilin@gmail.com', '2017-01-20 13:16:46'),
(3, 'fef7a0536578a077d04989b3c8f98dbd', 'jingwumen@gmail.com', 'Box Hill Mall Medical Centre', 'img/clinics/test_jingwumen.jpg', '8 Market Street', '3128', 'Box Hill', '', '', 7, 1, NULL, 'jingwumen@gmail.com', '2017-01-20 13:18:09', 'jingwumen@gmail.com', '2017-01-20 13:18:09');

-- --------------------------------------------------------

--
-- 表的结构 `fd_customer_user`
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
-- 转存表中的数据 `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_PWD`, `CUSTOMER_USER_MAIL`, `CUSTOMER_FIRSTNAME`, `CUSTOMER_LASTNAME`, `TITLE_ID`, `GENDER_ID`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_POSTCODE`, `CUSTOMER_SUBURB`, `STATE_ID`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(207, '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', 'test', 'test', 0, 0, '11/11/1983', '1 Whitehorse Road', '3128', 'Box Hill', 7, '0412341234', '1231231231', 1, '', 'test@gmail.com', '2017-01-23 09:51:38', 'test@gmail.com', '2017-01-23 09:51:38');

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
(1, 'booked'),
(2, 'cancelled'),
(3, '已就诊'),
(4, '未就诊');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_gender_ch`
--

CREATE TABLE `fd_dict_gender_ch` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_gender_ch`
--

INSERT INTO `fd_dict_gender_ch` (`GENDER_ID`, `GENDER_NAME`) VALUES
(0, '女'),
(1, '男');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_gender_en`
--

CREATE TABLE `fd_dict_gender_en` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_gender_en`
--

INSERT INTO `fd_dict_gender_en` (`GENDER_ID`, `GENDER_NAME`) VALUES
(0, 'Female'),
(1, 'Male');

-- --------------------------------------------------------

--
-- 表的结构 `fd_dict_language`
--

CREATE TABLE `fd_dict_language` (
  `LANGUAGE_ID` int(11) NOT NULL,
  `LANGUAGE_NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `fd_dict_language`
--

INSERT INTO `fd_dict_language` (`LANGUAGE_ID`, `LANGUAGE_NAME`) VALUES
(0, 'English'),
(1, 'Chinese'),
(2, 'Spanish'),
(3, 'Arabic');

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

CREATE TABLE `fd_dict_state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE_NAME` varchar(50) NOT NULL,
  `STATE_POSTCODE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- 表的结构 `fd_dict_title`
--

CREATE TABLE `fd_dict_title` (
  `TITLE_ID` int(11) NOT NULL,
  `TITLE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_dict_title`
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
  `DOCTOR_ID_IMPORT` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_doctor`
--

INSERT INTO `fd_doctor` (`DOCTOR_ID`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DOCTOR_GENDER`, `ACTIVE_STATUS`, `DOCTOR_PHOTO`, `DOCTOR_INFO`, `NOTE`, `DOCTOR_ID_IMPORT`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'GP', 'John Doe', '', 1, 'img/doctors/test_huatuo.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 'GP', 'Frank Underwood', '', 1, 'img/doctors/test_bianque.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, 'GP', 'Cal Lightman', '', 1, 'img/doctors/test_lishizhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(4, 'GP', 'Roy Brench', '', 1, 'img/doctors/test_huangfeihong.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(5, 'GP', 'Gillian Foster', '', 1, 'img/doctors/test_shisanyi.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(6, 'GP', 'Ria Torres', '', 1, 'img/doctors/test_linshirong.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, 'GP', 'Jane Bob', '', 1, 'img/doctors/test_huoyuanjia.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(8, 'GP', 'Maurice Moss', '', 1, 'img/doctors/test_chenzhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(9, 'GP', 'Douglas Reynholm', '', 1, 'img/doctors/test_huotingen.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

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
(2, 1, 2, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 1, 3, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, 2, 4, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(12, 3, 7, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(13, 3, 8, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(14, 3, 9, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(15, 2, 5, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(16, 2, 6, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00');

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
(1, 187, 61339, 15234, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59', 'fudanyinxin@gmail.com', '2016-12-13 07:44:59'),
(2, 187, 61339, 15210, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18', 'fudanyinxin@gmail.com', '2016-12-13 07:50:18'),
(3, 187, 61339, 15205, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46', 'fudanyinxin@gmail.com', '2016-12-13 07:50:46'),
(4, 187, 61339, 15209, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29', 'fudanyinxin@gmail.com', '2016-12-13 07:51:29'),
(5, 187, 61340, 15216, 1, '', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02'),
(6, 0, 61337, 15280, 1, '', 'shelleymyl@gmail.com', '2017-01-19 09:51:07', 'shelleymyl@gmail.com', '2017-01-19 09:51:07'),
(7, 0, 61337, 15294, 1, '', 'shelleymyl@gmail.com', '2017-01-19 09:57:22', 'shelleymyl@gmail.com', '2017-01-19 09:57:22'),
(8, 0, 9, 15800, 1, '', 'test@gmail.com', '2017-02-02 15:09:20', 'test@gmail.com', '2017-02-02 15:09:20'),
(9, 207, 9, 15814, 1, '', 'test@gmail.com', '2017-02-02 15:10:07', 'test@gmail.com', '2017-02-02 15:10:07'),
(10, 0, 9, 15804, 1, '', 'test@gmail.com', '2017-02-02 15:21:27', 'test@gmail.com', '2017-02-02 15:21:27'),
(11, 0, 9, 15814, 1, '', 'test@gmail.com', '2017-02-02 15:35:40', 'test@gmail.com', '2017-02-02 15:35:40'),
(12, 0, 9, 15801, 1, '', 'test@gmail.com', '2017-02-02 15:35:53', 'test@gmail.com', '2017-02-02 15:35:53'),
(13, 207, 9, 15801, 1, '', 'test@gmail.com', '2017-02-02 15:37:17', 'test@gmail.com', '2017-02-02 15:37:17'),
(14, 207, 9, 15800, 1, '', 'test@gmail.com', '2017-02-05 10:25:51', 'test@gmail.com', '2017-02-05 10:25:51'),
(15, 207, 9, 15802, 1, '', 'test@gmail.com', '2017-02-05 10:26:34', 'test@gmail.com', '2017-02-05 10:26:34'),
(16, 207, 1, 16295, 1, '', 'test@gmail.com', '2017-02-05 10:40:50', 'test@gmail.com', '2017-02-05 10:40:50'),
(17, 207, 1, 15890, 1, '', 'test@gmail.com', '2017-02-05 10:41:26', 'test@gmail.com', '2017-02-05 10:41:26'),
(18, 207, 2, 16296, 1, '', 'test@gmail.com', '2017-02-05 10:42:05', 'test@gmail.com', '2017-02-05 10:42:05'),
(19, 207, 3, 16306, 1, '', 'test@gmail.com', '2017-02-06 17:32:04', 'test@gmail.com', '2017-02-06 17:32:04'),
(20, 208, 1, 16564, 1, '', 't@gmail.com', '2017-02-16 21:41:57', 't@gmail.com', '2017-02-16 21:41:57'),
(21, 209, 1, 16556, 1, '', 'er@gmail.com', '2017-02-16 21:43:42', 'er@gmail.com', '2017-02-16 21:43:42'),
(22, 210, 1, 16558, 1, '', 'h@g.com', '2017-02-16 21:57:55', 'h@g.com', '2017-02-16 21:57:55'),
(23, 207, 1, 17165, 1, '', 'test@gmail.com', '2017-03-03 08:34:56', 'test@gmail.com', '2017-03-03 08:34:56');

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
(109, 187, 61340, 15216, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02', 'fudanyinxin@gmail.com', '2016-12-13 07:55:02'),
(110, 0, 61337, 15280, '1', 'A', '', 'shelleymyl@gmail.com', '2017-01-19 09:51:07', 'shelleymyl@gmail.com', '2017-01-19 09:51:07'),
(111, 0, 61337, 15294, '1', 'A', '', 'shelleymyl@gmail.com', '2017-01-19 09:57:22', 'shelleymyl@gmail.com', '2017-01-19 09:57:22'),
(112, 0, 9, 15800, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:09:20', 'test@gmail.com', '2017-02-02 15:09:20'),
(113, 0, 9, 15814, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:10:07', 'test@gmail.com', '2017-02-02 15:10:07'),
(114, 0, 9, 15804, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:21:27', 'test@gmail.com', '2017-02-02 15:21:27'),
(115, 0, 9, 15814, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:35:40', 'test@gmail.com', '2017-02-02 15:35:40'),
(116, 0, 9, 15801, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:35:53', 'test@gmail.com', '2017-02-02 15:35:53'),
(117, 207, 9, 15801, '1', 'A', '', 'test@gmail.com', '2017-02-02 15:37:17', 'test@gmail.com', '2017-02-02 15:37:17'),
(118, 207, 9, 15800, '1', 'A', '', 'test@gmail.com', '2017-02-05 10:25:51', 'test@gmail.com', '2017-02-05 10:25:51'),
(119, 207, 9, 15802, '1', 'A', '', 'test@gmail.com', '2017-02-05 10:26:34', 'test@gmail.com', '2017-02-05 10:26:34'),
(120, 207, 1, 16295, '1', 'A', '', 'test@gmail.com', '2017-02-05 10:40:50', 'test@gmail.com', '2017-02-05 10:40:50'),
(121, 207, 1, 15890, '1', 'A', '', 'test@gmail.com', '2017-02-05 10:41:26', 'test@gmail.com', '2017-02-05 10:41:26'),
(122, 207, 2, 16296, '1', 'A', '', 'test@gmail.com', '2017-02-05 10:42:05', 'test@gmail.com', '2017-02-05 10:42:05'),
(123, 207, 3, 16306, '1', 'A', '', 'test@gmail.com', '2017-02-06 17:32:04', 'test@gmail.com', '2017-02-06 17:32:04'),
(124, 208, 1, 16564, '1', 'A', '', 't@gmail.com', '2017-02-16 21:41:57', 't@gmail.com', '2017-02-16 21:41:57'),
(125, 209, 1, 16556, '1', 'A', '', 'er@gmail.com', '2017-02-16 21:43:42', 'er@gmail.com', '2017-02-16 21:43:42'),
(126, 210, 1, 16558, '1', 'A', '', 'h@g.com', '2017-02-16 21:57:55', 'h@g.com', '2017-02-16 21:57:55'),
(127, 207, 1, 17165, '1', 'A', '', 'test@gmail.com', '2017-03-03 08:34:56', 'test@gmail.com', '2017-03-03 08:34:56');

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

--
-- 转存表中的数据 `fd_rel_customer_doctor`
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
-- 表的结构 `fd_rel_doctor_appointment_time`
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
-- 转存表中的数据 `fd_rel_doctor_appointment_time`
--

INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_DATE`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `REQUESTING_FLAG`, `REQUESTING_USER_ID`, `SUCCESSFUL_FLAG`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(17159, 1, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17160, 1, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17161, 1, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17162, 1, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17163, 1, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17164, 1, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17165, 1, '2017-03-04', '11:00:00', 0, '', 0, 0, 0, '', '0000-00-00 00:00:00', 'test@gmail.com', '2017-03-03 08:34:56'),
(17166, 1, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17167, 1, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17168, 2, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17169, 2, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17170, 2, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17171, 2, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17172, 2, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17173, 2, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17174, 2, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17175, 2, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17176, 2, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17177, 3, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17178, 3, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17179, 3, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17180, 3, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17181, 3, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17182, 3, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17183, 3, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17184, 3, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17185, 3, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17186, 4, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17187, 4, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17188, 4, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17189, 4, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17190, 4, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17191, 4, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17192, 4, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17193, 4, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17194, 4, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17195, 5, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17196, 5, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17197, 5, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17198, 5, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17199, 5, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17200, 5, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17201, 5, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17202, 5, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17203, 5, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17204, 6, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17205, 6, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17206, 6, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17207, 6, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17208, 6, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17209, 6, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17210, 6, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17211, 6, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17212, 6, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17213, 7, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17214, 7, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17215, 7, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17216, 7, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17217, 7, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17218, 7, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17219, 7, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17220, 7, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17221, 7, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17222, 8, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17223, 8, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17224, 8, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17225, 8, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17226, 8, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17227, 8, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17228, 8, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17229, 8, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17230, 8, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17231, 9, '2017-03-04', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17232, 9, '2017-03-04', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17233, 9, '2017-03-04', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17234, 9, '2017-03-04', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17235, 9, '2017-03-04', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17236, 9, '2017-03-04', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17237, 9, '2017-03-04', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17238, 9, '2017-03-04', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17239, 9, '2017-03-04', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17240, 1, '2017-03-05', '09:30:00', 1, '', 1, 207, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17241, 1, '2017-03-05', '09:45:00', 1, '', 1, 207, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17242, 1, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17243, 1, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17244, 1, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17245, 1, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17246, 1, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17247, 1, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17248, 1, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17249, 2, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17250, 2, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17251, 2, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17252, 2, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17253, 2, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17254, 2, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17255, 2, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17256, 2, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17257, 2, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17258, 3, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17259, 3, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17260, 3, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17261, 3, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17262, 3, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17263, 3, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17264, 3, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17265, 3, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17266, 3, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17267, 4, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17268, 4, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17269, 4, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17270, 4, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17271, 4, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17272, 4, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17273, 4, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17274, 4, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17275, 4, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17276, 5, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17277, 5, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17278, 5, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17279, 5, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17280, 5, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17281, 5, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17282, 5, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17283, 5, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17284, 5, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17285, 6, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17286, 6, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17287, 6, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17288, 6, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17289, 6, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17290, 6, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17291, 6, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17292, 6, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17293, 6, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17294, 7, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17295, 7, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17296, 7, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17297, 7, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17298, 7, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17299, 7, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17300, 7, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17301, 7, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17302, 7, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17303, 8, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17304, 8, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17305, 8, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17306, 8, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17307, 8, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17308, 8, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17309, 8, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17310, 8, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17311, 8, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17312, 9, '2017-03-05', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17313, 9, '2017-03-05', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17314, 9, '2017-03-05', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17315, 9, '2017-03-05', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17316, 9, '2017-03-05', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17317, 9, '2017-03-05', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17318, 9, '2017-03-05', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17319, 9, '2017-03-05', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17320, 9, '2017-03-05', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17321, 1, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17322, 1, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17323, 1, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17324, 1, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17325, 1, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17326, 1, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17327, 1, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17328, 1, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17329, 1, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17330, 2, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17331, 2, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17332, 2, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17333, 2, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17334, 2, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17335, 2, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17336, 2, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17337, 2, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17338, 2, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17339, 3, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17340, 3, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17341, 3, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17342, 3, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17343, 3, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17344, 3, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17345, 3, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17346, 3, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17347, 3, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17348, 4, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17349, 4, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17350, 4, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17351, 4, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17352, 4, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17353, 4, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17354, 4, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17355, 4, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17356, 4, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17357, 5, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17358, 5, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17359, 5, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17360, 5, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17361, 5, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17362, 5, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17363, 5, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17364, 5, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17365, 5, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17366, 6, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17367, 6, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17368, 6, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17369, 6, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17370, 6, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17371, 6, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17372, 6, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17373, 6, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17374, 6, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17375, 7, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17376, 7, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17377, 7, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17378, 7, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17379, 7, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17380, 7, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17381, 7, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17382, 7, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17383, 7, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17384, 8, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17385, 8, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17386, 8, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17387, 8, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17388, 8, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17389, 8, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17390, 8, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17391, 8, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17392, 8, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17393, 9, '2017-03-06', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17394, 9, '2017-03-06', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17395, 9, '2017-03-06', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17396, 9, '2017-03-06', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17397, 9, '2017-03-06', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17398, 9, '2017-03-06', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17399, 9, '2017-03-06', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17400, 9, '2017-03-06', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17401, 9, '2017-03-06', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17402, 1, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17403, 1, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17404, 1, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17405, 1, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17406, 1, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17407, 1, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17408, 1, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17409, 1, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17410, 1, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17411, 2, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17412, 2, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17413, 2, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17414, 2, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17415, 2, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17416, 2, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17417, 2, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17418, 2, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17419, 2, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17420, 3, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17421, 3, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17422, 3, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17423, 3, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17424, 3, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17425, 3, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17426, 3, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17427, 3, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17428, 3, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17429, 4, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17430, 4, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17431, 4, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17432, 4, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17433, 4, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17434, 4, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17435, 4, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17436, 4, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17437, 4, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17438, 5, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17439, 5, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17440, 5, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17441, 5, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17442, 5, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17443, 5, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17444, 5, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17445, 5, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17446, 5, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17447, 6, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17448, 6, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17449, 6, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17450, 6, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17451, 6, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17452, 6, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17453, 6, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17454, 6, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17455, 6, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17456, 7, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17457, 7, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17458, 7, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17459, 7, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17460, 7, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17461, 7, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17462, 7, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17463, 7, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17464, 7, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17465, 8, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17466, 8, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17467, 8, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17468, 8, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17469, 8, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17470, 8, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17471, 8, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17472, 8, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17473, 8, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17474, 9, '2017-03-07', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17475, 9, '2017-03-07', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17476, 9, '2017-03-07', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17477, 9, '2017-03-07', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17478, 9, '2017-03-07', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17479, 9, '2017-03-07', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17480, 9, '2017-03-07', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17481, 9, '2017-03-07', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17482, 9, '2017-03-07', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17483, 1, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17484, 1, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17485, 1, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17486, 1, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17487, 1, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17488, 1, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17489, 1, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17490, 1, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17491, 1, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17492, 2, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17493, 2, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17494, 2, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17495, 2, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17496, 2, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17497, 2, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17498, 2, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17499, 2, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17500, 2, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17501, 3, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17502, 3, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17503, 3, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17504, 3, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17505, 3, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17506, 3, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17507, 3, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17508, 3, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17509, 3, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17510, 4, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17511, 4, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17512, 4, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17513, 4, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17514, 4, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17515, 4, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17516, 4, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17517, 4, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17518, 4, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17519, 5, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17520, 5, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17521, 5, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17522, 5, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17523, 5, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17524, 5, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17525, 5, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17526, 5, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17527, 5, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17528, 6, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17529, 6, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17530, 6, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17531, 6, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17532, 6, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17533, 6, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17534, 6, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17535, 6, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17536, 6, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17537, 7, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17538, 7, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17539, 7, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17540, 7, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17541, 7, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17542, 7, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17543, 7, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17544, 7, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17545, 7, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17546, 8, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17547, 8, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17548, 8, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17549, 8, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17550, 8, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17551, 8, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17552, 8, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17553, 8, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17554, 8, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17555, 9, '2017-03-08', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17556, 9, '2017-03-08', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17557, 9, '2017-03-08', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17558, 9, '2017-03-08', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17559, 9, '2017-03-08', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17560, 9, '2017-03-08', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17561, 9, '2017-03-08', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17562, 9, '2017-03-08', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17563, 9, '2017-03-08', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17564, 1, '2017-03-09', '09:30:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17565, 2, '2017-03-09', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17566, 3, '2017-03-09', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17567, 4, '2017-03-09', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17568, 5, '2017-03-09', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17569, 6, '2017-03-09', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17570, 7, '2017-03-09', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17571, 8, '2017-03-09', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17572, 9, '2017-03-09', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17573, 1, '2017-03-10', '09:30:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17574, 2, '2017-03-10', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17575, 3, '2017-03-10', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17576, 4, '2017-03-10', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17577, 5, '2017-03-10', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17578, 6, '2017-03-10', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17579, 7, '2017-03-10', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17580, 8, '2017-03-10', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(17581, 9, '2017-03-10', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

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
-- 表的结构 `fd_rel_doctor_language`
--

CREATE TABLE `fd_rel_doctor_language` (
  `DOCTOR_LANGUAGE_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `LANGUAGE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `fd_rel_doctor_language`
--

INSERT INTO `fd_rel_doctor_language` (`DOCTOR_LANGUAGE_ID`, `DOCTOR_ID`, `LANGUAGE_ID`) VALUES
(66, 1, 3),
(67, 1, 0),
(68, 1, 1),
(69, 1, 2),
(70, 2, 3),
(71, 3, 0),
(72, 4, 1),
(73, 5, 2),
(74, 6, 3),
(75, 7, 0),
(76, 8, 1),
(77, 9, 2),
(78, 8, 2),
(79, 9, 3);

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
-- 表的结构 `fd_save_search`
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
-- 转存表中的数据 `fd_save_search`
--

INSERT INTO `fd_save_search` (`CUSTOMER_SEARCH_ID`, `CUSTOMER_USER_ID`, `SEARCH_NAME`, `CLINIC_SUBURB`, `STATE_ID`, `CLINIC_NAME`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DISTANCE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18'),
(2, 207, '', 'Box Hill, VIC 3128', '', '', 'GP', '', '', 'test@gmail.com', '2017-02-16 18:49:10', 'test@gmail.com', '2017-02-16 18:49:10');

-- --------------------------------------------------------

--
-- 表的结构 `fd_service`
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
-- 转存表中的数据 `fd_service`
--

INSERT INTO `fd_service` (`SERVICE_CODE`, `SERVICE_ID`, `DES`, `SERVICE_JS`, `URL`, `INPUT_PARA`, `OUTPUT_PARA`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(4, 'UI01', '用户登录', 'sign_in.js', 'url: \"classes/class.sign_in.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(5, 'UI02', '获取用户详细信息(条件用户名)', 'appointmentDoctor.js', 'url: \"classes/class.UserDetail.php\",', 'username: username', '用户详细信息', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(6, 'UI03', '获取用户详细信息(条件用户ID)', 'userUpdPersonInfo.js', 'url: \"classes/class.UserDetail.php\",', 'action_type: \"view\", CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(7, 'UU01', '个人用户注册(游客通过预约,自动注册)', 'appointmentDoctor.js', 'url: \"classes/class.sign_up_person.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(8, 'UU02', '个人用户注册(通过注册页面注册)', 'sign_up_person.js', 'url: \"classes/class.sign_up_person.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(9, 'UU03', '修改个人用户信息', 'userUpdPersonInfo.j', 'url: \"classes/class.UserDetail.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(10, 'UU04', '修改个人用户密码', 'userUpdPersonPwd.js', 'url: \"classes/class.UserDetail.php\",', 'action_type:\"update\", CUSTOMER_USER_ID:fd_userid, CUSTOMER_USER_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(11, 'CU01', '诊所用户注册', 'sign_up_clinic.js', 'url: \"classes/class.signup_clinic.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(12, 'CU02', '获取诊所用户详细信息', 'clinicUpdUserInfo.js', 'url: \"classes/class.ClinicDetail.php\",', 'action_type: \"view\",\r\nCLINIC_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(13, 'CU03', '修改诊所用户信息', 'clinicUpdUserInfo.js', 'url: \"classes/class.ClinicDetail.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(16, 'CU04', '修改诊所用户密码', 'clinicUpdUserPwd.js', 'url: \"classes/class.ClinicDetail.php\",', 'action_type:\"update\",\r\nCLINIC_USER_ID:fd_userid,\r\nCLINIC_USER_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(17, 'CU05', '诊所用户搜索医生', 'clinicQryDoctor.js', 'url: \"classes/class.ClinicOprDoctor.php\",', 'CLINIC_USER_ID: fd_userid,\r\n    DOCTOR_TYPE: $(\'#DOCTOR_TYPE\').val(),\r\n    DOCTOR_NAME: $(\'#DOCTOR_NAME\').val(),', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(18, 'CU06', '修改医生为inactive/active', 'clinicQryDoctor.js', 'url: \"classes/class.ClinicOprDoctor.php\",', 'action_type: \"update\",\r\n      ACTIVE_STATUS: 0|1,\r\n      DOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(19, 'CU07', '修改医生基本信息', 'clinicUpdDoctorDetail.js', 'url: \"classes/class.ClinicOprDoctor.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(20, 'SD01', '搜索医生(主页全体条件 or)', 'searchDoctor.js', 'url: \"classes/class.searchDoctor.php\",', '见首页输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 0 查询条件or', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(21, 'SD02', '搜索医生(主页全体条件 and)', 'searchDoctor.js', 'url: \"classes/class.searchDoctor.php\",', '搜索医生也点击搜索按钮，全体输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 1 查询条件and', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(22, 'ST01', '搜索医生预约时间ID(条件医生ID,预约时间日期，时间)', 'appointmentDoctor.js', 'url: \"classes/class.searchAppTimeID.php\",', 'DOCTOR_ID: $(\'#DOCTOR_ID\').val(),\r\nAPPOINTMENT_DATE:\r\nAPPOINTMENT_TIME: radio_txt', '搜索医生预约时间ID', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(23, 'SP01', '搜索预约状态（填充下拉框）', 'userAppointmentRecoder.js', 'url: \"classes/class.getAppointmentStatus.php\",', 'para=\"\";', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(24, 'SP02', '搜索预约记录', 'userAppointmentRecoder.js', 'url: \"classes/class.AppointmentRecoder.php\",', 'CUSTOMER_USER_ID: userid,\r\nCREATE_DATE_BEGIN:  $(\'#begin_time\').val(),\r\nCREATE_DATE_END:  $(\'#end_time\').val(),\r\nAPPOINTMENT_STATUS_ID : $(\'#app_status\').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(25, 'AD01', '预约医生', 'appointmentDoctor.js', 'url: \"classes/class.appointmentDoctor.php\",', 'action_type: \"\"create\"\",\r\nCUSTOMER_USER_NAME: $(\'#CUSTOMER_USER_NAME\').val(),\r\nCUSTOMER_USER_PWD: $(\'#CUSTOMER_USER_PWD\').val(),\r\nCUSTOMER_USER_ID: custom_user_id,\r\nDOCTOR_ID: $(\'#DOCTOR_ID\').val(),\r\nDOCTOR_APPOINTMENT_TIME_ID:time_id,\r\nAPPOINTMENT_STATUS_ID:1', '预约成功', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(26, 'AD02', '取消预约', 'userAppointmentRecoder.js', 'url: \"classes/class.AppointmentRecoder.php\",', 'action_type: \"\"update\"\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID,\r\nCREATE_DATE: CREATE_DATE', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(27, 'S001', '收藏医生', 'appointmentDoctor.js', 'url: \"classes/class.saveDoctor.php\",', 'action_type:\"\"create\"\",\r\nCUSTOMER_USER_ID:$(\'#CUSTOMER_USER_ID\').val(),\r\nDOCTOR_ID:$(\'#DOCTOR_ID\').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(28, 'S002', '搜索收藏的医生', 'userSaveDoctor.js', 'url: \"classes/class.saveDoctor.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(29, 'S003', '删除收藏医生', 'userSaveDoctor.js', 'url: \"classes/class.saveDoctor.php\",', 'action_type: \"\"remove\"\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(30, 'SS01', '保存为常用搜索条件', 'searchDoctor.js', 'url: \"classes/class.saveSearch.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(31, 'SS02', '搜索常用搜索条件', 'userSaveSearch.js', 'url: \"classes/class.saveSearch.php\",', 'CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(32, 'SS03', '删除常用搜索条件', 'userSaveSearch.js', 'url: \"classes/class.saveSearch.php\",', 'action_type: \"remove\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nCUSTOMER_SEARCH_ID: CUSTOMER_SEARCH_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(36, 'AU01', '修改管理员密码', 'adminUpdPwd.js', 'url: \"classes/class.AdminDetail.php\",', 'action_type: \"update\",\r\nADMIN_ID:fd_userid,\r\nADMIN_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(37, 'AU02', '查询诊所用户', 'adminQryClinic.js', 'url: \"classes/class.ClinicDetail.php\",', '页面输入条件', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(38, 'AU03', '查询个人用户', 'adminQryUser.js', 'url: \"classes/class.UserDetail.php\",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(39, 'AU06', '修改诊所用户为inactive/active', 'adminQryClinic.js', 'url: \"classes/class.ClinicDetail.php\",', 'action_type: \"update_active\",\r\nACTIVE_STATUS: 0,\r\nCLINIC_USER_ID: CLINIC_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(40, 'AU07', '修改个人用户为inactive/active', 'adminQryUser.js', 'url: \"classes/class.UserDetail.php\",', 'action_type: \"update_active\",\r\nACTIVE_STATUS: 1/0,\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(41, 'SSTE', '填充州下拉列表', 'adminQryUser.js', 'url: \"classes/class.getState.php\",', '空', '州所有内容', '全部查询，无需条件', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(42, 'SDTY', '填充医生类别', 'adminQryDoctor.js', 'url: \"classes/class.getDoctorType.php\",', '无', '医生所有类别', '查询全部内容', 'admin', '2016-09-10 00:00:00', 'admin', '2016-09-10 00:00:00'),
(43, 'SSUB', '填充区', 'userSaveDoctor.js', 'url: \"classes/class.getSuburb.php\",', '无', '全部诊所区', '查询全部，无条件', 'admin', '2016-09-13 00:00:00', 'admin', '2016-09-13 00:00:00');

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
-- Indexes for table `fd_dict_language`
--
ALTER TABLE `fd_dict_language`
  ADD PRIMARY KEY (`LANGUAGE_ID`);

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
-- Indexes for table `fd_rel_doctor_language`
--
ALTER TABLE `fd_rel_doctor_language`
  ADD PRIMARY KEY (`DOCTOR_LANGUAGE_ID`);

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
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ap_patient`
--
ALTER TABLE `ap_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `fd_admin`
--
ALTER TABLE `fd_admin`
  MODIFY `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  MODIFY `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  MODIFY `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- 使用表AUTO_INCREMENT `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  MODIFY `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `fd_dict_search`
--
ALTER TABLE `fd_dict_search`
  MODIFY `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `fd_dict_state`
--
ALTER TABLE `fd_dict_state`
  MODIFY `STATE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `fd_doctor`
--
ALTER TABLE `fd_doctor`
  MODIFY `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  MODIFY `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17582;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_language`
--
ALTER TABLE `fd_rel_doctor_language`
  MODIFY `DOCTOR_LANGUAGE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- 使用表AUTO_INCREMENT `fd_role`
--
ALTER TABLE `fd_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_save_search`
--
ALTER TABLE `fd_save_search`
  MODIFY `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `fd_service`
--
ALTER TABLE `fd_service`
  MODIFY `SERVICE_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- 使用表AUTO_INCREMENT `fd_user`
--
ALTER TABLE `fd_user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

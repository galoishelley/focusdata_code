-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-25 09:49:11
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
  IF ( DATEIN >= DATE_ADD(CURRENT_DATE(),INTERVAL 4 DAY) ) THEN
    SELECT t1.APPOINTMENT_DATE, 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME,
           t2.DOCTOR_INFO,
           t8.LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
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
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE >= DATE_SUB(DATEIN,INTERVAL 3 DAY)
           AND t1.APPOINTMENT_DATE <= DATE_ADD(DATEIN,INTERVAL 3 DAY)
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
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
           t2.DOCTOR_INFO,
           t8.LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
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
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE >= CURRENT_DATE() 
           AND t1.APPOINTMENT_DATE <= DATE_ADD(DATEIN,INTERVAL 6 DAY)
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%') 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_7_days` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50))  READS SQL DATA
BEGIN 
  IF ( DATEIN >= DATE_ADD(CURRENT_DATE(),INTERVAL 4 DAY) ) THEN
    SELECT distinct t1.APPOINTMENT_DATE
           
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
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE >= DATE_SUB(DATEIN,INTERVAL 3 DAY)
           AND t1.APPOINTMENT_DATE <= DATE_ADD(DATEIN,INTERVAL 3 DAY)
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
    ORDER BY t1.APPOINTMENT_DATE asc, 
              t1.DOCTOR_ID asc, 
              t1.APPOINTMENT_TIME asc; 
  ELSE 
    SELECT distinct t1.APPOINTMENT_DATE
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
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE >= CURRENT_DATE() 
           AND t1.APPOINTMENT_DATE <= DATE_ADD(DATEIN,INTERVAL 6 DAY)
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%') 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_clinic` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50), IN `startPageIN` INT(50), IN `pageSizeIN` INT(50))  READS SQL DATA
BEGIN 
SELECT * from (
    SELECT 
		   t4.IS_YELLOWPAGE,
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME) as APPOINTMENT_TIME
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
		   select t6.DOCTOR_ID,GROUP_CONCAT(DISTINCT t7.LANGUAGE_NAME) as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
    WHERE  t1.ACTIVE_STATUS = 1
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE = DATEIN
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
			group by CLINIC_USER_ID	
				
union
	SELECT 
		   t4.IS_YELLOWPAGE,
           '',
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
           t5.STATE_NAME,
		   ''
    FROM   
		   
		fd_clinic_user t4 
		LEFT JOIN fd_rel_clinic_doctor t3 
				ON t3.CLINIC_USER_ID = t4.CLINIC_USER_ID 
		LEFT JOIN fd_doctor t2 
		ON t2.DOCTOR_ID = t3.DOCTOR_ID 
				  
				  
		LEFT JOIN fd_dict_state t5 
				ON t4.STATE_ID = t5.STATE_ID 
           
    WHERE  t4.IS_YELLOWPAGE=1
           
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%') 
                  OR CLINICNAMEIN = '' )
				) A limit startPageIN,pageSizeIN;
           
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_clinic_count` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50))  READS SQL DATA
BEGIN 

SELECT count(*) AS COUNT from (
    SELECT 
		   t4.IS_YELLOWPAGE,
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME) as APPOINTMENT_TIME
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
		   select t6.DOCTOR_ID,GROUP_CONCAT(DISTINCT t7.LANGUAGE_NAME) as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
    WHERE  t1.ACTIVE_STATUS = 1
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE = DATEIN
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
			group by CLINIC_USER_ID	
				
union
	SELECT 
           t4.IS_YELLOWPAGE,
           '',
           t3.CLINIC_USER_ID,
           t4.CLINIC_PHOTO,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t4.CLINIC_OVERVIEW,
           t5.STATE_NAME,
		   ''
    FROM   
		   
		fd_clinic_user t4 
		LEFT JOIN fd_rel_clinic_doctor t3 
				ON t3.CLINIC_USER_ID = t4.CLINIC_USER_ID 
		LEFT JOIN fd_doctor t2 
		ON t2.DOCTOR_ID = t3.DOCTOR_ID 
				  
				  
		LEFT JOIN fd_dict_state t5 
				ON t4.STATE_ID = t5.STATE_ID 
           
    WHERE  t4.IS_YELLOWPAGE=1
           
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%') 
                  OR CLINICNAMEIN = '' )
                  ) A;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_doctor` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50), IN `startPageIN` INT(50), IN `pageSizeIN` INT(50))  READS SQL DATA
BEGIN 
SELECT * from (
    SELECT 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME,
           t2.DOCTOR_INFO,
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME) as APPOINTMENT_TIME
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
		   select t6.DOCTOR_ID,GROUP_CONCAT(DISTINCT t7.LANGUAGE_NAME) as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
    WHERE  t1.ACTIVE_STATUS = 1
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE = DATEIN
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
			group by DOCTOR_ID
            ) A limit startPageIN,pageSizeIN;
           
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_doctor_count` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100), IN `doctorIDIN` VARCHAR(50), IN `clinicIDIN` VARCHAR(50))  READS SQL DATA
BEGIN 
SELECT count(*) AS COUNT from (
    SELECT 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME,
           t2.DOCTOR_INFO,
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME) as APPOINTMENT_TIME
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
		   select t6.DOCTOR_ID,GROUP_CONCAT(DISTINCT t7.LANGUAGE_NAME) as LANGUAGE_NAME from
fd_rel_doctor_language as t6 left join fd_dict_language as t7 on t6.LANGUAGE_ID = t7.LANGUAGE_ID
group by t6.DOCTOR_ID
		   ) t8
           ON t1.DOCTOR_ID = t8.DOCTOR_ID
    WHERE  t1.ACTIVE_STATUS = 1
		   AND t4.IS_YELLOWPAGE=0
           AND t1.APPOINTMENT_DATE = DATEIN
           AND CONCAT(t1.APPOINTMENT_DATE, ' ', t1.APPOINTMENT_TIME) > Now() 
           AND ( t5.STATE_NAME = STATEIN 
                  OR STATEIN = '' ) 
           AND ( t4.CLINIC_SUBURB = SUBURBIN 
                  OR SUBURBIN = '' ) 
           AND ( t4.CLINIC_POSTCODE = POSTCODEIN 
                  OR POSTCODEIN = '' ) 
           AND ( t2.DOCTOR_TYPE = DOCTORTYPEIN 
                  OR DOCTORTYPEIN = '' ) 
           AND ( t4.CLINIC_NAME like CONCAT('%', CLINICNAMEIN, '%')
                  OR CLINICNAMEIN = '' ) 
           AND ( t2.DOCTOR_NAME like CONCAT('%', DOCTORNAMEIN, '%')
                  OR DOCTORNAMEIN = '' ) 
           AND ( t1.DOCTOR_ID = DOCTORIDIN
                OR DOCTORIDIN='')
           AND ( t3.CLINIC_USER_ID = CLINICIDIN
                OR CLINICIDIN='')
			group by DOCTOR_ID
            
            )A ;
           
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
  `CLINIC_PHONE` varchar(50) NOT NULL,
  `CLINIC_PHOTO` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `CLINIC_POSTCODE` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `CLINIC_LAT` varchar(20) NOT NULL,
  `CLINIC_LNG` varchar(20) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `CLINIC_OVERVIEW` varchar(5000) DEFAULT NULL,
  `IS_YELLOWPAGE` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_PHONE`, `CLINIC_PHOTO`, `CLINIC_ADDR`, `CLINIC_POSTCODE`, `CLINIC_SUBURB`, `CLINIC_LAT`, `CLINIC_LNG`, `STATE_ID`, `ACTIVE_STATUS`, `CLINIC_OVERVIEW`, `IS_YELLOWPAGE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, '89634c352f3a1dc151e8cd19a859f27a', 'bencaotang@gmail.com', 'Box Hill Superclinic', '', 'super.jpg', '810 Whitehorse Road', '3127', 'Box Hill', '', '', 7, 1, NULL, 0, 'bencaotang@gmail.com', '2017-01-23 08:37:39', 'bencaotang@gmail.com', '2017-01-23 08:37:39'),
(2, '25ccd325869097a683e3466ffcaf31cf', 'baozhilin@gmail.com', 'Box Hill Medical Centre', '', 'medical.jpg', '528 Station Street', '3128', 'Box Hill', '', '', 7, 1, NULL, 0, 'baozhilin@gmail.com', '2017-01-20 13:16:46', 'baozhilin@gmail.com', '2017-01-20 13:16:46'),
(3, 'fef7a0536578a077d04989b3c8f98dbd', 'jingwumen@gmail.com', 'Box Hill Mall Medical Centre', '', 'mall.jpg', '8 Market Street', '3128', 'Box Hill', '', '', 7, 1, NULL, 0, 'jingwumen@gmail.com', '2017-01-20 13:18:09', 'jingwumen@gmail.com', '2017-01-20 13:18:09'),
(10001, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic1@gmail.com', 'Wong Robert', '(03) 9590 0147', 'DefaultClinic.jpg', '302 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10002, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic2@gmail.com', 'Waverley Heart Clinic', '(03) 9561 9688', 'DefaultClinic.jpg', 'Ste 7/ 264 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10003, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic3@gmail.com', 'Waverley General Practice', '(03) 9802 8155', 'DefaultClinic.jpg', '370 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10004, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic4@gmail.com', 'Waverley Eye Clinic', '(03) 9886 5522', 'DefaultClinic.jpg', '226 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10005, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic5@gmail.com', 'Warburton Fiona Dr', '(03) 9802 8844', 'DefaultClinic.jpg', '1 Fairhills Parade', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10006, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic6@gmail.com', 'Walton Tony', '(03) 9426 6693', 'DefaultClinic.jpg', 'Suite 6 262- 264 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10007, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic7@gmail.com', 'Wallis Ben Dr', '(03) 9814 9999', 'DefaultClinic.jpg', '244 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10008, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic8@gmail.com', 'Vinci Angela Dr', '(03) 9814 9999', 'DefaultClinic.jpg', '244 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10009, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic9@gmail.com', 'Veins Clinic', '(03) 9803 4800', 'DefaultClinic.jpg', '747 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10010, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic10@gmail.com', 'Vasta C S & Corrigan M L', '(03) 9560 1266', 'DefaultClinic.jpg', '17 Hampshire Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10011, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic11@gmail.com', 'Thomas Clayton Dr', '(03) 9566 2733', 'DefaultClinic.jpg', '499 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10012, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic12@gmail.com', 'Thean Janice Dr', '(03) 9886 5522', 'DefaultClinic.jpg', '226 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10013, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic13@gmail.com', 'Specialist Vein Care', '(03) 9561 5155', 'DefaultClinic.jpg', '258 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10014, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic14@gmail.com', 'Skinner TG Dr', '(03) 9802 8844', 'DefaultClinic.jpg', '1 Fairhills Parade', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10015, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic15@gmail.com', 'Singh Harpreet', '(03) 9802 8155', 'DefaultClinic.jpg', '370 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10016, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic16@gmail.com', 'Robertson I E V', '(03) 9802 9101', 'DefaultClinic.jpg', '598 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10017, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic17@gmail.com', 'Robertson Dr. Ian', '(03) 9802 9101', 'DefaultClinic.jpg', '598 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10018, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic18@gmail.com', 'Riseley Judith Dr', '(03) 9814 9999', 'DefaultClinic.jpg', '244 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10019, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic19@gmail.com', 'Riseley Judith', '(03) 9803 4800', 'DefaultClinic.jpg', '747 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10020, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic20@gmail.com', 'Reid John D.', 'Send Enquiry', 'DefaultClinic.jpg', '859 Waverley Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10021, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic21@gmail.com', 'Pippa Marsdland Dr.', '(03) 9802 8155', 'DefaultClinic.jpg', '370 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10022, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic22@gmail.com', 'A Wheelers Hill Clinic', '', 'DefaultClinic.jpg', '847 Ferntree Gully Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10023, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic23@gmail.com', 'AAA Waverley Medical Centre', '', 'DefaultClinic.jpg', '244 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10024, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic24@gmail.com', 'Ah Sang Wendy', '(03) 9561 3200', 'DefaultClinic.jpg', '847 Ferntree Gully Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10025, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic25@gmail.com', 'Al-Souffi M Dr', '(03) 9562 2288', 'DefaultClinic.jpg', 'Cnr Springvale Rd and Magid Ave', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10026, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic26@gmail.com', 'Appletree Hill Medical Centre', '(03) 9887 8223', 'DefaultClinic.jpg', '888 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10027, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic27@gmail.com', 'Arnold Carolyn Dr', '(03) 9566 2733', 'DefaultClinic.jpg', '499 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10028, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic28@gmail.com', 'Banerjee Pramita Dr', '(03) 9814 9999', 'DefaultClinic.jpg', '244 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10029, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic29@gmail.com', 'Bob Haran Dr', '(03) 9561 6102', 'DefaultClinic.jpg', '6 Ondine Dr', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10030, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic30@gmail.com', 'Cheah S H DR', '(03) 9561 3999', 'DefaultClinic.jpg', '183 Jells Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10031, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic31@gmail.com', 'Chitra Haran, Dr', '(03) 9561 6102', 'DefaultClinic.jpg', '6 Ondine Dr', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10032, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic32@gmail.com', 'Court D', '(03) 9561 3200', 'DefaultClinic.jpg', '847 Ferntree Gully Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10033, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic33@gmail.com', 'Court D B', '(03) 9561 3200', 'DefaultClinic.jpg', '847 Ferntree Gully Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10034, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic34@gmail.com', 'Courtney Peter Dr', '(03) 9566 2759', 'DefaultClinic.jpg', '499 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10035, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic35@gmail.com', 'DeSouza Michael Dr', '(03) 9803 5494', 'DefaultClinic.jpg', '888 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10036, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic36@gmail.com', 'Diagnostic Medical Ultrasound Services Pty Ltd', '1300 693 246', 'DefaultClinic.jpg', 'Suite Ground Floor 24 202 Jells Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10037, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic37@gmail.com', 'Ebrahim E', '(03) 9560 9473', 'DefaultClinic.jpg', '705 Waverley Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10038, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic38@gmail.com', 'Edwards Christine Dr', '(03) 9803 5494', 'DefaultClinic.jpg', '888 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10039, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic39@gmail.com', 'Elderton Janette Dr', '(03) 9803 5494', 'DefaultClinic.jpg', '888 High Street Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10040, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic40@gmail.com', 'Fairhills Medical Clinic', '', 'DefaultClinic.jpg', '1 Fairhills Parade', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10041, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic41@gmail.com', 'Freeman Anne', '(03) 9562 2288', 'DefaultClinic.jpg', '2 Magid Ave', '3170', 'Mulgrave', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10042, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic42@gmail.com', 'Gregory Lee', '(03) 9562 2288', 'DefaultClinic.jpg', '2 Magid Ave', '3170', 'Mulgrave', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10043, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic43@gmail.com', 'Athari Dr.', '(03) 9748 9777', 'DefaultClinic.jpg', '241 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10044, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic44@gmail.com', 'Barnetson W', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10045, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic45@gmail.com', 'Bermudez R', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10046, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic46@gmail.com', 'Bradley M F', '(03) 9741 9511', 'DefaultClinic.jpg', '1 Pine Ave', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10047, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic47@gmail.com', 'Braude G', '(03) 9749 2766', 'DefaultClinic.jpg', '229 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10048, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic48@gmail.com', 'Burke Dr', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10049, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic49@gmail.com', 'Calder R T Dr', '(03) 9216 8633', 'DefaultClinic.jpg', '300 Princess Hwy', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10050, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic50@gmail.com', 'Caric Vladimir Dr', '(03) 9395 6333', 'DefaultClinic.jpg', 'Shop 33/ 300 Point Cook Rd', '3030', 'Point Cook', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10051, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic51@gmail.com', 'Caroline Syme', '0432 023 416', 'DefaultClinic.jpg', '5 Huntington Ct', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10052, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic52@gmail.com', 'Cox Dr', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10053, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic53@gmail.com', 'Dalton Dr', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10054, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic54@gmail.com', 'Dillane P', '(03) 9741 2033', 'DefaultClinic.jpg', '13 Synnot St', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10055, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic55@gmail.com', 'Dr Jared Mee', '(03) 9749 7846', 'DefaultClinic.jpg', '297 Princess Hwy', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10056, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic56@gmail.com', 'Dr. Chalam Kolli', '', 'DefaultClinic.jpg', '15 Princes Hwy', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10057, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic57@gmail.com', 'Dr. Peter Pocock', '(03) 9395 3899', 'DefaultClinic.jpg', '69 Sanctuary Lakes South Blv', '3030', 'Point Cook', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10058, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic58@gmail.com', 'Dunne K', '(03) 9741 9191', 'DefaultClinic.jpg', '297 Princes Hwy', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10059, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic59@gmail.com', 'Feekery Colin', '(03) 9749 2766', 'DefaultClinic.jpg', '229 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10060, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic60@gmail.com', 'Fernando Dr', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10061, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic61@gmail.com', 'Giam E', '(03) 9749 2766', 'DefaultClinic.jpg', '229 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10062, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic62@gmail.com', 'Giam Edward', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10063, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic63@gmail.com', 'Gilani M', '(03) 9749 2766', 'DefaultClinic.jpg', '233 Heaths Rd', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10064, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic64@gmail.com', 'Grogan Helen Dr', '', 'DefaultClinic.jpg', '242 Hoppers Lane', '3030', 'Werribee', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10065, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic65@gmail.com', 'A M Monteith', '(03) 9830 7130', 'DefaultClinic.jpg', '524 Whitehorse Rd', '3127', 'Surrey Hills', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10066, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic66@gmail.com', 'A Whiter Smiley', '1300 661 159', 'DefaultClinic.jpg', '541 Elgar Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10067, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic67@gmail.com', 'Alpha Dental Group', '(03) 9894 4479', 'DefaultClinic.jpg', '20C Blackburn Rd', '3130', 'Blackburn', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10068, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic68@gmail.com', 'An Eileen Dr', '(03) 9899 0288', 'DefaultClinic.jpg', 'Level 1 934 Whitehorse Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10069, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic69@gmail.com', 'Australian Unity Dental Care', '(03) 9897 1038', 'DefaultClinic.jpg', '973 Whitehorse Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10070, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic70@gmail.com', 'Bastian Kathryn Dr', '(03) 9808 1735', 'DefaultClinic.jpg', '204 Elgar Rd', '3128', 'Box Hill South', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10071, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic71@gmail.com', 'Blackburn Clinic Dental Centre', '(03) 9878 1597', 'DefaultClinic.jpg', '195 Whitehorse Rd', '3130', 'Blackburn', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10072, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic72@gmail.com', 'Blackburn Dental Group', '(03) 9878 1411', 'DefaultClinic.jpg', '23 Blackburn Rd', '3130', 'Blackburn', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10073, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic73@gmail.com', 'Box Hill Dental', '(03) 9890 7364', 'DefaultClinic.jpg', '106 Thames St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10074, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic74@gmail.com', 'Box Hill Family Dentistry', '(03) 9899 3110', 'DefaultClinic.jpg', 'Level 2/ 43 Carrington Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10075, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic75@gmail.com', 'Boyd Robyn', '(03) 9890 7364', 'DefaultClinic.jpg', '106 Thames St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10076, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic76@gmail.com', 'Burwood Dental Centre', '(03) 9888 7534', 'DefaultClinic.jpg', '356 Burwood Hwy', '3125', 'Burwood', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10077, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic77@gmail.com', 'Chan Steven K W Dr', '(03) 9890 7100', 'DefaultClinic.jpg', 'Suite 8, Centro Box Hill North , 17 Market St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10078, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic78@gmail.com', 'Chang Juliana Dr', '(03) 9899 0288', 'DefaultClinic.jpg', 'Level 1 934 Whitehorse Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10079, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic79@gmail.com', 'Cheung D K S Dr', '(03) 9899 3415', 'DefaultClinic.jpg', '1st Floor 591 Station St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10080, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic80@gmail.com', 'Chong Dental Surgery', '(03) 9899 2980', 'DefaultClinic.jpg', 'Level 1/587- 589 Station St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10081, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic81@gmail.com', 'Chong Dental Surgery', '(03) 9899 2980', 'DefaultClinic.jpg', '1st Floor 587- 589 Station St', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10082, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic82@gmail.com', 'Crystal Dental Imaging', '(03) 9897 1569', 'DefaultClinic.jpg', '1029 Whitehorse Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10083, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic83@gmail.com', 'Dental Care Today', '0448 832 867', 'DefaultClinic.jpg', '244 Canterbury Rd', '3131', 'Forest Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10084, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic84@gmail.com', 'Dentalcare For All', '(03) 9897 1174', 'DefaultClinic.jpg', 'Suite 3/ 1A Carrington Rd', '3128', 'Box Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10085, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic85@gmail.com', 'A. Pacella Dr', '(03) 9560 9573', 'DefaultClinic.jpg', '268 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10086, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic86@gmail.com', 'AA Pacella Dr & Associates', '(03) 9560 9573', 'DefaultClinic.jpg', '268 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10087, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic87@gmail.com', 'Agha Karim Dr', '(03) 9561 1118', 'DefaultClinic.jpg', '568 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10088, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic88@gmail.com', 'Bloom Jason Dr', '(03) 9803 0964', 'DefaultClinic.jpg', '312 Blackburn Rd', '3149', 'Mt Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10089, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic89@gmail.com', 'Borgula Luke Dr', '(03) 9574 7757', 'DefaultClinic.jpg', 'Suite 2 262- 264 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10090, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic90@gmail.com', 'Chan Michelle', '(03) 9887 8787', 'DefaultClinic.jpg', '230 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10091, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic91@gmail.com', 'Chong Kiang Dr.', '(03) 9561 5355', 'DefaultClinic.jpg', '686 Ferntree Gully Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10092, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic92@gmail.com', 'Chua Lawrence Dr', '(03) 9802 0198', 'DefaultClinic.jpg', '470 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10093, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic93@gmail.com', 'De Hoyos Miro Dr', '(03) 9561 1118', 'DefaultClinic.jpg', '568 Blackburn Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10094, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic94@gmail.com', 'Dentist @ 330', '(03) 9886 5318', 'DefaultClinic.jpg', '330 Highbury Rd', '3149', 'Mt Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10095, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic95@gmail.com', 'Dowling Lawrence G & Melissa', '(03) 9802 2899', 'DefaultClinic.jpg', '240 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10096, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic96@gmail.com', 'Dr A Pacella Pty Ltd', '(03) 9560 9573', 'DefaultClinic.jpg', '268 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10097, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic97@gmail.com', 'Dr Andreas Bechler & Associates', '(03) 9803 3998', 'DefaultClinic.jpg', '1C Hanover Rd', '3133', 'Vermont South', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10098, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic98@gmail.com', 'Dr Barry Kave', '(03) 9560 2702', 'DefaultClinic.jpg', '861A Waverley Rd', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10099, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic99@gmail.com', 'Dr Kevin Prouse and Dr M. Timol', '(03) 9560 5581', 'DefaultClinic.jpg', '9 Collegium Ave', '3150', 'Wheelers Hill', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10100, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic100@gmail.com', 'EK Dental', '(03) 9887 8787', 'DefaultClinic.jpg', '230 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10101, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic101@gmail.com', 'EK Dental Surgery', '(03) 9887 8787', 'DefaultClinic.jpg', '230 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10102, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic102@gmail.com', 'Ek Lee C Dr', '(03) 9887 8787', 'DefaultClinic.jpg', '230 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10103, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic103@gmail.com', 'Estioko Leora Dr', '(03) 9560 2177', 'DefaultClinic.jpg', 'Suite 5 Level 1 264 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10104, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic104@gmail.com', 'Farmer Glenda', '(03) 9802 2899', 'DefaultClinic.jpg', '240 Springvale Rd', '3150', 'Glen Waverley', '', '', 7, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10105, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic105@gmail.com', 'Advanced Imaging Parramatta', '', 'DefaultClinic.jpg', '116 Macquarie St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10106, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic106@gmail.com', 'Agar Ashish Dr', '(02) 9635 7077', 'DefaultClinic.jpg', '152 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10107, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic107@gmail.com', 'Andrew Malous', '(02) 9687 6395', 'DefaultClinic.jpg', '191 Church St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10108, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic108@gmail.com', 'Argyle Street Medical Centre', '(02) 9893 8733', 'DefaultClinic.jpg', 'Shop 13, Westfield Shopping Town, Cnr Marsden and Argyle Sreets', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10109, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic109@gmail.com', 'Aroney Jim & Caraiscos Phillip', '(02) 9893 8733', 'DefaultClinic.jpg', '144- 146 Church St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10110, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic110@gmail.com', 'Banerjee Bharati Dr', '(02) 9635 7077', 'DefaultClinic.jpg', '152 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10111, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic111@gmail.com', 'Chan Derek Dr', '(02) 9635 7077', 'DefaultClinic.jpg', '152 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10112, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic112@gmail.com', 'Christopher', '(02) 8677 7043', 'DefaultClinic.jpg', '302 Church St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10113, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic113@gmail.com', 'Dr Dai Tran', '(02) 9687 7664', 'DefaultClinic.jpg', 'Level 2 Suite 6 154 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10114, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic114@gmail.com', 'Dr Dai Tran', '(02) 9687 7664', 'DefaultClinic.jpg', 'Suite 6 Level 2 154 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10115, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic115@gmail.com', 'Dr Stewart Precians', '(02) 9687 7664', 'DefaultClinic.jpg', 'Ste 6/ 154 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10116, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic116@gmail.com', 'Fed Dept Health', '(02) 9865 9333', 'DefaultClinic.jpg', '20 Smith St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39'),
(10117, 'b87fd559e522c3bf34deb1b3d68ff15d', 'ypclinic117@gmail.com', 'Fitzsimons Ross Dr', '(02) 9635 7077', 'DefaultClinic.jpg', '152 Marsden St', '2150', 'Parramatta', '', '', 2, 1, NULL, 1, 'admin', '2017-01-23 08:37:39', 'admin', '2017-01-23 08:37:39');

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
  `CUSTOMER_LAT` varchar(20) NOT NULL,
  `CUSTOMER_LNG` varchar(20) NOT NULL,
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

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_PWD`, `CUSTOMER_USER_MAIL`, `CUSTOMER_FIRSTNAME`, `CUSTOMER_LASTNAME`, `TITLE_ID`, `GENDER_ID`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_POSTCODE`, `CUSTOMER_SUBURB`, `CUSTOMER_LAT`, `CUSTOMER_LNG`, `STATE_ID`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(207, '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', 'test', 'test', 0, 0, '11/11/1983', '1 Whitehorse Road', '3128', 'Box Hill', '', '', 7, '0412341234', '1231231231', 1, '', 'test@gmail.com', '2017-01-23 09:51:38', 'test@gmail.com', '2017-01-23 09:51:38');

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
(1, 'Booked'),
(2, 'Cancelled'),
(3, 'Check in'),
(4, 'No show');

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
  `DOCTOR_INFO` varchar(5000) NOT NULL,
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
(1, 'GP', 'John Doe', '', 1, 'test_huatuo.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(2, 'GP', 'Frank Underwood', '', 1, 'test_bianque.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(3, 'GP', 'Cal Lightman', '', 1, 'test_lishizhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(4, 'GP', 'Roy Brench', '', 1, 'test_huangfeihong.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(5, 'GP', 'Gillian Foster', '', 1, 'test_shisanyi.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(6, 'GP', 'Ria Torres', '', 1, 'test_linshirong.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(7, 'GP', 'Jane Bob', '', 1, 'test_huoyuanjia.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(8, 'GP', 'Maurice Moss', '', 1, 'test_chenzhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(9, 'GP', 'Douglas Reynholm', '', 1, 'test_huotingen.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(101, 'GP', 'John Doe', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(102, 'GP', 'Frank Underwood', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(103, 'GP', 'Cal Lightman', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(104, 'GP', 'Roy Brench', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(105, 'GP', 'Gillian Foster', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(106, 'GP', 'Ria Torres', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(107, 'GP', 'Jane Bob', '', 1, 'test_doctor.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(108, 'GP', 'Maurice Moss', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(109, 'GP', 'Douglas Reynholm', '', 1, 'test_doctor.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(111, 'GP', 'John Doe', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(112, 'GP', 'Frank Underwood', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(113, 'GP', 'Cal Lightman', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(114, 'GP', 'Roy Brench', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(115, 'GP', 'Gillian Foster', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(116, 'GP', 'Ria Torres', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(117, 'GP', 'Jane Bob', '', 1, 'test_doctor.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(118, 'GP', 'Maurice Moss', '', 1, 'test_doctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(119, 'GP', 'Douglas Reynholm', '', 1, 'test_doctor.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10001, 'GP', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10002, 'Dentist', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10003, 'Dietitian', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10004, 'Physio', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10005, 'Podiatrist', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10006, 'Psychologist', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10007, 'Chiropractor', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10008, 'Audiologist', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10009, 'Optometry', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10010, 'Skin specialist', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(10011, 'Counsellor', 'DummyDoctor', '', 1, 'DefaultDoctor.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

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
(5, 2, 5, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, 2, 6, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(7, 3, 7, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(8, 3, 8, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(9, 3, 9, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, 1, 101, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(12, 1, 102, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(13, 1, 103, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(14, 1, 104, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(15, 1, 105, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(16, 1, 106, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(17, 1, 107, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(18, 1, 108, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(19, 1, 109, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(21, 1, 111, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(22, 1, 112, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(23, 1, 113, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(24, 1, 114, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(25, 1, 115, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(26, 1, 116, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(27, 1, 117, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(28, 1, 118, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(29, 1, 119, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10001, 10001, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10002, 10002, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10003, 10003, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10004, 10004, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10005, 10005, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10006, 10006, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10007, 10007, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10008, 10008, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10009, 10009, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10010, 10010, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10011, 10011, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10012, 10012, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10013, 10013, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10014, 10014, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10015, 10015, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10016, 10016, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10017, 10017, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10018, 10018, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10019, 10019, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10020, 10020, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10021, 10021, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10022, 10022, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10023, 10023, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10024, 10024, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10025, 10025, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10026, 10026, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10027, 10027, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10028, 10028, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10029, 10029, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10030, 10030, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10031, 10031, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10032, 10032, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10033, 10033, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10034, 10034, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10035, 10035, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10036, 10036, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10037, 10037, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10038, 10038, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10039, 10039, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10040, 10040, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10041, 10041, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10042, 10042, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10043, 10043, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10044, 10044, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10045, 10045, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10046, 10046, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10047, 10047, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10048, 10048, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10049, 10049, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10050, 10050, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10051, 10051, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10052, 10052, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10053, 10053, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10054, 10054, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10055, 10055, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10056, 10056, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10057, 10057, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10058, 10058, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10059, 10059, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10060, 10060, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10061, 10061, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10062, 10062, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10063, 10063, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10064, 10064, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10065, 10065, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10066, 10066, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10067, 10067, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10068, 10068, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10069, 10069, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10070, 10070, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10071, 10071, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10072, 10072, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10073, 10073, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10074, 10074, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10075, 10075, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10076, 10076, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10077, 10077, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10078, 10078, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10079, 10079, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10080, 10080, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10081, 10081, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10082, 10082, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10083, 10083, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10084, 10084, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10085, 10085, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10086, 10086, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10087, 10087, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10088, 10088, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10089, 10089, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10090, 10090, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10091, 10091, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10092, 10092, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10093, 10093, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10094, 10094, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10095, 10095, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10096, 10096, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10097, 10097, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10098, 10098, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10099, 10099, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10100, 10100, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10101, 10101, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10102, 10102, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10103, 10103, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10104, 10104, 10002, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10105, 10105, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10106, 10106, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10107, 10107, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10108, 10108, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10109, 10109, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10110, 10110, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10111, 10111, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10112, 10112, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10113, 10113, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10114, 10114, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10115, 10115, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10116, 10116, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(10117, 10117, 10001, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00');

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
(23, 207, 1, 17165, 1, '', 'test@gmail.com', '2017-03-03 08:34:56', 'test@gmail.com', '2017-03-03 08:34:56'),
(24, 207, 11, 19429, 1, '', 'test@gmail.com', '2017-03-28 11:33:38', 'test@gmail.com', '2017-03-28 11:33:38'),
(25, 207, 11, 19430, 1, '', 'test@gmail.com', '2017-03-28 11:34:16', 'test@gmail.com', '2017-03-28 11:34:16'),
(26, 211, 1, 23771, 1, '', 'c@c.com', '2017-04-19 10:37:55', 'c@c.com', '2017-04-19 10:37:55');

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
(127, 207, 1, 17165, '1', 'A', '', 'test@gmail.com', '2017-03-03 08:34:56', 'test@gmail.com', '2017-03-03 08:34:56'),
(128, 207, 11, 19429, '1', 'A', '', 'test@gmail.com', '2017-03-28 11:33:38', 'test@gmail.com', '2017-03-28 11:33:38'),
(129, 207, 11, 19430, '1', 'A', '', 'test@gmail.com', '2017-03-28 11:34:16', 'test@gmail.com', '2017-03-28 11:34:16'),
(130, 211, 1, 23771, '1', 'A', '', 'c@c.com', '2017-04-19 10:37:55', 'c@c.com', '2017-04-19 10:37:55');

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
(6, 0, 61338, '', 'fudanyinxin@gmail.com', '2016-12-14 07:54:19', 'fudanyinxin@gmail.com', '2016-12-14 07:54:19'),
(7, 207, 4, '', 'test@gmail.com', '2017-04-04 10:20:28', 'test@gmail.com', '2017-04-04 10:20:28'),
(8, 207, 1, '', 'test@gmail.com', '2017-04-04 10:34:54', 'test@gmail.com', '2017-04-04 10:34:54'),
(9, 207, 2, '', 'test@gmail.com', '2017-04-04 10:34:57', 'test@gmail.com', '2017-04-04 10:34:57'),
(10, 207, 5, '', 'test@gmail.com', '2017-04-25 03:22:03', 'test@gmail.com', '2017-04-25 03:22:03');

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
(26169, 1, '2017-04-24', '20:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26170, 1, '2017-04-24', '20:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26171, 1, '2017-04-24', '21:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26172, 1, '2017-04-24', '21:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26173, 1, '2017-04-24', '21:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26174, 1, '2017-04-24', '21:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26175, 1, '2017-04-24', '22:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26176, 1, '2017-04-24', '22:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26177, 1, '2017-04-24', '22:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26178, 2, '2017-04-24', '22:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26179, 2, '2017-04-24', '22:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26180, 2, '2017-04-24', '23:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26181, 2, '2017-04-24', '23:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26182, 2, '2017-04-24', '23:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26183, 2, '2017-04-24', '23:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26184, 2, '2017-04-24', '12:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26185, 2, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26186, 2, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26187, 3, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26188, 3, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26189, 3, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26190, 3, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26191, 3, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26192, 3, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26193, 3, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26194, 3, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26195, 3, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26196, 4, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26197, 4, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26198, 4, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26199, 4, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26200, 4, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26201, 4, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26202, 4, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26203, 4, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26204, 4, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26205, 5, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26206, 5, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26207, 5, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26208, 5, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26209, 5, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26210, 5, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26211, 5, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26212, 5, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26213, 5, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26214, 6, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26215, 6, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26216, 6, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26217, 6, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26218, 6, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26219, 6, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26220, 6, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26221, 6, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26222, 6, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26223, 7, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26224, 7, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26225, 7, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26226, 7, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26227, 7, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26228, 7, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26229, 7, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26230, 7, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26231, 7, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26232, 8, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26233, 8, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26234, 8, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26235, 8, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26236, 8, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26237, 8, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26238, 8, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26239, 8, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26240, 8, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26241, 9, '2017-04-24', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26242, 9, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26243, 9, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26244, 9, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26245, 9, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26246, 9, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26247, 9, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26248, 9, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26249, 9, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26250, 1, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26251, 1, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26252, 1, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26253, 1, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26254, 1, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26255, 1, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26256, 1, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26257, 1, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26258, 1, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26259, 2, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26260, 2, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26261, 2, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26262, 2, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26263, 2, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26264, 2, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26265, 2, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26266, 2, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26267, 2, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26268, 3, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26269, 3, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26270, 3, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26271, 3, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26272, 3, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26273, 3, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26274, 3, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26275, 3, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26276, 3, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26277, 4, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26278, 4, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26279, 4, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26280, 4, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26281, 4, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26282, 4, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26283, 4, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26284, 4, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26285, 4, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26286, 5, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26287, 5, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26288, 5, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26289, 5, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26290, 5, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26291, 5, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26292, 5, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26293, 5, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26294, 5, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26295, 6, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26296, 6, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26297, 6, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26298, 6, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26299, 6, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26300, 6, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26301, 6, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26302, 6, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26303, 6, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26304, 7, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26305, 7, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26306, 7, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26307, 7, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26308, 7, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26309, 7, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26310, 7, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26311, 7, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26312, 7, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26313, 8, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26314, 8, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26315, 8, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26316, 8, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26317, 8, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26318, 8, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26319, 8, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26320, 8, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26321, 8, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26322, 9, '2017-04-25', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26323, 9, '2017-04-25', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26324, 9, '2017-04-25', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26325, 9, '2017-04-25', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26326, 9, '2017-04-25', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26327, 9, '2017-04-25', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26328, 9, '2017-04-25', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26329, 9, '2017-04-25', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26330, 9, '2017-04-25', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26331, 101, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26332, 102, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26333, 103, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26334, 104, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26335, 105, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26336, 106, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26337, 107, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26338, 108, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26339, 109, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26340, 111, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26341, 112, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26342, 113, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26343, 114, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26344, 115, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26345, 116, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26346, 117, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26347, 118, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26348, 119, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26349, 1, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26350, 1, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26351, 1, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26352, 1, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26353, 1, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26354, 1, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26355, 1, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26356, 1, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26357, 1, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26358, 2, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26359, 2, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26360, 2, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26361, 2, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26362, 2, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26363, 2, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26364, 2, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26365, 2, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26366, 2, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26367, 3, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26368, 3, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26369, 3, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26370, 3, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26371, 3, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26372, 3, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26373, 3, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26374, 3, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26375, 3, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26376, 4, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26377, 4, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26378, 4, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26379, 4, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26380, 4, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26381, 4, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26382, 4, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26383, 4, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26384, 4, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26385, 5, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26386, 5, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26387, 5, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26388, 5, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26389, 5, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26390, 5, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26391, 5, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26392, 5, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26393, 5, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26394, 6, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26395, 6, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26396, 6, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26397, 6, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26398, 6, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26399, 6, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26400, 6, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26401, 6, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26402, 6, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26403, 7, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26404, 7, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26405, 7, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26406, 7, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26407, 7, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26408, 7, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26409, 7, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26410, 7, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26411, 7, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26412, 8, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26413, 8, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26414, 8, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26415, 8, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26416, 8, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26417, 8, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26418, 8, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26419, 8, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26420, 8, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26421, 9, '2017-04-26', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26422, 9, '2017-04-26', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26423, 9, '2017-04-26', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26424, 9, '2017-04-26', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26425, 9, '2017-04-26', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26426, 9, '2017-04-26', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26427, 9, '2017-04-26', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26428, 9, '2017-04-26', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26429, 9, '2017-04-26', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26430, 1, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26431, 1, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26432, 1, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26433, 1, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26434, 1, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26435, 1, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26436, 1, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26437, 1, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26438, 1, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26439, 2, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26440, 2, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26441, 2, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26442, 2, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26443, 2, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26444, 2, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26445, 2, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26446, 2, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26447, 2, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26448, 3, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26449, 3, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26450, 3, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26451, 3, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26452, 3, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26453, 3, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26454, 3, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26455, 3, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26456, 3, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26457, 4, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26458, 4, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26459, 4, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26460, 4, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26461, 4, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26462, 4, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26463, 4, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26464, 4, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26465, 4, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26466, 5, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26467, 5, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26468, 5, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26469, 5, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26470, 5, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26471, 5, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26472, 5, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26473, 5, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26474, 5, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26475, 6, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26476, 6, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26477, 6, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26478, 6, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26479, 6, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26480, 6, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26481, 6, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26482, 6, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26483, 6, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26484, 7, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26485, 7, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26486, 7, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26487, 7, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26488, 7, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26489, 7, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26490, 7, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26491, 7, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26492, 7, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26493, 8, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26494, 8, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26495, 8, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26496, 8, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26497, 8, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26498, 8, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26499, 8, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26500, 8, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26501, 8, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26502, 9, '2017-04-27', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26503, 9, '2017-04-27', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26504, 9, '2017-04-27', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26505, 9, '2017-04-27', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26506, 9, '2017-04-27', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26507, 9, '2017-04-27', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26508, 9, '2017-04-27', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26509, 9, '2017-04-27', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26510, 9, '2017-04-27', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26511, 1, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26512, 1, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26513, 1, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26514, 1, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26515, 1, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26516, 1, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26517, 1, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26518, 1, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26519, 1, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26520, 2, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26521, 2, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26522, 2, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26523, 2, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26524, 2, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26525, 2, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26526, 2, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26527, 2, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26528, 2, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26529, 3, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26530, 3, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26531, 3, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26532, 3, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26533, 3, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26534, 3, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26535, 3, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26536, 3, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26537, 3, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26538, 4, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26539, 4, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26540, 4, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26541, 4, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26542, 4, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26543, 4, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26544, 4, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26545, 4, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26546, 4, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26547, 5, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26548, 5, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26549, 5, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26550, 5, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26551, 5, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26552, 5, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26553, 5, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26554, 5, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26555, 5, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26556, 6, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26557, 6, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26558, 6, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26559, 6, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26560, 6, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26561, 6, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26562, 6, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26563, 6, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26564, 6, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26565, 7, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26566, 7, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26567, 7, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26568, 7, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26569, 7, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26570, 7, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26571, 7, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26572, 7, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26573, 7, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26574, 8, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26575, 8, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26576, 8, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26577, 8, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26578, 8, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26579, 8, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26580, 8, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26581, 8, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26582, 8, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26583, 9, '2017-04-28', '09:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26584, 9, '2017-04-28', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26585, 9, '2017-04-28', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26586, 9, '2017-04-28', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26587, 9, '2017-04-28', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26588, 9, '2017-04-28', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26589, 9, '2017-04-28', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26590, 9, '2017-04-28', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26591, 9, '2017-04-28', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26592, 9, '2017-04-28', '11:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26593, 9, '2017-04-28', '12:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26594, 9, '2017-04-28', '12:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26595, 9, '2017-04-28', '12:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26596, 9, '2017-04-28', '12:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26597, 9, '2017-04-28', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26598, 9, '2017-04-28', '13:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26599, 9, '2017-04-28', '13:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26600, 9, '2017-04-28', '13:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26601, 9, '2017-04-28', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26602, 9, '2017-04-28', '14:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26603, 9, '2017-04-28', '14:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26604, 9, '2017-04-28', '14:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26605, 9, '2017-04-28', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26606, 9, '2017-04-28', '15:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26607, 9, '2017-04-28', '15:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26608, 9, '2017-04-28', '15:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26609, 9, '2017-04-28', '16:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26610, 9, '2017-04-28', '16:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26611, 1, '2017-04-29', '09:30:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26612, 2, '2017-04-29', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26613, 3, '2017-04-29', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26614, 4, '2017-04-29', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26615, 5, '2017-04-29', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26616, 6, '2017-04-29', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26617, 7, '2017-04-29', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26618, 8, '2017-04-29', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26619, 9, '2017-04-29', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26620, 1, '2017-04-30', '09:30:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26621, 2, '2017-04-30', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26622, 3, '2017-04-30', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26623, 4, '2017-04-30', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26624, 5, '2017-04-30', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26625, 6, '2017-04-30', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26626, 7, '2017-04-30', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26627, 8, '2017-04-30', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26628, 9, '2017-04-30', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26629, 1, '2017-04-24', '09:30:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26630, 2, '2017-04-24', '09:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26631, 3, '2017-04-24', '10:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26632, 4, '2017-04-24', '10:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26633, 5, '2017-04-24', '10:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26634, 6, '2017-04-24', '10:45:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26635, 7, '2017-04-24', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(26636, 8, '2017-04-24', '11:15:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_DATE`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `REQUESTING_FLAG`, `REQUESTING_USER_ID`, `SUCCESSFUL_FLAG`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(26637, 9, '2017-04-24', '11:30:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

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
(72, 4, 1),
(73, 5, 2),
(74, 6, 3),
(86, 2, 2),
(87, 3, 3),
(92, 1, 1),
(93, 8, 2),
(94, 8, 3),
(95, 9, 2),
(96, 9, 3),
(97, 7, 2),
(98, 1, 2),
(99, 1, 3),
(100, 1, 0);

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
(2, 207, '', '', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-11 05:21:53', 'test@gmail.com', '2017-04-11 05:21:53'),
(3, 207, '', '', '', '', '', '', '20km', 'test@gmail.com', '2017-04-23 17:40:56', 'test@gmail.com', '2017-04-23 17:40:56'),
(4, 207, '', '', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:01', 'test@gmail.com', '2017-04-23 17:41:01'),
(5, 207, '', '222', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:04', 'test@gmail.com', '2017-04-23 17:41:04'),
(6, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:08', 'test@gmail.com', '2017-04-23 17:41:08'),
(7, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:14', 'test@gmail.com', '2017-04-23 17:41:14'),
(8, 207, '', '222', '', 'eeeee', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:20', 'test@gmail.com', '2017-04-23 17:41:20'),
(9, 207, '', '222', '', 'eeeee', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:23', 'test@gmail.com', '2017-04-23 17:41:23'),
(10, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:27', 'test@gmail.com', '2017-04-23 17:41:27'),
(11, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4f', '20km', 'test@gmail.com', '2017-04-23 17:41:31', 'test@gmail.com', '2017-04-23 17:41:31'),
(12, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4fe', '20km', 'test@gmail.com', '2017-04-23 17:41:33', 'test@gmail.com', '2017-04-23 17:41:33'),
(13, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '20km', 'test@gmail.com', '2017-04-23 17:41:36', 'test@gmail.com', '2017-04-23 17:41:36'),
(14, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:39', 'test@gmail.com', '2017-04-23 17:41:39'),
(15, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:43', 'test@gmail.com', '2017-04-23 17:41:43'),
(16, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:47', 'test@gmail.com', '2017-04-23 17:41:47'),
(17, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '5km', 'test@gmail.com', '2017-04-23 17:41:52', 'test@gmail.com', '2017-04-23 17:41:52'),
(18, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '20km', 'test@gmail.com', '2017-04-23 17:41:55', 'test@gmail.com', '2017-04-23 17:41:55'),
(19, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrssswww', '20km', 'test@gmail.com', '2017-04-23 17:41:58', 'test@gmail.com', '2017-04-23 17:41:58'),
(20, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddddddxe', '', '444rrrrr4ferrssswww', '20km', 'test@gmail.com', '2017-04-23 17:42:03', 'test@gmail.com', '2017-04-23 17:42:03'),
(21, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18'),
(22, 207, '', '', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-11 05:21:53', 'test@gmail.com', '2017-04-11 05:21:53'),
(23, 207, '', '', '', '', '', '', '20km', 'test@gmail.com', '2017-04-23 17:40:56', 'test@gmail.com', '2017-04-23 17:40:56'),
(24, 207, '', '', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:01', 'test@gmail.com', '2017-04-23 17:41:01'),
(25, 207, '', '222', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:04', 'test@gmail.com', '2017-04-23 17:41:04'),
(26, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:08', 'test@gmail.com', '2017-04-23 17:41:08'),
(27, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:14', 'test@gmail.com', '2017-04-23 17:41:14'),
(28, 207, '', '222', '', 'eeeee', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:20', 'test@gmail.com', '2017-04-23 17:41:20'),
(29, 207, '', '222', '', 'eeeee', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:23', 'test@gmail.com', '2017-04-23 17:41:23'),
(30, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:27', 'test@gmail.com', '2017-04-23 17:41:27'),
(31, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4f', '20km', 'test@gmail.com', '2017-04-23 17:41:31', 'test@gmail.com', '2017-04-23 17:41:31'),
(32, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4fe', '20km', 'test@gmail.com', '2017-04-23 17:41:33', 'test@gmail.com', '2017-04-23 17:41:33'),
(33, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '20km', 'test@gmail.com', '2017-04-23 17:41:36', 'test@gmail.com', '2017-04-23 17:41:36'),
(34, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:39', 'test@gmail.com', '2017-04-23 17:41:39'),
(35, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:43', 'test@gmail.com', '2017-04-23 17:41:43'),
(36, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:47', 'test@gmail.com', '2017-04-23 17:41:47'),
(37, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '5km', 'test@gmail.com', '2017-04-23 17:41:52', 'test@gmail.com', '2017-04-23 17:41:52'),
(38, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '20km', 'test@gmail.com', '2017-04-23 17:41:55', 'test@gmail.com', '2017-04-23 17:41:55'),
(39, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18'),
(40, 207, '', '', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-11 05:21:53', 'test@gmail.com', '2017-04-11 05:21:53'),
(41, 207, '', '', '', '', '', '', '20km', 'test@gmail.com', '2017-04-23 17:40:56', 'test@gmail.com', '2017-04-23 17:40:56'),
(42, 207, '', '', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:01', 'test@gmail.com', '2017-04-23 17:41:01'),
(43, 207, '', '222', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:04', 'test@gmail.com', '2017-04-23 17:41:04'),
(44, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:08', 'test@gmail.com', '2017-04-23 17:41:08'),
(45, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:14', 'test@gmail.com', '2017-04-23 17:41:14'),
(46, 207, '', '222', '', 'eeeee', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:20', 'test@gmail.com', '2017-04-23 17:41:20'),
(47, 207, '', '222', '', 'eeeee', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:23', 'test@gmail.com', '2017-04-23 17:41:23'),
(48, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:27', 'test@gmail.com', '2017-04-23 17:41:27'),
(49, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4f', '20km', 'test@gmail.com', '2017-04-23 17:41:31', 'test@gmail.com', '2017-04-23 17:41:31'),
(50, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4fe', '20km', 'test@gmail.com', '2017-04-23 17:41:33', 'test@gmail.com', '2017-04-23 17:41:33'),
(51, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '20km', 'test@gmail.com', '2017-04-23 17:41:36', 'test@gmail.com', '2017-04-23 17:41:36'),
(52, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:39', 'test@gmail.com', '2017-04-23 17:41:39'),
(53, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:43', 'test@gmail.com', '2017-04-23 17:41:43'),
(54, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:47', 'test@gmail.com', '2017-04-23 17:41:47'),
(55, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '5km', 'test@gmail.com', '2017-04-23 17:41:52', 'test@gmail.com', '2017-04-23 17:41:52'),
(56, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '20km', 'test@gmail.com', '2017-04-23 17:41:55', 'test@gmail.com', '2017-04-23 17:41:55'),
(57, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18'),
(58, 207, '', '', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-11 05:21:53', 'test@gmail.com', '2017-04-11 05:21:53'),
(59, 207, '', '', '', '', '', '', '20km', 'test@gmail.com', '2017-04-23 17:40:56', 'test@gmail.com', '2017-04-23 17:40:56'),
(60, 207, '', '', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:01', 'test@gmail.com', '2017-04-23 17:41:01'),
(61, 207, '', '222', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:04', 'test@gmail.com', '2017-04-23 17:41:04'),
(62, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:08', 'test@gmail.com', '2017-04-23 17:41:08'),
(63, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:14', 'test@gmail.com', '2017-04-23 17:41:14'),
(64, 207, '', '222', '', 'eeeee', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:20', 'test@gmail.com', '2017-04-23 17:41:20'),
(65, 207, '', '222', '', 'eeeee', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:23', 'test@gmail.com', '2017-04-23 17:41:23'),
(66, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:27', 'test@gmail.com', '2017-04-23 17:41:27'),
(67, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4f', '20km', 'test@gmail.com', '2017-04-23 17:41:31', 'test@gmail.com', '2017-04-23 17:41:31'),
(68, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4fe', '20km', 'test@gmail.com', '2017-04-23 17:41:33', 'test@gmail.com', '2017-04-23 17:41:33'),
(69, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '20km', 'test@gmail.com', '2017-04-23 17:41:36', 'test@gmail.com', '2017-04-23 17:41:36'),
(70, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:39', 'test@gmail.com', '2017-04-23 17:41:39'),
(71, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:43', 'test@gmail.com', '2017-04-23 17:41:43'),
(72, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:47', 'test@gmail.com', '2017-04-23 17:41:47'),
(73, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '5km', 'test@gmail.com', '2017-04-23 17:41:52', 'test@gmail.com', '2017-04-23 17:41:52'),
(74, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '20km', 'test@gmail.com', '2017-04-23 17:41:55', 'test@gmail.com', '2017-04-23 17:41:55'),
(75, 0, '', '', '', '', '', '', '', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18', 'fudanyinxin@gmail.com', '2016-12-14 07:24:18'),
(76, 207, '', '', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-11 05:21:53', 'test@gmail.com', '2017-04-11 05:21:53'),
(77, 207, '', '', '', '', '', '', '20km', 'test@gmail.com', '2017-04-23 17:40:56', 'test@gmail.com', '2017-04-23 17:40:56'),
(78, 207, '', '', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:01', 'test@gmail.com', '2017-04-23 17:41:01'),
(79, 207, '', '222', '', '21', '', '', '20km', 'test@gmail.com', '2017-04-23 17:41:04', 'test@gmail.com', '2017-04-23 17:41:04'),
(80, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:08', 'test@gmail.com', '2017-04-23 17:41:08'),
(81, 207, '', '222', '', '21', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:14', 'test@gmail.com', '2017-04-23 17:41:14'),
(82, 207, '', '222', '', 'eeeee', '', '444', '20km', 'test@gmail.com', '2017-04-23 17:41:20', 'test@gmail.com', '2017-04-23 17:41:20'),
(83, 207, '', '222', '', 'eeeee', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:23', 'test@gmail.com', '2017-04-23 17:41:23'),
(84, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr', '20km', 'test@gmail.com', '2017-04-23 17:41:27', 'test@gmail.com', '2017-04-23 17:41:27'),
(85, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4f', '20km', 'test@gmail.com', '2017-04-23 17:41:31', 'test@gmail.com', '2017-04-23 17:41:31'),
(86, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4fe', '20km', 'test@gmail.com', '2017-04-23 17:41:33', 'test@gmail.com', '2017-04-23 17:41:33'),
(87, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '20km', 'test@gmail.com', '2017-04-23 17:41:36', 'test@gmail.com', '2017-04-23 17:41:36'),
(88, 207, '', '222', '', 'eeeeerrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:39', 'test@gmail.com', '2017-04-23 17:41:39'),
(89, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrr', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:43', 'test@gmail.com', '2017-04-23 17:41:43'),
(90, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferr', '5km', 'test@gmail.com', '2017-04-23 17:41:47', 'test@gmail.com', '2017-04-23 17:41:47'),
(91, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '5km', 'test@gmail.com', '2017-04-23 17:41:52', 'test@gmail.com', '2017-04-23 17:41:52'),
(92, 207, '', '222', '', 'eeeeerrrrrrrrrrrrrrrddd', '', '444rrrrr4ferrsss', '20km', 'test@gmail.com', '2017-04-23 17:41:55', 'test@gmail.com', '2017-04-23 17:41:55'),
(93, 207, '', 'Box Hill, VIC 3128', '', '', 'GP', '', '', 'test@gmail.com', '2017-04-25 03:23:46', 'test@gmail.com', '2017-04-25 03:23:46'),
(94, 207, '', 'Box Hill, VIC 3128', '', '', 'Podiatrist', '', '', 'test@gmail.com', '2017-04-25 03:24:33', 'test@gmail.com', '2017-04-25 03:24:33'),
(95, 207, '', 'Box Hill, VIC 3128', '', '', 'Podiatrist', '', '', 'test@gmail.com', '2017-04-25 03:27:01', 'test@gmail.com', '2017-04-25 03:27:01');

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
  MODIFY `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10118;
--
-- 使用表AUTO_INCREMENT `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  MODIFY `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
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
  MODIFY `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10012;
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
  MODIFY `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10118;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- 使用表AUTO_INCREMENT `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  MODIFY `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26638;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_rel_doctor_language`
--
ALTER TABLE `fd_rel_doctor_language`
  MODIFY `DOCTOR_LANGUAGE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- 使用表AUTO_INCREMENT `fd_role`
--
ALTER TABLE `fd_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `fd_save_search`
--
ALTER TABLE `fd_save_search`
  MODIFY `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
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

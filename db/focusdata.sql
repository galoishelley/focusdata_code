-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: focusdata
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ap_patient`
--

DROP TABLE IF EXISTS `ap_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_admin`
--

DROP TABLE IF EXISTS `fd_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_admin` (
  `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMIN_NAME` varchar(50) NOT NULL,
  `ADMIN_PWD` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_clinic_user`
--

DROP TABLE IF EXISTS `fd_clinic_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `BULK_BILLING` int(11) DEFAULT '0',
  `LATE_HOUR_SERVICES` int(11) DEFAULT '0',
  `FREE_PARKING` int(11) DEFAULT '0',
  `WHEELCHAIR_ACCESS` int(11) DEFAULT '0',
  `FEMALE_DOCTOR` int(11) DEFAULT '0',
  `HOME_VISIT` int(11) DEFAULT '0',
  `ONSITE_PATHOLOGY_COLLECTION` int(11) DEFAULT '0',
  `AGPAL` int(11) DEFAULT '0',
  `STANDARD_15_MINUTE_CONSULTATION` int(11) DEFAULT '0',
  `EXTEND_30_MINUTE_CONSULTATION` int(11) DEFAULT '0',
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CLINIC_USER_ID`),
  KEY `FK_fd_clinic_user_2` (`STATE_ID`),
  CONSTRAINT `FK_fd_clinic_user_2` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_customer_user`
--

DROP TABLE IF EXISTS `fd_customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `ACTIVATE` int(11) NOT NULL DEFAULT '0',
  `ACTIVATION_CODE` varchar(45) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_USER_ID`),
  KEY `FK_fd_customer_user_7` (`STATE_ID`),
  CONSTRAINT `FK_fd_customer_user_7` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_appointment_status`
--

DROP TABLE IF EXISTS `fd_dict_appointment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_appointment_status` (
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPOINTMENT_STATUS` varchar(50) NOT NULL,
  PRIMARY KEY (`APPOINTMENT_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_gender_ch`
--

DROP TABLE IF EXISTS `fd_dict_gender_ch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_gender_ch` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`GENDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_gender_en`
--

DROP TABLE IF EXISTS `fd_dict_gender_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_gender_en` (
  `GENDER_ID` int(11) NOT NULL,
  `GENDER_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`GENDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_interest`
--

DROP TABLE IF EXISTS `fd_dict_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_interest` (
  `INTEREST_ID` int(11) NOT NULL,
  `INTEREST_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`INTEREST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_language`
--

DROP TABLE IF EXISTS `fd_dict_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_language` (
  `LANGUAGE_ID` int(11) NOT NULL,
  `LANGUAGE_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_log_type`
--

DROP TABLE IF EXISTS `fd_dict_log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_log_type` (
  `LOG_TYPE_ID` int(11) NOT NULL,
  `LOG_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`LOG_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_search`
--

DROP TABLE IF EXISTS `fd_dict_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_search` (
  `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEARCH_CONTENT` varchar(50) NOT NULL,
  PRIMARY KEY (`SEARCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_state`
--

DROP TABLE IF EXISTS `fd_dict_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_state` (
  `STATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATE_NAME` varchar(50) NOT NULL,
  `STATE_POSTCODE` varchar(50) NOT NULL,
  PRIMARY KEY (`STATE_ID`),
  UNIQUE KEY `STATE_NAME` (`STATE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_dict_title`
--

DROP TABLE IF EXISTS `fd_dict_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_dict_title` (
  `TITLE_ID` int(11) NOT NULL,
  `TITLE_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`TITLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_doctor`
--

DROP TABLE IF EXISTS `fd_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_doctor` (
  `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID_IMPORT` int(11) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DOCTOR_GENDER` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `DOCTOR_PHOTO` varchar(200) NOT NULL,
  `DOCTOR_YEAR` varchar(45) DEFAULT NULL,
  `DOCTOR_INFO` varchar(5000) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10073 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_function`
--

DROP TABLE IF EXISTS `fd_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_function` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_log`
--

DROP TABLE IF EXISTS `fd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_log` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_clinic_doctor`
--

DROP TABLE IF EXISTS `fd_rel_clinic_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_clinic_doctor` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_customer_appointment`
--

DROP TABLE IF EXISTS `fd_rel_customer_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_customer_appointment` (
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_customer_appointment_his`
--

DROP TABLE IF EXISTS `fd_rel_customer_appointment_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_customer_appointment_his` (
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_customer_doctor`
--

DROP TABLE IF EXISTS `fd_rel_customer_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_customer_doctor` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_doctor_appointment_time`
--

DROP TABLE IF EXISTS `fd_rel_doctor_appointment_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_doctor_appointment_time` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID` int(11) NOT NULL DEFAULT '0',
  `APPOINTMENT_DATE` date NOT NULL,
  `APPOINTMENT_TIME` time NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `REQUESTING_FLAG` int(11) NOT NULL DEFAULT '0',
  `REQUESTING_USER_ID` int(11) NOT NULL DEFAULT '0',
  `SUCCESSFUL_FLAG` int(11) NOT NULL DEFAULT '0',
  `BP_APPOINTMENT_ID` int(11) NOT NULL DEFAULT '0',
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`),
  KEY `FK_fd_rel_doctor_appointment_time_1` (`DOCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=481085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_doctor_appointment_time_his`
--

DROP TABLE IF EXISTS `fd_rel_doctor_appointment_time_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_doctor_appointment_time_his` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_doctor_interest`
--

DROP TABLE IF EXISTS `fd_rel_doctor_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_doctor_interest` (
  `DOCTOR_INTEREST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID` int(11) DEFAULT NULL,
  `INTEREST_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DOCTOR_INTEREST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_rel_doctor_language`
--

DROP TABLE IF EXISTS `fd_rel_doctor_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_rel_doctor_language` (
  `DOCTOR_LANGUAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOCTOR_ID` int(11) NOT NULL,
  `LANGUAGE_ID` int(11) NOT NULL,
  PRIMARY KEY (`DOCTOR_LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_role`
--

DROP TABLE IF EXISTS `fd_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_save_search`
--

DROP TABLE IF EXISTS `fd_save_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_save_search` (
  `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_SEARCH_ID`),
  KEY `FK_FD_SAVE_SEARCH_1` (`CUSTOMER_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_service`
--

DROP TABLE IF EXISTS `fd_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_service` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_user`
--

DROP TABLE IF EXISTS `fd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'focusdata'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_get7daysTimeslots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get7daysTimeslots`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50)
    )
    READS SQL DATA
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
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_7_days` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_7_days`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50)
    )
    READS SQL DATA
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
		   AND t2.ACTIVE_STATUS = 1
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
			AND t2.ACTIVE_STATUS = 1
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
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_all_clinic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_clinic`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50),
        IN `startPageIN` INT(50),
        IN `pageSizeIN` INT(50)
    )
    READS SQL DATA
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
           t4.BULK_BILLING,
           t4.LATE_HOUR_SERVICES,
           t4.FREE_PARKING,
           t4.WHEELCHAIR_ACCESS,
           t4.FEMALE_DOCTOR,
           t4.HOME_VISIT,
           t4.ONSITE_PATHOLOGY_COLLECTION,
           t4.AGPAL,
           t4.STANDARD_15_MINUTE_CONSULTATION,
           t4.EXTEND_30_MINUTE_CONSULTATION,
           t4.CLINIC_OVERVIEW,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME ORDER BY t1.APPOINTMENT_TIME ASC) as APPOINTMENT_TIME
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
    AND t2.ACTIVE_STATUS = 1
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
           t4.BULK_BILLING,
           t4.LATE_HOUR_SERVICES,
           t4.FREE_PARKING,
           t4.WHEELCHAIR_ACCESS,
           t4.FEMALE_DOCTOR,
           t4.HOME_VISIT,
           t4.ONSITE_PATHOLOGY_COLLECTION,
           t4.AGPAL,
           t4.STANDARD_15_MINUTE_CONSULTATION,
           t4.EXTEND_30_MINUTE_CONSULTATION,
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
           AND t2.ACTIVE_STATUS = 1
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
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_all_clinic_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_clinic_count`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50)
    )
    READS SQL DATA
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
           t4.BULK_BILLING,
           t4.LATE_HOUR_SERVICES,
           t4.FREE_PARKING,
           t4.WHEELCHAIR_ACCESS,
           t4.FEMALE_DOCTOR,
           t4.HOME_VISIT,
           t4.ONSITE_PATHOLOGY_COLLECTION,
           t4.AGPAL,
           t4.STANDARD_15_MINUTE_CONSULTATION,
           t4.EXTEND_30_MINUTE_CONSULTATION,
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
    AND t2.ACTIVE_STATUS = 1
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
           t4.BULK_BILLING,
           t4.LATE_HOUR_SERVICES,
           t4.FREE_PARKING,
           t4.WHEELCHAIR_ACCESS,
           t4.FEMALE_DOCTOR,
           t4.HOME_VISIT,
           t4.ONSITE_PATHOLOGY_COLLECTION,
           t4.AGPAL,
           t4.STANDARD_15_MINUTE_CONSULTATION,
           t4.EXTEND_30_MINUTE_CONSULTATION,
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
           AND t2.ACTIVE_STATUS = 1
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_doctor`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50),
        IN `startPageIN` INT(50),
        IN `pageSizeIN` INT(50)
    )
    READS SQL DATA
BEGIN 
SELECT * from (
    SELECT 
           t1.DOCTOR_ID, 
           t2.DOCTOR_PHOTO, 
           t2.DOCTOR_NAME,
           t2.DOCTOR_INFO,
           t2.DOCTOR_GENDER,
           t2.DOCTOR_YEAR,
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
           GROUP_CONCAT(DISTINCT INTEREST_NAME) as INTEREST_NAME,
           t3.CLINIC_USER_ID,
           t4.CLINIC_NAME,
           t4.CLINIC_PHONE,
           t4.CLINIC_ADDR, 
           t4.CLINIC_SUBURB, 
           t4.CLINIC_LAT,
           t4.CLINIC_LNG,
           t5.STATE_NAME, 
		   GROUP_CONCAT(DISTINCT t1.APPOINTMENT_TIME ORDER BY t1.APPOINTMENT_TIME ASC) as APPOINTMENT_TIME
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
           
           LEFT JOIN (
		   select t60.DOCTOR_ID,GROUP_CONCAT(DISTINCT t70.INTEREST_NAME) as INTEREST_NAME from
fd_rel_doctor_interest as t60 left join fd_dict_interest as t70 on t60.INTEREST_ID = t70.INTEREST_ID
group by t60.DOCTOR_ID
		   ) t9
           ON t1.DOCTOR_ID = t9.DOCTOR_ID
           
    WHERE  t1.ACTIVE_STATUS = 1
    AND t2.ACTIVE_STATUS = 1
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
            order by APPOINTMENT_TIME desc
            ) A limit startPageIN,pageSizeIN;
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_doctor_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_doctor_count`(
        IN `dateIN` DATE,
        IN `suburbIN` VARCHAR(50),
        IN `postcodeIN` VARCHAR(50),
        IN `stateIN` VARCHAR(50),
        IN `doctorTypeIN` VARCHAR(50),
        IN `clinicNameIN` VARCHAR(100),
        IN `doctorNameIN` VARCHAR(100),
        IN `doctorIDIN` VARCHAR(50),
        IN `clinicIDIN` VARCHAR(50)
    )
    READS SQL DATA
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
    AND t2.ACTIVE_STATUS = 1
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
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23 21:27:43

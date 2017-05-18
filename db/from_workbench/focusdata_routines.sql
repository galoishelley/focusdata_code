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
           GROUP_CONCAT(DISTINCT LANGUAGE_NAME) as LANGUAGE_NAME,
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

-- Dump completed on 2017-05-18 21:10:29

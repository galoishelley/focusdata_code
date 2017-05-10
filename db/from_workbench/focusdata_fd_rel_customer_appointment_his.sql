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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_rel_customer_appointment_his`
--

LOCK TABLES `fd_rel_customer_appointment_his` WRITE;
/*!40000 ALTER TABLE `fd_rel_customer_appointment_his` DISABLE KEYS */;
INSERT INTO `fd_rel_customer_appointment_his` VALUES (85,184,1,36,'1','A','','fudanyinxin@gmail.com','2016-10-03 18:42:45','fudanyinxin@gmail.com','2016-10-03 18:42:45'),(86,184,1,37,'1','A','','fudanyinxin@gmail.com','2016-10-03 18:43:02','fudanyinxin@gmail.com','2016-10-03 18:43:02'),(87,185,61337,15068,'1','A','','kitty','2016-11-12 07:33:36','kitty','2016-11-12 07:33:36'),(88,186,61337,15130,'1','A','','dodo','2016-11-12 07:46:31','dodo','2016-11-12 07:46:31'),(89,187,61337,15132,'1','A','','fudanyinxin@gmail.com','2016-12-11 06:29:43','fudanyinxin@gmail.com','2016-12-11 06:29:43'),(90,187,0,15132,'1','A','','fudanyinxin@gmail.com','2016-12-11 06:32:26','fudanyinxin@gmail.com','2016-12-11 06:32:26'),(91,187,61337,15184,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:05:02','fudanyinxin@gmail.com','2016-12-11 09:05:02'),(92,187,61337,15190,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:06:26','fudanyinxin@gmail.com','2016-12-11 09:06:26'),(93,187,61337,15198,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:17:24','fudanyinxin@gmail.com','2016-12-11 09:17:24'),(94,187,61337,15191,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:46:33','fudanyinxin@gmail.com','2016-12-11 09:46:33'),(95,187,61337,15192,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:49:01','fudanyinxin@gmail.com','2016-12-11 09:49:01'),(96,187,61337,15193,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:49:14','fudanyinxin@gmail.com','2016-12-11 09:49:14'),(97,187,61337,15194,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:49:22','fudanyinxin@gmail.com','2016-12-11 09:49:22'),(98,187,61337,15195,'1','A','','fudanyinxin@gmail.com','2016-12-11 09:49:33','fudanyinxin@gmail.com','2016-12-11 09:49:33'),(99,187,61337,15196,'1','A','','fudanyinxin@gmail.com','2016-12-11 11:07:26','fudanyinxin@gmail.com','2016-12-11 11:07:26'),(100,189,0,15197,'1','A','','qwe','2016-12-11 12:49:48','qwe','2016-12-11 12:49:48'),(101,189,61337,15197,'1','A','','qwe','2016-12-11 12:49:51','qwe','2016-12-11 12:49:51'),(102,190,61339,15187,'1','A','','lop','2016-12-11 12:51:40','lop','2016-12-11 12:51:40'),(103,191,61339,15189,'1','A','','dongfangbubai','2016-12-11 12:53:36','dongfangbubai','2016-12-11 12:53:36'),(104,191,61337,15134,'1','A','','dongfangbubai','2016-12-11 12:53:54','dongfangbubai','2016-12-11 12:53:54'),(105,187,61339,15234,'1','A','','fudanyinxin@gmail.com','2016-12-13 07:44:59','fudanyinxin@gmail.com','2016-12-13 07:44:59'),(106,187,61339,15210,'1','A','','fudanyinxin@gmail.com','2016-12-13 07:50:18','fudanyinxin@gmail.com','2016-12-13 07:50:18'),(107,187,61339,15205,'1','A','','fudanyinxin@gmail.com','2016-12-13 07:50:46','fudanyinxin@gmail.com','2016-12-13 07:50:46'),(108,187,61339,15209,'1','A','','fudanyinxin@gmail.com','2016-12-13 07:51:29','fudanyinxin@gmail.com','2016-12-13 07:51:29'),(109,187,61340,15216,'1','A','','fudanyinxin@gmail.com','2016-12-13 07:55:02','fudanyinxin@gmail.com','2016-12-13 07:55:02'),(110,0,61337,15280,'1','A','','shelleymyl@gmail.com','2017-01-19 09:51:07','shelleymyl@gmail.com','2017-01-19 09:51:07'),(111,0,61337,15294,'1','A','','shelleymyl@gmail.com','2017-01-19 09:57:22','shelleymyl@gmail.com','2017-01-19 09:57:22'),(112,0,9,15800,'1','A','','test@gmail.com','2017-02-02 15:09:20','test@gmail.com','2017-02-02 15:09:20'),(113,0,9,15814,'1','A','','test@gmail.com','2017-02-02 15:10:07','test@gmail.com','2017-02-02 15:10:07'),(114,0,9,15804,'1','A','','test@gmail.com','2017-02-02 15:21:27','test@gmail.com','2017-02-02 15:21:27'),(115,0,9,15814,'1','A','','test@gmail.com','2017-02-02 15:35:40','test@gmail.com','2017-02-02 15:35:40'),(116,0,9,15801,'1','A','','test@gmail.com','2017-02-02 15:35:53','test@gmail.com','2017-02-02 15:35:53'),(117,207,9,15801,'1','A','','test@gmail.com','2017-02-02 15:37:17','test@gmail.com','2017-02-02 15:37:17'),(118,207,9,15800,'1','A','','test@gmail.com','2017-02-05 10:25:51','test@gmail.com','2017-02-05 10:25:51'),(119,207,9,15802,'1','A','','test@gmail.com','2017-02-05 10:26:34','test@gmail.com','2017-02-05 10:26:34'),(120,207,1,16295,'1','A','','test@gmail.com','2017-02-05 10:40:50','test@gmail.com','2017-02-05 10:40:50'),(121,207,1,15890,'1','A','','test@gmail.com','2017-02-05 10:41:26','test@gmail.com','2017-02-05 10:41:26'),(122,207,2,16296,'1','A','','test@gmail.com','2017-02-05 10:42:05','test@gmail.com','2017-02-05 10:42:05'),(123,207,3,16306,'1','A','','test@gmail.com','2017-02-06 17:32:04','test@gmail.com','2017-02-06 17:32:04'),(124,208,1,16564,'1','A','','t@gmail.com','2017-02-16 21:41:57','t@gmail.com','2017-02-16 21:41:57'),(125,209,1,16556,'1','A','','er@gmail.com','2017-02-16 21:43:42','er@gmail.com','2017-02-16 21:43:42'),(126,210,1,16558,'1','A','','h@g.com','2017-02-16 21:57:55','h@g.com','2017-02-16 21:57:55'),(127,207,1,17165,'1','A','','test@gmail.com','2017-03-03 08:34:56','test@gmail.com','2017-03-03 08:34:56'),(128,207,11,19429,'1','A','','test@gmail.com','2017-03-28 11:33:38','test@gmail.com','2017-03-28 11:33:38'),(129,207,11,19430,'1','A','','test@gmail.com','2017-03-28 11:34:16','test@gmail.com','2017-03-28 11:34:16'),(130,211,1,23771,'1','A','','c@c.com','2017-04-19 10:37:55','c@c.com','2017-04-19 10:37:55'),(131,207,10035,26701,'1','A','','test@gmail.com','2017-04-30 15:16:12','test@gmail.com','2017-04-30 15:16:12'),(132,207,10035,26702,'1','A','','test@gmail.com','2017-04-30 15:17:21','test@gmail.com','2017-04-30 15:17:21'),(133,207,10035,26704,'1','A','','test@gmail.com','2017-04-30 15:17:46','test@gmail.com','2017-04-30 15:17:46'),(134,207,10035,26712,'1','A','','test@gmail.com','2017-04-30 15:20:34','test@gmail.com','2017-04-30 15:20:34'),(135,207,10035,26698,'1','A','','test@gmail.com','2017-04-30 17:40:30','test@gmail.com','2017-04-30 17:40:30'),(136,207,10035,26820,'1','A','','test@gmail.com','2017-05-01 05:09:44','test@gmail.com','2017-05-01 05:09:44'),(137,207,10035,26824,'1','A','','test@gmail.com','2017-05-01 05:22:52','test@gmail.com','2017-05-01 05:22:52'),(138,207,10058,27128,'1','A','','test@gmail.com','2017-05-01 15:29:47','test@gmail.com','2017-05-01 15:29:47'),(139,207,10058,27120,'1','A','','test@gmail.com','2017-05-02 14:42:48','test@gmail.com','2017-05-02 14:42:48'),(140,207,10370,192813,'1','A','','test@gmail.com','2017-05-06 17:41:55','test@gmail.com','2017-05-06 17:41:55'),(141,207,10370,233642,'1','A','','test@gmail.com','2017-05-06 18:21:31','test@gmail.com','2017-05-06 18:21:31'),(142,207,10370,233649,'1','A','','test@gmail.com','2017-05-06 18:22:14','test@gmail.com','2017-05-06 18:22:14'),(143,207,10012,103013,'1','A','','test@gmail.com','2017-05-09 07:26:30','test@gmail.com','2017-05-09 07:26:30'),(144,207,10012,103017,'1','A','','test@gmail.com','2017-05-09 07:31:40','test@gmail.com','2017-05-09 07:31:40'),(145,207,10012,103029,'1','A','','test@gmail.com','2017-05-09 08:13:28','test@gmail.com','2017-05-09 08:13:28'),(146,207,10012,103014,'1','A','','test@gmail.com','2017-05-09 08:14:12','test@gmail.com','2017-05-09 08:14:12'),(147,207,10012,179659,'1','A','','test@gmail.com','2017-05-09 08:24:31','test@gmail.com','2017-05-09 08:24:31'),(148,207,10012,179661,'1','A','','test@gmail.com','2017-05-09 08:24:50','test@gmail.com','2017-05-09 08:24:50'),(149,207,10012,179685,'1','A','','test@gmail.com','2017-05-09 13:33:59','test@gmail.com','2017-05-09 13:33:59'),(150,207,10012,179687,'1','A','','test@gmail.com','2017-05-09 13:34:24','test@gmail.com','2017-05-09 13:34:24'),(151,207,10012,179745,'1','A','','test@gmail.com','2017-05-09 14:34:52','test@gmail.com','2017-05-09 14:34:52'),(152,207,10012,179953,'1','A','','test@gmail.com','2017-05-09 14:43:32','test@gmail.com','2017-05-09 14:43:32'),(153,207,10012,179797,'1','A','','test@gmail.com','2017-05-09 14:49:41','test@gmail.com','2017-05-09 14:49:41'),(154,207,10012,179901,'1','A','','test@gmail.com','2017-05-09 14:54:07','test@gmail.com','2017-05-09 14:54:07'),(155,207,10012,179901,'1','A','','test@gmail.com','2017-05-09 14:54:38','test@gmail.com','2017-05-09 14:54:38');
/*!40000 ALTER TABLE `fd_rel_customer_appointment_his` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-10 23:06:26

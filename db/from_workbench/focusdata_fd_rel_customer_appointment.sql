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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_rel_customer_appointment`
--

LOCK TABLES `fd_rel_customer_appointment` WRITE;
/*!40000 ALTER TABLE `fd_rel_customer_appointment` DISABLE KEYS */;
INSERT INTO `fd_rel_customer_appointment` VALUES (45,207,10012,179685,1,'','test@gmail.com','2017-05-09 13:33:59','test@gmail.com','2017-05-09 13:33:59'),(46,207,10012,179687,2,'','test@gmail.com','2017-05-09 13:34:24','test@gmail.com','2017-05-09 13:34:24'),(47,207,10012,179745,2,'','test@gmail.com','2017-05-09 14:34:52','test@gmail.com','2017-05-09 14:34:52'),(48,207,10012,179953,2,'','test@gmail.com','2017-05-09 14:43:32','test@gmail.com','2017-05-09 14:43:32'),(49,207,10012,179797,2,'','test@gmail.com','2017-05-09 14:49:41','test@gmail.com','2017-05-09 14:49:41'),(50,207,10012,179901,2,'','test@gmail.com','2017-05-09 14:54:07','test@gmail.com','2017-05-09 14:54:07'),(51,207,10012,179901,1,'','test@gmail.com','2017-05-09 14:54:38','test@gmail.com','2017-05-09 14:54:38');
/*!40000 ALTER TABLE `fd_rel_customer_appointment` ENABLE KEYS */;
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

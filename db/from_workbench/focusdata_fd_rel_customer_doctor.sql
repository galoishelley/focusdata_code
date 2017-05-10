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
-- Dumping data for table `fd_rel_customer_doctor`
--

LOCK TABLES `fd_rel_customer_doctor` WRITE;
/*!40000 ALTER TABLE `fd_rel_customer_doctor` DISABLE KEYS */;
INSERT INTO `fd_rel_customer_doctor` VALUES (1,187,61338,'','fudanyinxin@gmail.com','2016-12-12 15:41:43','fudanyinxin@gmail.com','2016-12-12 15:41:43'),(2,187,61339,'','fudanyinxin@gmail.com','2016-12-12 17:49:43','fudanyinxin@gmail.com','2016-12-12 17:49:43'),(3,187,61337,'','fudanyinxin@gmail.com','2016-12-13 04:56:19','fudanyinxin@gmail.com','2016-12-13 04:56:19'),(4,187,61340,'','fudanyinxin@gmail.com','2016-12-13 06:03:32','fudanyinxin@gmail.com','2016-12-13 06:03:32'),(5,0,61338,'','fudanyinxin@gmail.com','2016-12-14 07:54:12','fudanyinxin@gmail.com','2016-12-14 07:54:12'),(6,0,61338,'','fudanyinxin@gmail.com','2016-12-14 07:54:19','fudanyinxin@gmail.com','2016-12-14 07:54:19'),(7,207,4,'','test@gmail.com','2017-04-04 10:20:28','test@gmail.com','2017-04-04 10:20:28'),(8,207,1,'','test@gmail.com','2017-04-04 10:34:54','test@gmail.com','2017-04-04 10:34:54'),(9,207,2,'','test@gmail.com','2017-04-04 10:34:57','test@gmail.com','2017-04-04 10:34:57'),(10,207,5,'','test@gmail.com','2017-04-25 03:22:03','test@gmail.com','2017-04-25 03:22:03');
/*!40000 ALTER TABLE `fd_rel_customer_doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-10 23:06:27

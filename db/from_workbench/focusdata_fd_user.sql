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
-- Dumping data for table `fd_user`
--

LOCK TABLES `fd_user` WRITE;
/*!40000 ALTER TABLE `fd_user` DISABLE KEYS */;
INSERT INTO `fd_user` VALUES (1,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(2,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(3,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(4,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(5,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(6,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(7,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(8,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(9,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(11,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(12,'aa','bb','','','','','',NULL,'','','0000-00-00 00:00:00','','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `fd_user` ENABLE KEYS */;
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

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
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CUSTOMER_USER_ID`),
  KEY `FK_fd_customer_user_7` (`STATE_ID`),
  CONSTRAINT `FK_fd_customer_user_7` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_customer_user`
--

LOCK TABLES `fd_customer_user` WRITE;
/*!40000 ALTER TABLE `fd_customer_user` DISABLE KEYS */;
INSERT INTO `fd_customer_user` VALUES (207,'098f6bcd4621d373cade4e832627b4f6','test@gmail.com','test','test111',0,0,'23/02/1981','1 Whitehorse Road','3128','Box Hill','-37.8192605','145.13905020000004',7,'0412341234','1231231231',1,'','test@gmail.com','2017-01-23 09:51:38','test@gmail.com','2017-05-01 04:33:23'),(208,'34f11756fbab5b61c7fb91d5015e87a8','fudanyinxin@gmail.com','f','f',0,0,'11/11/1111','1','1','1','-35.308796','149.13593500000002',3,'1111111111','1111111111111',1,'','fudanyinxin@gmail.com','2017-05-10 10:02:21','fudanyinxin@gmail.com','2017-05-10 10:02:21'),(209,'c4ca4238a0b923820dcc509a6f75849b','fudanyinxin1@gmail.com','f','f',0,0,'11/11/1111','1','1','1','-35.308796','149.13593500000002',3,'1111111111','11',1,'','fudanyinxin1@gmail.com','2017-05-10 10:03:03','fudanyinxin1@gmail.com','2017-05-10 10:03:03'),(210,'47bce5c74f589f4867dbd57e9ca9f808','fudanyinxin@gmail.comaa','fa','wang',3,0,'11/11/1111','1','111','11','-27.5755849','153.29870010000002',3,'1111111111','111',1,'','fudanyinxin@gmail.comaa','2017-05-10 10:22:10','fudanyinxin@gmail.comaa','2017-05-10 10:22:10'),(211,'8fa14cdd754f91cc6554c9e71929cce7','adfas@f','ddd','xxx',5,0,'11/11/1111','1','1','1','-35.2421201','149.0572644',3,'1111111111','1',1,'','adfas@f','2017-05-10 10:26:07','adfas@f','2017-05-10 10:26:07');
/*!40000 ALTER TABLE `fd_customer_user` ENABLE KEYS */;
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

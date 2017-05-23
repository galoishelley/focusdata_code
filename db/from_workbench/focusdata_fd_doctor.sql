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
-- Dumping data for table `fd_doctor`
--

LOCK TABLES `fd_doctor` WRITE;
/*!40000 ALTER TABLE `fd_doctor` DISABLE KEYS */;
INSERT INTO `fd_doctor` VALUES (1,99,'GP','999','',1,'test_huatuo.jpg','','1','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(2,98,'GP','Frank Underwood','',1,'test_bianque.jpg','','2','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(3,97,'GP','Cal Lightman','',1,'test_lishizhen.jpg','','3','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(4,96,'GP','Roy Brench','',1,'test_huangfeihong.jpg','','4','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(5,95,'GP','Gillian Foster','',1,'test_shisanyi.jpg','','5','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(6,94,'GP','Ria Torres','',1,'test_linshirong.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(8,93,'GP','Maurice Moss','',1,'test_chenzhen.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(101,92,'GP','John Doe','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(102,91,'GP','Frank Underwood','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(103,90,'GP','Cal Lightman','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(104,89,'GP','Roy Brench','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(105,88,'GP','Gillian Foster','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(106,87,'GP','Ria Torres','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(108,86,'GP','Maurice Moss','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(111,85,'GP','John Doe','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(112,84,'GP','Frank Underwood','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(113,83,'GP','Cal Lightman','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(114,82,'GP','Roy Brench','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(115,81,'GP','Gillian Foster','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(116,80,'GP','Ria Torres','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(118,79,'GP','Maurice Moss','',1,'test_doctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10001,78,'GP','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10002,77,'Dentist','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10003,76,'Dietitian','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10004,75,'Physio','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10005,74,'Podiatrist','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10006,73,'Psychologist','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10007,72,'Chiropractor','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10008,71,'Audiologist','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10009,70,'Optometry','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10010,69,'Skin specialist','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10011,0,'Counsellor','DummyDoctor','',1,'DefaultDoctor.jpg','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10058,6,'','1 1','',1,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10059,8,'','2 2','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10060,15,'','3 3','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10061,16,'','4 4','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10062,17,'','5 5','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10063,18,'','6 6','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10064,19,'','7 7','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10065,20,'','8 8','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10066,21,'','9 9','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10067,22,'','a a','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10068,23,'','b b','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10069,24,'','c c','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10070,25,'','d d','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10071,26,'','e e','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00'),(10072,27,'','f f','',0,'','','','bencaotang@gmail.com','2017-05-19 22:40:10','','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `fd_doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22 23:41:15
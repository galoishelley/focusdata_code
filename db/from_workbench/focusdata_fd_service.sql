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
-- Dumping data for table `fd_service`
--

LOCK TABLES `fd_service` WRITE;
/*!40000 ALTER TABLE `fd_service` DISABLE KEYS */;
INSERT INTO `fd_service` VALUES (4,'UI01','用户登录','sign_in.js','url: \"classes/class.sign_in.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(5,'UI02','获取用户详细信息(条件用户名)','appointmentDoctor.js','url: \"classes/class.UserDetail.php\",','username: username','用户详细信息','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(6,'UI03','获取用户详细信息(条件用户ID)','userUpdPersonInfo.js','url: \"classes/class.UserDetail.php\",','action_type: \"view\", CUSTOMER_USER_ID: fd_userid','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(7,'UU01','个人用户注册(游客通过预约,自动注册)','appointmentDoctor.js','url: \"classes/class.sign_up_person.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(8,'UU02','个人用户注册(通过注册页面注册)','sign_up_person.js','url: \"classes/class.sign_up_person.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(9,'UU03','修改个人用户信息','userUpdPersonInfo.j','url: \"classes/class.UserDetail.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(10,'UU04','修改个人用户密码','userUpdPersonPwd.js','url: \"classes/class.UserDetail.php\",','action_type:\"update\", CUSTOMER_USER_ID:fd_userid, CUSTOMER_USER_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(11,'CU01','诊所用户注册','sign_up_clinic.js','url: \"classes/class.signup_clinic.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(12,'CU02','获取诊所用户详细信息','clinicUpdUserInfo.js','url: \"classes/class.ClinicDetail.php\",','action_type: \"view\",\r\nCLINIC_USER_ID: fd_userid','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(13,'CU03','修改诊所用户信息','clinicUpdUserInfo.js','url: \"classes/class.ClinicDetail.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(16,'CU04','修改诊所用户密码','clinicUpdUserPwd.js','url: \"classes/class.ClinicDetail.php\",','action_type:\"update\",\r\nCLINIC_USER_ID:fd_userid,\r\nCLINIC_USER_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(17,'CU05','诊所用户搜索医生','clinicQryDoctor.js','url: \"classes/class.ClinicOprDoctor.php\",','CLINIC_USER_ID: fd_userid,\r\n    DOCTOR_TYPE: $(\'#DOCTOR_TYPE\').val(),\r\n    DOCTOR_NAME: $(\'#DOCTOR_NAME\').val(),','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(18,'CU06','修改医生为inactive/active','clinicQryDoctor.js','url: \"classes/class.ClinicOprDoctor.php\",','action_type: \"update\",\r\n      ACTIVE_STATUS: 0|1,\r\n      DOCTOR_ID: DOCTOR_ID','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(19,'CU07','修改医生基本信息','clinicUpdDoctorDetail.js','url: \"classes/class.ClinicOprDoctor.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(20,'SD01','搜索医生(主页全体条件 or)','searchDoctor.js','url: \"classes/class.searchDoctor.php\",','见首页输入框','诊所，医生，及预约时间（预约医生所需全部内容）','入参requesttype = 0 查询条件or','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(21,'SD02','搜索医生(主页全体条件 and)','searchDoctor.js','url: \"classes/class.searchDoctor.php\",','搜索医生也点击搜索按钮，全体输入框','诊所，医生，及预约时间（预约医生所需全部内容）','入参requesttype = 1 查询条件and','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(22,'ST01','搜索医生预约时间ID(条件医生ID,预约时间日期，时间)','appointmentDoctor.js','url: \"classes/class.searchAppTimeID.php\",','DOCTOR_ID: $(\'#DOCTOR_ID\').val(),\r\nAPPOINTMENT_DATE:\r\nAPPOINTMENT_TIME: radio_txt','搜索医生预约时间ID','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(23,'SP01','搜索预约状态（填充下拉框）','userAppointmentRecoder.js','url: \"classes/class.getAppointmentStatus.php\",','para=\"\";','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(24,'SP02','搜索预约记录','userAppointmentRecoder.js','url: \"classes/class.AppointmentRecoder.php\",','CUSTOMER_USER_ID: userid,\r\nCREATE_DATE_BEGIN:  $(\'#begin_time\').val(),\r\nCREATE_DATE_END:  $(\'#end_time\').val(),\r\nAPPOINTMENT_STATUS_ID : $(\'#app_status\').val()','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(25,'AD01','预约医生','appointmentDoctor.js','url: \"classes/class.appointmentDoctor.php\",','action_type: \"\"create\"\",\r\nCUSTOMER_USER_NAME: $(\'#CUSTOMER_USER_NAME\').val(),\r\nCUSTOMER_USER_PWD: $(\'#CUSTOMER_USER_PWD\').val(),\r\nCUSTOMER_USER_ID: custom_user_id,\r\nDOCTOR_ID: $(\'#DOCTOR_ID\').val(),\r\nDOCTOR_APPOINTMENT_TIME_ID:time_id,\r\nAPPOINTMENT_STATUS_ID:1','预约成功','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(26,'AD02','取消预约','userAppointmentRecoder.js','url: \"classes/class.AppointmentRecoder.php\",','action_type: \"\"update\"\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID,\r\nCREATE_DATE: CREATE_DATE','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(27,'S001','收藏医生','appointmentDoctor.js','url: \"classes/class.saveDoctor.php\",','action_type:\"\"create\"\",\r\nCUSTOMER_USER_ID:$(\'#CUSTOMER_USER_ID\').val(),\r\nDOCTOR_ID:$(\'#DOCTOR_ID\').val()','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(28,'S002','搜索收藏的医生','userSaveDoctor.js','url: \"classes/class.saveDoctor.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(29,'S003','删除收藏医生','userSaveDoctor.js','url: \"classes/class.saveDoctor.php\",','action_type: \"\"remove\"\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(30,'SS01','保存为常用搜索条件','searchDoctor.js','url: \"classes/class.saveSearch.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(31,'SS02','搜索常用搜索条件','userSaveSearch.js','url: \"classes/class.saveSearch.php\",','CUSTOMER_USER_ID: fd_userid','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(32,'SS03','删除常用搜索条件','userSaveSearch.js','url: \"classes/class.saveSearch.php\",','action_type: \"remove\",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nCUSTOMER_SEARCH_ID: CUSTOMER_SEARCH_ID','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(36,'AU01','修改管理员密码','adminUpdPwd.js','url: \"classes/class.AdminDetail.php\",','action_type: \"update\",\r\nADMIN_ID:fd_userid,\r\nADMIN_PWD:$(\'#CUSTOMER_USER_NEWPWD\').val()','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(37,'AU02','查询诊所用户','adminQryClinic.js','url: \"classes/class.ClinicDetail.php\",','页面输入条件','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(38,'AU03','查询个人用户','adminQryUser.js','url: \"classes/class.UserDetail.php\",','页面所有输入框','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(39,'AU06','修改诊所用户为inactive/active','adminQryClinic.js','url: \"classes/class.ClinicDetail.php\",','action_type: \"update_active\",\r\nACTIVE_STATUS: 0,\r\nCLINIC_USER_ID: CLINIC_USER_ID','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(40,'AU07','修改个人用户为inactive/active','adminQryUser.js','url: \"classes/class.UserDetail.php\",','action_type: \"update_active\",\r\nACTIVE_STATUS: 1/0,\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID','','','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(41,'SSTE','填充州下拉列表','adminQryUser.js','url: \"classes/class.getState.php\",','空','州所有内容','全部查询，无需条件','admin','2016-09-09 00:00:00','admin','2016-09-09 00:00:00'),(42,'SDTY','填充医生类别','adminQryDoctor.js','url: \"classes/class.getDoctorType.php\",','无','医生所有类别','查询全部内容','admin','2016-09-10 00:00:00','admin','2016-09-10 00:00:00'),(43,'SSUB','填充区','userSaveDoctor.js','url: \"classes/class.getSuburb.php\",','无','全部诊所区','查询全部，无条件','admin','2016-09-13 00:00:00','admin','2016-09-13 00:00:00');
/*!40000 ALTER TABLE `fd_service` ENABLE KEYS */;
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

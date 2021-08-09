CREATE DATABASE  IF NOT EXISTS `directiedb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `directiedb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: directiedb.cahiew9mtaez.ap-southeast-1.rds.amazonaws.com    Database: directiedb
-- ------------------------------------------------------
-- Server version	5.6.39-log

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
-- Table structure for table `bdirection`
--

DROP TABLE IF EXISTS `bdirection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdirection` (
  `BDirectionID` int(11) NOT NULL AUTO_INCREMENT,
  `CurrentBID` int(11) NOT NULL,
  `PreviousBID` int(11) DEFAULT NULL,
  `NextBID` int(11) DEFAULT NULL,
  `DirectID` int(11) NOT NULL,
  `Compass` int(11) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BDirectionID`),
  KEY `BDIRECTION_CURRENTBID_idx` (`CurrentBID`),
  KEY `BDIRECTION_DIRECTID_idx` (`DirectID`),
  KEY `BDIRECTION_NEXTBID_idx` (`NextBID`),
  KEY `BDIRECTION_PREVIOUSBID_idx` (`PreviousBID`),
  CONSTRAINT `BDIRECTION_CURRENTBID` FOREIGN KEY (`CurrentBID`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BDIRECTION_DIRECTID` FOREIGN KEY (`DirectID`) REFERENCES `direction` (`DirectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BDIRECTION_NEXTBID` FOREIGN KEY (`NextBID`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BDIRECTION_PREVIOUSBID` FOREIGN KEY (`PreviousBID`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdirection`
--

LOCK TABLES `bdirection` WRITE;
/*!40000 ALTER TABLE `bdirection` DISABLE KEYS */;
INSERT INTO `bdirection` VALUES (211,111,NULL,113,1,129,''),(212,113,111,120,1,110,''),(213,120,113,135,1,114,''),(214,135,120,110,2,17,''),(215,110,135,144,1,20,''),(216,144,110,146,2,288,''),(217,146,144,NULL,1,246,'');
/*!40000 ALTER TABLE `bdirection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beacon`
--

DROP TABLE IF EXISTS `beacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beacon` (
  `BeaconID` int(11) NOT NULL,
  `UUID` varchar(45) NOT NULL,
  `Major` int(11) NOT NULL,
  `Minor` int(11) NOT NULL,
  `TurningPoint` tinyint(1) NOT NULL,
  `Toggle` tinyint(1) NOT NULL,
  PRIMARY KEY (`BeaconID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beacon`
--

LOCK TABLES `beacon` WRITE;
/*!40000 ALTER TABLE `beacon` DISABLE KEYS */;
INSERT INTO `beacon` VALUES (110,'11111111-1111-1111-1111-111111111111',110,110,0,1),(111,'11111111-1111-1111-1111-111111111111',110,110,0,1),(113,'11111111-1111-1111-1111-111111111111',113,113,0,1),(119,'11111111-1111-1111-1111-111111111111',119,119,0,1),(120,'11111111-1111-1111-1111-111111111111',120,120,0,1),(132,'11111111-1111-1111-1111-111111111111',132,132,0,1),(135,'11111111-1111-1111-1111-111111111111',135,135,1,1),(136,'11111111-1111-1111-1111-111111111111',136,136,0,1),(140,'11111111-1111-1111-1111-111111111111',140,140,0,1),(144,'11111111-1111-1111-1111-111111111111',144,144,1,1),(145,'11111111-1111-1111-1111-111111111111',145,145,0,1),(146,'11111111-1111-1111-1111-111111111111',146,146,0,1),(151,'11111111-1111-1111-1111-111111111111',151,151,0,1),(153,'11111111-1111-1111-1111-111111111111',153,153,0,1),(155,'11111111-1111-1111-1111-111111111111',155,155,0,1),(156,'11111111-1111-1111-1111-111111111111',156,156,0,1),(158,'11111111-1111-1111-1111-111111111111',158,158,0,1),(159,'11111111-1111-1111-1111-111111111111',139,139,0,1);
/*!40000 ALTER TABLE `beacon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beaconunit`
--

DROP TABLE IF EXISTS `beaconunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beaconunit` (
  `BUID` int(11) NOT NULL AUTO_INCREMENT,
  `BeaconID` int(11) NOT NULL,
  `UnitID` int(11) NOT NULL,
  PRIMARY KEY (`BUID`),
  KEY `BEACONUNIT_BEACONID_idx` (`BeaconID`),
  KEY `BEACONUNIT_UNITID_idx` (`UnitID`),
  CONSTRAINT `BEACONUNIT_BEACONID` FOREIGN KEY (`BeaconID`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BEACONUNIT_UNITID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beaconunit`
--

LOCK TABLES `beaconunit` WRITE;
/*!40000 ALTER TABLE `beaconunit` DISABLE KEYS */;
INSERT INTO `beaconunit` VALUES (1,111,202),(2,113,203),(3,120,204),(4,135,205),(5,110,206),(6,144,207),(7,146,208),(8,158,209),(9,153,210);
/*!40000 ALTER TABLE `beaconunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brelation`
--

DROP TABLE IF EXISTS `brelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brelation` (
  `BRID` int(11) NOT NULL AUTO_INCREMENT,
  `BeaconID` int(11) NOT NULL,
  `RelatedBeacon` int(11) NOT NULL,
  PRIMARY KEY (`BRID`),
  KEY `BRELATION_BEACONID_idx` (`BeaconID`),
  KEY `BRELATION_RELATEDBEACONS_idx` (`RelatedBeacon`),
  CONSTRAINT `BRELATION_BEACONID` FOREIGN KEY (`BeaconID`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BRELATION_RELATEDBEACONS` FOREIGN KEY (`RelatedBeacon`) REFERENCES `beacon` (`BeaconID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brelation`
--

LOCK TABLES `brelation` WRITE;
/*!40000 ALTER TABLE `brelation` DISABLE KEYS */;
INSERT INTO `brelation` VALUES (318,111,111),(319,111,113),(321,113,111),(322,113,113),(330,120,120),(331,120,135),(332,135,120),(333,135,135),(336,144,146),(338,146,146),(345,158,158),(351,110,135),(352,144,144),(353,110,144),(354,146,144),(357,120,113),(358,113,120),(359,158,146),(360,146,158),(361,110,110),(362,135,110),(363,144,110);
/*!40000 ALTER TABLE `brelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction`
--

DROP TABLE IF EXISTS `direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direction` (
  `DirectID` int(11) NOT NULL AUTO_INCREMENT,
  `Action` varchar(45) NOT NULL,
  PRIMARY KEY (`DirectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction`
--

LOCK TABLES `direction` WRITE;
/*!40000 ALTER TABLE `direction` DISABLE KEYS */;
INSERT INTO `direction` VALUES (1,'Go straight'),(2,'Turn Left'),(3,'Turn Right');
/*!40000 ALTER TABLE `direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `FacilityID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityName` varchar(45) NOT NULL,
  `FacilityInfo` varchar(500) NOT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'MEDIA CLASSROOM','A room in which a class of pupils or students is taught.'),(2,'CYBER WARGAME CENTRE','A dedicated learning space to give our students a taste of the real experience of a security professional.'),(3,'GAME DEVELOPMENT CENTRE','The Game Development Centre features labs with high-performance PC workstations and game consoles.'),(4,'M.A.D. STUDIOS','The M.A.D. (Media-Art-Design) Studios is a fully-equipped set of production studios with a personal touch. An integral part of the Creative Hub, it is divided into exclusive Home-based Studios where each student will have their own personalized workspace and dedicated access.'),(5,'MOTION CAPTURE STUDIO','The Motion Capture Studio allows students to capture facial and full body movements by up to eight cameras simultaneously.'),(6,'MUSIC TECHNOLOGY CENTRE','There are five Music Technology Centres which are designed for teaching music and audio technology modules.'),(7,'RECORDING STUDIO (A,B,C)','Two of the three Music & Audio Production Suites. These suites are equipped with musical instruments, outboards & boutique tube microphones. Capable of producing audio for various media contents such as video, games animation, while providing an inspirational place to compose and arrange music. '),(8,'RECORDING STUDIO (F)','One of the three Music & Audio Production Suites. It houses mobile studio boxes meant for single instrument recording. These boxes are equipped with industry-standard recording & mixing software & hardware.'),(9,'SOCIAL MEDIA LISTENING CENTRE','The Social Media Listening Centre provides our students with an authentic experience in listening, monitoring and analysing the sentiments and buzz on social media in channels such as forums, blogs, microblogs, Q&A, news and social networking sites.'),(10,'VISUAL EFFECTS STUDIO','The Visual Effects Studio allows students to produce moving imagery in a controlled setting. This sound-proof studio is ideal for chroma-key, video production works and video streaming.'),(11,'WIRELESS INNOVATION LAB','The Wireless InnovaTion Lab is designed for the delivery of modules on Internet of Things (IoT) and wireless networking. A showcase area features projects and latest technology related to IoT and wireless networking.'),(12,'CONFERENCE ROOM','A conference hall, conference room, or meeting room is a room provided for singular events such as business conferences and meetings.'),(13,'WASHROOM','A room with washing and toilet facilities.'),(14,'SYNERGY ROOM','SYNERGY ROOM');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilityimage`
--

DROP TABLE IF EXISTS `facilityimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilityimage` (
  `FIID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityID` int(11) NOT NULL,
  `ImageID` int(11) NOT NULL,
  PRIMARY KEY (`FIID`),
  KEY `FacilityID_idx` (`FacilityID`),
  KEY `ImageID_idx` (`ImageID`),
  CONSTRAINT `FACILITYIMAGE_FACILITYID` FOREIGN KEY (`FacilityID`) REFERENCES `facility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FACILITYIMAGE_IMAGEID` FOREIGN KEY (`ImageID`) REFERENCES `image` (`ImageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilityimage`
--

LOCK TABLES `facilityimage` WRITE;
/*!40000 ALTER TABLE `facilityimage` DISABLE KEYS */;
INSERT INTO `facilityimage` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(81,12,58),(82,13,56),(83,14,58);
/*!40000 ALTER TABLE `facilityimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilityunit`
--

DROP TABLE IF EXISTS `facilityunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilityunit` (
  `FUID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityID` int(11) NOT NULL,
  `UnitID` int(11) NOT NULL,
  PRIMARY KEY (`FUID`),
  KEY `FACILITYUNIT_FACILITYID_idx` (`FacilityID`),
  KEY `FACILITYUNIT_UNITID_idx` (`UnitID`),
  CONSTRAINT `FACILITYUNIT_FACILITYID` FOREIGN KEY (`FacilityID`) REFERENCES `facility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FACILITYUNIT_UNITID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilityunit`
--

LOCK TABLES `facilityunit` WRITE;
/*!40000 ALTER TABLE `facilityunit` DISABLE KEYS */;
INSERT INTO `facilityunit` VALUES (1,2,24),(2,2,25),(3,2,26),(4,2,27),(5,2,28),(6,3,66),(7,3,67),(8,4,48),(9,4,49),(10,4,50),(11,4,51),(12,5,32),(13,6,19),(14,6,20),(15,6,21),(16,7,33),(17,7,34),(18,7,35),(19,8,17),(20,9,68),(21,9,69),(22,10,1),(23,11,22),(72,1,2),(89,1,3),(90,1,4),(91,1,5),(92,1,6),(93,1,7),(94,1,8),(95,1,9),(96,1,10),(97,1,11),(98,1,12),(99,1,13),(100,1,14),(101,1,15),(102,1,16),(104,1,18),(108,1,23),(109,1,29),(110,1,30),(111,1,31),(112,1,36),(113,1,37),(114,1,38),(115,1,39),(116,1,40),(117,1,41),(118,1,42),(119,1,43),(120,1,44),(121,1,45),(122,1,46),(123,1,47),(125,1,52),(126,1,53),(127,1,54),(128,1,55),(129,1,56),(130,1,57),(131,1,58),(132,1,59),(133,1,60),(134,1,61),(135,1,62),(136,1,63),(137,1,64),(138,1,65),(139,1,70),(140,1,71),(141,1,72),(142,1,73),(143,1,74),(144,1,75),(145,1,76),(146,1,77),(147,1,78),(148,1,79),(149,1,80),(150,1,81),(151,1,82),(152,1,83),(153,1,84),(154,1,85),(155,1,86),(156,1,87),(157,1,88),(158,1,89),(159,1,90),(160,1,91),(161,1,92),(162,1,93),(163,1,94),(164,1,95),(165,1,96),(166,1,97),(167,1,98),(168,1,99),(169,1,100),(170,1,101),(171,1,102),(172,1,103),(173,1,104),(174,1,105),(175,1,106),(176,1,107),(177,1,108),(178,1,109),(179,1,110),(180,1,111),(181,1,112),(182,1,113),(183,1,114),(184,1,115),(185,1,116),(186,1,117),(187,1,118),(188,1,119),(189,1,120),(190,1,121),(191,1,122),(192,1,123),(193,1,124),(194,1,125),(195,1,126),(196,1,127),(197,1,128),(198,1,129),(199,1,130),(200,1,131),(201,1,132),(202,1,133),(203,1,134),(204,1,135),(205,1,136),(206,1,137),(207,1,138),(208,1,139),(209,1,140),(210,1,141),(211,1,142),(212,1,143),(213,1,144),(214,1,145),(215,1,146),(216,1,147),(217,1,148),(218,1,149),(219,1,150),(220,1,151),(221,1,152),(222,1,153),(223,1,154),(224,13,155),(225,13,156),(226,13,157),(227,13,158),(228,13,159),(229,13,160),(230,13,161),(231,13,162),(232,13,163),(233,13,164),(234,13,165),(235,13,166),(236,13,167),(237,13,168),(238,13,169),(239,13,170),(240,13,171),(241,13,172),(242,13,173),(243,13,174),(244,13,175),(245,13,176),(246,13,177),(247,13,178),(248,13,179),(249,13,180),(263,13,200),(264,13,201),(265,12,202),(274,12,203),(275,12,204),(276,12,205),(277,12,206),(278,12,207),(279,12,208),(280,12,209),(281,12,210),(282,13,211),(283,13,212),(284,13,213),(285,13,214),(286,13,215),(287,13,216),(288,13,217),(289,13,218),(290,13,219),(291,13,220),(292,13,221),(293,13,222),(294,13,223),(295,13,224),(296,13,225),(297,13,226),(298,13,227),(299,13,228),(300,13,229);
/*!40000 ALTER TABLE `facilityunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `ImageURL` longtext NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`ImageID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2F22612(1).jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=Y053W7KEmgGknnhSKfwsvJtwXxUbsDqUa%2FUHX6LNHqKZ%2F4TPlhnnxKE9GRGupHNkqIEwFc1yfE0AHtVFdkIu6nvXo%2FMjsVWAOWiMizCEUzG56bezB3KS5xHnD9%2FRkhZYTMatQMy29mR78hNkERIho0OAhdDPxW2hulB8YRN50g%2FCGIOracdqG9%2BgD1156SnEb4RbadL6ADRzhbhoDe%2BdEOHlbLQIGq8qfOtbBsOE9H6xqQ4Q2Nt9iVzjImgyFHj%2BQJP7bgRY5W2%2FIPNR74nnuXL2SlWEYFkU%2BZz0ptpIjn0QgycLkw19%2BPE8BR8tdc0DACKre34apDpJj%2BuS%2BdO7uQ%3D%3D','Facility'),(2,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fcyberwargame.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=LTqWC%2FgCpI8q6JMELsRWXfTsFcQo1IRInqWHPVDMPimTsxEYO6fNwMpFQ%2BKaaXmjMUM7XG6szcrLL2b4WEiCjYJyAeL6Lr265s597TC4yS3Z0RCqiDkfSBRYwdF0Jkt0pElGM%2Fek%2BiD%2FVbMFFAQbQR4ANpT3pSfdeZkuY3y5hctFJ29GbWBreH%2BUv4Cdhns7nBlem2w0UHYN4bhUFIuKEWwFamgwtDxS%2FRbz5uVg3BWXMqwSv3Os4spcstC2GqBPhvcVGTZ3jKTUro1X%2Fi%2F052rzW5Ho6DW4Kv1xR4D2g2jlLeiDhBrxQFrF3PxtHFuJc7TTPu71Coqzlpw036URvA%3D%3D','Facility'),(3,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fgamedev.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=miTv%2Bv7InVtDXxrMfxWK7RvwtixLRg89nlg5bufaXPObgDJhf0qtGQ6LItANq82%2FVmTo3dtLtStQyuknHyc27d5lsYkMKg7xy67yuUnSywXtUicmqV8GUjWtIEtJ0Mw3Qm5fvMbWxElL5HdMcR5l8BXze5R2yHi987g8Xi6bZqJnMpLPigiAYzX8XxDPf3IDebw0paB9XYRQ1Gz4z816Gs9DhDWfpSDSAIRUQNFsJfmUzNIoXyAzTxVt3zOJPdDDPdIrcxDS6RhGd0bO9GVOTDMIu%2B8pwT8POYpIaUf1IUbjfDJRBeAg5oxLZPm9FTUvqKhLXgFqtvah9xDKxj%2BQ0A%3D%3D','Facility'),(4,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fmadstudios.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=CPkuay5ml7Eu1fLReW8uTzi%2BQ%2FaGiu27j3Iu09Cuqp5XONuPr9sMQ7aUFJxWwsp%2BVxHQtzaNasJJ%2BjPnJEs8cpp0AHP9eEbIE30EzB8uGFskDblEI7xuaCb%2B3AkByN45foU383X5e4BcsgUwmbs%2BrwYKzkrTSgKnTeFlNkZQQYwdzs8Zn%2BvFo5YpbWCi1bp4Dp6fK%2FIrl2BJHy3dl2Ob9yBbQEqh8NJ6L12KMex%2FWXOPWUXOEbIPtYUOVsPia89ilRyr6sC2wd%2Fu2TTPwIe2S7dJd2FVGC3l8S8Sc3vATTOVbffSx7%2BNHR4jBmL853waxqsFErLRGsa6PCYhlJWK3A%3D%3D','Facility'),(5,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fmotioncapture.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=A5%2FahSQCoRmyy6wWmxuy0W849XSl6PRzHXliGfOSmirwnTU%2FxChHiSZzc%2FsjU1cHyNpL%2BuQeJqnkFH7J%2BMOwI1HiXTrK5Gxqhglb8hUIe8tD8wuiusTSylcyD9WUTm2mVFlOIk3W0AU6oR4tfb21BeFH4H9Y%2Fk8S2I0618q4LnaRNr3ix8hSw%2BUEDHxiROEOgX2C%2BAeqfyxPhoMgfPvsvo7PO3hvcXrXGP2KpWhJdi%2BLZZsepsQpHUwwEHGShfvGfEkeKrzAxVyY9I7BvBS1K0Yhp08DvqSyV%2FYMW89%2BXnLXNaDW8mNggGFqEjMb7EaWV0boQjfbbQaKJ%2Bt1vIJ1iA%3D%3D','Facility'),(6,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fmusictech.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=esfxLjWdxvn5ilBnPffxoH0f%2F2w2n2LUFQcoxKROemoHcYQl%2FOiUdSZzrTeEoYvGy%2BYZej33xYqd86thXU%2B0kLzUAvGCTWWC4rsdchDVG9Gp9AYg2AAVdFiWWHyh9QQSXzlXSEkzdQH54ISOVDF87tFWqAj3S%2F%2B2oBik2%2B9AIbclKnv6Yw4v4%2BorgZvS3xk28I%2BGFqjNs5wOV6nWssNHXn%2Bz3jZykZqj6tkv6vO%2FHjgve3Cwgc%2F%2BFe6hrqn8w3j3v0NFYPodLjlTdocERFJXmi2IhDy07M7GVmqjc1%2BhX%2BrtPU3M9N5AAok33I8cebC0jr5CIuGT4pAl7SbTLSaHnw%3D%3D','Facility'),(7,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Frecordingstudios.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=D1XqP%2FZrxTda%2F%2BYrtl6txKyimKsQ6eD37xDS3LPfgXyuuZUBUAK54%2BA2dB4nKP2u%2B%2FyndrqpjYAZ9FjAkmNG8xSgUkJfxyvlDSdwMzUUD3xPSqg2b88E7S8uXTejYxAH2%2BdBMGBrEJtJq5vZsBkVFSjI5GqB3mupGchSny9bKbirCmQ1%2BneDDo10tMvyytBMs6WVdBGyrH5WxP5KpEFrKWP6cAfKK3twgHwEsfpTATsq5EykhJEZHtqi7AKLnzlu4zzjo8GZXKE7wbUTN7IVdtq5zo5FC%2FdiwdPrpdGwKs0tgBEfjfDAbBym1Bnpg5P8HQX7Axe7WYVjnU6WT%2Fcg2g%3D%3D','Facility'),(8,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Frecordingstudiof.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=j12EKYcNgDo7VXdQl44QUN4wNznxm6EtRxFdhcowZgv3Uqq5vN0TbhZtqqhjq0fgrZDyuowmQYrJE1CKpOa7Dpewj8w0jby%2BZVsd1aHJJ29Hbj0in1Oc4uTz4HVwrKI9x2F7k%2FegCAwt4vR%2F9x5yeRu3ls7NGRBW0LwtLQNlu9xhBq9sPYXYKHQSiv7n7h9QqNTDRw1icpYcpHLaxZkR7jk1%2B%2BNcxhT2UDtc3NlwMYkLA5ybJzfKt51rwzqPBLLQpQ3RHmtQToCR4%2FBTFeff9uCwig%2FXGf%2B7BtELeQZxEzxqSIZEIpBKRmaaGZvfrgbTc2kCxbxm3LNMexbz2R8qkg%3D%3D','Facility'),(9,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fsocialmedia.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=lly20eHG%2B0yN5BzKUduY2a%2BOQDhyEu76UHCSEO0yaGqX2RrQJrj6GMMpoABLa4EV%2Bno%2BXrkb0ojMYanvpdA8vSG30jf%2FHzQffUuhXkHCW6DOmm6hOXg5RSqMk63kbf7nN4BtFcDgYlvW9P6zwMwqg0ZcXnDm5FpdoydPuWlE5QeCHQ2RADeztqMtCBOao4MfK5qgtsWse5fWkyLyT3M0FwppC5OL8dKBMNP1GPAzdihBgE6MgezmkD%2FzvarJWyLvl%2F37%2Btx9z4xpsdQbJ3%2B1L6cZB9TMBDVWQ0HK98jYsdA6iIbOns5csDgnafMy%2BjAzXSFfpvyIgPXqF%2F9rUal1%2BQ%3D%3D','Facility'),(10,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fvisualeffects.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=XJgyFTcfHhUZNvyZPTyRf77jHoG68k71LFggFmwBoebdSZSKfvpNreUwzkr7j5mHZy34GpZSue2C6bcX%2FngB3A8uTi8XMxeIPiQNhkM4aYwdKWS4KBA1cx5oD%2BDWO%2BYRkJrQRwYDeFNzYCvYB2Ssy8ESPBQ5Ct0gkPio3YQeHqJpEj90c1nG237%2B1dflucHHChiYIVfFNx7WIDNWNXVgHE6IGB0AnqB3ezY%2Fn5%2FqO0C92NG0HEbjIz1fu2LVMYb84Slq9K7sX3rElujwGsGcqYBaeFxDtJZ4DIxTaHEX%2FHzG%2FnlG%2BgePsvwJLY4NRIGplLhf2g5ESVBX91yzYgIYJg%3D%3D','Facility'),(11,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fwirelessinnolab.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=ULsf7IV5UezshvVVxXziQTqy%2BjXly07gV3Jc8XhmwMM%2FGkHZmZvHrtDN2AqevjnW2J52pJ5i1K9gek3uhJ8XQaxVhMOFWTIP0VL36hhlH%2FnAvo28WOFDBScmk9oknWONUHXyey1VcUWg6E3P7pnMDpMyWpiVDgPVHwlrd0H3wT0BP0MqfKFtHK0ULI%2BaScV%2BFVQmwRp59oyPjCaKgOXgYQ4NghUJMEqvHcF2NBkmchhFNZDIyZLlc6wB7V%2F1zbFG2uKXqqptPOEhrx9yyacSMv2q7R7V79AnbbC%2Bmy9HsjyuXI0eJeJNUcGpxWQW4NsL2YMToYQ61dkkLGnGtfCtVQ%3D%3D','Facility'),(12,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2F22612(1).jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=DBqpdUCsm5saAmGJT2aQVBTayHTfzybtv3YmOWXPjufor33GDM6KBSvNxVCdKHtJ2Lf0st5fGbG%2BWKZkMhG0rZteCHMr7pnUBYMDuDYOaxCUagCQDMwLDZkxVfoL7cNrYNMIvXqPnikjPEMuQZeHwgWtdbt57OJ3upIA7nfG7aAc3SC%2FwDrmJfOSyLCDcmAQzTAnOuRqbKdnP43m%2FziuxxwDwnqpHIrqkzZh8VX3e1WcK4OXpdgMjKGOPptZ8fpvn9dz%2FyjcT2riooJvQkruH8t6FayBm%2BueHH42fyH8Vh8HzGSIAmXC40ln3NpLzBwyrdrWQ2h1D85SyhATTC%2BkAg%3D%3D','Unit'),(13,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fcyberwargame.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=UJsno6sMqB%2FJrGWav9Ghbfr98nW4btNJMcM7ia%2BPeAk8FtKLAyTngpbDlqbpRx1C2SrBGeLl3Kj%2FaSnfvF191iVIpAPyjRWUI%2FOVHaSg9Ws0q13Br8nBNX9pVtMZPKTw%2BArn0WilvoNKUSm2LZSOXCul2rxPueaDIpt4qYZ7DtVb4noPDZyJ%2FBPwA8RT%2BP5ZwmekJBAg0sYfkY1hxkEiR3KguRiTsDqnDE0PGs9Bat5udL55jQQlVLDINJr07Tnum2PTA3ACElJ%2BOv6ePo%2BfQKxr%2BRuHT9RRPjQNzp7FkKl41khxW7f9q5y%2BCARbATsipwly%2FGtANYf5djqqGoI96g%3D%3D','Unit'),(14,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fgamedev.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=d7YGKkLXdBowFUo0Pg7uMi5OpJDqYCOAzm7LSZkP7EjJnFoMio8ABAjuMFswd9AP24JCONwp6iEAh56ta%2FUYtvJfGMubD4AmfEVFIDch3aaJCiA1STAfdvr2ZXm31TD1Pb%2F7%2FSMPgTvMbpe0nt4T2zuC1Usgl0CYrKQFmuUrJ7QVHcpXsm7IuaCn1XalyzEhZQPYbwVrXAsfyv1XEAc8yMx4eeThdmDrWJ3urR1z7UI9whicisALrsGmO1i%2BXAzn9ABkaA3iMk9gKDyeHM8gT3kJrVvANcmrKwyATJs70xEAz7E24JF8ZENVb2ZOPRNF4KT2hCTCkFPlq2AOtfkqzQ%3D%3D','Unit'),(15,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fmadstudios.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=nxL9d8gq9Pg7q40VcywPuozRVuvxuXSVAnRtm6TK0hF%2FUFImKuzs%2Bi2BJUPXqx0eSx74zJ3Lz11Y6YlaHiKu5cbBopK%2BbLRBEoeIf8XAHd6Fb5lXylhWE0G5nG%2BbHYrBUQ%2BwN8bgLFgGaLBqqzy%2Fl1%2BsCefMnGip0pBOxTVVTnsqXQIR2zD%2FIdcT7Lw7hkSiFNtn9Elb4jZ87su9N3UtLgt7JtnxRKjmQxwcLnT7dGvcU1U2PvmzPe2E5hLQZqNVVoMiLl54uw2kT57tg8CqSuQbkpdCquhsnc0n8P%2BABY2HEJMNE5mxMf4%2FYgMSLpaY%2Bbge2rdea4Qi3bjgU4UNbA%3D%3D','Unit'),(16,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fmotioncapture.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=fIGjOs0%2F2DJ4yyDQXvqNZXzFLZ2SPY3SMv%2Fxxsf8r4biEf%2Fs9lAPThpICbu%2BLI5Kr9JUsJBv5giY0LdzNSzc6ctuzV7w8XEOhxkf9pnieFPuplWaptQ%2Bz42xDqbsUOIFbQh6fnuBVUsNuJY29LWKFQYq6iFypqlD0yeyrjV%2FMhGg3vbc60bjGJQMJX3fOHsqbxb44%2FJQqExuzpafekJBfdaARgzXNXGqtZyjomFui8MUoiUUoFCR9KJMAphXueKxjK7DJdQ6951lwTFNk4e6LwiIC5FIX%2BoRJHXIkvrsF3wERE6SH5LScCaZ6Pt8%2B%2B5U8Tw4M1vMnMSy7wTKGVYbPw%3D%3D','Unit'),(17,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fmusictech.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=fLbHgWEWfoRqtaBU2vkjKqtd90wYcNSM75NUXs5%2BQl0BYe3H4mcJ3V4Rel%2FarIlARaSERFdcVg97OGf%2BF1NQ0y1Et1qPVjkAH2MoVa%2FOcC2WR1e6ALghh93QS33t7Gj9tJLUNqPiAeYPpDN5CAUIQi7i%2FjF5ouZ8HnAd6UW%2FV%2FH%2B3DpYCI9GrlqIA6AQV0E6zSjoAic7Nmo70AN6GURGk6Us3hfbL48RcNQgW%2F8rnzzvThnt131c1I0PPafGEfyLl04xVtaog%2FL9hIYAu%2BevUq6MD%2BHYt4b0PE4dSe%2B2KSP7SOrR4sPpyHCLfx9OebF3wxGBaelF9Ku%2BrX7Ou5tffQ%3D%3D','Unit'),(18,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Frecordingstudios.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=VCNRyM3UDWsojYhowMJDYaLKx3sbH9w0lemm84JBmsIiqpI9YmaKs4PyWE66NTTvfhHZReMnVFh%2FiP7iL%2BHH576efBW2VJpQDcChP2wB45pFaQEqoNKCYOLOqgZbjtZ0yHN2pOBlNd1GPOd996Xa9n0mxvqOdyPb3ZwdITItRCY9nyjkv%2FN284CEjD%2BFjtOxNNzC9Wg%2BeGZVtu3I96ai12dkttWiSv6T9Zv5Vs4mdtF593X3Ifc1jhKqzuNkTKWaMg3dJGF9FweBd0KMwL20FE70WAigtdDT86UrBRS8RcyLWrC2vjIo0vbLBc2FUUkPobjYqQkzZzHbV%2B6v0PYBnQ%3D%3D','Unit'),(19,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Frecordingstudiof.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=PaNATJedNKjf828agi%2BHI9Lh3aeAD4xXlNdMAzZKsl0VlyfpAdnY2deMT9PnMcfwdwwflqMRMUQQzK9t5oeQZmvNGr5nUxWQb5YwROeX%2BRKYdBwaL%2B%2FJaTyjWWJOA188WUjN9fNilEsTswyaCibziA2f5ZXOu8dBlWClpZPB%2BMuPAxsJ31Ysa5cAej49kWa5wR9WJy4QFDdAZhYxglWMquTE2HSuUaVR22HmfZQJy6SA4D6hbgsEWO%2FThSHDyFm0K0L%2BQy2FQyQcfo0F%2BMUPqrJEJLh%2B0blsI0U%2BeF2VMZ%2Fx5ruBaLnwhNyEltEc6LTa2MvJmI5%2BACd%2B%2B9cvZNHobw%3D%3D','Unit'),(20,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fsocialmedia.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=lcwFZkRX%2FdM9JIwrXG13DRljQnGgcHaFuApbP%2F8LYG2kUT%2FV92iDOxzBrMvacjO1yHkTOha%2F0JuIwKFZRTBo%2BdB3Xef%2FCFRbgPWshtjRAGLLLnUU5CTAqWap7arKOPeEJOm37hq1zJavUBRk4VnMaf%2B1WgBKxYCcrgI3NXxMPs7rFmDoDTpJ12nQC3zrAOvy1fPfCJBmnBRHtR7LTK6%2B9rCZzL%2BTp2Hzb6RVmGLGi3Ykdrh63dcJds4VzHfXUiOYX%2FbmYMT%2F1JE8oTQY1C4uVZiQkv4U4IwWNrVNSiJhRiScK4tn5uOPbcBiIvAB6ZsLjukF1tWxlRYv6Ozb4AIxaQ%3D%3D','Unit'),(21,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fvisualeffects.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=m7tkFA%2F%2FH7irrroeoCcZhY2aUWlrWf3jZDZSWmCS2Lm5r9PcN%2BifXHxb%2BAJN1eEAGhDN9LcOlbqRrQTTH%2BEJfE1UZLhvgfJIY3e687%2BSOtTuO9U4ljGwLY7UZuAV5D%2FJOztktSwFrIqgWQwDhDtb7zUY4y7ZEVXnlWoCmzxCC9BxJRuivOkejoOOmoOhU6hy8B1kBSZM4pi2rSxOoOP8K8Ti3g1dDVSgWEIoKG12nSJl1Df%2FvuSskwUpoOlUOFVUuI7Vs%2FnfVEtYvijcQ2BTgKl50UEHwE2YiTYMJVBxWnHm1D2xsvqTSk%2BFvqQ0Wc8Nfc5%2B9oZq%2F7BEzLU5aQPlZQ%3D%3D','Unit'),(22,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fwirelessinnolab.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=mVJaSncB9sqG7idHYmdQf8Up3UoWb63fDF7bTF4QZAbupo14i4Moy2zBWF9cV%2FVAGYC3WiDeMSYaytBNVmuaGBaAixF8AOC0Ha%2FvNAicPfQyog4BsH01%2BOtd1Jepc4oIJ4ylzJUNIckoXA2H5jhIhbja%2F0QCyGX9skQEmIqKxP%2FNfo8k47hdygonIDQ9gxusUxo5OHZyFNeBnzAtra1WypVibfCI3mQJnvVeiud0gJbpX6sltyuEv6wltz13z2IfbcHjahv8a19fHGhlG4UR4JlDyoquWYO0R6wLnuKMeicC%2FFT07UevuJDCcDVFxJzADKBCDnB9wBbJFx5ZgrixIQ%3D%3D','Unit'),(51,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2F22612(1).jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=DBqpdUCsm5saAmGJT2aQVBTayHTfzybtv3YmOWXPjufor33GDM6KBSvNxVCdKHtJ2Lf0st5fGbG%2BWKZkMhG0rZteCHMr7pnUBYMDuDYOaxCUagCQDMwLDZkxVfoL7cNrYNMIvXqPnikjPEMuQZeHwgWtdbt57OJ3upIA7nfG7aAc3SC%2FwDrmJfOSyLCDcmAQzTAnOuRqbKdnP43m%2FziuxxwDwnqpHIrqkzZh8VX3e1WcK4OXpdgMjKGOPptZ8fpvn9dz%2FyjcT2riooJvQkruH8t6FayBm%2BueHH42fyH8Vh8HzGSIAmXC40ln3NpLzBwyrdrWQ2h1D85SyhATTC%2BkAg%3D%3D','AG'),(54,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fwirelessinnolab.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=mVJaSncB9sqG7idHYmdQf8Up3UoWb63fDF7bTF4QZAbupo14i4Moy2zBWF9cV%2FVAGYC3WiDeMSYaytBNVmuaGBaAixF8AOC0Ha%2FvNAicPfQyog4BsH01%2BOtd1Jepc4oIJ4ylzJUNIckoXA2H5jhIhbja%2F0QCyGX9skQEmIqKxP%2FNfo8k47hdygonIDQ9gxusUxo5OHZyFNeBnzAtra1WypVibfCI3mQJnvVeiud0gJbpX6sltyuEv6wltz13z2IfbcHjahv8a19fHGhlG4UR4JlDyoquWYO0R6wLnuKMeicC%2FFT07UevuJDCcDVFxJzADKBCDnB9wBbJFx5ZgrixIQ%3D%3D','Unit'),(55,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fnoimage.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=H9Vx14mRv3Za6OQEmXfRKA3OJgFsZ7DsloioO5HTjUx6oez5l%2FX20CrL%2Bo3k98phdEDfYWejO%2FOU8vl%2BiKONCVZH0U7otECd2%2BFfg%2FSDUru%2F0q3%2FJ39cp4x78FcC0ybasp%2BQwdCTJT4KwnDTffTnDMT5FQaX%2BoPAqiBFq%2FUn9CaChki54ozri4ui9tGJLPAntsahIQDhbqr8wQSujehwHajJAoxInMo5b5QBT%2F4C2Z2rkR%2F81Nd3WDKjBO1xEUHxAF%2FNSflz7Skru4hWDZIHib7RxqvkCdB%2FT0sz0IzX9PWrzF4GJIXxLvB268mn8QxUzmgvfTPnnrIVxic4Ld%2FMNQ%3D%3D','Unit'),(56,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2FWhatsApp%20Image%202018-07-31%20at%201.08.45%20PM.jpeg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=OsSh%2BIJXks0I4I1lupp1T087OGviiWXvqvg9BptkNeXpwSNOt7foZc45W6yLM3tgBvMAZYU38U881lyyRIAjYcyikQWX3EGkfwz1ts1mcRo5XCW7s%2BjEltkJOGyH6BoAM%2FTDrzOfMQMToGtjKebfsVXPaIHBNFN8Se%2BkXBg6XIHFFQ0bT6NwZzZJbG4slTCgkO%2Bf9IaYlWUTpwXuAdDbqByXzOr69WYoJCsU1d%2FdShDt53ek6ZHAqqPWIVVMULXOLpn0W%2FrolYXy%2B84u%2Fk%2FeRZRWSCNO6dICmLONpKa3QXVHkX5QRY4M%2FL7bbXTPhVa8vRs1ERVuh1Jj2GbOwOQ%2BiQ%3D%3D','Facility'),(57,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fmalewashroom.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=FDX%2BRsGZtNsPrOWDzkDTWxhNK3OB4xPkvtmdBqbDU1RHKhHslu3pwpXrlLcItS8Jk52TYQNaXDqef4f4KOwf94O%2BQVJ9v30tKAhYR7Pq2%2F%2FBCHgyFylVeB7uDzajfuXRIfNtOuNIkN3Lr%2F4sR2P0fFfd4Kt9EtsNLXOLcA0wfwl%2BEX4AZ1cNDvgBerPeC5SrgbkoyPkAg1NXeC5NLdbOJ1CDnss8XvvttEI1z%2FeeGeyeDkOI0cDzOVoLSF%2FjaGy%2F9cInQhBegzULYTVBPWEadpaBn9qtlp5ZTi%2FipdcRXNgyTFJg%2BDQ%2BkANI%2Bvn%2FOBcugyIcJi1HEAJ8ozirvJHH4g%3D%3D','Unit'),(58,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Ffacilities%2Fconferenceroom.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=RF8DiJrkIgKiRLlDJKVGYq4hpJ%2FiaRRmq74%2F5y1HkTpapgGgBnuonBAUzRtXhtIEYJvhWZ5xRpsySQX2XZTBZX0KU8twq8uFJHfz6bwR6GnDdYNYlqVAURgHiUWy8yDyYRg%2B4tamumIlO6nVLith2qmMushfkF%2BqOLbZ4iaV6QQ%2FBtEIenYV1LgdToV%2FVeaQzPhEwwMiKuh3nIZ4UGuxGwR0%2F%2BczD%2Fj7SvnM5ExEZagy7lUY5OR%2FLf1dPgTHB3oL6iZ%2FR0wGZN%2FCrtKij6CfatnHp4uiEbNMIXexIKeOWwm3xrD3BJ%2BKDpok8YQ6EpBSvM8pTreo1OPpFYpyTXuslQ%3D%3D','Facility'),(59,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Ffemalewashroom.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=lHx0NvB1O4LzGfpBhmz8MM%2BP%2F53RhJxfVkZZuv8JgmvMH2iOrXLbBh%2BrFTU%2FK5lMILHzVbkGAGoMOOMrqj2jHjOKFQYmVFecPOdplvo7NqJ5rIAoU6hUAKkSImsQigb9alAdb4CWEXOKzo6XbI5%2BcYeru0ufI%2BJxDlP9M3ayg09FcstaqS%2FdUql4Sen9ZSryhVp%2Bwcc%2Bkr0eQraNUg2%2B6mXgvR7H52NOIm6R2AKRZjPoKE2NtIOdwcl6FrkPE9o366N0UKQ3hhWMYHPkJ258vPm%2FJ7RG0BzNwHROsT2Il7ylldbQFgPzWDWFwJlPlPZqSQkWhkfIaRQSIlNPodSJmg%3D%3D','Unit'),(60,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fhandicapwashroom.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=Q3%2B0eSMDNQe07KP6LRFCbxu5P7bMGmwW5Gi%2BPK%2FKkFiKru%2B89FCQr1bSMzj1YnEwJVm6UgKBUoSuKvh%2Bg2Z%2F0z4YxEfPjQhoS9nVeFJfRoZimDLX5fRIdezDmgBwLqD%2BqGE26xlDkRLkzJsDLVPGfu%2BboVDTadNBlIAUiPzbt%2Bjc3aHGnwJjMmbqLeMLr8a5ILnZ%2FIvE6OpbUxRwXBskFmL8w7LBR9b6NVIMWG7EkFOzDEs4VHFrjhPhxZgoxDkcozJWS2tkV%2Fr2%2FTMNwmHGfYGyA9WRT7fle69Ys9Gc6tyL0c%2FbegUDLKKDiGQAta9LoiMu6dAEIw2vi3Ma5YR4tA%3D%3D','Unit'),(61,'https://storage.googleapis.com/pwa-firebase-hosting.appspot.com/images%2Funits%2Fconferenceroom.jpg?GoogleAccessId=firebase-adminsdk-slnc4%40pwa-firebase-hosting.iam.gserviceaccount.com&Expires=253370736000&Signature=XGjtn2mTFabCIUcUObnTpYPziV32rqkZ%2FxKoV4BgjZkq5Rh5i10Hmtls6Di2aCHObxlN3YN2SY0DujyfQ0ScDU62jRvFMJT46B5f3rsjmRAe2l0OJ0Tdskm3IGbac9%2FRiiOTou%2BrugRmQXxLlatB10DZonlesLg5W0LiumKt9Ggp4Wh76xwkA%2FjlMAnHt399f7kCE1ueEBgf9Spgm6U46CLA9kIF7UXNP01yCYjG6K1s7AytyoUgL8SI5kvCcPQm5o07TXz1X0wOZ7J%2FzBOikbNGtc83uQ0XH%2FjRmOabC3lSIYC6An2qpARO5zghuNJzkmnoTQzF5TmCEbmTkNkw5A%3D%3D','Unit');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `UnitID` int(11) NOT NULL AUTO_INCREMENT,
  `UnitNo` varchar(45) NOT NULL,
  `Level` int(11) NOT NULL,
  `Block` varchar(45) NOT NULL,
  `UnitName` varchar(45) NOT NULL,
  PRIMARY KEY (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'T1933',3,'19','VISUAL EFFECTS STUDIO'),(2,'T19334',3,'19','BUSINESS INNOVATION & DESIGN STUDIO'),(3,'T19335',3,'19','BUSINESS INNOVATION & DESIGN STUDIO'),(4,'T19336',3,'19','BUSINESS INNOVATION & DESIGN STUDIO'),(5,'T19337',3,'19','RETAIL STUDIO'),(6,'T19338',3,'19','BUSINESS INNOVATION & DESIGN STUDIO ll'),(7,'T19339',3,'19','BUSINESS INNOVATION & DESIGN STUDIO ll'),(8,'T19340',3,'19','MEDIA CLASSROOM'),(9,'T19433',4,'19','MEDIA CLASSROOM'),(10,'T19457',4,'19','MEDIA CLASSROOM'),(11,'T2011',1,'20','MEDIA CLASSROOM'),(12,'T2012',1,'20','MEDIA CLASSROOM'),(13,'T2013',1,'20','MEDIA CLASSROOM'),(14,'T2021A',2,'20','MEDIA CLASSROOM'),(15,'T2021B',2,'20','MEDIA CLASSROOM'),(16,'T2022',2,'20','NETWORKING LAB'),(17,'T2023',2,'20','YELLOW SUBMARINE'),(18,'T2024',2,'20','LENNON'),(19,'T2025',2,'20','MCCARTNEY'),(20,'T2026',2,'20','HARRISON'),(21,'T2027',2,'20','Starr'),(22,'T2031',3,'20','WIRELESS INNOVATION LAB'),(23,'T2032',3,'20','CYBER SECURITY INNOVATION CENTRE'),(24,'T2033',3,'20','CYBER RANGE'),(25,'T2034',3,'20','CYBERWATCH COMPETENCY CENTRE'),(26,'T2034A',3,'20','CYBERWATCH COMPETENCY CENTRE'),(27,'T2035',3,'20','MALWARE ANALYSIS LAB'),(28,'T2036',3,'20','FORENSICS INVESTIGATION LAB'),(29,'T2041A',4,'20','INTEGRATED RESOURCE CENTRE'),(30,'T2041B',4,'20','COMTECH CENTRE'),(31,'T2041C',4,'20','SERVER CENTRE'),(32,'T2042',4,'20','MOTION CAPTURE STUDIO'),(33,'T2043',4,'20','LUCY'),(34,'T2044',4,'20','SOUNDSCAPE REVOLVER'),(35,'T2044A',4,'20','ANTHOLOGY'),(36,'T2045',4,'20','ANTHOLOGY'),(37,'T2051',5,'20','CASS LECTURERS ROOM'),(38,'T2052',5,'20','DRAWING STUDIO'),(39,'T2053',5,'20','DRAWING STUDIO'),(40,'T2054',5,'20','DESIGN PRODUCTION ROOM'),(41,'T2055',5,'20','POST PRODUCTION STUDIO A'),(42,'T2056',5,'20','POST PRODUCTION STUDIO B'),(43,'T2111',1,'21','THE BAY'),(44,'T2112',1,'21','THE NOLAN'),(45,'T2113',1,'21','THE REYNAUD'),(46,'T2114',1,'21','THE MIYAZAKI'),(47,'T2115',1,'21','THE LASSETER'),(48,'T2116',1,'21','M.A.D. STUDIOS'),(49,'T2117',1,'21','THE MERGERS'),(50,'T2118',1,'21','THINK TANK'),(51,'T2119',1,'21','THE ARTISAN'),(52,'T21111',1,'21','SPICE SERVICE DESK'),(53,'T2121',2,'21','MEDIA CLASSROOM'),(54,'T2122',2,'21','MEDIA CLASSROOM'),(55,'T2123',2,'21','CASS MEDIA LAB 1'),(56,'T2124',2,'21','CASS MEDIA LAB 2'),(57,'T2125A',2,'21','CONTROL ROOM'),(58,'T2125',2,'21','CREATIVE MEDIA SUITE'),(59,'T2126',2,'21','MULTIMEDIA ROOM 1'),(60,'T2126A',2,'21','CASS ROOM'),(61,'T2127',2,'21','MULTIMEDIA ROOM 2'),(62,'T2128',2,'21','EQUIPMENT HUB'),(63,'T21210',2,'21','MEDIA CLASSROOM'),(64,'T2131',3,'21','MEDIA CLASSROOM'),(65,'T2132',3,'21','MEDIA CLASSROOM'),(66,'T2133',3,'21','APERTURE SCIENCE'),(67,'T2134',3,'21','UNREAL AND TECHNOLOGY LAB'),(68,'T2135A',3,'21','SOCIAL MEDIA LISTENING CENTRE'),(69,'T2135B',3,'21','SOCIAL MEDIA LISTENING CENTRE'),(70,'T2136',3,'21','INFOCOMM SOLUTIONS CENTRE'),(71,'T2137',3,'21','HOSPITALITY & TOURISM IT CENTRE'),(72,'T2138',3,'21','HOSPITALITY & TOURISM IT CENTRE'),(73,'T2139',3,'21','INFORMATION SYSTEMS LAB'),(74,'T2141',4,'21','MEDIA CLASSROOM'),(75,'T2142',4,'21','MEDIA CLASSROOM'),(76,'T2143',4,'21','MEDIA CLASSROOM'),(77,'T2144',4,'21','MEDIA CLASSROOM'),(78,'T2145',4,'21','MEDIA CLASSROOM'),(79,'T2146',4,'21','MEDIA CLASSROOM'),(80,'T2147',4,'21','MEDIA CLASSROOM'),(81,'T2148',4,'21','MEDIA CLASSROOM'),(82,'T2149',4,'21','MEDIA CLASSROOM'),(83,'T21410',4,'21','MEDIA CLASSROOM'),(84,'T2151',5,'21','MEDIA CLASSROOM'),(85,'T2152',5,'21','MEDIA CLASSROOM'),(86,'T2153',5,'21','MEDIA CLASSROOM'),(87,'T2154',5,'21','MEDIA CLASSROOM'),(88,'T2155',5,'21','MEDIA CLASSROOM'),(89,'T2156',5,'21','MEDIA CLASSROOM'),(90,'T2157',5,'21','BLACKBOX'),(91,'T2158',5,'21','BLACKBOX'),(92,'T2231A',3,'22','SERVER ROOM'),(93,'T2231',3,'22','ACCOUNTING ANALYTICS'),(94,'T2232A',3,'22','MULTIMEDIA EDITING STUDIO'),(95,'T2232',3,'22','FINANCIAL INFORMATICS CENTRE'),(96,'T2233',3,'22','HUMAN RESOURCE LEARNING STUDIO'),(97,'T2234',3,'22','HOSPITALITY LEARNING HUB'),(98,'Project Room',3,'22','PROJECT ROOM'),(99,'T2235',3,'22','MEDIA CLASSROOM'),(100,'T2236',3,'22','DEALING ROOM'),(101,'T22321',3,'22','MEDIA CLASSROOM'),(102,'T22310',3,'22','MEDIA CLASSROOM'),(103,'T2239',3,'22','IBALL'),(104,'T2237',3,'22','MEDIA CLASSROOM'),(105,'T2238',3,'22','ACCOUNTING COLLABORATION STUDIO'),(106,'T2241',4,'22','MEDIA CLASSROOM'),(107,'T2242',4,'22','MEDIA CLASSROOM'),(108,'T2243',4,'22','MEDIA CLASSROOM'),(109,'T2244',4,'22','MEDIA CLASSROOM'),(110,'T2245',4,'22','MEDIA CLASSROOM'),(111,'T2246',4,'22','MEDIA CLASSROOM'),(112,'T2247',4,'22','MEDIA CLASSROOM'),(113,'T2248',4,'22','MEDIA CLASSROOM'),(114,'T22409',4,'22','MEDIA CLASSROOM'),(115,'T22414',4,'22','MEDIA CLASSROOM'),(116,'T22420',4,'22','MEDIA CLASSROOM'),(117,'T22421',4,'22','MEDIA CLASSROOM'),(118,'T22425',4,'22','MEDIA CLASSROOM'),(119,'T22429',4,'22','MEDIA CLASSROOM'),(120,'T22430',4,'22','STAFF LOUNGE'),(121,'T22431',4,'22','MEDIA CLASSROOM'),(122,'T22432',4,'22','MEDIA CLASSROOM'),(123,'T22433',4,'22','MEDIA CLASSROOM'),(124,'T22434',4,'22','MEDIA CLASSROOM'),(125,'T22435',4,'22','MEDIA CLASSROOM'),(126,'T2251',5,'22','MEDIA CLASSROOM'),(127,'T2252',5,'22','MEDIA CLASSROOM'),(128,'T2253',5,'22','MEDIA CLASSROOM'),(129,'T2254',5,'22','MEDIA CLASSROOM'),(130,'T2255',5,'22','MEDIA CLASSROOM'),(131,'T2256',5,'22','MEDIA CLASSROOM'),(132,'T2257',5,'22','MEDIA CLASSROOM'),(133,'T2258',5,'22','MEDIA CLASSROOM'),(134,'T2259',5,'22','MEDIA CLASSROOM'),(135,'T22510',5,'22','MEDIA CLASSROOM'),(136,'T22511',5,'22','MEDIA CLASSROOM'),(137,'T22512',5,'22','MEDIA CLASSROOM'),(138,'T2261',6,'22','HUDDLE CORNER'),(139,'T2262A',6,'22','MEDIA CLASSROOM'),(140,'T2262B',6,'22','MEDIA CLASSROOM'),(141,'T2263',6,'22','MEDIA CLASSROOM'),(142,'T2264',6,'22','MEDIA CLASSROOM'),(143,'T2265',6,'22','MEDIA CLASSROOM'),(144,'T2266',6,'22','MEDIA CLASSROOM'),(145,'T2267',6,'22','MEDIA CLASSROOM'),(146,'T2268',6,'22','MEDIA CLASSROOM'),(147,'T2269',6,'22','MEDIA CLASSROOM'),(148,'T22610',6,'22','MEDIA CLASSROOM'),(149,'T22611',6,'22','MEDIA CLASSROOM'),(150,'T22612',6,'22','MEDIA CLASSROOM'),(151,'T22613',6,'22','MEDIA CLASSROOM'),(152,'T22614',6,'22','MEDIA CLASSROOM'),(153,'T22615',6,'22','MEDIA CLASSROOM'),(154,'T22616',6,'22','MEDIA CLASSROOM'),(155,'T19(2)M2',2,'19','MALE WASHROOM'),(156,'T19(2)F2',2,'19','FEMALE WASHROOM'),(157,'T19(2)H',2,'19','HANDICAP WASHROOM'),(158,'T19(3)M2',3,'19','MALE WASHROOM'),(159,'T19(3)F2',3,'19','FEMALE WASHROOM'),(160,'T19(3)H2',3,'19','HANDICAP WASHROOM'),(161,'T20(1)M',1,'20','MALE WASHROOM'),(162,'T20(2)F',2,'20','FEMALE WASHROOM'),(163,'T20(3)M',3,'20','MALE WASHROOM'),(164,'T20(4)F',4,'20','FEMALE WASHROOM'),(165,'T20(5)M',5,'20','MALE WASHROOM'),(166,'T21(1)M',1,'21','MALE WASHROOM'),(167,'T21(1)F',1,'21','FEMALE WASHROOM'),(168,'T21(1)H',1,'21','HANDICAP WASHROOM'),(169,'T21(2)M',2,'21','MALE WASHROOM'),(170,'T21(2)F',2,'21','FEMALE WASHROOM'),(171,'T21(2)H',2,'21','HANDICAP WASHROOM'),(172,'T21(3)M',3,'21','MALE WASHROOM'),(173,'T21(3)F',3,'21','FEMALE WASHROOM'),(174,'T21(3)H',3,'21','HANDICAP WASHROOM'),(175,'T21(4)M',4,'21','MALE WASHROOM'),(176,'T21(4)F',4,'21','FEMALE WASHROOM'),(177,'T21(4)H',4,'21','HANDICAP WASHROOM'),(178,'T21(5)M',5,'21','MALE WASHROOM'),(179,'T21(5)F',5,'21','FEMALE WASHROOM'),(180,'T21(5)H',5,'21','HANDICAP WASHROOM'),(190,'T1942',4,'19','OUTSIDE CONFERENCE ROOM POINT 1'),(191,'T1942',4,'19','OUTSIDE CONFERENCE ROOM POINT 2'),(192,'T1942',4,'19','OUTSIDE CONFERENCE ROOM POINT 3'),(193,'T1941',4,'19','OUTSIDE SYNERGY ROOM POINT 1'),(194,'T1941',4,'19','OUTSIDE SYNERGY ROOM POINT 2'),(195,'T1941',4,'19','OUTSIDE SYNERGY ROOM POINT 3'),(196,'T1941',4,'19','OUTSIDE SYNERGY ROOM POINT 4'),(197,'T1941',4,'19','OUTSIDE SYNERGY ROOM POINT 5'),(200,'T21(4)H',4,'21','OUTSIDE HANDICAP WASHROOM'),(201,'T1941',4,'19','OUTSIDE FEMALE WASHROOM'),(202,'T1942',4,'19','CONFERENCE ROOM POINT 1'),(203,'T1942',4,'19','CONFERENCE ROOM POINT 2'),(204,'T1942',4,'19','CONFERENCE ROOM POINT 3'),(205,'T1942',4,'19','CONFERENCE ROOM POINT 4'),(206,'T1942',4,'19','CONFERENCE ROOM POINT 5'),(207,'T1942',4,'19','CONFERENCE ROOM POINT 6'),(208,'T1942',4,'19','CONFERENCE ROOM POINT 7'),(209,'T1942',4,'19','CONFERENCE ROOM POINT 8'),(210,'T1942',4,'19','CONFERENCE ROOM POINT 9'),(211,'T22(2)M',2,'22','MALE WASHROOM'),(212,'T22(2)F',2,'22','FEMALE WASHROOM'),(213,'T22(2)H',2,'22','HANDICAP WASHROOM'),(214,'T22(3)M',3,'22','MALE WASHROOM'),(215,'T22(3)F1',3,'22','FEMALE WASHROOM'),(216,'T22(3)F2',3,'22','FEMALE WASHROOM'),(217,'T22(3)H',3,'22','HANDICAP WASHROOM'),(218,'T22(4)M1',4,'22','MALE WASHROOM'),(219,'T22(4)M2',4,'22','MALE WASHROOM'),(220,'T22(4)F',4,'22','FEMALE WASHROOM'),(221,'T22(4)H',4,'22','HANDICAP WASHROOM'),(222,'T22(5)M',5,'22','MALE WASHROOM'),(223,'T22(5)F1',5,'22','FEMALE WASHROOM'),(224,'T22(5)F2',5,'22','FEMALE WASHROOM'),(225,'T22(5)H',5,'22','HANDICAP WASHROOM'),(226,'T22(6)M',6,'22','MALE WASHROOM'),(227,'T22(6)F1',6,'22','FEMALE WASHROOM'),(228,'T22(6)F2',6,'22','FEMALE WASHROOM'),(229,'T22(6)H',6,'22','HANDICAP WASHROOM');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitimage`
--

DROP TABLE IF EXISTS `unitimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitimage` (
  `UIID` int(11) NOT NULL AUTO_INCREMENT,
  `UnitID` int(11) NOT NULL,
  `ImageID` int(11) NOT NULL,
  PRIMARY KEY (`UIID`),
  KEY `UNITIMAGE_UNITID_idx` (`UnitID`),
  KEY `UNITIMAGE_IMAGEID_idx` (`ImageID`),
  CONSTRAINT `UNITIMAGE_IMAGEID` FOREIGN KEY (`ImageID`) REFERENCES `image` (`ImageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UNITIMAGE_UNITID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitimage`
--

LOCK TABLES `unitimage` WRITE;
/*!40000 ALTER TABLE `unitimage` DISABLE KEYS */;
INSERT INTO `unitimage` VALUES (11,1,21),(20,2,12),(23,3,12),(25,4,12),(26,5,12),(27,6,12),(28,7,12),(29,8,12),(30,9,12),(31,10,12),(32,11,12),(33,12,12),(34,13,12),(35,14,12),(36,15,12),(37,16,12),(38,17,19),(39,18,12),(40,19,17),(41,20,17),(42,21,17),(43,22,22),(44,23,12),(45,24,13),(46,25,13),(47,26,13),(48,27,13),(49,28,13),(50,29,12),(51,30,12),(52,31,12),(53,32,16),(54,33,18),(55,34,18),(56,35,18),(57,36,12),(58,37,12),(59,38,12),(60,39,12),(61,40,12),(62,41,12),(63,42,12),(64,43,12),(65,44,12),(66,45,12),(67,46,12),(68,47,12),(69,48,15),(70,49,15),(71,50,15),(72,51,15),(73,52,12),(74,53,12),(75,54,12),(76,55,12),(77,56,12),(78,57,12),(79,58,12),(80,59,12),(81,60,12),(82,61,12),(83,62,12),(84,63,12),(85,64,12),(86,65,12),(87,66,14),(88,67,14),(89,68,20),(90,69,20),(91,70,12),(92,71,12),(93,72,12),(94,73,12),(95,74,12),(96,75,12),(97,76,12),(98,77,12),(99,78,12),(100,79,12),(101,80,12),(102,81,12),(103,82,12),(104,83,12),(105,84,12),(106,85,12),(107,86,12),(108,87,12),(109,88,12),(110,89,12),(111,90,12),(112,91,12),(113,92,12),(114,93,12),(115,94,12),(116,95,12),(117,96,12),(118,97,12),(119,98,12),(120,99,12),(121,100,12),(122,101,12),(123,102,12),(124,103,12),(125,104,12),(126,105,12),(127,106,12),(128,107,12),(129,108,12),(130,109,12),(131,110,12),(132,111,12),(133,112,12),(134,113,12),(135,114,12),(136,115,12),(137,116,12),(138,117,12),(139,118,12),(140,119,12),(141,120,12),(142,121,12),(143,122,12),(144,123,12),(145,124,12),(146,125,12),(147,126,12),(148,127,12),(149,128,12),(150,129,12),(151,130,12),(152,131,12),(153,132,12),(154,133,12),(155,134,12),(156,135,12),(157,136,12),(158,137,12),(159,138,12),(160,139,12),(161,140,12),(162,141,12),(163,142,12),(164,143,12),(165,144,12),(166,145,12),(167,146,12),(168,147,12),(169,148,12),(170,149,12),(171,150,12),(172,151,12),(173,152,12),(174,153,12),(175,154,12),(207,155,57),(208,156,59),(209,157,60),(210,158,57),(211,159,59),(212,160,60),(213,161,57),(214,162,59),(215,163,57),(216,164,59),(217,165,57),(218,166,57),(219,167,59),(220,168,60),(221,169,57),(222,170,59),(223,171,60),(224,172,57),(225,173,59),(226,174,60),(227,175,57),(228,176,59),(229,177,60),(230,178,57),(231,179,59),(232,180,60),(233,202,61),(234,203,61),(235,204,61),(236,205,61),(237,206,61),(238,207,61),(239,208,61),(240,209,61),(241,210,61),(242,211,57),(243,212,59),(244,213,60),(245,214,57),(246,215,59),(247,216,59),(248,217,60),(249,218,57),(250,219,57),(251,220,59),(252,221,60),(253,222,57),(254,223,59),(255,224,59),(256,225,60),(257,226,57),(258,227,59),(259,228,59),(260,229,60);
/*!40000 ALTER TABLE `unitimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-03 12:30:16

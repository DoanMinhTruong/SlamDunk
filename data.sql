-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `aliases` varchar(69) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `birthday` varchar(9) DEFAULT NULL,
  `img` varchar(132) DEFAULT NULL,
  `high_school_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Mitsuyoshi Anzai','White Haired Buddha ,White Haired Devil ,Pops (by Sakuragi Hanamichi)','Male','May 1','https://static.wikia.nocookie.net/slamdunk/images/0/00/AnzaiT.png/revision/latest/scale-to-width-down/127?cb=20140520192200',1),(2,'Riki Takato','','Male','','https://static.wikia.nocookie.net/slamdunk/images/b/b1/TakatoT.png/revision/latest/scale-to-width-down/127?cb=20141118072730',2),(3,'Moichi Taoka','','Male','August 30','https://static.wikia.nocookie.net/slamdunk/images/4/45/TaokaT.png/revision/latest/scale-to-width-down/127?cb=20141027161832',3),(4,'Kenji Fujima','','Male','','https://static.wikia.nocookie.net/slamdunk/images/c/cf/FujimaT.png/revision/latest/scale-to-width-down/127?cb=20141028053404',4),(5,'Goro Domoto','','','','https://static.wikia.nocookie.net/slamdunk/images/d/de/DomotoT.png/revision/latest/scale-to-width-down/127?cb=20141125071745',5),(6,'None','','','','https://static.wikia.nocookie.net/slamdunk/images/6/6d/Kanehira_square.jpg/revision/latest/scale-to-width-down/127?cb=20221114145206',6);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `high_school`
--

DROP TABLE IF EXISTS `high_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `high_school` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `perfecture` varchar(8) DEFAULT NULL,
  `captain_id` varchar(2) DEFAULT NULL,
  `vice_captain_id` varchar(2) DEFAULT NULL,
  `coach_id` tinyint(4) DEFAULT NULL,
  `img` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `high_school`
--

LOCK TABLES `high_school` WRITE;
/*!40000 ALTER TABLE `high_school` DISABLE KEYS */;
INSERT INTO `high_school` VALUES (1,'Shohoku High School','Kanagawa','3','6',1,'https://static.wikia.nocookie.net/slamdunk/images/a/a8/Shohoku.png/revision/latest/scale-to-width-down/130?cb=20141118152046'),(2,'Kainan University Affiliated High School','Kanagawa','15','17',2,'https://static.wikia.nocookie.net/slamdunk/images/f/f6/Kainan.png/revision/latest/scale-to-width-down/130?cb=20140511212712'),(3,'Ryonan High School','Kanagawa','23','26',3,'https://static.wikia.nocookie.net/slamdunk/images/6/67/RyonanHigh.png/revision/latest/scale-to-width-down/130?cb=20141119083029'),(4,'Shoyo High School','Kanagawa','45','29',4,'https://static.wikia.nocookie.net/slamdunk/images/5/51/Shoyo.png/revision/latest/scale-to-width-down/130?cb=20141126074910'),(5,'Sannoh Industry Affiliated High School','Akita','33','36',5,'https://static.wikia.nocookie.net/slamdunk/images/8/8d/Sannoh.png/revision/latest/scale-to-width-down/130?cb=20141114163739'),(6,'Toyotama High School','','','',6,'https://static.wikia.nocookie.net/slamdunk/images/1/1f/Toyotama.png/revision/latest/scale-to-width-down/130?cb=20141119075840');
/*!40000 ALTER TABLE `high_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(18) DEFAULT NULL,
  `aliases` varchar(135) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` varchar(11) DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL,
  `height` varchar(75) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `high_school_id` tinyint(4) DEFAULT NULL,
  `year` varchar(24) DEFAULT NULL,
  `position` varchar(66) DEFAULT NULL,
  `jersey` varchar(51) DEFAULT NULL,
  `img` varchar(137) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Hanamichi Sakuragi','The Basketball Genius,King of Rebound,Foul Out King,Red Haired Monkey,Simpleton King,The Savior of Basketball,Idiot Boy,Pipsqueak,Moron','Male','April 1','16','189.2 cm (6\'2)','83 kg (183 lbs)',1,'Year 1 Class 7','[Power Forward/Shooting Guard] Swingman/Center (Two Big Men= PF/C)','#10','https://static.wikia.nocookie.net/slamdunk/images/c/c4/SakuragiT.png/revision/latest/scale-to-width-down/127?cb=20140520192202'),(2,'Kaede Rukawa','Super Rookie,Fox,Offense Demon,Sleepy Tricky Fox','Male','January 1','15','188 cm (6\' 1\")','75 kg (165 lbs)',1,'Year 1 Class 10','Small Forward/Power Forward','#11','https://static.wikia.nocookie.net/slamdunk/images/f/fb/RukawaT.png/revision/latest/scale-to-width-down/127?cb=20140520192201'),(3,'Takenori Akagi','Gori, Gorilla, Old Gorilla, Stinking Gori (by Hanamichi Sakuragi)','Male','May 10','18','197 cm (6\' 5\")(current),193 cm (6’ 3”)(freshman),172 cm (5’ 8”)(elementary)','90 kg (198 lbs)(current),88 kg (194 lbs)(freshman)',1,'Year 3 Class 6(Formerly)','Center','#10, #4, #33 (practice)','https://static.wikia.nocookie.net/slamdunk/images/8/85/AkagiT.png/revision/latest/scale-to-width-down/127?cb=20140520192200'),(4,'Ryota Miyagi','Ryo-chin (by Sakuragi)','Male','July 31','17','168 cm (5\' 6\")','59 kg (130 lbs)',1,'Year 2 Class 1','Point Guard','#7 (current), #17 (freshman)','https://static.wikia.nocookie.net/slamdunk/images/9/90/RyotaT.png/revision/latest/scale-to-width-down/127?cb=20140520192201'),(5,'Hisashi Mitsui','Mitchi, Mit-chan, Mit-chin, Splashy','Male','May 22','18','184 cm (6\' 0\")(current),176 cm (5’9”)(freshman)','70 kg (155 lbs)(current),63 kg (138 lbs)(freshman)',1,'3rd year','Shooting Guard','#14 (Shohoku),4 (Takeishi)','https://static.wikia.nocookie.net/slamdunk/images/1/10/MitsuiT.png/revision/latest/scale-to-width-down/127?cb=20140520192201'),(6,'Kiminobu Kogure','Four eyes','Male','July 12','18','178 cm (5\' 10\")','63 kg (138 lbs)',1,'Year 3 Class 6(Formerly)','Vice Captain,Small Forward,Shooting Guard (if Mitsui is benched)','#5','https://static.wikia.nocookie.net/slamdunk/images/7/76/KogureT.png/revision/latest/scale-to-width-down/127?cb=20140520192201'),(7,'Yasuharu Yasuda','Yasu','Male','March 28','17','165 cm (5\'5\")','57 kg (125 lbs)',1,'2nd Year','Point Guard','#6','https://static.wikia.nocookie.net/slamdunk/images/5/55/YasudaT.png/revision/latest/scale-to-width-down/127?cb=20140520213005'),(8,'Tetsushi Shiozaki','','','','','','',1,'','','','https://static.wikia.nocookie.net/slamdunk/images/b/b4/TetsushiT.png/revision/latest/scale-to-width-down/127?cb=20140520213005'),(9,'Satoru Kakuta','','','','','','',1,'','','','https://static.wikia.nocookie.net/slamdunk/images/5/57/KakutaT.png/revision/latest/scale-to-width-down/127?cb=20140520213004'),(10,'Kentaro Iishi','','','','','','',1,'','','','https://static.wikia.nocookie.net/slamdunk/images/5/50/IishiT.png/revision/latest/scale-to-width-down/127?cb=20140520213004'),(11,'Satoro Sasaoka','','','','','','',1,'','','','https://static.wikia.nocookie.net/slamdunk/images/7/70/SasaokaT.png/revision/latest/scale-to-width-down/127?cb=20140520213005'),(12,'Toki Kuwata','','','','','','',1,'','','','https://static.wikia.nocookie.net/slamdunk/images/e/e8/KuwataT.png/revision/latest/scale-to-width-down/127?cb=20140520213004'),(13,'Ayako','','Female','March 21','17','','',1,'2nd year','Team Manager','','https://static.wikia.nocookie.net/slamdunk/images/4/4f/AyakoT.png/revision/latest/scale-to-width-down/127?cb=20140520193027'),(14,'Haruko Akagi','','Female','April 9','16','156cm (5\'1\"½)','42kg (93 lbs)',1,'1st year','2nd Manager','','https://static.wikia.nocookie.net/slamdunk/images/e/ea/HarukoT.png/revision/latest/scale-to-width-down/127?cb=20140520192200'),(15,'Shinichi Maki','じい (\'Jii\', short for じいさん, or middle-aged man)','Male','August 15','17','184 cm (6\' 0\")','79 kg (175 lbs)',2,'Third','Point Guard, Captain','#12 (First year), #8 (Second year), #4 (Third year)','https://static.wikia.nocookie.net/slamdunk/images/4/46/MakiT.png/revision/latest/scale-to-width-down/127?cb=20141028052940'),(16,'Soichiro Jin','','Male','August 22','','189 cm (6\'2)','71 kg (156lbs)',2,'2nd year','Shooting guard','#6','https://static.wikia.nocookie.net/slamdunk/images/6/6d/JinT.png/revision/latest/scale-to-width-down/127?cb=20141028052911'),(17,'Kazuma Takasago','','Male','August 24','','191 cm (6\'3)','80 kg (176lbs)',2,'3rd year','Center','#5','https://static.wikia.nocookie.net/slamdunk/images/2/21/TakasagoT.png/revision/latest/scale-to-width-down/127?cb=20141028053009'),(18,'Tadashi Muto','','','','','','',2,'','','','https://static.wikia.nocookie.net/slamdunk/images/8/87/MutoT.png/revision/latest/scale-to-width-down/127?cb=20141118073002'),(19,'Nobunaga Kiyota','Wild Monkey','Male','November 21','','178 cm (5\' 10\")','70 kg (155 lbs)',2,'1st year','Shooting Guard','#10','https://static.wikia.nocookie.net/slamdunk/images/2/22/KiyotaT.png/revision/latest/scale-to-width-down/127?cb=20141028052926'),(20,'Yoshinori Miyawasu','Space alien','Male','','','160cm (5\' 3\")','42 kg (92lbs)',2,'3rd year','Point Guard','#15','https://static.wikia.nocookie.net/slamdunk/images/a/a6/MiyamasuT.png/revision/latest/scale-to-width-down/127?cb=20141028052953'),(21,'Kicchou Fukuda','Fukusuke, Fuku','Male','November 26','','188 cm (6\' 2\")','80 kg (176 lbs)',3,'2nd year','Forward','#13','https://static.wikia.nocookie.net/slamdunk/images/a/a3/FukudaT.png/revision/latest/scale-to-width-down/127?cb=20141027161706'),(22,'Akira Sendoh','','Male','February 14','17','190 cm (6\' 3\")','79 kg (175 lbs)',3,'2nd Year','Forward/Point Guard','#7','https://static.wikia.nocookie.net/slamdunk/images/d/df/SendohT.png/revision/latest/scale-to-width-down/127?cb=20141027161814'),(23,'Jun Uozumi','Boss Monkey','Male','March 8','','202 cm (6\' 7\")(current),199 cm (6’ 6”)(former)','90 kg (198 lbs)',3,'3rd year','Center','#4, #15(freshman)','https://static.wikia.nocookie.net/slamdunk/images/e/ef/UozumiT.png/revision/latest/scale-to-width-down/127?cb=20141027161904'),(24,'Hiroaki Koshino','','Male','','','174 cm','62 kg',3,'2nd year','Shooting Guard','#6','https://static.wikia.nocookie.net/slamdunk/images/2/22/KoshinoT.png/revision/latest/scale-to-width-down/127?cb=20141027161755'),(25,'Uekusa','','Male','','','170 cm','62 kg',3,'2nd year','Point Guard','#8','https://static.wikia.nocookie.net/slamdunk/images/0/06/UekusaT.png/revision/latest/scale-to-width-down/127?cb=20141027161847'),(26,'Ryoji Ikegami','','Male','','','183 cm','72 kg',3,'3rd Year','Forward','#5','https://static.wikia.nocookie.net/slamdunk/images/a/a3/IkegamiT.png/revision/latest/scale-to-width-down/127?cb=20141027161736'),(27,'Hikoichi Aida','','Male','','','165 cm','52 kg',3,'1st year','Small Forward/Manager','#10','https://static.wikia.nocookie.net/slamdunk/images/e/e4/HikoichiT.png/revision/latest/scale-to-width-down/127?cb=20141027161721'),(28,'Kazushi Hasegawa','','Male','August 8','','190cm','80kg',4,'3rd year','Shooting Guard','#6','https://static.wikia.nocookie.net/slamdunk/images/1/1f/HasegawaT.png/revision/latest/scale-to-width-down/127?cb=20141028053434'),(29,'Toru Hanagata','Specs','Male','December 9','18','197 cm (6\' 6\")','83 kg (183 lbs)',4,'3rd year','Center','#5','https://static.wikia.nocookie.net/slamdunk/images/a/ab/HanagataT.png/revision/latest/scale-to-width-down/127?cb=20141028053420'),(30,'Shoichi Takano','','','','','','',4,'','','','https://static.wikia.nocookie.net/slamdunk/images/c/c9/TakanoT.png/revision/latest/scale-to-width-down/127?cb=20141028053522'),(31,'Mitsuru Nagano','','','','','','',4,'','','','https://static.wikia.nocookie.net/slamdunk/images/9/94/NaganoT.png/revision/latest/scale-to-width-down/127?cb=20141028053505'),(32,'Taku Itou','','','','','','',4,'','','','https://static.wikia.nocookie.net/slamdunk/images/1/1a/ItouT.png/revision/latest/scale-to-width-down/127?cb=20141028053451'),(33,'Kazunari Fukatsu','','Male','','','180 cm','',5,'','Point Guard','# 4','https://static.wikia.nocookie.net/slamdunk/images/9/99/KazunariFukatsuT.png/revision/latest/scale-to-width-down/127?cb=20141117141737'),(34,'Matsumoto Minoru','Beanpole','Male','','','186cm (6\' 1\")','76kg (168lbs)',5,'','Shooting Guard','# 6','https://static.wikia.nocookie.net/slamdunk/images/e/e5/MinoruMatsumotoT.png/revision/latest/scale-to-width-down/127?cb=20141117141000'),(35,'Masashi Kawata','Bald Gori','Male','October 23','','190 cm (6\' 3\")','95 kg (209 lbs)',5,'','Center','# 7','https://static.wikia.nocookie.net/slamdunk/images/4/46/MasashiKawataT.png/revision/latest/scale-to-width-down/127?cb=20141117140437'),(36,'Masahiro Nobe','Totem Pole','Male','','','199 cm','90kg',5,'','Power Forward','# 5','https://static.wikia.nocookie.net/slamdunk/images/2/2a/MasahiroNobeT.png/revision/latest/scale-to-width-down/127?cb=20141117141502'),(37,'Eiji Sawakita','','Male','October 7','','188 cm (6\' 2\")','77 Kg (170 lbs)',5,'','Small Forward','# 9','https://static.wikia.nocookie.net/slamdunk/images/b/b9/SawakitaT.png/revision/latest/scale-to-width-down/127?cb=20141117164915'),(38,'Mikio Kawata','','Male','','','210 cm','130 kg',5,'','Power Forward/Center','','https://static.wikia.nocookie.net/slamdunk/images/2/28/MikioKawataT.png/revision/latest/scale-to-width-down/127?cb=20141117140312'),(39,'Satoshi Ichinokura','','Male','','','170 cm','',5,'','Shooting Guard','# 8','https://static.wikia.nocookie.net/slamdunk/images/6/66/SatoshiIchinokuraT.png/revision/latest/scale-to-width-down/127?cb=20141117140552'),(40,'Tsuyoshi Minami','Ace Killer','Male','','','184 cm','',6,'3rd Year','Small Forward/Shooting Guard','#4','https://static.wikia.nocookie.net/slamdunk/images/f/f0/MinamiT.png/revision/latest/scale-to-width-down/127?cb=20141120065514'),(41,'Minori Kishimoto','','Male','','','188 cm','',6,'3rd Year','Power Forward','#5','https://static.wikia.nocookie.net/slamdunk/images/d/de/KishimotoT.png/revision/latest/scale-to-width-down/127?cb=20141120065441'),(42,'Mitsuaki Iwata','','Male','','','190 cm','',6,'3rd year','Center','','https://static.wikia.nocookie.net/slamdunk/images/1/15/IwataT.png/revision/latest/scale-to-width-down/127?cb=20141120034950'),(43,'Kyohei Yajima','','Male','','','180 cm','',6,'3rd year','Shooting Guard','','https://static.wikia.nocookie.net/slamdunk/images/e/e0/Kyohei_Yajima_Square.jpg/revision/latest/scale-to-width-down/127?cb=20221114144656'),(44,'Daijiro Itakura','','','','','','',6,'','','','https://static.wikia.nocookie.net/slamdunk/images/4/43/ItakuraT.png/revision/latest/scale-to-width-down/127?cb=20141120034924'),(45,'Kenji Fujima','','Male','','','178 cm','66 kg',4,'3rd year','Point Guard','#4','https://static.wikia.nocookie.net/slamdunk/images/c/cf/FujimaT.png/revision/latest/scale-to-width-down/127?cb=20141028053404');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-27 22:44:44

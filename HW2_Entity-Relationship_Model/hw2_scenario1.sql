-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` int NOT NULL,
  `book_title` varchar(45) DEFAULT NULL,
  `book_author` varchar(45) DEFAULT NULL,
  `book_subject` varchar(45) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`ISBN`,`publisher_id`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `fk_book_publisher_idx` (`publisher_id`),
  CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (11784,'區塊鏈與營業秘密保護困難之突破','郭彥呈','法律',9),(12322,'我的天才夢','張愛玲','中文文學',17),(13444,'被討厭的勇氣','岸見一郎','心靈成長',24),(16530,'火影忍者 1','Massashi Kishimoto','動作冒險',2),(16547,'火影忍者 2','Massashi Kishimoto','動作冒險',2),(16554,'火影忍者 3','Massashi Kishimoto','動作冒險',2),(19789,'Frank Gehry 談建築設計X建築人生','Isengerg, Barbara','藝術設計',1),(20521,'簡報處理PowerPoint 2016一切搞定','碁峰資訊','軟體應用',5),(23567,'電商人妻故事力手帳','電商人妻Audrey','投資理財',25),(24132,'股息Cover我每一天：600張存股達人絕活全公','大俠武林','投資理財',27),(25843,'原子習慣','詹姆斯克利爾','心靈成長',21),(26487,'大數據','約翰保羅','軟體應用',30),(32412,'新一代 科大四技機械群機械製造升學寶典','江元壽','電子/電機',13),(34567,'先別急著吃棉花糖','喬辛迪波沙','兒童繪本',26),(35685,'超速學習：我這樣做，一個月學會素描，一年學會四種語言，完成MIT四年課程','谷來客希爾','心靈成長',23),(35790,'OGSM打造高敏捷團隊：OKR做不到','張敏敏','管理與領導',28),(36621,'工地主任試題精選解析','陳佑松','建築土木',8),(43257,'投資最重要的事：一本股神巴菲特讀了兩遍的書','詹姆斯史蒂芬','投資理財',22),(55688,'這樣煮菜最健康','王寶寶','生活',14),(56743,'小王子','保羅科佐沃','藝術設計',29),(56779,'這樣繳稅最省錢','省錢大師','投資理財',13),(60966,'辛老師的私房國文課','辛耘','中文文學',18),(73996,'刀劍神域 1','川原礫','幻奇冒險',3),(74569,'大師教你如何拍電影','大衛芬奇','建築土木',19),(75860,'刀劍神域 2','川原礫','幻奇冒險',3),(78243,'刀劍神域 3','川原礫','幻奇冒險',3),(81022,'打不死的戰狼：華為的快速成長策略與狼性文化','鄧為中','管理與領導',11),(82189,'凱蒂的故宮尋寶：跟著凱蒂一起探遊故宮50大寶物','三采文化','藝術設計',16),(90809,'火影忍者 4','Massashi Kishimoto','動作冒險',2),(90816,'火影忍者 5','Massashi Kishimoto','動作冒險',2),(97555,'九星07','果味喵','幻奇冒險',12);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem` (
  `bookitem_id` int NOT NULL,
  `bookitem_reserve` int DEFAULT NULL,
  `book_ISBN` int NOT NULL,
  `book_publisher_id` varchar(45) DEFAULT NULL,
  `library_library_id` int NOT NULL,
  PRIMARY KEY (`bookitem_id`,`book_ISBN`,`library_library_id`),
  UNIQUE KEY `bookitem_id_UNIQUE` (`bookitem_id`),
  KEY `fk_bookitem_book1_idx` (`book_ISBN`),
  KEY `fk_bookitem_library1_idx` (`library_library_id`),
  CONSTRAINT `fk_bookitem_book1` FOREIGN KEY (`book_ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `fk_bookitem_library1` FOREIGN KEY (`library_library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES (3364694,0,19789,'1',1),(3364695,0,16530,'2',1),(3364696,0,16547,'2',1),(3364697,1,16554,'2',1),(3364698,1,90809,'2',1),(3364699,0,90816,'2',1),(3364700,1,73996,'3',1),(3364701,0,75860,'3',1),(3364702,0,78243,'3',1),(3364703,0,32412,'13',1),(3364704,1,81022,'11',1),(3364705,0,97555,'12',1),(3364706,0,82189,'16',1),(3364707,1,11784,'9',1),(3364708,1,36621,'8',1),(3364709,0,20521,'5',1),(3364710,0,25843,'21',2),(5564810,1,43257,'22',3),(5564811,1,35685,'23',4),(5564812,1,13444,'24',5),(5564813,0,23567,'25',5),(5564814,1,34567,'26',4),(5564815,0,24132,'27',3),(5564816,0,35790,'28',2),(5564817,1,56743,'29',1),(5564818,1,26487,'30',2),(5564819,1,74569,'19',2),(5564820,0,55688,'14',3),(5564821,0,56779,'13',4),(5564822,0,60966,'18',5),(5564823,0,12322,'17',5);
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `library_id` int NOT NULL,
  `library_name` varchar(45) DEFAULT NULL,
  `library_address` varchar(45) DEFAULT NULL,
  `library_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`library_id`),
  UNIQUE KEY `library_id_UNIQUE` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'總圖','臺北市大安區羅斯福路四段一號','233662326*623'),(2,'社科圖','臺北市大安區羅斯福路四段一號','233662326*624'),(3,'法圖','臺北市大安區羅斯福路四段一號','233662326*625'),(4,'管圖','臺北市大安區羅斯福路四段一號','233662326*625'),(5,'醫圖','台北市中正區仁愛路一段1號','23562207');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(45) DEFAULT NULL,
  `publisher_address` varchar(45) DEFAULT NULL,
  `publisher_telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `idpublisher_UNIQUE` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'天下文化','台北市中山區南京東路二段139號11樓','(02)25078627'),(2,'東立出版社有限公司','臺北市大同區承德路二段81號10樓','(02)25587277'),(3,'臺灣角川股份有限公司','臺北市松山區光復北路11巷46號5樓','(02)27472433*102'),(4,'花木蘭文化出版社','新北市中和區中安街72號13樓','(02)29231455'),(5,'碁峰資訊股份有限公司','臺北市南港區三重路66號7樓之6','(02)27882408*856'),(6,'五南圖書出版股份有限公司','臺北市大安區和平東路二段339號4樓','(02)27055066'),(7,'千華數位文化股份有限公司','新北市中和區中山路三段136巷10弄17號','(02)22289070'),(8,'全華圖書股份有限公司','新北市土城區忠義路21號','(02)22625666'),(9,'元華文創股份有限公司','臺北市中正區重慶南路2段51號4樓','(02)23511607'),(10,'上奇資訊股份有限公司','臺北市中山區南京東路2段98號8樓之1','(02)25627969'),(11,'時報文化出版企業股份有限公司','臺北市萬華區和平西路三段240號3樓','(02)23087111'),(12,'說頻文化有限公司','臺中市烏日區五光路607巷20號','(04)23366995'),(13,'台科大圖書股份有限公司','新北市新莊區中正路649號7樓','(02)29085945'),(14,'青文出版社股份有限公司','臺北市中山區長安東路一段36號3樓','(02)25681699'),(15,'九星文化出版社','臺北市中正區忠孝西路一段50號21樓之9','(02)23891185'),(16,'三采文化股份有限公司','臺北市內湖區瑞光路513巷33號8樓','(02)87971234'),(17,'遠流出版公司','臺北市中山區中山北路一段11號13樓','(02)22420117'),(18,'遠見天下文化出版股份有限公司','臺北市中山區松江路93巷1號2樓','(02)25173688'),(19,'聯經出版事業股份有限公司','臺北市信義區基隆路一段180號4樓','(02)87876242'),(20,'麥田出版','臺北市中山區民生東路二段141號5樓','(02)25007696'),(21,'新學林出版股份有限公司','臺北市大安區和平東路2段339號9樓','(02)27001808'),(22,'藍海製作有限公司','臺北市文山區興隆路二段22巷7弄2號1樓','(02)29301211'),(23,'華格那企業有限公司','臺中市西區公益路130號7樓','(02)29301211'),(24,'花園文化事業有限公司','臺北市文山區興隆路二段22巷7弄2號1樓','(04)22857299'),(25,'三民書局股份有限公司','臺北市中山區復興北路386號','(02)25006600*504'),(26,'考用出版股份有限公司','臺北市大安區和平東路二段357巷2號4樓之2','(02)27096723'),(27,'和裕出版社','臺南市安南區海佃路二段636巷5號','(06)2454023'),(28,'木馬文化事業股份有限公司','新北市新店區中正路506號4樓','(02)22181417*156'),(29,'華文網股份有限公司','新北市中和區中山路二段366巷10號10樓','(02)22487896'),(30,'臺灣愛思唯爾有限公司','臺北市中山區中山北路二段96號','(02)25225900'),(31,'威向有限公司','新北市樹林區保安街一段9號2樓之2','(02)26817935');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `bookitem_id` int NOT NULL,
  `student_id` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`bookitem_id`,`student_id`),
  KEY `fk_bookitem_has_student_student1_idx` (`student_id`),
  KEY `fk_bookitem_has_student_bookitem1_idx` (`bookitem_id`),
  CONSTRAINT `fk_bookitem_has_student_bookitem1` FOREIGN KEY (`bookitem_id`) REFERENCES `bookitem` (`bookitem_id`),
  CONSTRAINT `fk_bookitem_has_student_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (3364696,8610016,'2021-10-23'),(3364696,8707003,'2021-10-23'),(3364697,8707000,'2021-09-23'),(3364699,8707012,'2021-09-01'),(3364700,8707006,'2021-10-22'),(3364701,8707010,'2021-10-25'),(3364702,8707005,'2021-10-07'),(3364702,8707006,'2021-09-15'),(3364703,8303034,'2021-10-05'),(3364703,8707013,'2021-10-15'),(3364705,8707001,'2021-10-17'),(3364705,8707004,'2021-10-01'),(3364706,8707002,'2021-10-19'),(3364706,9902076,'2021-10-11'),(3364707,8707008,'2021-10-11'),(3364707,9902076,'2021-10-12'),(3364708,9303122,'2021-10-13'),(3364709,8707010,'2021-10-04'),(3364709,9303122,'2021-10-14'),(5564811,8707009,'2021-10-15'),(5564812,8707008,'2021-10-14'),(5564813,8707007,'2021-10-13'),(5564814,8707005,'2021-10-04'),(5564814,8707006,'2021-10-12'),(5564816,8707005,'2021-10-05'),(5564818,8707011,'2021-10-06'),(5564820,8707011,'2021-10-07'),(5564821,8707011,'2021-10-08'),(5564822,9902076,'2021-10-09'),(5564823,9902076,'2021-10-10');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `student_name` varchar(45) DEFAULT NULL,
  `student_department` varchar(45) DEFAULT NULL,
  `student_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (11356,'貝果','社工','一'),(901133,'蔡尚恩','經濟','一'),(902110,'雷神所以','法律','一'),(5301045,'田約翰','生傳','五'),(5303123,'鞏固','獸醫','四'),(6902012,'簡昀儒','醫學','四'),(7202001,'洪安妮','國企','三'),(7301023,'林銘仁','牙醫','三'),(7301024,'張老王','財金','四'),(8202014,'姜軍','政治','二'),(8303034,'黃耀霆','工管','二'),(8610016,'吳郁心','經濟','三'),(8702120,'安潔莉納裘莉','牙醫','二'),(8707000,'張三','中文','一'),(8707001,'李四','日文','三'),(8707002,'王五','外文','二'),(8707003,'趙六','電機','一'),(8707004,'孫七','資工','三'),(8707005,'周八','工海','二'),(8707006,'吳十','材料','一'),(8707007,'鄭十','物理','三'),(8707008,'楊禹琬','法律','二'),(8707009,'陳芸柏','財金','一'),(8707010,'簡裕星','國企','三'),(8707011,'陳瑋伸','會計','二'),(8707012,'黃珍茂','資管','一'),(8707013,'張柏毅','政治','三'),(8902011,'王老五','資管','三'),(9303122,'蕭阿達','經濟','二'),(9304066,'高國豪','獸醫','二'),(9902076,'莫老五','圖資','二');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25 21:42:21

-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `Item_ID` int NOT NULL,
  `Item_Name` varchar(45) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  `Restaurant_Restaurant ID` int NOT NULL,
  PRIMARY KEY (`Item_ID`,`Restaurant_Restaurant ID`),
  KEY `fk_Item_Restaurant1_idx` (`Restaurant_Restaurant ID`),
  CONSTRAINT `fk_Item_Restaurant1` FOREIGN KEY (`Restaurant_Restaurant ID`) REFERENCES `Restaurant` (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (123,'咖哩牛腩飯','188',1),(234,'黯然銷魂飯','140',2),(321,'咖哩牛腩意麵','188',16),(345,'自選鮭魚飯','129',3),(432,'蝦仁滑蛋飯','140',17),(456,'印度炒麵','230',4),(543,'自選鮭魚飯','129',18),(567,'博多綠咖哩套餐','360',5),(654,'印尼炒麵','230',19),(678,'香嫩雞肉咖哩','150',6),(765,'博多黑咖哩套餐','360',20),(789,'叉燒飯','100',7),(876,'香嫩雞肉咖哩','150',21),(987,'招牌三寶飯','100',22),(1098,'海南雞腿飯套餐','125',23),(8910,'椒麻雞腿飯套餐','125',8),(11109,'打拋雞肉飯','120',24),(91011,'打拋豬肉飯','120',9),(101112,'椒麻雞烤肉飯','165',10),(111213,'起司培根牛肉堡','230',11),(121110,'椒麻雞烤肉飯','165',25),(121314,'義式肉醬麵','110',12),(131211,'火烤培根牛肉堡','230',26),(131415,'招牌乾拌麵','90',13),(141312,'白醬鮮蝦麵','110',27),(141516,'采味雞飯','155',14),(151413,'招牌乾拌麵','90',28),(151617,'金門麵','100',15),(161514,'采味雞飯','155',29),(171615,'馬祖麵','100',15);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item_has_Order`
--

DROP TABLE IF EXISTS `Item_has_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item_has_Order` (
  `Item_Item ID` int NOT NULL,
  `Order_Order ID` int NOT NULL,
  PRIMARY KEY (`Item_Item ID`,`Order_Order ID`),
  KEY `fk_Item_has_Order_Order1_idx` (`Order_Order ID`),
  KEY `fk_Item_has_Order_Item1_idx` (`Item_Item ID`),
  CONSTRAINT `fk_Item_has_Order_Item1` FOREIGN KEY (`Item_Item ID`) REFERENCES `Item` (`Item_ID`),
  CONSTRAINT `fk_Item_has_Order_Order1` FOREIGN KEY (`Order_Order ID`) REFERENCES `Order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_has_Order`
--

LOCK TABLES `Item_has_Order` WRITE;
/*!40000 ALTER TABLE `Item_has_Order` DISABLE KEYS */;
INSERT INTO `Item_has_Order` VALUES (123,123),(234,234),(321,321),(345,345),(432,432),(456,456),(543,543),(567,567),(654,654),(678,678),(765,765),(789,789),(876,876),(987,987),(1098,1098),(8910,8910),(11109,11109),(91011,91011),(101112,101112),(111213,111213),(121110,121110),(121314,121314),(131211,131211),(131415,131415),(141312,141312),(141516,141516),(151413,151413),(151617,151617),(161514,161514),(171615,171615);
/*!40000 ALTER TABLE `Item_has_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `Order_ID` int NOT NULL,
  `Order_Item` varchar(45) DEFAULT NULL,
  `Order_Time` varchar(45) DEFAULT NULL,
  `Pick-up_Time` varchar(45) DEFAULT NULL,
  `Pick-up_Venue` varchar(45) DEFAULT NULL,
  `Payment_Amount` varchar(45) DEFAULT NULL,
  `Student_Student ID` int NOT NULL,
  PRIMARY KEY (`Order_ID`,`Student_Student ID`),
  KEY `fk_Order_Student1_idx` (`Student_Student ID`),
  CONSTRAINT `fk_Order_Student1` FOREIGN KEY (`Student_Student ID`) REFERENCES `Student` (`Student ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (123,'咖哩牛腩飯','17:30','18:00','男六','188',98361),(234,'黯然銷魂飯','19:30','19:50','女三','140',760175),(321,'咖哩牛腩意麵','12:10','12:30','男三','129',930312),(345,'自選鮭魚飯','12:10','12:30','男三','129',930312),(432,'蝦仁滑蛋飯','11:30','11:50','男一','140',983465),(456,'印度炒麵','11:55','12:10','男二','230',986366),(543,'自選鮭魚飯','18:30 ','18:50','女三','129',1029856),(567,'博多綠咖哩套餐','11:30','11:55','男三','360',1038740),(654,'印尼炒麵','11:59','12:20','男一','230',1209613),(678,'香嫩雞肉咖哩','12:10','12:30','男三','150',1398454),(765,'博多黑咖哩套餐','13:00','13:30','女六','360',1398561),(789,'叉燒飯','12:30 ','12:50','大一女','100',1489098),(876,'香嫩雞肉咖哩','15:30','15:50','男六','150',1497651),(987,'招牌三寶飯','15:10','15:30','女二','100',1827356),(1098,'海南雞腿飯套餐','12:30','12:50','男三','125',1834650),(8910,'椒麻雞腿飯套餐','17:00','17:20','女一','125',1948510),(11109,'打拋雞肉飯','12:30','12:50','女一','120',1983609),(91011,'打拋豬肉飯','12:10','12:30','男一','120',1983705),(101112,'椒麻雞烤肉飯','15:10','15:30','女四','165',1986341),(111213,'起司培根牛肉堡','11:30','11:50','男一','230',2769128),(121110,'椒麻雞烤肉飯','19:00','19:20','男一','165',3471481),(121314,'義式肉醬麵','17:00','17:20','女一舍','110',7610063),(131211,'火烤培根牛肉堡','18:00','18:20','男三','230',7691876),(131415,'招牌乾拌麵','12:10','12:30','男一','90',8757591),(141312,'白醬鮮蝦麵','12:35','12:50','男二','110',9026366),(141516,'采味雞飯','14:20','14:50','男三','155',9078714),(151413,'招牌乾拌麵','12:10','12:30','女五','90',9098491),(151617,'金門麵','19:00','19:20','男三','100',9758912),(161514,'采味雞飯','13:10','13:30','女二','155',9767584),(171615,'馬祖麵','11:00','11:30','女五','100',9875101);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `Restaurant_ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Open_time` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'泰街頭','02 2367 6997','11:30–14:30, 17:00–21:00','台北市大安區溫州街74巷6號'),(2,'茗香園冰室 - 公館店','02 2365 8033','11:30–15:00, 17:00–21:30','台北市中正區羅斯福路四段132號2F'),(3,'YU POKÉ-夏威夷生魚飯','02 2368 4282','11:30–20:30','台北市中正區羅斯福路四段24巷12弄4號'),(4,'池先生 Kopitiam (公館店)','02 2367 6989','11:30–15:30\n11:30–15:30, 17:00–20:45','100台北市中正區羅斯福路三段284巷10號'),(5,' 赤神日式豬排 公館店','02 2367 6511','11:00-22:00','台北市中正區羅斯福路3段286巷4弄14號'),(6,'稻咖哩','02 2363 7439','11:30~14:30, 17:00~21:00','台北市大安區溫州街79號'),(7,'鳳城燒臘粵菜','02 2363 3772','11:00~20:30','台北市大安區新生南路三段58號之3'),(8,'正香馬來西亞餐室','02 2738 9902','11:30~14:00, 17:30~19:30','台北市大安區辛亥路二段203號'),(9,'指有雞飯','02 2367 5253','11:30~14:00, 17:30~21:00','台北市大安區溫州街74巷5弄3號'),(10,'曼谷燒泰式簡餐便當','02 2363 0081','11:30~14:30, 17:00~21:00','台北市中正區羅斯福路三段286巷18號'),(11,'L.A.F Burger 拉芙漢堡','02 2362 1092','11:30~14:30, 17:30~21:30','台北市中正區汀州路三段293號2樓'),(12,'I\'m Pasta','02 2735 3535','11:00-15:30, 17:00-20:30 ','台北市大安區和平東路二段118巷50號'),(13,'五二麵鋪','02 2736 8137','11:30-14:00, 17:00-20:00','台北市大安區和平東路二段118巷52弄3號'),(14,'采味食光','02 2736 6256','11:45-14:00, 17:15-20:30','台北市大安區和平東路二段118巷36號'),(15,'馬祖麵館','02 2735 1862','10:30-20:45','台北市大安區和平東路二段118巷49號'),(16,'泰街頭','02 2367 6997','11:30–14:30, 17:00–21:00','台北市大安區溫州街74巷6號'),(17,'茗香園冰室 - 公館店','02 2365 8033','11:30–15:00, 17:00–21:30','台北市中正區羅斯福路四段132號2F'),(18,'YU POKÉ-夏威夷生魚飯','02 2368 4282','11:30–20:30','台北市中正區羅斯福路四段24巷12弄4號'),(19,'池先生 Kopitiam (公館店)','02 2367 6989','11:30–15:30\n11:30–15:30, 17:00–20:45','100台北市中正區羅斯福路三段284巷10號'),(20,' 赤神日式豬排 公館店','02 2367 6511','11:00-22:00','台北市中正區羅斯福路3段286巷4弄14號'),(21,'稻咖哩','02 2363 7439','11:30~14:30, 17:00~21:00','台北市大安區溫州街79號'),(22,'鳳城燒臘粵菜','02 2363 3772','11:00~20:30','台北市大安區新生南路三段58號之3'),(23,'正香馬來西亞餐室','02 2738 9902','11:30~14:00, 17:30~19:30','台北市大安區辛亥路二段203號'),(24,'指有雞飯','02 2367 5253','11:30~14:00, 17:30~21:00','台北市大安區溫州街74巷5弄3號'),(25,'曼谷燒泰式簡餐便當','02 2363 0081','11:30~14:30, 17:00~21:00','台北市中正區羅斯福路三段286巷18號'),(26,'L.A.F Burger 拉芙漢堡','02 2362 1092','11:30~14:30, 17:30~21:30','台北市中正區汀州路三段293號2樓'),(27,'I\'m Pasta','02 2735 3535','11:00-15:30, 17:00-20:30 ','台北市大安區和平東路二段118巷50號'),(28,'五二麵鋪','02 2736 8137','11:30-14:00, 17:00-20:00','台北市大安區和平東路二段118巷52弄3號'),(29,'采味食光','02 2736 6256','11:45-14:00, 17:15-20:30','台北市大安區和平東路二段118巷36號'),(30,'馬祖麵館','02 2735 1862','10:30-20:45','台北市大安區和平東路二段118巷49號');
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `Student ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Dormitory` varchar(45) DEFAULT NULL,
  `Order Time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Student ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (98361,'鄭十','0919872695','男六','17:30'),(760175,'黃珍茂','0997687412','女三','19:30'),(918641,'孫七','0918798931','男三','12:30'),(930312,'蕭阿達','0998759823','男三','12:10'),(983465,'張柏毅','0917612094','男一','11:30'),(986366,'蔡尚恩','0998769876','男二','11:55'),(1029856,'安潔莉納裘莉','0998769156','女三','18:30'),(1038740,'林揚','0912874691','男三','11:30'),(1209613,'周八','0912713847','男一','11:59'),(1398454,'李四','0912874623','男三','12:10'),(1398561,'黃美花','0912874619','女六','13:00'),(1489098,'王敏','0918346198','大一女','12:30'),(1497651,'吳九','0998769156','男六','15:30'),(1827356,'洪安妮','0998759823','女二','15:10'),(1834650,'田約翰','0987698981','男三','12:30'),(1948510,'陳芸柏','0923164782','女一','17:00'),(1983609,'陳韋如','0917698475','女一','12:30'),(1983705,'王希銘','0912874623','男一','12:10'),(1986341,'陳玉琪','0918765123','女四','15:10'),(2769128,'姜軍','0918798931','男一','11:30'),(3471481,'王小明','0923164782','男一','19:00'),(7610063,'陳小美','0918383781','女一舍','17:00'),(7691876,'黃耀庭','0912876413','男三','18:00'),(8757591,'趙六','0918346198','男一','12:10'),(9026366,'張三','0913786491','男二','12:35'),(9078714,'王老五','0972690145','男三','14:20'),(9098491,'沈虹予','0913786491','女五','12:10'),(9758912,'高國豪','0913786491','男三','19:00'),(9767584,'簡昀儒','0987513153','女二','13:10'),(9875101,'林曉萱','0912713847','女五','11:00');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25 21:54:31

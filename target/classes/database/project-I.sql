-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `Idbill` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Adress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Total_money` double DEFAULT NULL,
  PRIMARY KEY (`Idbill`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (100,'taiha','0090936723','Ha Tay','asdsad',55),(101,'taiha','1223312321','hưng yên','nguyentaihabk@gmail.com',50),(102,'Nguyễn Tài Hà','0977798156','Thường TÍn, Hà Nội','caibapsao@gmail.com',175),(103,'user1','122221211212','hưng yên','rg',46),(104,'dinhlun','0977798156','Lào','kalsncsk@GMAIL.COM',243),(105,'taiha','1223312321','hưng yên','kalsncsk@GMAIL.COM',46),(127,'yasuo','1223312321','Sai Gon','nguyentaihabk@gmail.com',82);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartId` int(11) NOT NULL AUTO_INCREMENT,
  `CartName` varchar(45) NOT NULL,
  `Price` double NOT NULL,
  `Users_UserId` int(11) NOT NULL,
  PRIMARY KEY (`CartId`,`Users_UserId`),
  KEY `fk_Cart_Users1_idx` (`Users_UserId`),
  CONSTRAINT `fk_Cart_Users1` FOREIGN KEY (`Users_UserId`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1001,'Men'),(1002,'Woman'),(1003,'Kid');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `CommentId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `CommentTime` datetime DEFAULT NULL,
  `CommentContent` varchar(200) DEFAULT NULL,
  `product_ProductId` int(11) NOT NULL,
  `Users_UserId` int(11) NOT NULL,
  PRIMARY KEY (`CommentId`,`product_ProductId`,`Users_UserId`),
  KEY `fk_Comment_product1_idx` (`product_ProductId`),
  KEY `fk_Comment_Users1_idx` (`Users_UserId`),
  CONSTRAINT `fk_Comment_Users1` FOREIGN KEY (`Users_UserId`) REFERENCES `users` (`UserId`),
  CONSTRAINT `fk_Comment_product1` FOREIGN KEY (`product_ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (10,'dat09','2019-11-28 10:10:10','Giày đẹp tuyệt đỉnh',200,1),(11,'tientroc','2019-11-29 12:12:12','Giày đẹp, giá cả phải chăng',201,2),(12,'trungqn','2019-11-30 00:00:00','Giày đẹp, tốt, độ bền chưa biết.',204,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ProductImageId` int(11) NOT NULL AUTO_INCREMENT,
  `Image` text NOT NULL,
  `product_ProductId` int(11) NOT NULL,
  PRIMARY KEY (`ProductImageId`,`product_ProductId`),
  KEY `fk_image_product1_idx` (`product_ProductId`),
  CONSTRAINT `fk_image_product1` FOREIGN KEY (`product_ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (300,'Men/add1.jpg',200),(301,'Men/add2.jpg',201),(302,'Men/add3.jpg',202),(303,'Men/add4.jpg',203),(304,'Men/add5.jpg',204),(305,'Men/add6.png',205),(306,'Men/add7.jpg',206),(307,'Men/add8.jpg',207),(308,'Men/add9.jpg',208),(309,'Woman/adn1.jpg',209),(310,'Woman/adn2.jpg',210),(311,'Woman/adn3.jpg',211),(312,'Woman/adn4.jpg',212),(313,'Woman/adn5.jpg',213),(314,'Woman/adn6.jpg',214),(315,'Woman/adn7.jpg',215),(316,'Woman/adn8.jpg',216),(317,'Woman/adn9.jpg',217),(318,'Kids/te1.jpg',218),(319,'Kids/te2.jpg',219),(320,'Kids/te3.jpg',220),(321,'Kids/te4.jpg',221),(322,'Kids/te5.jpg',222),(323,'Kids/te6.jpg',223),(324,'Kids/te7.jpg',224),(325,'Kids/te8.jpg',225),(326,'Kids/te9.jpg',226),(335,'Men/rinegan.png',237);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderName` varchar(45) DEFAULT NULL,
  `OrderDate` varchar(100) DEFAULT NULL,
  `Adress` varchar(100) DEFAULT NULL,
  `Users_UserId` int(11) NOT NULL,
  PRIMARY KEY (`OrderId`,`Users_UserId`),
  KEY `fk_Orders_Users1_idx` (`Users_UserId`),
  CONSTRAINT `fk_Orders_Users1` FOREIGN KEY (`Users_UserId`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (201,'dat09','2019-11-28','Thái Bình',1),(202,'tientroc','2019-11-29','Hà Nội',2),(203,'trungqn','2019-11-29','Thái Nguyên',3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_product`
--

DROP TABLE IF EXISTS `orders_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_product` (
  `Orders_OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `product_ProductId` int(11) NOT NULL,
  PRIMARY KEY (`Orders_OrderId`,`product_ProductId`),
  KEY `fk_Orders_has_product_product1_idx` (`product_ProductId`),
  KEY `fk_Orders_has_product_Orders1_idx` (`Orders_OrderId`),
  CONSTRAINT `fk_Orders_has_product_Orders1` FOREIGN KEY (`Orders_OrderId`) REFERENCES `orders` (`OrderId`),
  CONSTRAINT `fk_Orders_has_product_product1` FOREIGN KEY (`product_ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_product`
--

LOCK TABLES `orders_has_product` WRITE;
/*!40000 ALTER TABLE `orders_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Price` double NOT NULL,
  `Discount` double DEFAULT NULL,
  `Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_CategoryId` int(11) NOT NULL,
  `currency` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ProductId`,`category_CategoryId`),
  KEY `fk_product_category1_idx` (`category_CategoryId`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_CategoryId`) REFERENCES `category` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (200,'Adidas Pulseboost HD LTD “Grey One”',20,43,0.05,'The outside of the sole has anti-slippery grooves for your baby can perform sports activities, play ..',1001,'$',1),(201,'Adidas AlphaBounce+ “Triple Black”',10,46,0.02,'FLEXIBLE SHOES WITH CUSHION GRADE.',1001,'$',1),(202,'Adidas Nite Jogger “Light Solid Grey”',48,49,0.03,'FLEXIBLE SHOES WITH CUSHION GRADE.',1001,'$',1),(203,'Adidas Ultraboost 4.0 Split Boost “Grey”',20,42,0.1,'ENERGY COMES FROM EACH STEP These running shoes combine comfort and high performance for a great running feel like never before.',1001,'$',1),(204,'Adidas Ultraboost 4.0 U “Legend Earth”',19,41,0.05,'ENERGY COMES FROM EACH STEP These running shoes combine comfort and high performance for a great running feel like never before. Knit shoes with elasticity can change with the foot mold when you are running. Reinforced middle sole and flexible outsole provide flexible and energetic footsteps.',1001,'$',1),(205,'Adidas Ultraboost 4.0 “Rainy Season”',21,49,0.02,'These running shoes combine comfort and high performance for a great running feel like never before. Knit shoes with elasticity can change with the foot mold when you are running. Reinforced middle sole and flexible outsole provide flexible and energetic footsteps.',1001,'$',1),(206,'Adidas Advantage Base “Triple White”',22,53,0.03,'Authentic T-toe shoes stand out from the inside of the street. This youthful suede sports shoe floats on a rubber outsole ready to play. The lining of the shoe is comfortable and gently wraps around the foot.',1001,'$',1),(207,'Adidas Questar Ride “Active Orange”',20,47,0.1,'DOUBLE CHANGES FOR SPECIAL COLOR A pair of glossy shoes with a stylish, stylish feel. These women\'s shoes have a mesh body with special colors - creating a 3D gradient geometry effect. Cloudfoam dual base feels comfortable all day.',1001,'$',1),(208,'Adidas Alphaboost Parley “Core Black”',22,46,0.05,'RUNNING SHOES ARE DESIGNED TO INCREASE SPEED, STRENGTH AND FLEXIBILITY. Designed for athletes, these running shoes are ideal for strength training and speed. Double cushion and fixed heel provide extra support for the sole for increased flexibility in multi-directional motion. The fabric on the shoe body is light and breathable to make your running smooth and comfortable.',1001,'$',1),(209,'Adidas Advantage Base “All White/Navy” Nữ',18,38,0.03,'nullBEAUTIFUL SHOES FOR THE BEAUTIFUL The Stan Smith is a line of classic tennis shoes for women, first appeared in 1971 and has become a fashion icon and is visible from the tennis court to the upper office. Around the world. The leather lining, with OrthoLite® sockliner gives the shoe a premium look, the heel is held in suede for a classic look and the iconic perforated 3-striped perforated sides.',1002,'$',1),(210,'Adidas EQT Support Mid ADV “Core Black” Nữ',15,30,0.02,'EQT SHOES ARE UPGRADED TO PRIMEKNIT SHOES IN 1991, Adidas\' Equiment line marked the rise of the running culture. These shoes recreate that tradition with a bold appearance, combining the design of the 90s and modern. The unique design of the DQT line is 3-Stripes Webbing tape and molded TPU heel in true EQT style. Boost middle sole with fast response buffer. Stingray-inspired leather detailing on the sides and a nubuck heel patch bring a modern street feel.',1002,'$',1),(211,'Adidas Stansmith W “Green” Nữ',24,29,0.05,'BEAUTIFUL SHOES FOR THE BEAUTIFUL The Stan Smith is a line of classic tennis shoes for women, first appeared in 1971 and has become a fashion icon and is visible from the tennis court to the upper office. Around the world. The leather lining, with OrthoLite® sockliner gives the shoe a premium look, the heel is held in suede for a classic look and the iconic perforated 3-striped perforated sides.',1002,'$',1),(212,'Adidas UltraBoost 19 W “Core Black” Nữ',22,20,0.02,'A SHOE, MODERN RUNNING SHOES FOR ANYWHERE AND ANYTHING WAY. These running shoes combine comfort and high performance for a great running feel like never before. Primeknit shoes body is highly elastic, breathable, hugging the foot while you are running. Enhanced boost ™ outsole and flexible STRETCHWEB outsole for flexible and energetic footsteps.',1002,'$',1),(213,'Adidas Superstar “Copper Mettalic” Nữ',23,26,0.05,'A pair of sneaker with hard top, for young people. As a street and cultural symbol, Superstar adidas shoes have a story that is told over and over in new and different ways. Back like skis, these shoes offer a whole new look. They have an extended waffle texture and a characteristic uppers.',1002,'$',1),(214,'Adidas Ultraboost 4.0 Split Boost “Grey”',21,27,0.03,'These running shoes combine comfort and high performance for a great running feel like never before. Primeknit shoes body is highly elastic, breathable, hugging the foot while you are running. Enhanced boost ™ outsole and flexible STRETCHWEB outsole for flexible and energetic footsteps.',1002,'$',1),(215,'Adidas Ultraboost 4.0 J “Multicolor” Nữ',15,35,0.02,'ENERGY COMES FROM EACH STEP. These running shoes combine comfort and high performance for a great running feel like never before. Knit shoes with elasticity can change with the foot mold when you are running. Reinforced middle sole and flexible outsole provide flexible and energetic footsteps.',1002,'$',1),(216,'Adidas Falcon “Triple White” Nữ',20,40,0.1,'A modern, lightweight running shoe for any place and every space Adidas chunky adidas Falcon uses the special anti-bones found in the 1990s in its design. This season, a special model, is designed with rave style hints of the \'90s. The upper of the mesh has a faux leather and metallic finish. Equipped with a support cushion for comfort from morning to night.',1002,'$',1),(217,'Adidas Ultraboost 19 W “Triple White” Nữ',25,28,0.02,'The Ku Ku 2915 baby shoes are not only made from safe materials for the health of children, along with smart design, comfortable, handy but also very trendy.',1002,'$',1),(218,'Giày cho bé KUKU2915',23,15,0.05,'The Ku Ku 2914 baby shoes are not only made from safe materials for the health of children, along with smart design, comfortable, handy but also very fashionable.',1003,'$',1),(219,'Giày cho bé KUKU2914',21,12,0.02,'After each baby learns to walk, the mother takes off her shoes and checks whether the soles and toes of the baby are swollen or red or not to be used.',1003,'$',1),(220,'Giày tập đi cho bé KUKU 2913',24,10,0.03,'The sole of the shoe is in, the underside of the sole is designed with non-slip spikes that are safe for each step of the baby',1003,'$',1),(221,'Giày chun lười Sports cho bé (1-6T)',21,9,0.05,'Giày đẹp, bền nhẹ,thoải mái từng bước đ',1003,'$',1),(222,'Giày đế trong buộc dây (1-5T)',20,13,0.1,'The product is designed to hold the whole foot with firm shoe lacing, increasing the product\'s durability as well as keeping the shoe shape stable, creating comfortable and confident steps for the baby.',1003,'$',1),(223,'Giày thể thao bé trai Superme (1-5T)',23,15,0.02,'The sole of the shoe is porous, the underside of the sole is designed with non-slip spikes that are safe for each step of the baby',1003,'$',1),(224,'Giày thể thao bé gái Pan DG (1-5T)',20,11,0.05,'Sports style with warm, lightweight and soft inner lining suitable for babies to practice walking, carrying at home, hanging out with parents, traveling. Parents, please combine with costumes with tones to create a lovely style that is equally stylish for your baby',1003,'$',1),(225,'Giày thể thao EMIT DEN 3 (1-5T)',22,12,0.03,'The outside of the sole has anti-slippery grooves for your baby can perform sports activities, play ..',1003,'$',1),(226,'Giày chun lười in chữ Hello (1-4T)',23,16,0.05,'The sole of the shoe is porous, the underside of the sole is designed with non-slip spikes that are safe for each step of the baby',1003,'$',1),(237,'giayfake1',2,30,0.01,'dz',1001,'$',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_cart`
--

DROP TABLE IF EXISTS `product_has_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_has_cart` (
  `product_ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `Cart_CartId` int(11) NOT NULL,
  PRIMARY KEY (`product_ProductId`,`Cart_CartId`),
  KEY `fk_product_has_Cart_Cart1_idx` (`Cart_CartId`),
  KEY `fk_product_has_Cart_product1_idx` (`product_ProductId`),
  CONSTRAINT `fk_product_has_Cart_Cart1` FOREIGN KEY (`Cart_CartId`) REFERENCES `cart` (`CartId`),
  CONSTRAINT `fk_product_has_Cart_product1` FOREIGN KEY (`product_ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_cart`
--

LOCK TABLES `product_has_cart` WRITE;
/*!40000 ALTER TABLE `product_has_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_has_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) DEFAULT NULL,
  `Users_UserId` int(11) NOT NULL,
  PRIMARY KEY (`RoleId`,`Users_UserId`),
  KEY `fk_Role_Users1_idx` (`Users_UserId`),
  CONSTRAINT `fk_Role_Users1` FOREIGN KEY (`Users_UserId`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=9998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (9991,'user',1),(9992,'user',2),(9993,'user',3);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) NOT NULL,
  `Adress` varchar(100) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `Avatar` tinytext,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'taiha','nguyentaihabk@gmail.com','0906213612','Hà Tây','1999-11-11','dd','taiha'),(2,'user','bk@gmail','11111111111111','fsdff','1999-09-01','1','11111'),(3,'project','project@','11111111111','11111111','1999-09-00','33','11111'),(4,'tung3d','tung3d@gmail.com','0965321478','Hà Nội','2000-02-02','aaad','tung3d'),(5,'haden','haden@gmail.com','0963254178','Hà Nội','1999-03-03','aaba','haden'),(6,'dinhlun99hy','dinh@gmail.com','1223312321','hưng yên','1999-11-11',NULL,'11111'),(8,'isaac','issac@gmail.com','099999999','Sai Gon','1999-11-11',NULL,'11111'),(18,'yasuo','nguyentaihabk@gmail.com','1223312321','Sai Gon','15/09/99',NULL,'11111');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-25  2:54:43

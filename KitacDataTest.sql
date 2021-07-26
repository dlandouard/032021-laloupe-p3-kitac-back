-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: Kitac
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `API_products`
--

DROP TABLE IF EXISTS `API_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `API_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `API_Product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_API_Products_products` (`product_id`),
  CONSTRAINT `fk_API_Products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `API_products`
--

LOCK TABLES `API_products` WRITE;
/*!40000 ALTER TABLE `API_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `API_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buys`
--

DROP TABLE IF EXISTS `buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  `supplies_id` int DEFAULT NULL,
  `buying_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_buys_products` (`product_id`),
  KEY `fk_buys_users` (`user_id`),
  CONSTRAINT `fk_buys_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_buys_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buys`
--

LOCK TABLES `buys` WRITE;
/*!40000 ALTER TABLE `buys` DISABLE KEYS */;
/*!40000 ALTER TABLE `buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img_link` varchar(255) DEFAULT NULL,
  `img_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Homme','https://cdn.pixabay.com/photo/2017/08/02/10/03/people-2570596_960_720.jpg','img_homme'),(2,'Femme','https://cdn.pixabay.com/photo/2016/11/21/11/29/close-up-1844786_960_720.jpg','img_femme'),(3,'Enfant','https://cdn.pixabay.com/photo/2014/12/14/16/05/teddy-bear-567952_960_720.jpg','img_enfant'),(4,'Accessoire','https://cdn.pixabay.com/photo/2017/07/04/18/28/cloth-bag-2472107_960_720.jpg','img_accessoire'),(5,'Deco','https://cdn.pixabay.com/photo/2017/01/14/12/48/hotel-1979406_960_720.jpg','img_deco');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_product_products` (`product_id`),
  KEY `fk_category_product_category` (`category_id`),
  CONSTRAINT `fk_category_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_category_product_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (1,3,2),(2,3,3),(3,4,1),(4,4,3),(5,5,2),(6,6,5),(7,7,4);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characterises`
--

DROP TABLE IF EXISTS `characterises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characterises` (
  `product_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_characterises_products` (`product_id`),
  KEY `fk_characterises_size` (`size_id`),
  KEY `fk_characterises_gender` (`gender_id`),
  CONSTRAINT `fk_characterises_gender` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_characterises_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_characterises_size` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characterises`
--

LOCK TABLES `characterises` WRITE;
/*!40000 ALTER TABLE `characterises` DISABLE KEYS */;
INSERT INTO `characterises` VALUES (3,1,2,1),(3,2,2,2),(3,3,2,3),(3,4,2,4),(3,5,2,5),(3,6,2,6),(3,7,2,7),(3,8,2,9),(3,1,3,10),(3,2,3,11),(3,3,3,12),(3,4,3,13),(3,5,3,14),(3,6,3,15),(3,7,3,16),(3,8,3,17),(4,1,1,18),(4,2,1,19),(4,3,1,20),(4,4,1,21),(4,5,1,22),(4,6,1,23),(4,7,1,24),(4,8,1,25),(5,1,2,26),(5,2,2,27),(5,3,2,28),(5,4,2,29),(5,5,2,30),(5,6,2,31),(5,7,2,32),(5,8,2,33);
/*!40000 ALTER TABLE `characterises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Homme'),(2,'Femme'),(3,'Enfants');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mades_of`
--

DROP TABLE IF EXISTS `mades_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mades_of` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `materials_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mades_of_products` (`product_id`),
  KEY `fk_mades_of_materials` (`materials_id`),
  CONSTRAINT `fk_mades_of_materials` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`),
  CONSTRAINT `fk_mades_of_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mades_of`
--

LOCK TABLES `mades_of` WRITE;
/*!40000 ALTER TABLE `mades_of` DISABLE KEYS */;
INSERT INTO `mades_of` VALUES (1,3,1),(2,3,2),(3,4,1),(4,4,2),(5,4,3),(6,5,2),(7,5,4),(8,6,2),(9,7,2),(10,7,3),(11,7,4);
/*!40000 ALTER TABLE `mades_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material_type` varchar(100) NOT NULL,
  `material_price` float(5,2) NOT NULL,
  `quantity` int NOT NULL,
  `API_Mat_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'Lin',5.40,1000,NULL,'https://www.publicdomainpictures.net/pictures/400000/velka/leinen-textil-hintergrund-textur.jpg'),(2,'Coton',1.23,2000,NULL,'https://www.publicdomainpictures.net/pictures/30000/velka/white-fabric-texture.jpg'),(3,'Flanelle',8.40,500,NULL,'https://www.mondialtissus.fr/media/catalog/product/cache/5a7b68a13efa2fc32f1f88cc4632d82f/2/e/2e435d8b83ec66ede81b7a7603d50ec3873c3256_153935.jpg'),(4,'Soie',10.80,200,NULL,'https://www.publicdomainpictures.net/pictures/250000/velka/silk-background-orange-fabric.jpg');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `difficulty` varchar(100) DEFAULT NULL,
  `completion_time` varchar(100) DEFAULT NULL,
  `product_price` float(6,2) DEFAULT NULL,
  `pieces` varchar(100) NOT NULL,
  `supplies_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_supplies` (`supplies_id`),
  CONSTRAINT `fk_products_supplies` FOREIGN KEY (`supplies_id`) REFERENCES `supplies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Pantalon','Un magnifique pantalon à fleur','Moyenne','24h',45.00,'avant, après, poches',1),(4,'Chemise','Le must have de cet été','Difficile','72h',60.00,'avant, arrière, col, manches',2),(5,'Robe','LA robe pour se la péter en soirée','Moyenne','18h',120.00,'avant, arrière',NULL),(6,'Rideau','Pour vous cacher du regard de vos voisins avec élégance','Facile','6h',30.00,'principal, doublure',3),(7,'Drap','Pour passer de belles nuits','Facile','6h',20.00,'principal',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_images`
--

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;
INSERT INTO `products_images` VALUES (1,'https://www.dolcegabbana.com/dw/image/v2/AAGA_PRD/on/demandware.static/-/Sites-15/default/dwfe7b1b65/images/zoom/I3C02WHPAAQ_HR2ZI_0.jpg?sw=742&sh=944&sm=fit','Un pantalon pas beaux a fleur'),(2,'https://img01.ztat.net/article/spp-media-p1/9753872023d63b2b8bc9c9f7b89e7246/e79ee0b39bc34506922100f52cd1b13e.jpg?imwidth=762&filter=packshot','Une chemise incroyable'),(3,'https://witt.eu/product/resized/040/040.00ZUK92341-A01.069_7_bg.jpg','Une Robe tendance'),(4,'https://www.univers-decor.com/8087-thickbox_default/lot-de-2-rideaux-occultant-taupe-clair-140-x-260-cm.jpg','Des dideaux detailler'),(5,'http://www.lesdoucesnuitsdemae.com/media/catalog/product/cache/1/image/500x500/9df78eab33525d08d6e5fb8d27136e95/h/o/housse-couette-belle-nuit-1643470.jpg','Des drap funky'),(6,'https://live.staticflickr.com/4036/4682415035_c113db13c3_4k.jpg','Robe1(Hood?)'),(7,'https://live.staticflickr.com/1302/4682415031_344e0c8bf7_4k.jpg','Robe2(soirée?)'),(8,'https://live.staticflickr.com/4047/4682415045_0df9ac183a_4k.jpg','Robe3(étoiles?)');
/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `represents`
--

DROP TABLE IF EXISTS `represents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `represents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `product_images_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_represents_products` (`product_id`),
  KEY `fk_represents_products_images` (`product_images_id`),
  CONSTRAINT `fk_represents_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_represents_products_images` FOREIGN KEY (`product_images_id`) REFERENCES `products_images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `represents`
--

LOCK TABLES `represents` WRITE;
/*!40000 ALTER TABLE `represents` DISABLE KEYS */;
INSERT INTO `represents` VALUES (1,3,1),(2,4,2),(4,6,4),(5,7,5),(6,5,6),(7,5,7),(8,5,8);
/*!40000 ALTER TABLE `represents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size_number` int DEFAULT NULL,
  `size_letter` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,34,'s'),(2,38,'M'),(3,42,'L'),(4,46,'XL'),(5,50,'2XL'),(6,54,'3XL'),(7,58,'4XL'),(8,62,'5XL');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Kit fermeture','Fermeture éclair',10.00),(2,'Kit boutons','boutons',12.00),(3,'Kit rideaux','cerceaux',5.00);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (2,'admin'),(3,'customer'),(4,'seamstress');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `user_types_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_type` (`user_types_id`),
  CONSTRAINT `fk_user_type` FOREIGN KEY (`user_types_id`) REFERENCES `user_types` (`id`),
  CONSTRAINT `fk_users_user_types` FOREIGN KEY (`user_types_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'damien','dland@email.com','2 rue du test','12345678Pass',NULL,NULL),(3,'damien','dland@email.com','2 rue du test','12345678Pass',NULL,NULL),(4,'TestHash','test@hash.com','2 rue du SHA','$argon2i$v=19$m=4096,t=3,p=1$VI6smBJqK0TBlJE2MykkqQ$KzkYzLAkTFzJP+ilUc0yhCR3riLAea836QADwniyONQ',NULL,NULL),(5,'jwt','jwt@email.com','2 rue du JWT','$argon2i$v=19$m=4096,t=3,p=1$qt0fc92Y8NtWZXoxTxPHSg$ipg436BjYSUI133fDJZmINZDqHw+2p0d2SkLXxspIf0',NULL,2);
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

-- Dump completed on 2021-07-09 11:49:09

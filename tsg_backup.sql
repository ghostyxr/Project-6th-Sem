-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tsg
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (2,'Galav','galav02@gmail.com','Delivery','Late','2025-05-21 02:26:25',0);
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (22,15,7,1,100.00,'2025-07-24 12:36:52','2025-07-24 12:36:52'),(23,16,7,1,100.00,'2025-07-24 12:42:14','2025-07-24 12:42:14'),(24,17,7,1,100.00,'2025-07-24 12:44:57','2025-07-24 12:44:57'),(25,18,7,1,100.00,'2025-07-24 12:49:12','2025-07-24 12:49:12'),(26,19,7,1,100.00,'2025-07-24 12:49:13','2025-07-24 12:49:13'),(31,24,7,1,100.00,'2025-07-24 12:49:14','2025-07-24 12:49:14'),(32,25,7,1,100.00,'2025-07-24 12:57:05','2025-07-24 12:57:05'),(33,26,7,1,100.00,'2025-07-24 13:11:40','2025-07-24 13:11:40'),(34,27,11,1,100.00,'2025-07-24 13:14:56','2025-07-24 13:14:56'),(35,28,9,1,3000.00,'2025-07-25 07:58:06','2025-07-25 07:58:06'),(36,29,9,1,3000.00,'2025-07-25 08:07:42','2025-07-25 08:07:42'),(37,30,9,1,3000.00,'2025-07-25 08:08:33','2025-07-25 08:08:33'),(38,31,9,1,3000.00,'2025-07-25 08:09:24','2025-07-25 08:09:24'),(39,32,3,1,15500.00,'2025-07-25 08:14:58','2025-07-25 08:14:58'),(40,33,7,1,100.00,'2025-07-25 09:14:21','2025-07-25 09:14:21');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_order_total_after_item_change
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (
        SELECT SUM(quantity * price) 
        FROM order_items 
        WHERE order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_order_total_after_item_update
AFTER UPDATE ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (
        SELECT SUM(quantity * price) 
        FROM order_items 
        WHERE order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_order_total_after_item_delete
AFTER DELETE ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (
        SELECT COALESCE(SUM(quantity * price), 0) 
        FROM order_items 
        WHERE order_id = OLD.order_id
    )
    WHERE id = OLD.order_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `status` enum('pending','completed','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (15,5,100.00,'TXN_1753360612_5','pending',NULL,'2025-07-24 12:36:52','2025-07-24 12:36:52'),(16,5,100.00,'TXN_1753360934_5','completed',NULL,'2025-07-24 12:42:14','2025-07-24 12:42:14'),(17,5,100.00,'TXN_1753361097_5','pending',NULL,'2025-07-24 12:44:57','2025-07-24 12:44:57'),(18,5,100.00,'TXN_1753361352_5','pending',NULL,'2025-07-24 12:49:12','2025-07-24 12:49:12'),(19,5,100.00,'TXN_1753361353_5','pending',NULL,'2025-07-24 12:49:13','2025-07-24 12:49:13'),(24,5,100.00,'TXN_1753361354_5','pending',NULL,'2025-07-24 12:49:14','2025-07-24 12:49:14'),(25,5,100.00,'TXN_1753361825_5','completed',NULL,'2025-07-24 12:57:05','2025-07-24 12:57:05'),(26,8,100.00,'TXN_1753362700_8','completed',NULL,'2025-07-24 13:11:40','2025-07-24 13:11:40'),(27,8,100.00,'TXN_1753362896_8','completed',NULL,'2025-07-24 13:14:56','2025-07-24 13:14:56'),(28,8,3000.00,'TXN_1753430286_8','completed',NULL,'2025-07-25 07:58:06','2025-07-25 07:58:06'),(29,8,3000.00,'TXN_1753430862_8','completed',NULL,'2025-07-25 08:07:42','2025-07-25 08:07:42'),(30,8,3000.00,'TXN_1753430913_8','completed',NULL,'2025-07-25 08:08:33','2025-07-25 08:08:33'),(31,8,3000.00,'TXN_1753430964_8','completed',NULL,'2025-07-25 08:09:24','2025-07-25 08:09:24'),(32,8,15500.00,'TXN_1753431298_8','completed',NULL,'2025-07-25 08:14:58','2025-07-25 08:14:58'),(33,8,100.00,'TXN_1753434861_8','completed',NULL,'2025-07-25 09:14:21','2025-07-25 09:14:21');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Guitars','Acoustic and electric guitars','2025-05-13 00:09:44'),(2,'Bass Guitars','Electric and acoustic bass guitars','2025-05-13 00:09:44'),(3,'Drums','Drum sets and percussion instruments','2025-05-13 00:09:44'),(4,'Keyboards','Pianos and synthesizers','2025-05-13 00:09:44'),(5,'Amplifiers','Guitar and bass amplifiers','2025-05-13 00:09:44'),(6,'Accessories','Musical instrument accessories','2025-05-13 00:09:44');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Mantra Karma 3 Band Equalizer with Tuner (Black)','Guitars',12000.00,'The affordable Mantra Karma guitar, which was especially designed in Nepal and has a timeless and classic appearance, is a straightforward guitar type that takes its inspiration from the karma principle. Now available with 3 band equalizer and tuner.','uploads/products/682cc61bd20b0.jpg','2025-05-20 18:12:43','2025-05-20 18:12:43'),(3,'Dream Maker Semi Acoustic Guitar DM-606 CS','Guitars',15500.00,'The hollow body design of the Dream Maker DM-606 CS semi-acoustic guitar captures a warm, organic tone. Its comfortable wood neck with a fingerboard allows for precision playing, and its onboard controls allow for tone modifications. It also features pickups for amplification.','uploads/products/682cc6f979545.png','2025-05-20 18:16:25','2025-05-20 18:16:25'),(4,'Enya EMX1E HPL 36 inch semi acoustic Guitar','Guitars',24000.00,'Enya EMX1E HPL 36 inch Travel semi-acoustic guitar is a great choice for musicians who need a high-quality, portable instrument that can deliver great sound and withstand the demands of travel.','uploads/products/682cc7ad55e2d.jpeg','2025-05-20 18:19:25','2025-05-20 18:19:25'),(5,'Epiphone Les Paul Custom Widow Guitar Center-Exclusive Electric Guitar Indigo Burst','Guitars',79000.00,'This Epiphone Les Paul Custom Widow limited-edition electric guitar is a bold reinterpretation of a classic design, offering premium craftsmanship and striking aesthetics. Part of Epiphone\'s Inspired by Gibson Collection, this guitar features a mahogany body with a flame maple top, delivering rich sustain and articulate brightness. The ebony fingerboard with pearloid block inlays adds visual elegance while ensuring smooth playability.','uploads/products/682cc83243cb1.jpeg','2025-05-20 18:21:38','2025-05-20 18:28:16'),(6,'Yamaha P-145B Portable Digital Piano','Keyboards',109000.00,'The entry-level model of the P Series. Perfect for beginners with a serious interest in playing the piano! Yamaha’s P Series digital pianos are loved by piano players around the world who want the comfortable feel of an acoustic piano in an instrument with a more manageable size and weight.','uploads/products/682cc99e894a2.jpeg','2025-05-20 18:27:42','2025-05-20 20:25:05'),(7,'Alice Acoustic Guitar String A206 - 1ST STRING','Accessories',100.00,'Phosphor bronze-colored copper alloy makes up the strings of the Alice A206 acoustic guitar. Anti-rust treatment extends the life of the strings considerably before oxidation occurs. These strings have an affordable price tag but offer a clean, long-lasting tone.','uploads/products/682cd42b579cf.jpeg','2025-05-20 19:12:43','2025-05-21 13:10:07'),(8,'Tama Drum Rhythm Mate Series','Drums',6000.00,'Elevate your drumming experience with our latest Tama special drum set, now available in striking red and black,Blue . Crafted with precision and attention to detail, this set is designed to deliver exceptional sound quality and performance.\r\n\r\n🔥 Kit Includes:\r\n\r\n22″ x 16″ Bass Drum\r\n10″ x 07″ Tom Tom\r\n12″ x 08″ Tom Tom\r\n16″ x 15″ Floor Tom\r\n14″ x 05″ Snare Drum','uploads/products/682cda9f30ba0.jpeg','2025-05-20 19:40:15','2025-05-21 04:15:58'),(9,'Bamboo Flute 19 Inches C Scale Professional','Flute',3000.00,'Key Note Or Scale: C\r\n Good Frequency And Complex Tone ,Warm,Sweet And Seamless\r\nExcellent For Classical Music,Orchestral Playing,Studio Recording And Other Musical Effects\r\nSuitable For Beginners As Well As Professionals ,Made From High Quality Material,Designed For High Level Performance \r\nImportant Note\r\nThe product is made of bamboo, which is a natural resource, so the colour and dimension of the product may vary slightly from what is shown in the image','uploads/products/682cdf525f5f1.jpeg','2025-05-20 20:00:10','2025-05-20 20:00:18'),(10,'Western concert flute-Silver Plated Flute','Flute',20000.00,'Western Concert Flute Silver Plated 16 Holes Woodwind Instrument with Cleaning Cloth Stick Gloves\r\nLevel: Standard\r\nLightweight and durable\r\nBody Style: Type-2\r\nKey Material: Steel','uploads/products/682cdfbbb0af6.jpg','2025-05-20 20:02:03','2025-05-20 20:02:03'),(11,'Strings and Beyond Super Celluloid Picks - 12 Pack Thin','Accessories',100.00,'Our Strings and Beyond picks are made from the highest quality classic celluloid. They have been hailed as our finest picks by many customers. Enjoy!\r\n\r\nPack of 3 picks: 1 x Black Thin, 1 x White Medium, 1 x Red Heavy\r\n\r\nPack of 12 picks availble in Black Thin, White Medium and Red Heavy','uploads/products/6882319a761a0.jpg','2025-07-24 13:14:02','2025-07-24 13:14:02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `idx_username` (`username`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Galawa Vikrem Aatreya','Gonbe','galav02@gmail.com','$argon2id$v=19$m=65536,t=4,p=3$UllGVENISk1jajExMW5wUA$Qf9U+n0hM1hQyjt3AhfiLjeeWOOezoenwKRE88UAXuM',0,'2025-05-22 12:27:01','2025-05-22 12:35:51','Gaidakot-2','9823451678'),(6,'Eren Yeager','Eren123','Eren123@gmail.com','$argon2id$v=19$m=65536,t=4,p=3$WVBvcFpNbmYzN1I4V3BtdQ$oVKj0ctPwB6iN7DH+fnM3I8Q2Htr4dxseMY4Yd/2EUs',1,'2025-05-22 12:33:41','2025-07-22 12:51:44','Shiganshina','9800000562'),(7,'Sambhav Shrestha','Admin','sambhavstha31@gmail.com','12345',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Bharatpur','9865005895'),(8,'Luna Shrestha','Luna22','Luna123@gmail.com','$argon2id$v=19$m=65536,t=4,p=3$eVBCaGtDYmF0cnRBSlNYZQ$mP8Q6GXOWdjkfEUUud3O7FfMkNdXldNcrGRjjTLGovo',0,'2025-07-24 13:10:02','2025-07-24 13:10:02','Monroe 22 ST','9855089567');
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

-- Dump completed on 2025-08-04 15:33:39

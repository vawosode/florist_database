CREATE DATABASE  IF NOT EXISTS `florist` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `florist`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: florist
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Temporary view structure for view `comprehensive_order_details`
--

DROP TABLE IF EXISTS `comprehensive_order_details`;
/*!50001 DROP VIEW IF EXISTS `comprehensive_order_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comprehensive_order_details` AS SELECT 
 1 AS `Customer_ID`,
 1 AS `Customer_name`,
 1 AS `Customer_phone`,
 1 AS `Customer_email`,
 1 AS `building_number`,
 1 AS `street`,
 1 AS `city`,
 1 AS `post_code`,
 1 AS `country`,
 1 AS `Order_Detail_ID`,
 1 AS `Customer_Payment_method_id`,
 1 AS `Order_Status_code`,
 1 AS `Date_order_placed`,
 1 AS `Date_order_paid`,
 1 AS `Product_code`,
 1 AS `Product_name`,
 1 AS `Supplier_id`,
 1 AS `Product_price`,
 1 AS `Shipping_Method`,
 1 AS `Shipping_Cost`,
 1 AS `Shipping_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `address_id` int NOT NULL,
  `building_number` varchar(55) NOT NULL,
  `street` varchar(55) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `post_code` varchar(55) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `florist_customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,'34','Colliers Wood Road','London','SW19 2HR','United Kingdom',245),(2,'10','Maple Street','Bristol','BS1 6FB','United Kingdom',246),(3,'78','Cedar Avenue','Manchester','M1 2AQ','United Kingdom',247),(4,'55','Oak Lane','Birmingham','B1 1TB','United Kingdom',248),(5,'22','Pine Road','Liverpool','L1 4DN','United Kingdom',249),(6,'67','Birch Way','Leeds','LS1 4BJ','United Kingdom',250),(7,'101','Elm Street','Glasgow','G1 2ER','United Kingdom',251);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_customer`
--

DROP TABLE IF EXISTS `florist_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_customer` (
  `Customer_ID` int NOT NULL,
  `Customer_name` varchar(255) DEFAULT NULL,
  `Customer_phone` varchar(20) DEFAULT NULL,
  `Customer_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_customer`
--

LOCK TABLES `florist_customer` WRITE;
/*!40000 ALTER TABLE `florist_customer` DISABLE KEYS */;
INSERT INTO `florist_customer` VALUES (245,'Chloe Brave','0790472649','chloebrave@mail.com'),(246,'Susan Ofori','0753712749','cs.ofori@mail.com'),(247,'Matthew Crew','0794782702','crew.m@mail.com'),(248,'Tammy Scott','0781682702','tamscott@mail.com'),(249,'Tendai Lewis','0790382103','Tendai.lewis@mail.com'),(250,'Ronald Jones','0750742782','ronjones1@mail.com'),(251,'John Ruiz','0797592900','jru@mail.com');
/*!40000 ALTER TABLE `florist_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_event`
--

DROP TABLE IF EXISTS `florist_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_event` (
  `Event_ID` int NOT NULL AUTO_INCREMENT,
  `Event_type` varchar(60) DEFAULT NULL,
  `Customer_id` int DEFAULT NULL,
  `Product_code` int DEFAULT NULL,
  PRIMARY KEY (`Event_ID`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Product_code` (`Product_code`),
  CONSTRAINT `florist_event_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `florist_customer` (`Customer_ID`),
  CONSTRAINT `florist_event_ibfk_2` FOREIGN KEY (`Product_code`) REFERENCES `florist_product` (`Product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_event`
--

LOCK TABLES `florist_event` WRITE;
/*!40000 ALTER TABLE `florist_event` DISABLE KEYS */;
INSERT INTO `florist_event` VALUES (1,'Birthday',247,7),(2,'Wedding',245,1),(3,'Anniversary',249,5),(4,'Housewarming',250,3),(5,'Graduation',246,4),(6,'Baby Shower',251,6);
/*!40000 ALTER TABLE `florist_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_order_details`
--

DROP TABLE IF EXISTS `florist_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_order_details` (
  `Order_Detail_ID` int NOT NULL,
  `Customer_id` int DEFAULT NULL,
  `Customer_Payment_method_id` varchar(60) DEFAULT NULL,
  `Order_Status_code` varchar(60) DEFAULT NULL,
  `Date_order_placed` datetime DEFAULT NULL,
  `Date_order_paid` datetime DEFAULT NULL,
  PRIMARY KEY (`Order_Detail_ID`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `florist_order_details_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `florist_customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_order_details`
--

LOCK TABLES `florist_order_details` WRITE;
/*!40000 ALTER TABLE `florist_order_details` DISABLE KEYS */;
INSERT INTO `florist_order_details` VALUES (1,245,'Credit Card','Completed','2024-01-10 10:00:00','2024-01-10 12:00:00'),(2,246,'Debit Card','Cancelled','2024-01-12 09:30:00',NULL),(3,247,'PayPal','Completed','2024-01-13 14:20:00','2024-01-14 10:15:00'),(4,248,'Credit Card','Cancelled','2024-01-15 11:00:00',NULL),(5,249,'Cash','Completed','2024-01-16 16:45:00','2024-01-17 09:00:00'),(6,250,'Credit Card','Cancelled','2024-01-18 10:00:00',NULL),(7,251,'Debit Card','Completed','2024-01-19 13:30:00','2024-01-20 11:00:00'),(12345,245,'Credit Card','Cancelled','2024-02-10 12:00:00',NULL);
/*!40000 ALTER TABLE `florist_order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteCancelledOrders` BEFORE DELETE ON `florist_order_details` FOR EACH ROW BEGIN

IF OLD.Order_Status_code = 'Cancelled' THEN

IF (SELECT COUNT(*) FROM Florist_Shipping WHERE Order_Detail_ID = OLD.Order_Detail_ID) = 0 THEN


DELETE FROM Florist_Shipping WHERE Order_Detail_ID = OLD.Order_Detail_ID;
DELETE FROM Florist_Event WHERE Order_Detail_ID = OLD.Order_Detail_ID;


DELETE FROM Florist_Order_Details WHERE Order_Detail_ID = OLD.Order_Detail_ID;

ELSE

SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete shipped order.';
END IF;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `florist_product`
--

DROP TABLE IF EXISTS `florist_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_product` (
  `Product_code` int NOT NULL,
  `Product_name` varchar(60) DEFAULT NULL,
  `Supplier_id` varchar(60) DEFAULT NULL,
  `Product_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_product`
--

LOCK TABLES `florist_product` WRITE;
/*!40000 ALTER TABLE `florist_product` DISABLE KEYS */;
INSERT INTO `florist_product` VALUES (1,'Roses','A7145',24.99),(2,'Fidel','L5645',25.00),(3,'Swiss Cheese Plant','L5645',15.00),(4,'Peace Lily','L5645',15.00),(5,'Succulent Plant','L5645',15.00),(6,'Azalea','A7145',18.00),(7,'Lily','A7145',10.00),(8,'Tulip','A7145',10.00),(9,'Snake Plant','L5645',12.00),(10,'Bird of Paradise Plant','L5645',35.00);
/*!40000 ALTER TABLE `florist_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_reviews`
--

DROP TABLE IF EXISTS `florist_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_reviews` (
  `Review_id` varchar(60) NOT NULL,
  `Customer_id` int DEFAULT NULL,
  `Product_code` int DEFAULT NULL,
  `Comment` text,
  `Rating` float DEFAULT NULL,
  `Review_on` datetime DEFAULT NULL,
  PRIMARY KEY (`Review_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Product_code` (`Product_code`),
  CONSTRAINT `florist_reviews_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `florist_customer` (`Customer_ID`),
  CONSTRAINT `florist_reviews_ibfk_2` FOREIGN KEY (`Product_code`) REFERENCES `florist_product` (`Product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_reviews`
--

LOCK TABLES `florist_reviews` WRITE;
/*!40000 ALTER TABLE `florist_reviews` DISABLE KEYS */;
INSERT INTO `florist_reviews` VALUES ('Brave',245,1,'Beautiful roses, very fresh!',5,'2024-02-05 10:00:00'),('Chloe',251,7,'The lilies were perfect!',5,'2024-01-20 14:21:00'),('Crew',247,7,'Easy transaction, fast delivery.',4,'2024-02-03 15:30:45'),('Lewis',249,5,'Succulent Plant is thriving, great buy.',4.5,'2024-02-08 16:20:00');
/*!40000 ALTER TABLE `florist_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_shipping`
--

DROP TABLE IF EXISTS `florist_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_shipping` (
  `Shipping_ID` int NOT NULL,
  `Order_Detail_ID` int DEFAULT NULL,
  `Shipping_Method` varchar(60) DEFAULT NULL,
  `Shipping_Cost` decimal(10,2) DEFAULT NULL,
  `Shipping_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Shipping_ID`),
  KEY `Order_Detail_ID` (`Order_Detail_ID`),
  CONSTRAINT `florist_shipping_ibfk_1` FOREIGN KEY (`Order_Detail_ID`) REFERENCES `florist_order_details` (`Order_Detail_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_shipping`
--

LOCK TABLES `florist_shipping` WRITE;
/*!40000 ALTER TABLE `florist_shipping` DISABLE KEYS */;
INSERT INTO `florist_shipping` VALUES (1,1,'Standard',5.99,'2024-01-11 09:00:00'),(2,2,'Express',7.99,'2024-01-13 08:00:00'),(3,3,'Standard',5.99,'2024-01-14 10:00:00'),(4,5,'Express',7.99,'2024-01-17 11:00:00'),(5,7,'Standard',5.99,'2024-01-20 14:00:00');
/*!40000 ALTER TABLE `florist_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_suppliers`
--

DROP TABLE IF EXISTS `florist_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_suppliers` (
  `Supplier_id` varchar(60) NOT NULL,
  `Supplier_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_suppliers`
--

LOCK TABLES `florist_suppliers` WRITE;
/*!40000 ALTER TABLE `florist_suppliers` DISABLE KEYS */;
INSERT INTO `florist_suppliers` VALUES ('A7145','A Warehouse'),('L5645','L Warehouse');
/*!40000 ALTER TABLE `florist_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_reviews_and_events`
--

DROP TABLE IF EXISTS `product_reviews_and_events`;
/*!50001 DROP VIEW IF EXISTS `product_reviews_and_events`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_reviews_and_events` AS SELECT 
 1 AS `Product_code`,
 1 AS `Product_name`,
 1 AS `Product_price`,
 1 AS `Event_type`,
 1 AS `Customer_name`,
 1 AS `Customer_email`,
 1 AS `Review_Comment`,
 1 AS `Review_Rating`,
 1 AS `Review_on`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'florist'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `AutoCancelUnpaidOrders` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `AutoCancelUnpaidOrders` ON SCHEDULE EVERY 1 DAY STARTS '2024-02-05 19:32:55' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE Florist_Order_Details
    SET Order_Status_code = 'Cancelled'
    WHERE Date_order_placed <= CURRENT_TIMESTAMP - INTERVAL 7 DAY
    AND Date_order_paid IS NULL */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'florist'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateTotalOrderCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateTotalOrderCost`(orderDetailID INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE totalCost DECIMAL(10,2);
    DECLARE productPrice DECIMAL(10,2);
    DECLARE shippingCost DECIMAL(10,2);

    SELECT Florist_Product.Product_price INTO productPrice
    FROM Florist_Product
    JOIN Florist_Event ON Florist_Product.Product_code = Florist_Event.Product_code
    JOIN Florist_Order_Details ON Florist_Event.Customer_id = Florist_Order_Details.Customer_id
    WHERE Florist_Order_Details.Order_Detail_ID = orderDetailID;

    SELECT Shipping_Cost INTO shippingCost
    FROM Florist_Shipping
    WHERE Order_Detail_ID = orderDetailID;

    SET totalCost = productPrice + shippingCost;
    
    RETURN totalCost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerOrderHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerOrderHistory`(IN custID INT)
BEGIN
    SELECT 
        Florist_Order_Details.Order_Detail_ID,
        Florist_Order_Details.Customer_Payment_method_id,
        Florist_Order_Details.Order_Status_code,
        Florist_Order_Details.Date_order_placed,
        Florist_Order_Details.Date_order_paid,
        Florist_Product.Product_code,
        Florist_Product.Product_name,
        Florist_Shipping.Shipping_Method,
        Florist_Shipping.Shipping_Cost,
        Florist_Shipping.Shipping_Date
    FROM Florist_Order_Details
    JOIN Florist_Event ON Florist_Order_Details.Customer_id = Florist_Event.Customer_id
    JOIN Florist_Product ON Florist_Event.Product_code = Florist_Product.Product_code
    JOIN Florist_Shipping ON Florist_Order_Details.Order_Detail_ID = Florist_Shipping.Order_Detail_ID
    WHERE Florist_Order_Details.Customer_id = custID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `comprehensive_order_details`
--

/*!50001 DROP VIEW IF EXISTS `comprehensive_order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comprehensive_order_details` AS select `florist_customer`.`Customer_ID` AS `Customer_ID`,`florist_customer`.`Customer_name` AS `Customer_name`,`florist_customer`.`Customer_phone` AS `Customer_phone`,`florist_customer`.`Customer_email` AS `Customer_email`,`customer_address`.`building_number` AS `building_number`,`customer_address`.`street` AS `street`,`customer_address`.`city` AS `city`,`customer_address`.`post_code` AS `post_code`,`customer_address`.`country` AS `country`,`florist_order_details`.`Order_Detail_ID` AS `Order_Detail_ID`,`florist_order_details`.`Customer_Payment_method_id` AS `Customer_Payment_method_id`,`florist_order_details`.`Order_Status_code` AS `Order_Status_code`,`florist_order_details`.`Date_order_placed` AS `Date_order_placed`,`florist_order_details`.`Date_order_paid` AS `Date_order_paid`,`florist_product`.`Product_code` AS `Product_code`,`florist_product`.`Product_name` AS `Product_name`,`florist_product`.`Supplier_id` AS `Supplier_id`,`florist_product`.`Product_price` AS `Product_price`,`florist_shipping`.`Shipping_Method` AS `Shipping_Method`,`florist_shipping`.`Shipping_Cost` AS `Shipping_Cost`,`florist_shipping`.`Shipping_Date` AS `Shipping_Date` from (((((`florist_customer` join `florist_order_details` on((`florist_customer`.`Customer_ID` = `florist_order_details`.`Customer_id`))) join `florist_shipping` on((`florist_order_details`.`Order_Detail_ID` = `florist_shipping`.`Order_Detail_ID`))) join `customer_address` on((`florist_customer`.`Customer_ID` = `customer_address`.`customer_id`))) join `florist_event` on((`florist_customer`.`Customer_ID` = `florist_event`.`Customer_id`))) join `florist_product` on((`florist_event`.`Product_code` = `florist_product`.`Product_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_reviews_and_events`
--

/*!50001 DROP VIEW IF EXISTS `product_reviews_and_events`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_reviews_and_events` AS select `p`.`Product_code` AS `Product_code`,`p`.`Product_name` AS `Product_name`,`p`.`Product_price` AS `Product_price`,`e`.`Event_type` AS `Event_type`,`c`.`Customer_name` AS `Customer_name`,`c`.`Customer_email` AS `Customer_email`,`r`.`Comment` AS `Review_Comment`,`r`.`Rating` AS `Review_Rating`,`r`.`Review_on` AS `Review_on` from (((`florist_product` `p` left join `florist_event` `e` on((`p`.`Product_code` = `e`.`Product_code`))) left join `florist_customer` `c` on((`e`.`Customer_id` = `c`.`Customer_ID`))) left join `florist_reviews` `r` on(((`p`.`Product_code` = `r`.`Product_code`) and (`c`.`Customer_ID` = `r`.`Customer_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05 20:51:29

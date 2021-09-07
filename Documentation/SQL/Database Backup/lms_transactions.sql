CREATE DATABASE  IF NOT EXISTS `lms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: database-1.ceo7csjfbddw.ap-south-1.rds.amazonaws.com    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TID` int NOT NULL AUTO_INCREMENT,
  `IID` int NOT NULL,
  `MID` int NOT NULL,
  `Issued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Returned` timestamp NULL DEFAULT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'issued',
  PRIMARY KEY (`TID`),
  KEY `IID_inventory_transactions_idx` (`IID`),
  KEY `memeber_transactions_idx` (`MID`),
  CONSTRAINT `IID_inventory_transactions` FOREIGN KEY (`IID`) REFERENCES `inventory` (`IID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `memeber_transactions` FOREIGN KEY (`MID`) REFERENCES `members` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (5,93,1,'2021-05-01 19:39:33','2021-08-19 14:11:03','returned'),(6,106,1,'2021-05-01 19:58:31','2021-08-24 13:38:02','returned'),(7,111,2,'2021-06-01 10:57:47','2021-09-06 10:30:09','returned'),(8,165,3,'2021-06-28 06:02:53','2021-09-06 10:30:11','returned'),(9,262,3,'2021-06-28 07:46:24','2021-09-06 10:30:04','returned'),(10,308,1,'2021-08-07 10:40:23','2021-09-06 10:30:01','returned'),(11,94,1,'2021-08-07 10:40:34','2021-09-06 10:30:12','returned'),(12,291,1,'2021-08-07 10:40:44','0000-00-00 00:00:00','issued'),(13,362,2,'2021-08-18 18:14:00','2021-09-06 10:30:07','returned'),(14,380,5,'2021-09-06 10:29:44',NULL,'issued');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 20:12:41

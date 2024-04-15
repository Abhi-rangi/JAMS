-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: new_schema
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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `rid` varchar(50) NOT NULL,
  `vin` varchar(50) NOT NULL,
  `cid` varchar(50) NOT NULL,
  `ccnum` varchar(16) NOT NULL,
  `insurance` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `fk_reservation_vin` (`vin`),
  KEY `fk_reservation_cid` (`cid`),
  CONSTRAINT `fk_reservation_cid` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`),
  CONSTRAINT `fk_reservation_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`),
  CONSTRAINT `ccmin` CHECK ((char_length(`ccnum`) >= 13))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('ABCD1234','2HGES16541H552478','r4ldg1nbwb','12345678901234',1,'2024-07-01','2024-10-01'),('ABCD1235','1GKEL19W3XB501087','11erxq8sv1','12345676601234',1,'2024-07-02','2024-10-02'),('ABCD1236','JTMBFREV0HD001751','2xgo7uli3f','19095678901234',1,'2024-07-03','2024-10-03');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 15:57:27

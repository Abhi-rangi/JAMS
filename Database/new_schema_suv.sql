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
-- Table structure for table `suv`
--

DROP TABLE IF EXISTS `suv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suv` (
  `vin` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `fk_suv_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `suv_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suv`
--

LOCK TABLES `suv` WRITE;
/*!40000 ALTER TABLE `suv` DISABLE KEYS */;
INSERT INTO `suv` VALUES ('1FTYR10D03TA78846','30 cubic feet'),('1G4GZ2217M1218745','30 cubic feet'),('2C3CDZBTZKH542305','35 cubic feet'),('2G61W5SZ0D9169778','35 cubic feet'),('3FA6P0HD7GR214587','40 cubic feet'),('3N1CN7AP6JL571235','40 cubic feet'),('4S3BNAL64H3046812','45 cubic feet'),('4T1BF1FK3FU027505','45 cubic feet'),('5UXKR0C53F0K55324','50 cubic feet'),('5YFBURHE7EP001234','50 cubic feet'),('JH4KB165XHC001435','55 cubic feet'),('JM1BL1V83G1335897','55 cubic feet'),('KL7CJPSB0HB121987','60 cubic feet'),('KNDPB3AC5G7032845','60 cubic feet');
/*!40000 ALTER TABLE `suv` ENABLE KEYS */;
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

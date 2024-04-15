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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `vin` varchar(50) NOT NULL,
  `doors` int NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `fk_car_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `type_check` CHECK ((`type` in (_utf8mb4'compact',_utf8mb4'mid-size',_utf8mb4'large',_utf8mb4'subcompact',_utf8mb4'sports',_utf8mb4'convertible',_utf8mb4'minivan')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('1G3GZ62C6T4104011',4,'mid-size'),('1GC4KXCG9ZF124367',2,'sports'),('1GC4ZLCG4DF124367',2,'sports'),('1GCEK19B66E110242',4,'mid-size'),('1GCEK19Z66E110242',4,'mid-size'),('1GCEZ19B66E110242',2,'convertible'),('1GCGC24U3J2120667',3,'minivan'),('1GKEL19W3XB501087',3,'minivan'),('1GKFK66U45J128796',4,'mid-size'),('1GKFK6ZU45J128796',4,'mid-size'),('1GKFZ66U45J128796',4,'mid-size'),('2G2FV22P7S2217425',3,'minivan'),('2G61W5S80D9169778',2,'sports'),('2G61WZS80DZ169778',2,'sports'),('2HGEJ6670YH550478',4,'mid-size'),('2HGEJZ670YH550478',4,'mid-size'),('2HGEZ6670YH550478',4,'mid-size'),('2HKRM3H73FH508754',3,'minivan'),('2HKYF18686H539159',4,'mid-size'),('2HKYF18Z86H539159',4,'mid-size'),('3N1AB7A9ZGY305402',2,'sports'),('3N1AB7APXGY305402',2,'sports'),('3VW4T7AJ9FM393284',4,'mid-size'),('3VW517AT1FM576058',3,'minivan'),('3VW517AZ6FM611062',4,'mid-size'),('3VW517ZT6FM611062',4,'mid-size'),('3VW5DAATXFM060205',4,'mid-size'),('3VW5ZAATXFM060205',2,'convertible'),('3VWZDAATXFM060205',4,'mid-size'),('4T1BE32K95U402470',4,'mid-size'),('4T1BE3ZK95U402470',4,'mid-size'),('4T1BE46K17U062935',4,'mid-size'),('4T1BF1FK19Z029067',2,'sports'),('4T1BF1FK1FU029067',2,'sports'),('4T1BF1FK3GU130643',4,'mid-size'),('4T1BF1FK3GU13Z643',2,'convertible'),('4T1BF1FK3GU150107',3,'minivan'),('4T1BF1FZ3GU130643',4,'mid-size'),('5YFBARHE8EP001234',2,'sports'),('5YFBURHAZEP001234',4,'mid-size'),('5YFBURHE5EP00A23Z',4,'mid-size'),('5YFBURHE723AZ1Z34',2,'convertible'),('5YFBURHZ2EA001234',3,'minivan'),('5YFBURZE8EP001234',3,'minivan'),('5YFBUZHASZP001234',4,'mid-size'),('5YFBUZHE7ZA001234',4,'mid-size'),('AYFBURHE6ZPZ0Z234',4,'mid-size'),('JT2ST87H2N0041111',3,'minivan'),('JTMBFREV0HD001751',4,'mid-size'),('JTMBFREV0HD001Z51',2,'convertible'),('JTMBFREV0HD084891',4,'mid-size'),('JTMBFREZ0HD001751',4,'mid-size'),('JTNB11HK1J3052078',4,'mid-size'),('JTNB11HK9J3024087',3,'minivan'),('JTNB11HZ1J3052078',4,'mid-size'),('JTNB1ZHK1J3052078',4,'mid-size'),('KNADN5A36H6041798',3,'minivan'),('KND87ZA23H7907557',3,'minivan'),('KNDJNZA23H7907557',4,'mid-size'),('KNDMB2Z3046070890',2,'sports'),('KNDMBAS3046070890',2,'sports'),('KNHBU4A2XG5047401',4,'mid-size'),('KNHBU4AZXG5047401',4,'mid-size'),('KNHBU4AZXG5Z47401',4,'mid-size'),('KNHBU4Z2ZG5047401',2,'convertible'),('KZ9JN2A23Z7907557',4,'mid-size'),('KZDJN2A23HZ907557',4,'mid-size'),('ZT1BZ32KZ5U402470',4,'mid-size'),('ZYFBURHE6EP001234',4,'mid-size');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
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

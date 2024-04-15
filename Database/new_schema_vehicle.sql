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
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vin` varchar(50) NOT NULL,
  `seating` int NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `mpg` varchar(7) NOT NULL,
  `vtype` varchar(5) NOT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `make_name_check` CHECK ((`make` in (_utf8mb4'Audi',_utf8mb4'Acura',_utf8mb4'BMW',_utf8mb4'Bentley',_utf8mb4'Buick',_utf8mb4'Cadillac',_utf8mb4'Chevrolet',_utf8mb4'Chrysler',_utf8mb4'Dodge',_utf8mb4'Ferrari',_utf8mb4'Fiat',_utf8mb4'Ford',_utf8mb4'GM',_utf8mb4'GEM',_utf8mb4'GMC',_utf8mb4'Honda',_utf8mb4'Hummer',_utf8mb4'Hyundai',_utf8mb4'Infiniti',_utf8mb4'Isuzu',_utf8mb4'Jaguar',_utf8mb4'Jeep',_utf8mb4'Kia',_utf8mb4'Lamborghini',_utf8mb4'Land Rover',_utf8mb4'Lexus',_utf8mb4'Lincoln',_utf8mb4'Lotus',_utf8mb4'Mazda',_utf8mb4'Mercedes-Benz',_utf8mb4'Mercury',_utf8mb4'Mitsubishi',_utf8mb4'Nissan',_utf8mb4'Oldsmobile',_utf8mb4'Peugeot',_utf8mb4'Pontiac',_utf8mb4'Porsche',_utf8mb4'Regal',_utf8mb4'Saab',_utf8mb4'Saturn',_utf8mb4'Subaru',_utf8mb4'Suzuki',_utf8mb4'Tesla',_utf8mb4'Toyota',_utf8mb4'Volkswagen',_utf8mb4'Volvo'))),
  CONSTRAINT `vtype_check` CHECK ((`vtype` in (_utf8mb4'car',_utf8mb4'truck',_utf8mb4'suv')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('1FADP3K2XHL250791',4,'Chevrolet','R20 (C20) Pickup 2WD','36mpg','truck'),('1FTYR10D03TA78846',6,'Ford','Escort Wagon','36mpg','suv'),('1G3GZ62C6T4104011',8,'Chevrolet','Lumina Minivan 2WD','30mpg','car'),('1G4GZ2217M1218745',6,'Ford','Escort Wagon','35mpg','suv'),('1GC4KXCG9ZF124367',2,'Ferrari','GS-6 (22-inch wheels)','16mpg','car'),('1GC4ZLCG4DF124367',2,'Ferrari','GS-6 (22-inch wheels)','16mpg','car'),('1GCEK19B66E110242',5,'Mitsubishi','Diamante Sedan','35mpg','car'),('1GCEK19Z66E110242',5,'Dodge','Reno','42mpg','car'),('1GCEZ19B66E110242',4,'BMW','645ci Convertible','28mpg','car'),('1GCGC24U3J2120667',2,'Jaguar','XJL','10mpg','car'),('1GKEL19W3XB501087',8,'Chevrolet','Lumina/APV Minivan 2WD','28mpg','car'),('1GKFK66U45J128796',5,'BMW','330i xDrive Sedan','27mpg','car'),('1GKFK6ZU45J128796',5,'Ford','Arnage LWB','21mpg','car'),('1GKFZ66U45J128796',5,'Suzuki','SX4 Sedan','28mpg','car'),('1GNEC13Z43R179085',4,'Ford','Ranger Pickup 4WD','35mpg','truck'),('2C3CDZBTZKH542305',6,'Jaguar','X-Type Sport Brake','21mpg','suv'),('2G1FB1ED4B9153082',4,'Ford','F250 Pickup 2WD','20mpg','truck'),('2G2FV22P7S2217425',8,'Chevrolet','Lumina Minivan 2WD','32mpg','car'),('2G61W5S80D9169778',2,'Jaguar','XJL','10mpg','car'),('2G61W5SZ0D9169778',6,'Jaguar','X-Type Sport Brake','20mpg','suv'),('2G61WZS80DZ169778',2,'Jaguar','XJL','10mpg','car'),('2HGEJ6670YH550478',5,'Cadillac','CTS Sedan','25mpg','car'),('2HGEJZ670YH550478',5,'Mitsubishi','Diamante Sedan','39mpg','car'),('2HGES16541H552478',4,'Chevrolet','R20 (C20) Pickup 2WD','21mpg','truck'),('2HGEZ6670YH550478',5,'Dodge','Reno','46mpg','car'),('2HKRM3H73FH508754',2,'Lamborghini','Murcielago Reventon','14mpg','car'),('2HKYF18686H539159',5,'BMW','330i xDrive Sedan','21mpg','car'),('2HKYF18Z86H539159',5,'Suzuki','SX4 Sedan','24mpg','car'),('2HKYZ18686H539159',2,'Saab','9-3 Convertible','22mpg','car'),('3C3CFFAR6FT527821',4,'Ford','F250 Pickup 2WD','36mpg','truck'),('3FA6P0HD7GR214587',5,'Ford','GS-6 (22-inch wheels)','36mpg','suv'),('3N1AB7A9ZGY305402',2,'Lamborghini','Murcielago Reventon','14mpg','car'),('3N1AB7APXGY305402',2,'Lamborghini','Murcielago Reventon','14mpg','car'),('3N1CN7AP6JL571235',5,'Ford','GS-6 (22-inch wheels)','37mpg','suv'),('3NXAJ5MV4LZ056745',4,'Ford','F150 Pickup 2WD','37mpg','truck'),('3VW4T7AJ9FM393284',8,'Chevrolet','Lumina/APV Minivan 2WD','26mpg','car'),('3VW517AT1FM576058',4,'Saab','9-3 Sport Sedan','19mpg','car'),('3VW517AT6ZM611062',5,'Chevrolet','Tracker 4WD Convertible','30mpg','car'),('3VW517AZ6FM611062',5,'Cadillac','CTS Sedan','36mpg','car'),('3VW517ZT6FM611062',5,'Mitsubishi','Diamante Sedan','43mpg','car'),('3VW5DAATXFM060205',5,'Toyota','Celica','31mpg','car'),('3VW5ZAATXFM060205',5,'Suzuki','SX4 Sedan','20mpg','car'),('3VWZDAATXFM060205',5,'BMW','330i xDrive Sedan','27mpg','car'),('4S3BNAL64H3046812',5,'Hyundai','Santa Fe Sport 2WD','20mpg','suv'),('4S4BSANC8H3332311',4,'Ford','F150 Pickup 2WD','20mpg','truck'),('4T1BE32K95U402470',5,'Toyota','Celica','20mpg','car'),('4T1BE32K9ZU402470',4,'BMW','645ci Convertible','26mpg','car'),('4T1BE3ZK95U402470',5,'BMW','330i xDrive Sedan','13mpg','car'),('4T1BE46K17U062935',8,'Chevrolet','Lumina Minivan 2WD','30mpg','car'),('4T1BF1FK19Z029067',4,'Saab','9-3 Sport Sedan','19mpg','car'),('4T1BF1FK1FU027505',3,'GMC','K25 Pickup 4WD','20mpg','truck'),('4T1BF1FK1FU029067',4,'Saab','9-3 Sport Sedan','19mpg','car'),('4T1BF1FK3FU027505',5,'Hyundai','Santa Fe Sport 2WD','20mpg','suv'),('4T1BF1FK3GU130643',5,'Chevrolet','Impala','33mpg','car'),('4T1BF1FK3GU13Z643',5,'Mitsubishi','Diamante Sedan','47mpg','car'),('4T1BF1FK3GU150107',8,'Chevrolet','Lumina/APV Minivan 2WD','28mpg','car'),('4T1BF1FZ3GU130643',5,'Cadillac','CTS Sedan','40mpg','car'),('5UXKR0C53F0K55324',6,'Ford','Bronco Sport 4WD','37mpg','suv'),('5YFBARHE1EP001234',3,'GMC','K25 Pickup 4WD','37mpg','truck'),('5YFBARHE8EP001234',2,'Porsche','944 S2','18mpg','car'),('5YFBUAHE8EP001234',3,'Chevrolet','T10 (S10) Blazer 4WD','37mpg','truck'),('5YFBURAS87P001234',2,'Saab','9-3 Convertible','24mpg','car'),('5YFBURHAZEP001234',5,'Toyota','Celica','16mpg','car'),('5YFBURHE5EP00A23Z',8,'Chevrolet','Lumina/APV Minivan 2WD','28mpg','car'),('5YFBURHE723AZ1Z34',5,'BMW','330i xDrive Sedan','29mpg','car'),('5YFBURHE7EP001234',6,'Ford','Bronco Sport 4WD','37mpg','suv'),('5YFBURHZ2EA001234',8,'Chevrolet','Lumina Minivan 2WD','32mpg','car'),('5YFBURZE8EP001234',2,'Porsche','944 S2','18mpg','car'),('5YFBUZHASZP001234',5,'Cadillac','CTS Sedan','44mpg','car'),('5YFBUZHE7ZA001234',5,'Ford','Arnage LWB','22mpg','car'),('AYFBURHE6ZPZ0Z234',5,'Chevrolet','Impala','37mpg','car'),('JH4KB165XHC001435',5,'Honda','Passport 4WD','35mpg','suv'),('JM1BL1V83G1335897',5,'Honda','Passport 4WD','35mpg','suv'),('JT2ST87H2N0041111',5,'Mercedes-Benz','ML350','12mpg','car'),('JTKDE177360081631',3,'Chevrolet','T10 (S10) Blazer 4WD','35mpg','truck'),('JTMBFREV0HD001751',5,'Dodge','Reno','34mpg','car'),('JTMBFREV0HD001Z51',5,'Cadillac','CTS Sedan','47mpg','car'),('JTMBFREV0HD084891',8,'Chevrolet','Lumina Minivan 2WD','32mpg','car'),('JTMBFREZ0HD001751',5,'Chevrolet','Impala','41mpg','car'),('JTNB11HK1J3052078',5,'Suzuki','SX4 Sedan','24mpg','car'),('JTNB11HK9J3024087',8,'Chevrolet','Lumina/APV Minivan 2WD','26mpg','car'),('JTNB11HZ1J3052078',5,'Toyota','Celica','22mpg','car'),('JTNB1ZHK1J3052078',5,'Ford','Arnage LWB','29mpg','car'),('KL7CJPSB0HB121987',5,'Volkswagen','Golf SportWagen','21mpg','suv'),('KNADN5A36H6041798',2,'Ferrari','GS-6 (22-inch wheels)','16mpg','car'),('KNAGM4AD3G5040130',4,'Ford','Ranger Pickup 4WD','21mpg','truck'),('KND87ZA23H7907557',8,'Chevrolet','Lumina Minivan 2WD','30mpg','car'),('KNDJNZA23H7907557',5,'Mitsubishi','Diamante Sedan','29mpg','car'),('KNDMB2Z3046070890',5,'Mercedes-Benz','ML350','12mpg','car'),('KNDMBAS3046070890',5,'Mercedes-Benz','ML350','12mpg','car'),('KNDPB3AC5G7032845',5,'Volkswagen','Golf SportWagen','21mpg','suv'),('KNHBU4A2XG5047401',8,'Chevrolet','Lumina/APV Minivan 2WD','26mpg','car'),('KNHBU4AZXG5047401',5,'Suzuki','SX4 Sedan','23mpg','car'),('KNHBU4AZXG5Z47401',5,'Ford','Arnage LWB','15mpg','car'),('KNHBU4Z2ZG5047401',5,'Chevrolet','Tracker 4WD Convertible','25mpg','car'),('KZ9JN2A23Z7907557',5,'Dodge','Reno','38mpg','car'),('KZDJN2A23HZ907557',5,'Chevrolet','Impala','45mpg','car'),('ZT1BZ32KZ5U402470',5,'Ford','Arnage LWB','26mpg','car'),('ZYFBURHE6EP001234',5,'Dodge','Reno','30mpg','car');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 15:57:26
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (arm64)
--
-- Host: localhost    Database: jams
-- ------------------------------------------------------
-- Server version	8.0.30

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

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cid` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `phonemin` CHECK ((char_length(`phone`) >= 10)),
  CONSTRAINT `state_name` CHECK ((`state` in (_utf8mb4'AK',_utf8mb4'AL',_utf8mb4'AR',_utf8mb4'AS',_utf8mb4'AZ',_utf8mb4'CA',_utf8mb4'CO',_utf8mb4'CT',_utf8mb4'DC',_utf8mb4'DE',_utf8mb4'FL',_utf8mb4'GA',_utf8mb4'GU',_utf8mb4'HI',_utf8mb4'IA',_utf8mb4'ID',_utf8mb4'IL',_utf8mb4'IN',_utf8mb4'KS',_utf8mb4'KY',_utf8mb4'LA',_utf8mb4'MA',_utf8mb4'MD',_utf8mb4'ME',_utf8mb4'MI',_utf8mb4'MN',_utf8mb4'MO',_utf8mb4'MP',_utf8mb4'MS',_utf8mb4'MT',_utf8mb4'NC',_utf8mb4'ND',_utf8mb4'NE',_utf8mb4'NH',_utf8mb4'NJ',_utf8mb4'NM',_utf8mb4'NV',_utf8mb4'NY',_utf8mb4'OH',_utf8mb4'OK',_utf8mb4'OR',_utf8mb4'PA',_utf8mb4'PR',_utf8mb4'RI',_utf8mb4'SC',_utf8mb4'SD',_utf8mb4'TN',_utf8mb4'TX',_utf8mb4'UM',_utf8mb4'UT',_utf8mb4'VA',_utf8mb4'VI',_utf8mb4'VT',_utf8mb4'WA',_utf8mb4'WI',_utf8mb4'WV',_utf8mb4'WY'))),
  CONSTRAINT `zipmin` CHECK ((char_length(`zipcode`) >= 4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('11erxq8sv1','61','555-678-9012','chriscarter789@live.com','222 Cherry Avenue','Sycamore','VA','56789','Rodriguez','Cannon'),('2xgo7uli3f','56','555-234-5678','kevinanderson789@rocketmail.com','888 Poplar Lane','Brookside','IL','90123','Anderson','Hugo'),('4oqkx8b1u3','35','555-678-9012','andrewrobinson654@elude.in','2829 Grape Lane','Harborview','LA','56789','Hall','Makayla'),('78va3hxwe5','46','555-345-6789','dianagarcia321@tutanota.com','999 Hemlock Street','Woodland','MI','34567','Thomas','Killian'),('7b5ic1u0y5','21','555-123-4567','emilyjones321@yahoo.com','101 Pine Lane','Maplewood','CA','78901','Brown','Israel'),('8f68dwjy9m','35','555-890-1234','jamesharris789@startmail.com','1213 Laurel Boulevard','Pinehurst','SC','23456','Harris','Alex'),('b0gyeac0mz','56','555-890-3456','alexbrown789@hotmail.com','789 Maple Court','Pineview','TX','23456','Williams','Vaughn'),('bfwihf82ec','60','555-789-0123','lindajackson456@protonmail.ch','1011 Fir Lane','Riverside','MO','78901','White','Cristofer'),('bx8fevv062','44','555-901-2345','laurawhite987@zoho.com','555 Sycamore Court','Sunnyside','MA','12345','Lopez','Reagan'),('e03ozecb03','52','555-123-4567','sandrajohnson456@fastmail.com','777 Cypress Drive','Meadowbrook','NC','23456','Wilson','Eric'),('ex9copzumc','24','555-890-1234','robertrodriguez654@yandex.com','444 Aspen Street','Greenfield','NJ','67890','Hernandez','Mohammad'),('fdi4bt5za2','39','555-901-2345','elizabethmartin321@safe-mail.net','1415 Pineapple Street','Oakdale','NV','45678','Martin','Destinee'),('ffjnpe601r','46','555-567-8901','michelleking321@privatdemail.net','2627 Banana Circle','Rosewood','KY','34567','Walker','Darrell'),('gmf9wsm0di','53','555-789-0123','amandajackson321@inbox.com','333 Magnolia Lane','Riverdale','OH','10234','Martinez','Junior'),('h3gkp2h5wh','39','555-234-5678','davidwilson654@outlook.com','34 Cedar Drive','Oakville','GA','34567','Jones','Madalyn'),('hr8nw5xlb4','48','555-456-7890','ericphillips789@mail2tor.com','2425 Plum Road','Highland Park','OK','12345','Robinson','Summer'),('i8pl5de4sf','18','555-789-0123','laurasmith987@anonymousspeech.com','3031 Orange Street','Lakeview','AR','78901','Young','Gregory'),('jmn4fwnex1','60','555-456-7890','michaelthomas123@icloud.com','890 Willow Circle','Birchwood','CO','45678','Miller','Jayda'),('jv9r3cuiq7','54','555-567-8901','jenniferlee456@protonmail.com','111 Spruce Boulevard','Ashland','AZ','90123','Davis','Abdullah'),('k3ptj5rpdp','38','555-789-1234','johndoe123@example.com','123 Elm Street','Willow Springs','NY','12345','Smith','Leland'),('l1ch6kdlv7','61','555-567-8901','lisawilson987@pm.me','4560 Chestnut Circle',' Lakeside','KS','56789','Moore','Ian'),('mnb5cttozi','53','555-345-6789','ashleyevans456@riseup.net','2223 Peach Avenue','Mountainview','UT','61234','Lewis','April'),('o4zs5kz11n','52','555-678-9012','patrickthompson123@guerrillamail.com','7890 Alder Avenue','Hillcrest','MD','21234','    Jackson','Anna'),('oqy7ww5ntr','21','555-345-6789','sarahmiller987@aol.com','567 Birch Road','Elmwood','WA','89012','    Garcia','Cecilia'),('pl1kmzuale','43','555-012-3456','matthewmartinez123@mail.com','666 Walnut Avenue','Clearwater','TN','89012','Gonzalez','Zaniyah'),('pmcyv7nlr5','45','555-456-7890','stevenbrown654@mailinator.com','1230 Juniper Road','Springvale','OR','45678','Taylor','Camila'),('r4ldg1nbwb','18','555-456-2345','marysmith456@gmail.com','456 Oak Avenue','Cedar Grove','FL','67890','Johnson','Joey'),('r4ldgZnbwb','18','555-456-2345','marysmith456@gmail.com','456 Oak Avenue','Cedar Grove','FL','67890','Johnson','Joey'),('sjlz5cdrs3','48','555-234-5678','christopherroberts123@hushmail.com','2021 Kiwi Lane','Valleyview','ME','90123','Clark','Tatum'),('veycfc0bpd','57','555-012-3456','ryanrivera654@mailfence.com','617 Mango Drive','Forestville','AL','67890','Thompson','Hana'),('wwva336ldo','48','555-123-4567','kimberlytaylor987@countermail.com','1819 Papaya Court','Sunset Hills','WI','89012','Garcia','Haven');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `rental_id` varchar(50) NOT NULL,
  `vin` varchar(50) NOT NULL,
  `cid` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `fk_rent_vin` (`vin`),
  KEY `fk_rent_cid` (`cid`),
  CONSTRAINT `fk_rent_cid` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`),
  CONSTRAINT `fk_rent_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES ('1234ABCD','1GCGC24U3J2120667','k3ptj5rpdp','2024-04-01','2024-07-01'),('1235ABCD','ZT1BZ32KZ5U402470','jmn4fwnex1','2024-04-01','2024-07-02'),('12456ABCD','1GKFK66U45J128796','e03ozecb03','2024-04-01','2024-07-03');
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `reservation` VALUES ('ABCD1234','2HGES16541H552478','r4ldg1nbwb','12345678901234',1,'2024-07-01','2024-10-01'),('ABCD1235','1GKEL19W3XB501087','11erxq8sv1','12345676601234',1,'2024-07-02','2024-10-02'),('ABCD1236','JTMBFREV0HD001751','2xgo7uli3f','19095678901234',1,'2024-07-03','2024-10-03'),('L9B875US','4T1BF1FK1FU027505','4oqkx8b1u3','1234567890123456',0,'2024-04-01','2024-04-30'),('SIW3T2BR','1GCGC24U3J2120667','4oqkx8b1u3','1234567890123456',0,'2024-05-30','2024-06-07'),('TCLBNJGE','1FADP3K2XHL250791','4oqkx8b1u3','1234567890123456',0,'2024-04-16','2024-04-25'),('WGJI1IJL','1GNEC13Z43R179085','4oqkx8b1u3','1234567890123456',0,'2024-04-09','2024-04-16'),('XXGZPR6I','1FTYR10D03TA78846','78va3hxwe5','1234567890123456',0,'2024-04-17','2024-05-04');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `sid` varchar(50) NOT NULL,
  `vin` varchar(50) NOT NULL,
  `descrip` varchar(3000) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `work_location` varchar(3000) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_service_vin` (`vin`),
  CONSTRAINT `fk_service_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `vin` varchar(50) NOT NULL,
  `load_capacity` varchar(50) NOT NULL,
  PRIMARY KEY (`vin`),
  CONSTRAINT `fk_truck_vin` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES ('1FADP3K2XHL250791','2,200 lbs'),('1GNEC13Z43R179085','1,500 lbs'),('2G1FB1ED4B9153082','1,800 lbs'),('2HGES16541H552478','2,200 lbs'),('3C3CFFAR6FT527821','1,800 lbs'),('3NXAJ5MV4LZ056745','2,500 lbs'),('4S4BSANC8H3332311','2,500 lbs'),('4T1BF1FK1FU027505','1,700 lbs'),('5YFBARHE1EP001234','1,700 lbs'),('5YFBUAHE8EP001234','2,300 lbs'),('JTKDE177360081631','2,300 lbs'),('KNAGM4AD3G5040130','1,500 lbs');
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-04-24 10:23:14
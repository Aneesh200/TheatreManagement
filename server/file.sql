-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (arm64)
--
-- Host: localhost    Database: theatre_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Customer`
--

Create Database theatre_management;

use theatre_management;

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CID` varchar(36) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`CID`),
  CONSTRAINT `customer_chk_1` CHECK ((`Age` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('046430e0-d8ef-4956-9d9f-702f38bf221d','test','2',22),('05af00b9-d90b-49b8-9d0d-ce4f1acd66fd','Lin','Long',21),('0d9f5f0a-aa19-4069-ae89-ae508abb8bda','AA','ss',12),('1edc5939-51d1-4444-95c1-ae0f26c74c06','Aneesh','Madhav',21),('312c29f4-a1cb-4a21-b75d-e3be2b93b411','Aneesh','Madhav',21),('413fd962-a4e8-4c11-a2bc-3318d66dcdbb','Aneesh','Madhav',22),('48f03791-8509-48ab-902e-7f3c7bc12263','Anes','Madh',21),('4e9cac62-130c-4e99-aa73-06723ea842e6','Lin','Long',21),('4f94771a-99eb-48e7-bc8b-6416adba045b','AA','12',22),('503a7134-c20b-403b-8ba6-1ba5e6b49a0a','Anee','Ma',21),('540de0dd-a04d-442b-a58d-449c99f3e101','Anee','Mad',21),('58236959-4e29-471d-af51-4d7380204d3a','Anee','MA',21),('70f315dd-e505-454a-a0ca-e657ceff468e','GG','LS',21),('74e7104c-be85-4b1f-81f9-ca1b0198f4d2','AA','ss',21),('79f8f35e-32fe-4539-8e0d-be3ca882f830','Lara','Jensen',21),('80aad05d-f882-4490-92c7-07f0fb1093d7','lin','long',21),('8a36da7b-dee4-4010-a219-b76fadb626b5','AA','gg',22),('a2a52128-72b5-4323-8fb6-146207025c76','Anee','M',21),('ab9bb1db-5eb2-41bc-93ce-feec3402bce7','Anee','M',21),('b5313089-d3f5-4d1c-9581-879d7fd617c4','test','123',21),('b5795c78-7e55-4391-bde7-f0750fa1747d','Aneesh','Madhav',21),('bfb0dff5-9735-4dd9-980d-bff329812d27','Lin','long',22),('c10e7715-07b0-47bb-b025-c095521170c0','Aneesh','Madhav',21),('c565f032-f2a9-417e-86b6-14ba3acd1c79','Anee','M',21),('c59dc2d7-791a-4089-86a4-afb532b5a4db','Anee','M',12),('ca19729f-02b9-4bff-be63-ed349206fef5','a','2',22),('cab4bd69-44df-4f34-a6be-35b316b7e35e','AA','dd',32),('cust1','John','Doe',25),('cust2','Jane','Smith',30),('cust3','Bob','Johnson',45),('d00ffe24-a5c6-4af6-875d-836e0fc766a5','Anee','M',21),('d853cbba-c886-4b0a-bdca-478ed859ed00','Aneesh','Ma',21),('da2e591b-e420-4f70-8835-d28407b754ea','Ajay ','Vasisht ',21),('daf1b342-2dfe-4e3e-8486-195c2315138f','Anee','HS',21),('dc6b8fce-c856-4640-9440-237569904e75','Anee','M',21),('e33bf45f-606f-4c78-ab81-7e7c82865f4b','Aneesh ','Madhav',21),('e3a6589d-019a-4ed2-9039-d27427f33d33','Sugondese','Knutz',18),('e918e122-02a2-426c-9ef7-3cf9cd2fef5a','t','1',21),('e9559f96-8194-427b-a94c-84e4c69de170','Anee','Ma',12),('eb47d65b-3f0d-4b90-9b8c-9d5fd61a1480','Akshay ','v',21),('f4867c61-fc97-4a08-a99c-51f84422fbdc','Aad','Da',21),('f589922e-2ebe-40e3-9cd9-824acd9df627','Anee','M',21);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Movie_ID` varchar(36) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Duration` int NOT NULL,
  `Genre` varchar(50) NOT NULL,
  PRIMARY KEY (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES ('mov1','Oppenheimer',181,'Drama/Historical'),('mov2','Interstellar',169,'Sci-Fi'),('mov3','The Dark Knight',152,'Action'),('mov4','Inception',148,'Sci-Fi/Action'),('mov5','Barbie',114,'Comedy/Fantasy'),('mov6','Avengers',180,'Action');
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screen`
--

DROP TABLE IF EXISTS `Screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Screen` (
  `Screen_ID` varchar(36) NOT NULL,
  `Screen_No` int NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Screen_ID`),
  UNIQUE KEY `Screen_No` (`Screen_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screen`
--

LOCK TABLES `Screen` WRITE;
/*!40000 ALTER TABLE `Screen` DISABLE KEYS */;
INSERT INTO `Screen` VALUES ('scr1',1,'IMAX'),('scr2',2,'Dolby Atmos'),('scr3',3,'Regular'),('scr4',4,'3D');
/*!40000 ALTER TABLE `Screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `Seat_No` varchar(10) NOT NULL,
  `Screen_ID` varchar(36) NOT NULL,
  `Available` tinyint(1) DEFAULT '1',
  `ShowID` varchar(36) NOT NULL,
  PRIMARY KEY (`Seat_No`,`Screen_ID`,`ShowID`),
  KEY `FK_Seat_Screen` (`Screen_ID`),
  KEY `FK_Seat_Show` (`ShowID`),
  CONSTRAINT `FK_Seat_Screen` FOREIGN KEY (`Screen_ID`) REFERENCES `Screen` (`Screen_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Seat_Show` FOREIGN KEY (`ShowID`) REFERENCES `Show` (`ShowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES ('A1','scr1',0,'sh1'),('A1','scr1',0,'sh10'),('A1','scr1',0,'sh11'),('A1','scr1',0,'sh15'),('A1','scr1',1,'sh22'),('A1','scr1',0,'sh5'),('A1','scr1',0,'sh6'),('A1','scr2',1,'sh-23'),('A1','scr2',1,'sh-24'),('A1','scr2',1,'sh-25'),('A1','scr2',1,'sh12'),('A1','scr2',1,'sh2'),('A1','scr2',1,'sh7'),('A1','scr3',1,'sh13'),('A1','scr3',1,'sh3'),('A1','scr3',1,'sh8'),('A1','scr4',1,'sh14'),('A1','scr4',1,'sh4'),('A1','scr4',1,'sh9'),('A2','scr1',0,'sh1'),('A2','scr1',0,'sh10'),('A2','scr1',0,'sh11'),('A2','scr1',0,'sh15'),('A2','scr1',1,'sh22'),('A2','scr1',0,'sh5'),('A2','scr1',0,'sh6'),('A2','scr2',1,'sh-23'),('A2','scr2',1,'sh-24'),('A2','scr2',1,'sh-25'),('A2','scr2',1,'sh12'),('A2','scr2',1,'sh2'),('A2','scr2',1,'sh7'),('A2','scr3',1,'sh13'),('A2','scr3',1,'sh3'),('A2','scr3',1,'sh8'),('A2','scr4',1,'sh14'),('A2','scr4',1,'sh4'),('A2','scr4',1,'sh9'),('A3','scr1',1,'sh1'),('A3','scr1',1,'sh10'),('A3','scr1',1,'sh11'),('A3','scr1',1,'sh15'),('A3','scr1',1,'sh22'),('A3','scr1',1,'sh5'),('A3','scr1',1,'sh6'),('A3','scr2',1,'sh-23'),('A3','scr2',1,'sh-24'),('A3','scr2',1,'sh-25'),('A3','scr2',1,'sh12'),('A3','scr2',1,'sh2'),('A3','scr2',1,'sh7'),('A3','scr3',1,'sh13'),('A3','scr3',1,'sh3'),('A3','scr3',1,'sh8'),('A3','scr4',1,'sh14'),('A3','scr4',1,'sh4'),('A3','scr4',1,'sh9'),('A4','scr1',1,'sh1'),('A4','scr1',1,'sh10'),('A4','scr1',1,'sh11'),('A4','scr1',1,'sh15'),('A4','scr1',1,'sh22'),('A4','scr1',1,'sh5'),('A4','scr1',1,'sh6'),('A4','scr2',1,'sh-23'),('A4','scr2',1,'sh-24'),('A4','scr2',1,'sh-25'),('A4','scr2',1,'sh12'),('A4','scr2',1,'sh2'),('A4','scr2',1,'sh7'),('A4','scr3',1,'sh13'),('A4','scr3',1,'sh3'),('A4','scr3',1,'sh8'),('A4','scr4',1,'sh14'),('A4','scr4',1,'sh4'),('A4','scr4',1,'sh9'),('A5','scr1',1,'sh1'),('A5','scr1',1,'sh10'),('A5','scr1',1,'sh11'),('A5','scr1',1,'sh15'),('A5','scr1',1,'sh22'),('A5','scr1',1,'sh5'),('A5','scr1',1,'sh6'),('A5','scr2',1,'sh-23'),('A5','scr2',1,'sh-24'),('A5','scr2',1,'sh-25'),('A5','scr2',1,'sh12'),('A5','scr2',1,'sh2'),('A5','scr2',1,'sh7'),('A5','scr3',1,'sh13'),('A5','scr3',1,'sh3'),('A5','scr3',1,'sh8'),('A5','scr4',1,'sh14'),('A5','scr4',1,'sh4'),('A5','scr4',1,'sh9'),('A6','scr1',1,'sh1'),('A6','scr1',1,'sh10'),('A6','scr1',1,'sh11'),('A6','scr1',1,'sh15'),('A6','scr1',1,'sh22'),('A6','scr1',1,'sh5'),('A6','scr1',1,'sh6'),('A6','scr2',1,'sh-23'),('A6','scr2',1,'sh-24'),('A6','scr2',1,'sh-25'),('A6','scr2',1,'sh12'),('A6','scr2',1,'sh2'),('A6','scr2',1,'sh7'),('A6','scr3',1,'sh13'),('A6','scr3',1,'sh3'),('A6','scr3',1,'sh8'),('A6','scr4',1,'sh14'),('A6','scr4',1,'sh4'),('A6','scr4',1,'sh9'),('A7','scr1',1,'sh1'),('A7','scr1',1,'sh10'),('A7','scr1',1,'sh11'),('A7','scr1',1,'sh15'),('A7','scr1',1,'sh22'),('A7','scr1',1,'sh5'),('A7','scr1',1,'sh6'),('A7','scr2',1,'sh-23'),('A7','scr2',1,'sh-24'),('A7','scr2',1,'sh-25'),('A7','scr2',1,'sh12'),('A7','scr2',1,'sh2'),('A7','scr2',1,'sh7'),('A7','scr3',1,'sh13'),('A7','scr3',1,'sh3'),('A7','scr3',1,'sh8'),('A7','scr4',1,'sh14'),('A7','scr4',1,'sh4'),('A7','scr4',1,'sh9'),('A8','scr1',1,'sh1'),('A8','scr1',1,'sh10'),('A8','scr1',1,'sh11'),('A8','scr1',1,'sh15'),('A8','scr1',1,'sh22'),('A8','scr1',1,'sh5'),('A8','scr1',1,'sh6'),('A8','scr2',1,'sh-23'),('A8','scr2',1,'sh-24'),('A8','scr2',1,'sh-25'),('A8','scr2',1,'sh12'),('A8','scr2',1,'sh2'),('A8','scr2',1,'sh7'),('A8','scr3',1,'sh13'),('A8','scr3',1,'sh3'),('A8','scr3',1,'sh8'),('A8','scr4',1,'sh14'),('A8','scr4',1,'sh4'),('A8','scr4',1,'sh9'),('B1','scr1',1,'sh1'),('B1','scr1',1,'sh10'),('B1','scr1',1,'sh11'),('B1','scr1',1,'sh15'),('B1','scr1',1,'sh22'),('B1','scr1',1,'sh5'),('B1','scr1',1,'sh6'),('B1','scr2',1,'sh-23'),('B1','scr2',1,'sh-24'),('B1','scr2',1,'sh-25'),('B1','scr2',1,'sh12'),('B1','scr2',1,'sh2'),('B1','scr2',1,'sh7'),('B1','scr3',1,'sh13'),('B1','scr3',1,'sh3'),('B1','scr3',1,'sh8'),('B1','scr4',1,'sh14'),('B1','scr4',1,'sh4'),('B1','scr4',1,'sh9'),('B2','scr1',1,'sh1'),('B2','scr1',1,'sh10'),('B2','scr1',1,'sh11'),('B2','scr1',1,'sh15'),('B2','scr1',1,'sh22'),('B2','scr1',1,'sh5'),('B2','scr1',1,'sh6'),('B2','scr2',1,'sh-23'),('B2','scr2',1,'sh-24'),('B2','scr2',1,'sh-25'),('B2','scr2',1,'sh12'),('B2','scr2',1,'sh2'),('B2','scr2',1,'sh7'),('B2','scr3',1,'sh13'),('B2','scr3',1,'sh3'),('B2','scr3',1,'sh8'),('B2','scr4',1,'sh14'),('B2','scr4',1,'sh4'),('B2','scr4',1,'sh9'),('B3','scr1',1,'sh1'),('B3','scr1',1,'sh10'),('B3','scr1',1,'sh11'),('B3','scr1',1,'sh15'),('B3','scr1',1,'sh22'),('B3','scr1',1,'sh5'),('B3','scr1',1,'sh6'),('B3','scr2',1,'sh-23'),('B3','scr2',1,'sh-24'),('B3','scr2',1,'sh-25'),('B3','scr2',0,'sh12'),('B3','scr2',0,'sh2'),('B3','scr2',0,'sh7'),('B3','scr3',1,'sh13'),('B3','scr3',1,'sh3'),('B3','scr3',1,'sh8'),('B3','scr4',1,'sh14'),('B3','scr4',1,'sh4'),('B3','scr4',1,'sh9'),('B4','scr1',1,'sh1'),('B4','scr1',1,'sh10'),('B4','scr1',1,'sh11'),('B4','scr1',1,'sh15'),('B4','scr1',1,'sh22'),('B4','scr1',1,'sh5'),('B4','scr1',1,'sh6'),('B4','scr2',1,'sh-23'),('B4','scr2',1,'sh-24'),('B4','scr2',1,'sh-25'),('B4','scr2',1,'sh12'),('B4','scr2',1,'sh2'),('B4','scr2',1,'sh7'),('B4','scr3',1,'sh13'),('B4','scr3',1,'sh3'),('B4','scr3',1,'sh8'),('B4','scr4',1,'sh14'),('B4','scr4',1,'sh4'),('B4','scr4',1,'sh9'),('B5','scr1',1,'sh1'),('B5','scr1',1,'sh10'),('B5','scr1',1,'sh11'),('B5','scr1',1,'sh15'),('B5','scr1',1,'sh22'),('B5','scr1',1,'sh5'),('B5','scr1',1,'sh6'),('B5','scr2',1,'sh-23'),('B5','scr2',1,'sh-24'),('B5','scr2',1,'sh-25'),('B5','scr2',1,'sh12'),('B5','scr2',1,'sh2'),('B5','scr2',1,'sh7'),('B5','scr3',1,'sh13'),('B5','scr3',1,'sh3'),('B5','scr3',1,'sh8'),('B5','scr4',1,'sh14'),('B5','scr4',1,'sh4'),('B5','scr4',1,'sh9'),('B6','scr1',1,'sh1'),('B6','scr1',1,'sh10'),('B6','scr1',1,'sh11'),('B6','scr1',1,'sh15'),('B6','scr1',1,'sh22'),('B6','scr1',1,'sh5'),('B6','scr1',1,'sh6'),('B6','scr2',1,'sh-23'),('B6','scr2',1,'sh-24'),('B6','scr2',1,'sh-25'),('B6','scr2',1,'sh12'),('B6','scr2',1,'sh2'),('B6','scr2',1,'sh7'),('B6','scr3',1,'sh13'),('B6','scr3',1,'sh3'),('B6','scr3',1,'sh8'),('B6','scr4',1,'sh14'),('B6','scr4',1,'sh4'),('B6','scr4',1,'sh9'),('B7','scr1',0,'sh1'),('B7','scr1',1,'sh10'),('B7','scr1',1,'sh11'),('B7','scr1',1,'sh15'),('B7','scr1',1,'sh22'),('B7','scr1',1,'sh5'),('B7','scr1',1,'sh6'),('B7','scr2',1,'sh-23'),('B7','scr2',1,'sh-24'),('B7','scr2',1,'sh-25'),('B7','scr2',1,'sh12'),('B7','scr2',1,'sh2'),('B7','scr2',1,'sh7'),('B7','scr3',1,'sh13'),('B7','scr3',1,'sh3'),('B7','scr3',1,'sh8'),('B7','scr4',1,'sh14'),('B7','scr4',1,'sh4'),('B7','scr4',1,'sh9'),('B8','scr1',0,'sh1'),('B8','scr1',1,'sh10'),('B8','scr1',1,'sh11'),('B8','scr1',1,'sh15'),('B8','scr1',1,'sh22'),('B8','scr1',1,'sh5'),('B8','scr1',1,'sh6'),('B8','scr2',1,'sh-23'),('B8','scr2',1,'sh-24'),('B8','scr2',1,'sh-25'),('B8','scr2',1,'sh12'),('B8','scr2',1,'sh2'),('B8','scr2',1,'sh7'),('B8','scr3',1,'sh13'),('B8','scr3',1,'sh3'),('B8','scr3',1,'sh8'),('B8','scr4',1,'sh14'),('B8','scr4',1,'sh4'),('B8','scr4',1,'sh9'),('C1','scr1',0,'sh1'),('C1','scr1',1,'sh10'),('C1','scr1',1,'sh11'),('C1','scr1',1,'sh15'),('C1','scr1',1,'sh22'),('C1','scr1',1,'sh5'),('C1','scr1',1,'sh6'),('C1','scr2',1,'sh-23'),('C1','scr2',1,'sh-24'),('C1','scr2',1,'sh-25'),('C1','scr2',1,'sh12'),('C1','scr2',1,'sh2'),('C1','scr2',1,'sh7'),('C1','scr3',1,'sh13'),('C1','scr3',1,'sh3'),('C1','scr3',1,'sh8'),('C1','scr4',1,'sh14'),('C1','scr4',1,'sh4'),('C1','scr4',1,'sh9'),('C2','scr1',0,'sh1'),('C2','scr1',0,'sh10'),('C2','scr1',1,'sh11'),('C2','scr1',1,'sh15'),('C2','scr1',1,'sh22'),('C2','scr1',1,'sh5'),('C2','scr1',1,'sh6'),('C2','scr2',1,'sh-23'),('C2','scr2',1,'sh-24'),('C2','scr2',1,'sh-25'),('C2','scr2',1,'sh12'),('C2','scr2',1,'sh2'),('C2','scr2',1,'sh7'),('C2','scr3',1,'sh13'),('C2','scr3',1,'sh3'),('C2','scr3',1,'sh8'),('C2','scr4',1,'sh14'),('C2','scr4',1,'sh4'),('C2','scr4',1,'sh9'),('C3','scr1',0,'sh1'),('C3','scr1',0,'sh10'),('C3','scr1',1,'sh11'),('C3','scr1',1,'sh15'),('C3','scr1',1,'sh22'),('C3','scr1',1,'sh5'),('C3','scr1',1,'sh6'),('C3','scr2',1,'sh-23'),('C3','scr2',1,'sh-24'),('C3','scr2',1,'sh-25'),('C3','scr2',1,'sh12'),('C3','scr2',1,'sh2'),('C3','scr2',1,'sh7'),('C3','scr3',1,'sh13'),('C3','scr3',1,'sh3'),('C3','scr3',1,'sh8'),('C3','scr4',1,'sh14'),('C3','scr4',1,'sh4'),('C3','scr4',1,'sh9'),('C4','scr1',0,'sh1'),('C4','scr1',1,'sh10'),('C4','scr1',1,'sh11'),('C4','scr1',1,'sh15'),('C4','scr1',1,'sh22'),('C4','scr1',1,'sh5'),('C4','scr1',1,'sh6'),('C4','scr2',0,'sh-23'),('C4','scr2',1,'sh-24'),('C4','scr2',1,'sh-25'),('C4','scr2',1,'sh12'),('C4','scr2',1,'sh2'),('C4','scr2',1,'sh7'),('C4','scr3',0,'sh13'),('C4','scr3',0,'sh3'),('C4','scr3',0,'sh8'),('C4','scr4',1,'sh14'),('C4','scr4',1,'sh4'),('C4','scr4',1,'sh9'),('C5','scr1',0,'sh1'),('C5','scr1',1,'sh10'),('C5','scr1',1,'sh11'),('C5','scr1',1,'sh15'),('C5','scr1',1,'sh22'),('C5','scr1',1,'sh5'),('C5','scr1',1,'sh6'),('C5','scr2',1,'sh-23'),('C5','scr2',1,'sh-24'),('C5','scr2',1,'sh-25'),('C5','scr2',1,'sh12'),('C5','scr2',1,'sh2'),('C5','scr2',1,'sh7'),('C5','scr3',1,'sh13'),('C5','scr3',1,'sh3'),('C5','scr3',1,'sh8'),('C5','scr4',1,'sh14'),('C5','scr4',1,'sh4'),('C5','scr4',1,'sh9'),('C6','scr1',0,'sh1'),('C6','scr1',1,'sh10'),('C6','scr1',1,'sh11'),('C6','scr1',1,'sh15'),('C6','scr1',1,'sh22'),('C6','scr1',1,'sh5'),('C6','scr1',1,'sh6'),('C6','scr2',1,'sh-23'),('C6','scr2',1,'sh-24'),('C6','scr2',1,'sh-25'),('C6','scr2',1,'sh12'),('C6','scr2',1,'sh2'),('C6','scr2',1,'sh7'),('C6','scr3',1,'sh13'),('C6','scr3',1,'sh3'),('C6','scr3',1,'sh8'),('C6','scr4',1,'sh14'),('C6','scr4',1,'sh4'),('C6','scr4',1,'sh9'),('C7','scr1',1,'sh1'),('C7','scr1',1,'sh10'),('C7','scr1',1,'sh11'),('C7','scr1',1,'sh15'),('C7','scr1',1,'sh22'),('C7','scr1',1,'sh5'),('C7','scr1',1,'sh6'),('C7','scr2',1,'sh-23'),('C7','scr2',1,'sh-24'),('C7','scr2',1,'sh-25'),('C7','scr2',1,'sh12'),('C7','scr2',1,'sh2'),('C7','scr2',1,'sh7'),('C7','scr3',1,'sh13'),('C7','scr3',1,'sh3'),('C7','scr3',1,'sh8'),('C7','scr4',1,'sh14'),('C7','scr4',1,'sh4'),('C7','scr4',1,'sh9'),('C8','scr1',1,'sh1'),('C8','scr1',1,'sh10'),('C8','scr1',1,'sh11'),('C8','scr1',1,'sh15'),('C8','scr1',1,'sh22'),('C8','scr1',1,'sh5'),('C8','scr1',1,'sh6'),('C8','scr2',1,'sh-23'),('C8','scr2',1,'sh-24'),('C8','scr2',1,'sh-25'),('C8','scr2',1,'sh12'),('C8','scr2',1,'sh2'),('C8','scr2',1,'sh7'),('C8','scr3',1,'sh13'),('C8','scr3',1,'sh3'),('C8','scr3',1,'sh8'),('C8','scr4',1,'sh14'),('C8','scr4',1,'sh4'),('C8','scr4',1,'sh9'),('D1','scr1',0,'sh1'),('D1','scr1',1,'sh10'),('D1','scr1',1,'sh11'),('D1','scr1',1,'sh15'),('D1','scr1',1,'sh22'),('D1','scr1',1,'sh5'),('D1','scr1',1,'sh6'),('D1','scr2',1,'sh-23'),('D1','scr2',1,'sh-24'),('D1','scr2',1,'sh-25'),('D1','scr2',1,'sh12'),('D1','scr2',1,'sh2'),('D1','scr2',1,'sh7'),('D1','scr3',1,'sh13'),('D1','scr3',1,'sh3'),('D1','scr3',1,'sh8'),('D1','scr4',1,'sh14'),('D1','scr4',1,'sh4'),('D1','scr4',1,'sh9'),('D2','scr1',1,'sh1'),('D2','scr1',1,'sh10'),('D2','scr1',1,'sh11'),('D2','scr1',1,'sh15'),('D2','scr1',1,'sh22'),('D2','scr1',1,'sh5'),('D2','scr1',1,'sh6'),('D2','scr2',1,'sh-23'),('D2','scr2',1,'sh-24'),('D2','scr2',1,'sh-25'),('D2','scr2',1,'sh12'),('D2','scr2',1,'sh2'),('D2','scr2',1,'sh7'),('D2','scr3',1,'sh13'),('D2','scr3',1,'sh3'),('D2','scr3',1,'sh8'),('D2','scr4',1,'sh14'),('D2','scr4',1,'sh4'),('D2','scr4',1,'sh9'),('D3','scr1',1,'sh1'),('D3','scr1',1,'sh10'),('D3','scr1',1,'sh11'),('D3','scr1',1,'sh15'),('D3','scr1',1,'sh22'),('D3','scr1',1,'sh5'),('D3','scr1',1,'sh6'),('D3','scr2',1,'sh-23'),('D3','scr2',1,'sh-24'),('D3','scr2',1,'sh-25'),('D3','scr2',1,'sh12'),('D3','scr2',1,'sh2'),('D3','scr2',1,'sh7'),('D3','scr3',1,'sh13'),('D3','scr3',1,'sh3'),('D3','scr3',1,'sh8'),('D3','scr4',1,'sh14'),('D3','scr4',1,'sh4'),('D3','scr4',1,'sh9'),('D4','scr1',0,'sh1'),('D4','scr1',1,'sh10'),('D4','scr1',0,'sh11'),('D4','scr1',1,'sh15'),('D4','scr1',1,'sh22'),('D4','scr1',0,'sh5'),('D4','scr1',1,'sh6'),('D4','scr2',1,'sh-23'),('D4','scr2',1,'sh-24'),('D4','scr2',1,'sh-25'),('D4','scr2',1,'sh12'),('D4','scr2',1,'sh2'),('D4','scr2',1,'sh7'),('D4','scr3',1,'sh13'),('D4','scr3',1,'sh3'),('D4','scr3',1,'sh8'),('D4','scr4',1,'sh14'),('D4','scr4',1,'sh4'),('D4','scr4',1,'sh9'),('D5','scr1',0,'sh1'),('D5','scr1',1,'sh10'),('D5','scr1',0,'sh11'),('D5','scr1',1,'sh15'),('D5','scr1',1,'sh22'),('D5','scr1',1,'sh5'),('D5','scr1',1,'sh6'),('D5','scr2',1,'sh-23'),('D5','scr2',1,'sh-24'),('D5','scr2',1,'sh-25'),('D5','scr2',1,'sh12'),('D5','scr2',1,'sh2'),('D5','scr2',1,'sh7'),('D5','scr3',1,'sh13'),('D5','scr3',1,'sh3'),('D5','scr3',1,'sh8'),('D5','scr4',1,'sh14'),('D5','scr4',1,'sh4'),('D5','scr4',1,'sh9'),('D6','scr1',0,'sh1'),('D6','scr1',1,'sh10'),('D6','scr1',0,'sh11'),('D6','scr1',1,'sh15'),('D6','scr1',1,'sh22'),('D6','scr1',1,'sh5'),('D6','scr1',1,'sh6'),('D6','scr2',1,'sh-23'),('D6','scr2',1,'sh-24'),('D6','scr2',1,'sh-25'),('D6','scr2',1,'sh12'),('D6','scr2',1,'sh2'),('D6','scr2',1,'sh7'),('D6','scr3',1,'sh13'),('D6','scr3',1,'sh3'),('D6','scr3',1,'sh8'),('D6','scr4',1,'sh14'),('D6','scr4',1,'sh4'),('D6','scr4',1,'sh9'),('D7','scr1',0,'sh1'),('D7','scr1',1,'sh10'),('D7','scr1',0,'sh11'),('D7','scr1',1,'sh15'),('D7','scr1',1,'sh22'),('D7','scr1',1,'sh5'),('D7','scr1',1,'sh6'),('D7','scr2',1,'sh-23'),('D7','scr2',1,'sh-24'),('D7','scr2',1,'sh-25'),('D7','scr2',1,'sh12'),('D7','scr2',1,'sh2'),('D7','scr2',1,'sh7'),('D7','scr3',1,'sh13'),('D7','scr3',1,'sh3'),('D7','scr3',1,'sh8'),('D7','scr4',1,'sh14'),('D7','scr4',1,'sh4'),('D7','scr4',1,'sh9'),('D8','scr1',0,'sh1'),('D8','scr1',1,'sh10'),('D8','scr1',1,'sh11'),('D8','scr1',1,'sh15'),('D8','scr1',1,'sh22'),('D8','scr1',1,'sh5'),('D8','scr1',1,'sh6'),('D8','scr2',1,'sh-23'),('D8','scr2',1,'sh-24'),('D8','scr2',1,'sh-25'),('D8','scr2',1,'sh12'),('D8','scr2',1,'sh2'),('D8','scr2',1,'sh7'),('D8','scr3',1,'sh13'),('D8','scr3',1,'sh3'),('D8','scr3',1,'sh8'),('D8','scr4',1,'sh14'),('D8','scr4',1,'sh4'),('D8','scr4',1,'sh9'),('E1','scr1',1,'sh1'),('E1','scr1',1,'sh10'),('E1','scr1',1,'sh11'),('E1','scr1',1,'sh15'),('E1','scr1',1,'sh22'),('E1','scr1',1,'sh5'),('E1','scr1',1,'sh6'),('E1','scr2',1,'sh-23'),('E1','scr2',1,'sh-24'),('E1','scr2',1,'sh-25'),('E1','scr2',1,'sh12'),('E1','scr2',1,'sh2'),('E1','scr2',1,'sh7'),('E1','scr3',1,'sh13'),('E1','scr3',1,'sh3'),('E1','scr3',1,'sh8'),('E1','scr4',1,'sh14'),('E1','scr4',1,'sh4'),('E1','scr4',1,'sh9'),('E2','scr1',1,'sh1'),('E2','scr1',1,'sh10'),('E2','scr1',1,'sh11'),('E2','scr1',1,'sh15'),('E2','scr1',1,'sh22'),('E2','scr1',1,'sh5'),('E2','scr1',1,'sh6'),('E2','scr2',1,'sh-23'),('E2','scr2',1,'sh-24'),('E2','scr2',1,'sh-25'),('E2','scr2',1,'sh12'),('E2','scr2',1,'sh2'),('E2','scr2',1,'sh7'),('E2','scr3',1,'sh13'),('E2','scr3',1,'sh3'),('E2','scr3',1,'sh8'),('E2','scr4',1,'sh14'),('E2','scr4',1,'sh4'),('E2','scr4',1,'sh9'),('E3','scr1',1,'sh1'),('E3','scr1',1,'sh10'),('E3','scr1',1,'sh11'),('E3','scr1',1,'sh15'),('E3','scr1',1,'sh22'),('E3','scr1',1,'sh5'),('E3','scr1',1,'sh6'),('E3','scr2',1,'sh-23'),('E3','scr2',1,'sh-24'),('E3','scr2',1,'sh-25'),('E3','scr2',1,'sh12'),('E3','scr2',1,'sh2'),('E3','scr2',1,'sh7'),('E3','scr3',1,'sh13'),('E3','scr3',1,'sh3'),('E3','scr3',1,'sh8'),('E3','scr4',1,'sh14'),('E3','scr4',1,'sh4'),('E3','scr4',1,'sh9'),('E4','scr1',1,'sh1'),('E4','scr1',1,'sh10'),('E4','scr1',1,'sh11'),('E4','scr1',1,'sh15'),('E4','scr1',1,'sh22'),('E4','scr1',1,'sh5'),('E4','scr1',1,'sh6'),('E4','scr2',1,'sh-23'),('E4','scr2',1,'sh-24'),('E4','scr2',1,'sh-25'),('E4','scr2',1,'sh12'),('E4','scr2',1,'sh2'),('E4','scr2',1,'sh7'),('E4','scr3',1,'sh13'),('E4','scr3',1,'sh3'),('E4','scr3',1,'sh8'),('E4','scr4',1,'sh14'),('E4','scr4',1,'sh4'),('E4','scr4',1,'sh9'),('E5','scr1',0,'sh1'),('E5','scr1',1,'sh10'),('E5','scr1',1,'sh11'),('E5','scr1',1,'sh15'),('E5','scr1',1,'sh22'),('E5','scr1',1,'sh5'),('E5','scr1',1,'sh6'),('E5','scr2',1,'sh-23'),('E5','scr2',1,'sh-24'),('E5','scr2',1,'sh-25'),('E5','scr2',1,'sh12'),('E5','scr2',1,'sh2'),('E5','scr2',0,'sh7'),('E5','scr3',1,'sh13'),('E5','scr3',1,'sh3'),('E5','scr3',1,'sh8'),('E5','scr4',1,'sh14'),('E5','scr4',1,'sh4'),('E5','scr4',1,'sh9'),('E6','scr1',0,'sh1'),('E6','scr1',1,'sh10'),('E6','scr1',1,'sh11'),('E6','scr1',1,'sh15'),('E6','scr1',1,'sh22'),('E6','scr1',1,'sh5'),('E6','scr1',1,'sh6'),('E6','scr2',1,'sh-23'),('E6','scr2',1,'sh-24'),('E6','scr2',1,'sh-25'),('E6','scr2',1,'sh12'),('E6','scr2',1,'sh2'),('E6','scr2',1,'sh7'),('E6','scr3',1,'sh13'),('E6','scr3',1,'sh3'),('E6','scr3',1,'sh8'),('E6','scr4',1,'sh14'),('E6','scr4',1,'sh4'),('E6','scr4',1,'sh9'),('E7','scr1',1,'sh1'),('E7','scr1',1,'sh10'),('E7','scr1',1,'sh11'),('E7','scr1',1,'sh15'),('E7','scr1',1,'sh22'),('E7','scr1',1,'sh5'),('E7','scr1',1,'sh6'),('E7','scr2',1,'sh-23'),('E7','scr2',1,'sh-24'),('E7','scr2',1,'sh-25'),('E7','scr2',1,'sh12'),('E7','scr2',1,'sh2'),('E7','scr2',1,'sh7'),('E7','scr3',1,'sh13'),('E7','scr3',1,'sh3'),('E7','scr3',1,'sh8'),('E7','scr4',1,'sh14'),('E7','scr4',1,'sh4'),('E7','scr4',1,'sh9'),('E8','scr1',1,'sh1'),('E8','scr1',1,'sh10'),('E8','scr1',1,'sh11'),('E8','scr1',1,'sh15'),('E8','scr1',1,'sh22'),('E8','scr1',1,'sh5'),('E8','scr1',1,'sh6'),('E8','scr2',1,'sh-23'),('E8','scr2',1,'sh-24'),('E8','scr2',1,'sh-25'),('E8','scr2',1,'sh12'),('E8','scr2',1,'sh2'),('E8','scr2',1,'sh7'),('E8','scr3',1,'sh13'),('E8','scr3',1,'sh3'),('E8','scr3',1,'sh8'),('E8','scr4',1,'sh14'),('E8','scr4',1,'sh4'),('E8','scr4',1,'sh9'),('F1','scr1',1,'sh1'),('F1','scr1',1,'sh10'),('F1','scr1',1,'sh11'),('F1','scr1',1,'sh15'),('F1','scr1',1,'sh22'),('F1','scr1',1,'sh5'),('F1','scr1',1,'sh6'),('F1','scr2',1,'sh-23'),('F1','scr2',1,'sh-24'),('F1','scr2',1,'sh-25'),('F1','scr2',1,'sh12'),('F1','scr2',1,'sh2'),('F1','scr2',1,'sh7'),('F1','scr3',1,'sh13'),('F1','scr3',1,'sh3'),('F1','scr3',1,'sh8'),('F1','scr4',1,'sh14'),('F1','scr4',1,'sh4'),('F1','scr4',1,'sh9'),('F2','scr1',1,'sh1'),('F2','scr1',1,'sh10'),('F2','scr1',1,'sh11'),('F2','scr1',1,'sh15'),('F2','scr1',1,'sh22'),('F2','scr1',1,'sh5'),('F2','scr1',1,'sh6'),('F2','scr2',1,'sh-23'),('F2','scr2',1,'sh-24'),('F2','scr2',1,'sh-25'),('F2','scr2',1,'sh12'),('F2','scr2',1,'sh2'),('F2','scr2',1,'sh7'),('F2','scr3',1,'sh13'),('F2','scr3',1,'sh3'),('F2','scr3',1,'sh8'),('F2','scr4',1,'sh14'),('F2','scr4',1,'sh4'),('F2','scr4',1,'sh9'),('F3','scr1',0,'sh1'),('F3','scr1',1,'sh10'),('F3','scr1',1,'sh11'),('F3','scr1',1,'sh15'),('F3','scr1',1,'sh22'),('F3','scr1',1,'sh5'),('F3','scr1',1,'sh6'),('F3','scr2',1,'sh-23'),('F3','scr2',1,'sh-24'),('F3','scr2',1,'sh-25'),('F3','scr2',1,'sh12'),('F3','scr2',1,'sh2'),('F3','scr2',1,'sh7'),('F3','scr3',1,'sh13'),('F3','scr3',1,'sh3'),('F3','scr3',1,'sh8'),('F3','scr4',1,'sh14'),('F3','scr4',1,'sh4'),('F3','scr4',1,'sh9'),('F4','scr1',1,'sh1'),('F4','scr1',1,'sh10'),('F4','scr1',1,'sh11'),('F4','scr1',1,'sh15'),('F4','scr1',1,'sh22'),('F4','scr1',1,'sh5'),('F4','scr1',1,'sh6'),('F4','scr2',1,'sh-23'),('F4','scr2',1,'sh-24'),('F4','scr2',1,'sh-25'),('F4','scr2',1,'sh12'),('F4','scr2',1,'sh2'),('F4','scr2',1,'sh7'),('F4','scr3',1,'sh13'),('F4','scr3',1,'sh3'),('F4','scr3',1,'sh8'),('F4','scr4',1,'sh14'),('F4','scr4',1,'sh4'),('F4','scr4',1,'sh9'),('F5','scr1',0,'sh1'),('F5','scr1',0,'sh10'),('F5','scr1',0,'sh11'),('F5','scr1',0,'sh15'),('F5','scr1',1,'sh22'),('F5','scr1',0,'sh5'),('F5','scr1',0,'sh6'),('F5','scr2',1,'sh-23'),('F5','scr2',1,'sh-24'),('F5','scr2',1,'sh-25'),('F5','scr2',1,'sh12'),('F5','scr2',1,'sh2'),('F5','scr2',1,'sh7'),('F5','scr3',1,'sh13'),('F5','scr3',1,'sh3'),('F5','scr3',1,'sh8'),('F5','scr4',1,'sh14'),('F5','scr4',1,'sh4'),('F5','scr4',1,'sh9'),('F6','scr1',0,'sh1'),('F6','scr1',1,'sh10'),('F6','scr1',1,'sh11'),('F6','scr1',1,'sh15'),('F6','scr1',1,'sh22'),('F6','scr1',1,'sh5'),('F6','scr1',1,'sh6'),('F6','scr2',1,'sh-23'),('F6','scr2',1,'sh-24'),('F6','scr2',1,'sh-25'),('F6','scr2',1,'sh12'),('F6','scr2',1,'sh2'),('F6','scr2',1,'sh7'),('F6','scr3',1,'sh13'),('F6','scr3',1,'sh3'),('F6','scr3',1,'sh8'),('F6','scr4',1,'sh14'),('F6','scr4',1,'sh4'),('F6','scr4',1,'sh9'),('F7','scr1',0,'sh1'),('F7','scr1',1,'sh10'),('F7','scr1',1,'sh11'),('F7','scr1',1,'sh15'),('F7','scr1',1,'sh22'),('F7','scr1',1,'sh5'),('F7','scr1',0,'sh6'),('F7','scr2',1,'sh-23'),('F7','scr2',1,'sh-24'),('F7','scr2',1,'sh-25'),('F7','scr2',1,'sh12'),('F7','scr2',1,'sh2'),('F7','scr2',1,'sh7'),('F7','scr3',1,'sh13'),('F7','scr3',1,'sh3'),('F7','scr3',1,'sh8'),('F7','scr4',1,'sh14'),('F7','scr4',1,'sh4'),('F7','scr4',1,'sh9'),('F8','scr1',0,'sh1'),('F8','scr1',1,'sh10'),('F8','scr1',1,'sh11'),('F8','scr1',1,'sh15'),('F8','scr1',1,'sh22'),('F8','scr1',1,'sh5'),('F8','scr1',1,'sh6'),('F8','scr2',1,'sh-23'),('F8','scr2',1,'sh-24'),('F8','scr2',1,'sh-25'),('F8','scr2',1,'sh12'),('F8','scr2',1,'sh2'),('F8','scr2',1,'sh7'),('F8','scr3',1,'sh13'),('F8','scr3',1,'sh3'),('F8','scr3',1,'sh8'),('F8','scr4',1,'sh14'),('F8','scr4',1,'sh4'),('F8','scr4',1,'sh9');
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Show`
--

DROP TABLE IF EXISTS `Show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Show` (
  `ShowID` varchar(36) NOT NULL,
  `Movie_ID` varchar(36) NOT NULL,
  `Screen_ID` varchar(36) NOT NULL,
  `Date` date NOT NULL,
  `Start_Time` time NOT NULL,
  PRIMARY KEY (`ShowID`),
  KEY `idx_show_date` (`Date`),
  KEY `FK_Show_Movie` (`Movie_ID`),
  KEY `FK_Show_Screen` (`Screen_ID`),
  CONSTRAINT `FK_Show_Movie` FOREIGN KEY (`Movie_ID`) REFERENCES `Movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Show_Screen` FOREIGN KEY (`Screen_ID`) REFERENCES `Screen` (`Screen_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Show`
--

LOCK TABLES `Show` WRITE;
/*!40000 ALTER TABLE `Show` DISABLE KEYS */;
INSERT INTO `Show` VALUES ('sh-23','mov6','scr2','2024-11-14','18:00:00'),('sh-24','mov6','scr2','2024-11-14','18:00:00'),('sh-25','mov1','scr2','2024-11-14','20:00:00'),('sh1','mov1','scr1','2024-11-13','10:00:00'),('sh10','mov1','scr1','2024-11-14','21:00:00'),('sh11','mov3','scr1','2024-11-15','11:00:00'),('sh12','mov4','scr2','2024-11-15','14:30:00'),('sh13','mov5','scr3','2024-11-15','17:00:00'),('sh14','mov1','scr4','2024-11-15','19:30:00'),('sh15','mov2','scr1','2024-11-15','22:00:00'),('sh2','mov2','scr2','2024-11-13','11:30:00'),('sh22','mov1','scr1','2024-12-01','18:00:00'),('sh3','mov3','scr3','2024-11-13','14:00:00'),('sh4','mov4','scr4','2024-11-13','16:30:00'),('sh5','mov5','scr1','2024-11-13','19:00:00'),('sh6','mov2','scr1','2024-11-14','10:00:00'),('sh7','mov3','scr2','2024-11-14','13:30:00'),('sh8','mov4','scr3','2024-11-14','16:00:00'),('sh9','mov5','scr4','2024-11-14','18:30:00');
/*!40000 ALTER TABLE `Show` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_show_insert` AFTER INSERT ON `show` FOR EACH ROW BEGIN
    
    INSERT INTO Seat (Seat_No, Screen_ID, Available, ShowID)
    SELECT 
        CONCAT(
            CHAR(65 + (numbers.number DIV 8)), 
            ((numbers.number % 8) + 1) 
        ) AS Seat_No,
        screens.Screen_ID,  
        TRUE AS Available,   
        NEW.ShowID           
    FROM 
        (SELECT 0 AS number UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 
         UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 
         UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 
         UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 
         UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 
         UNION SELECT 30 UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 
         UNION SELECT 35 UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 
         UNION SELECT 40 UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 
         UNION SELECT 45 UNION SELECT 46 UNION SELECT 47) numbers
    CROSS JOIN
        (SELECT Screen_ID FROM Screen WHERE Screen_ID = NEW.Screen_ID) screens
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Seat 
        WHERE Seat.Seat_No = CONCAT(CHAR(65 + (numbers.number DIV 8)), ((numbers.number % 8) + 1)) 
        AND Seat.Screen_ID = screens.Screen_ID
        AND Seat.ShowID = NEW.ShowID
    );
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_seats_before_show_delete` BEFORE DELETE ON `show` FOR EACH ROW BEGIN
    
    DELETE FROM Seat
    WHERE ShowID = OLD.ShowID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `TID` varchar(36) NOT NULL,
  `ShowID` varchar(36) NOT NULL,
  `CID` varchar(36) NOT NULL,
  `Seat_No` varchar(10) NOT NULL,
  `Screen_ID` varchar(36) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `UserID` varchar(36) NOT NULL,
  PRIMARY KEY (`TID`),
  KEY `idx_ticket_customer` (`CID`),
  KEY `idx_ticket_show` (`ShowID`),
  KEY `FK_Ticket_Seat` (`Seat_No`,`Screen_ID`),
  CONSTRAINT `FK_Ticket_Customer` FOREIGN KEY (`CID`) REFERENCES `Customer` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Seat` FOREIGN KEY (`Seat_No`, `Screen_ID`) REFERENCES `Seat` (`Seat_No`, `Screen_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Show` FOREIGN KEY (`ShowID`) REFERENCES `Show` (`ShowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES ('01dd9c2c-ec8e-4919-b727-be1a13885093','sh11','f4867c61-fc97-4a08-a99c-51f84422fbdc','D7','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('056f29c7-cc86-4829-b9ee-daae77387e88','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C5','scr1',10.00,''),('0ab2c93b-1db1-411a-9ed7-dce6e991e158','sh1','48f03791-8509-48ab-902e-7f3c7bc12263','D8','scr1',10.00,''),('123fa217-5d6b-4ac4-a32c-4442a87166ee','sh1','e9559f96-8194-427b-a94c-84e4c69de170','F3','scr1',10.00,''),('16f8b751-6cab-4d33-a881-d526a4a4369b','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C6','scr1',10.00,''),('35cfe444-d374-4dc8-8644-b802a39679fb','sh1','e918e122-02a2-426c-9ef7-3cf9cd2fef5a','D7','scr1',10.00,''),('37e00efd-7da7-434f-8eac-17fcdf6c5009','sh11','f4867c61-fc97-4a08-a99c-51f84422fbdc','D4','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('391bd45d-580b-4664-bc8a-3febb7440567','sh11','f4867c61-fc97-4a08-a99c-51f84422fbdc','D5','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('392397aa-59cb-4163-b36c-171d06763c2e','sh7','79f8f35e-32fe-4539-8e0d-be3ca882f830','E5','scr2',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('3bdb9e48-d467-4e59-a3f7-b43b4f5433ae','sh-23','eb47d65b-3f0d-4b90-9b8c-9d5fd61a1480','C4','scr2',10.00,''),('517a7247-e7c6-4db6-8e21-972cf587fed3','sh10','da2e591b-e420-4f70-8835-d28407b754ea','C3','scr1',10.00,''),('56f798e5-8cd4-4f08-92e2-ed0106015614','sh1','c10e7715-07b0-47bb-b025-c095521170c0','E6','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('5c7feee5-3fce-4ef6-87f9-1dffd9ab2902','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C1','scr1',10.00,''),('5e8317b3-9b29-457d-a4a6-9d3e2a92cd2c','sh1','503a7134-c20b-403b-8ba6-1ba5e6b49a0a','F8','scr1',10.00,'0e5a1e68-a43a-11ef-962c-8edca4a23d4a'),('652f6454-75c7-44c5-acaf-45e29d50d063','sh1','312c29f4-a1cb-4a21-b75d-e3be2b93b411','F5','scr1',10.00,''),('69a4b58b-a792-4fc7-9734-56fe1332a015','sh1','c10e7715-07b0-47bb-b025-c095521170c0','E5','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('6e5a7466-42da-4d50-8a44-8aaf301aca3c','sh1','e33bf45f-606f-4c78-ab81-7e7c82865f4b','B8','scr1',10.00,''),('79a85d37-b968-48e1-9462-9c4b7163119b','sh1','80aad05d-f882-4490-92c7-07f0fb1093d7','D5','scr1',10.00,''),('925d54b3-52b9-44aa-9601-4278fdad6ea4','sh1','b5795c78-7e55-4391-bde7-f0750fa1747d','D6','scr1',10.00,''),('9619146b-c316-4968-934b-53aa8876ab49','sh5','a2a52128-72b5-4323-8fb6-146207025c76','D4','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('99c9c666-8ac4-443a-b4b8-896c9955ca9d','sh10','da2e591b-e420-4f70-8835-d28407b754ea','C2','scr1',10.00,''),('a740dfe9-40a8-4ece-93b6-327ccc8d1f04','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C3','scr1',10.00,''),('af1453e9-9ecf-44d3-8783-fcc6714380db','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C2','scr1',10.00,''),('af443015-dfa9-4c92-aa5a-9ec88558b433','sh1','e3a6589d-019a-4ed2-9039-d27427f33d33','C4','scr1',10.00,''),('b57740c9-66bd-4b53-9637-eb99091e17da','sh1','046430e0-d8ef-4956-9d9f-702f38bf221d','D1','scr1',10.00,''),('b66366ff-b2e7-4d3f-b18a-9ee47ca1be29','sh1','e33bf45f-606f-4c78-ab81-7e7c82865f4b','B7','scr1',10.00,''),('c425087c-fbbc-4227-a455-6184ea3dc404','sh6','05af00b9-d90b-49b8-9d0d-ce4f1acd66fd','F7','scr1',10.00,''),('d77f8a3c-2730-4ef2-9ae1-2a520fb39d33','sh1','70f315dd-e505-454a-a0ca-e657ceff468e','F7','scr1',10.00,''),('dd9c77ed-452f-460f-bf4e-edef984230ee','sh1','4e9cac62-130c-4e99-aa73-06723ea842e6','F6','scr1',10.00,''),('f3828598-fe0d-48b0-b67a-2e339d6b1621','sh11','f4867c61-fc97-4a08-a99c-51f84422fbdc','D6','scr1',10.00,'19da8e83-a5bc-4bf3-9657-cfe3b098506f'),('fd5655fa-5c03-42b2-94fd-98a3d5a4281e','sh1','bfb0dff5-9735-4dd9-980d-bff329812d27','D4','scr1',10.00,''),('tkt1','sh1','cust1','A1','scr1',15.00,''),('tkt2','sh1','cust1','A2','scr1',15.00,''),('tkt3','sh2','cust2','B3','scr2',12.50,'');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` varchar(36) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('admin','customer') DEFAULT 'customer',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('0e5a1e68-a43a-11ef-962c-8edca4a23d4a','customer1','customer1','customer'),('19da8e83-a5bc-4bf3-9657-cfe3b098506f','Aneesh','aneesh200','customer'),('221ef1f8-a43a-11ef-962c-8edca4a23d4a','admin','admin','admin'),('55e6f312-6796-4785-a1b4-1d2ae3f2d895','admin2','admin2','admin');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 13:22:07

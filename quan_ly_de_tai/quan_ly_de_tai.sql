-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: quan_ly_de_tai
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bomon`
--

DROP TABLE IF EXISTS `bomon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomon` (
  `MABM` int NOT NULL,
  `TENBM` varchar(100) DEFAULT NULL,
  `PHONG` varchar(100) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `TRUONGBM` int DEFAULT NULL,
  `MAKHOA` int DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MABM`),
  KEY `MAKHOA` (`MAKHOA`),
  KEY `TRUONGBM` (`TRUONGBM`),
  CONSTRAINT `bomon_ibfk_1` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`),
  CONSTRAINT `bomon_ibfk_2` FOREIGN KEY (`TRUONGBM`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon`
--

LOCK TABLES `bomon` WRITE;
/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chude`
--

DROP TABLE IF EXISTS `chude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chude` (
  `MACD` int NOT NULL AUTO_INCREMENT,
  `TENCD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MACD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chude`
--

LOCK TABLES `chude` WRITE;
/*!40000 ALTER TABLE `chude` DISABLE KEYS */;
/*!40000 ALTER TABLE `chude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congviec`
--

DROP TABLE IF EXISTS `congviec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congviec` (
  `MADT` int DEFAULT NULL,
  `SOTT` int NOT NULL,
  `TENCV` varchar(50) DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  PRIMARY KEY (`SOTT`),
  KEY `MADT` (`MADT`),
  CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`MADT`) REFERENCES `detai` (`MADT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congviec`
--

LOCK TABLES `congviec` WRITE;
/*!40000 ALTER TABLE `congviec` DISABLE KEYS */;
/*!40000 ALTER TABLE `congviec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detai`
--

DROP TABLE IF EXISTS `detai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detai` (
  `MADT` int NOT NULL AUTO_INCREMENT,
  `TENDT` varchar(50) DEFAULT NULL,
  `CAPQL` varchar(15) DEFAULT NULL,
  `KINHPHI` double DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  `MACD` int DEFAULT NULL,
  `GVCNDT` int DEFAULT NULL,
  PRIMARY KEY (`MADT`),
  KEY `GVCNDT` (`GVCNDT`),
  KEY `MACD` (`MACD`),
  CONSTRAINT `detai_ibfk_1` FOREIGN KEY (`GVCNDT`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `detai_ibfk_2` FOREIGN KEY (`MACD`) REFERENCES `chude` (`MACD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detai`
--

LOCK TABLES `detai` WRITE;
/*!40000 ALTER TABLE `detai` DISABLE KEYS */;
/*!40000 ALTER TABLE `detai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaovien`
--

DROP TABLE IF EXISTS `giaovien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien` (
  `MAGV` int NOT NULL,
  `HOTEN` varchar(100) NOT NULL,
  `LUONG` double NOT NULL,
  `GENDER` bit(1) NOT NULL,
  `DOB` date DEFAULT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `GVQLCM` varchar(100) DEFAULT NULL,
  `MABM` int DEFAULT NULL,
  PRIMARY KEY (`MAGV`),
  KEY `MABM` (`MABM`),
  CONSTRAINT `giaovien_ibfk_1` FOREIGN KEY (`MABM`) REFERENCES `bomon` (`MABM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaovien`
--

LOCK TABLES `giaovien` WRITE;
/*!40000 ALTER TABLE `giaovien` DISABLE KEYS */;
/*!40000 ALTER TABLE `giaovien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gv_dt`
--

DROP TABLE IF EXISTS `gv_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gv_dt` (
  `PHONE` double NOT NULL,
  `MAGV` int DEFAULT NULL,
  PRIMARY KEY (`PHONE`),
  KEY `MAGV` (`MAGV`),
  CONSTRAINT `gv_dt_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gv_dt`
--

LOCK TABLES `gv_dt` WRITE;
/*!40000 ALTER TABLE `gv_dt` DISABLE KEYS */;
/*!40000 ALTER TABLE `gv_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MAKHOA` int NOT NULL AUTO_INCREMENT,
  `TENKHOA` varchar(50) DEFAULT NULL,
  `NAMTL` int DEFAULT NULL,
  `PHONG` varchar(15) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `TRUONGKHOA` int DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MAKHOA`),
  KEY `TRUONGKHOA` (`TRUONGKHOA`),
  CONSTRAINT `khoa_ibfk_1` FOREIGN KEY (`TRUONGKHOA`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoithan`
--

DROP TABLE IF EXISTS `nguoithan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoithan` (
  `MAGV` int DEFAULT NULL,
  `TEN` varchar(100) NOT NULL,
  `DOB` date DEFAULT NULL,
  `GENDER` bit(1) DEFAULT NULL,
  PRIMARY KEY (`TEN`),
  KEY `MAGV` (`MAGV`),
  CONSTRAINT `nguoithan_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoithan`
--

LOCK TABLES `nguoithan` WRITE;
/*!40000 ALTER TABLE `nguoithan` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoithan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thamgiadt`
--

DROP TABLE IF EXISTS `thamgiadt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thamgiadt` (
  `MAGV` int DEFAULT NULL,
  `MADT` int DEFAULT NULL,
  `STT` int NOT NULL,
  `PHUCAP` double DEFAULT NULL,
  `KETQUA` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`STT`),
  KEY `MAGV` (`MAGV`),
  KEY `MADT` (`MADT`),
  CONSTRAINT `thamgiadt_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `thamgiadt_ibfk_2` FOREIGN KEY (`MADT`) REFERENCES `detai` (`MADT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thamgiadt`
--

LOCK TABLES `thamgiadt` WRITE;
/*!40000 ALTER TABLE `thamgiadt` DISABLE KEYS */;
/*!40000 ALTER TABLE `thamgiadt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 17:03:47

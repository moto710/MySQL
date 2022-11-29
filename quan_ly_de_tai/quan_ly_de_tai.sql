-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: newschema
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
  `MABM` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TENBM` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PHONG` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DIENTHOAI` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TRUONGBM` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MAKHOA` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MABM`),
  KEY `FK_BOMON_GIAOVIEN` (`TRUONGBM`),
  KEY `FK_BOMON_KHOA` (`MAKHOA`),
  CONSTRAINT `FK_BOMON_GIAOVIEN` FOREIGN KEY (`TRUONGBM`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `FK_BOMON_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bomon`
--

LOCK TABLES `bomon` WRITE;
/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
INSERT INTO `bomon` VALUES ('CNTT','Công nghệ tri thức','B15','0838126126',NULL,'CNTT',NULL),('HHC','Hóa hữu cơ','B44','838222222',NULL,'HH',NULL),('HL','Hóa lý','B42','0838878787',NULL,'HH',NULL),('HPT','Hóa phân tích','B43','0838777777','007','HH','2007-10-15'),('HTTT','Hệ thống thông tin','B13','0838125125','002','CNTT','2004-09-20'),('MMT','Mạng máy tính','B16','0838676767','001','CNTT','2005-05-15'),('SH','Sinh hóa','B33','0838898989',NULL,'SH',NULL),('VLƯD','Vật lý ứng dụng','B24','0838454545','005','VL','2006-02-18'),('VLĐT','Vật lý điện tử','B23','0838234234',NULL,'VL',NULL),('VS','Vi sinh','B32','0838909090','004','SH','2007-01-01');
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chude`
--

DROP TABLE IF EXISTS `chude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chude` (
  `MACD` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TENCD` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MACD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chude`
--

LOCK TABLES `chude` WRITE;
/*!40000 ALTER TABLE `chude` DISABLE KEYS */;
INSERT INTO `chude` VALUES ('NCPT','Nghiên cứu phát triển'),('QLGD','Quản lý giáo dục'),('ƯDCN','Ứng dụng công nghệ');
/*!40000 ALTER TABLE `chude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congviec`
--

DROP TABLE IF EXISTS `congviec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congviec` (
  `MADT` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SOTT` int NOT NULL,
  `TENCV` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  PRIMARY KEY (`MADT`,`SOTT`),
  CONSTRAINT `FK_CONGVIEC_DETAI` FOREIGN KEY (`MADT`) REFERENCES `detai` (`MADT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congviec`
--

LOCK TABLES `congviec` WRITE;
/*!40000 ALTER TABLE `congviec` DISABLE KEYS */;
INSERT INTO `congviec` VALUES ('001',1,'Khởi tạo và Lập kế hoạch','2007-10-20','2008-12-20'),('001',2,'Xác định yêu cầu','2008-12-21','2008-03-21'),('001',3,'Phân tích hệ thống','2008-03-22','2008-05-22'),('001',4,'Thiết kế hệ thống','2008-05-23','2008-06-23'),('001',5,'Cài đặt thử nghiệm','2008-06-24','2008-10-20'),('002',1,'Khởi tạo và Lập kế hoạch','2009-05-10','2009-07-10'),('002',2,'Xác định yêu cầu','2009-07-11','2009-10-11'),('002',3,'Phân tích hệ thống','2009-10-12','2009-12-20'),('002',4,'Thiết kế hệ thống','2009-12-21','2010-03-22'),('002',5,'Cài đặt thử nghiệm','2010-03-23','2010-05-10'),('006',1,'Lấy mẫu','2006-10-20','2007-02-20'),('006',2,'Nuôi cấy','2007-02-21','2008-08-21');
/*!40000 ALTER TABLE `congviec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detai`
--

DROP TABLE IF EXISTS `detai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detai` (
  `MADT` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TENDT` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CAPQL` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `KINHPHI` decimal(10,1) DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  `MACD` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GVCNDT` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MADT`),
  KEY `FK_DETAI_CHUDE` (`MACD`),
  KEY `FK_DETAI_GIAOVIEN` (`GVCNDT`),
  CONSTRAINT `FK_DETAI_CHUDE` FOREIGN KEY (`MACD`) REFERENCES `chude` (`MACD`),
  CONSTRAINT `FK_DETAI_GIAOVIEN` FOREIGN KEY (`GVCNDT`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detai`
--

LOCK TABLES `detai` WRITE;
/*!40000 ALTER TABLE `detai` DISABLE KEYS */;
INSERT INTO `detai` VALUES ('001','HTTT quản lý các trường ĐH','ĐHQG',20.0,'2004-10-20','2008-10-20','QLGD','002'),('002','HTTT quản lý giáo vụ cho một khoa','Trường',20.0,'2000-10-12','2001-10-12','QLGD','002'),('003','Nghiên cứu chế tạo sợi Nanô Platin','ĐHQG',300.0,'2008-05-15','2010-05-15','NCPT','005'),('004','Tạo vật liệu sinh học bằng màng ối người','Nhà nước',100.0,'2007-01-01','2009-12-31','NCPT','004'),('005','Ứng dụng hóa học xanh','Trường',200.0,'2003-10-10','2004-12-10','ƯDCN','007'),('006','Nghiên cứu tế bào gốc','Nhà nước',4000.0,'2006-10-20','2009-10-20','NCPT','004'),('007','HTTT quản lý thư viện ở các trường đại học','Trường',20.0,'2009-05-10','2010-05-10','QLGD','001');
/*!40000 ALTER TABLE `detai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaovien`
--

DROP TABLE IF EXISTS `giaovien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien` (
  `MAGV` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `HOTEN` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LUONG` decimal(10,1) DEFAULT NULL,
  `PHAI` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGSINH` date DEFAULT NULL,
  `DIACHI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GVQLCM` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MABM` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`),
  KEY `FK_GIAOVIEN_BOMON` (`MABM`),
  KEY `FK_GIAOVIEN_GIAOVIEN` (`GVQLCM`),
  CONSTRAINT `FK_GIAOVIEN_BOMON` FOREIGN KEY (`MABM`) REFERENCES `bomon` (`MABM`),
  CONSTRAINT `FK_GIAOVIEN_GIAOVIEN` FOREIGN KEY (`GVQLCM`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `C_PHAI_GIAOVIEN` CHECK ((`PHAI` in (_utf8mb3'Nam',_utf8mb3'Nữ')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaovien`
--

LOCK TABLES `giaovien` WRITE;
/*!40000 ALTER TABLE `giaovien` DISABLE KEYS */;
INSERT INTO `giaovien` VALUES ('001','Nguyễn Hoài An',2000.0,'Nam','1973-02-15','25/3 Lạc Long Quân, Q.10, TP HCM',NULL,'MMT'),('002','Trần Trà Hương',2500.0,'Nữ','1960-06-20','125 Trần Hưng Đạo, Q.1, TP HCM',NULL,'HTTT'),('003','Nguyễn Ngọc Ánh',2200.0,'Nữ','1975-05-11','12/21 Võ Văn Ngân Thủ Đức, TP HCM','002','HTTT'),('004','Trương Nam Sơn',2300.0,'Nam','1959-06-20','215 Lý Thường Kiệt, TP Biên Hòa',NULL,'VS'),('005','Lý Hoàng Hà',2500.0,'Nam','1954-10-23','22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM',NULL,'VLĐT'),('006','Trần Bạch Tuyết',1500.0,'Nữ','1980-05-20','127 Hùng Vương, TP Mỹ Tho','004','VS'),('007','Nguyễn An Trung',2100.0,'Nam','1976-06-05','234 3/2, TP Biên Hòa',NULL,'HPT'),('008','Trần Trung Hiếu',1800.0,'Nam','1977-08-06','22/11 Lý Thường Kiệt','007','HPT'),('009','Trần Hoàng Nam',2000.0,'Nam','1975-11-22','234 Trần Não, An Phú, TP HCM','001','MMT'),('010','Phạm Nam Thanh',1500.0,'Nam','1980-12-12','221 Hùng Vương, Q.5, TP HCM','007','HPT');
/*!40000 ALTER TABLE `giaovien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gv_dt`
--

DROP TABLE IF EXISTS `gv_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gv_dt` (
  `MAGV` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DIENTHOAI` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MAGV`,`DIENTHOAI`),
  CONSTRAINT `FK_GV_DT_GIAOVIEN` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gv_dt`
--

LOCK TABLES `gv_dt` WRITE;
/*!40000 ALTER TABLE `gv_dt` DISABLE KEYS */;
INSERT INTO `gv_dt` VALUES ('001','0838912112'),('001','0903123123'),('002','0913454545'),('003','0838121212'),('003','0903656565'),('003','0937125125'),('006','0937888888'),('008','0653717171'),('008','0913232323');
/*!40000 ALTER TABLE `gv_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MAKHOA` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TENKHOA` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAMTL` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PHONG` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DIENTHOAI` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TRUONGKHOA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MAKHOA`),
  KEY `FK_KHOA_GIAOVIEN` (`TRUONGKHOA`),
  CONSTRAINT `FK_KHOA_GIAOVIEN` FOREIGN KEY (`TRUONGKHOA`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES ('CNTT','Công nghệ thông tin','1995','B11','0838123456','002','2005-02-20'),('HH','Sinh học','1980','B41','0838456465','007','2001-10-15'),('SH',' Hóa học','1980','B31','0838454545','004','2000-10-11'),('VL','Vật lý','1976','B21','0838223223','005','2003-09-18');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoithan`
--

DROP TABLE IF EXISTS `nguoithan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoithan` (
  `MAGV` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TEN` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NGSINH` date DEFAULT NULL,
  `PHAI` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`,`TEN`),
  CONSTRAINT `FK_NGUOITHAN_GIAOVIEN` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `C_PHAI_NGUOITHAN` CHECK ((`PHAI` in (_utf8mb3'Nam',_utf8mb3'Nữ')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoithan`
--

LOCK TABLES `nguoithan` WRITE;
/*!40000 ALTER TABLE `nguoithan` DISABLE KEYS */;
INSERT INTO `nguoithan` VALUES ('001','Hùng','1990-01-14','Nam'),('001','Thủy','1994-12-05','Nữ'),('003','Hà','1997-09-03','Nữ'),('003','Thu','1998-09-03','Nữ'),('007','Mai','2003-03-26','Nữ'),('007','Vy','2000-02-14','Nữ'),('008','Nam','1991-05-06','Nam'),('009','An','1996-08-19','Nam'),('010','Nguyệt','2006-01-14','Nữ');
/*!40000 ALTER TABLE `nguoithan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thamgiadt`
--

DROP TABLE IF EXISTS `thamgiadt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thamgiadt` (
  `MAGV` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MADT` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `STT` int NOT NULL,
  `PHUCAP` decimal(5,1) DEFAULT NULL,
  `KETQUA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`,`MADT`,`STT`),
  KEY `FK_THAMGIADT_CONGVIEC` (`MADT`,`STT`),
  CONSTRAINT `FK_THAMGIADT_CONGVIEC` FOREIGN KEY (`MADT`, `STT`) REFERENCES `congviec` (`MADT`, `SOTT`),
  CONSTRAINT `FK_THAMGIADT_GIAOVIEN` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thamgiadt`
--

LOCK TABLES `thamgiadt` WRITE;
/*!40000 ALTER TABLE `thamgiadt` DISABLE KEYS */;
INSERT INTO `thamgiadt` VALUES ('001','002',1,0.0,NULL),('001','002',2,2.0,NULL),('002','001',4,2.0,'Đạt'),('003','001',1,1.0,'Đạt'),('003','001',2,0.0,'Đạt'),('003','001',4,1.0,'Đạt'),('003','002',2,0.0,NULL),('004','006',1,0.0,'Đạt'),('004','006',2,1.0,'Đạt'),('006','006',2,1.5,'Đạt'),('009','002',3,0.5,NULL),('009','002',4,1.5,NULL);
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

-- Dump completed on 2022-11-29 17:25:24

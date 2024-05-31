-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for library
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;

-- Dumping structure for table library.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table library.admin: ~0 rows (approximately)
DELETE FROM `admin`;
INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
	(1, 'Kus69', 'Kus69@gmail.com', 'admin', 'e6e061838856bf47e1de730719fb2609', '2024-05-20 13:36:04');

-- Dumping structure for table library.booktype
CREATE TABLE IF NOT EXISTS `booktype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Jenis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.booktype: ~2 rows (approximately)
DELETE FROM `booktype`;
INSERT INTO `booktype` (`id`, `Jenis`) VALUES
	(1, 'Fisik'),
	(2, 'E-book');

-- Dumping structure for table library.tblauthors
CREATE TABLE IF NOT EXISTS `tblauthors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblauthors: ~4 rows (approximately)
DELETE FROM `tblauthors`;
INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
	(10, 'Deo', '2024-05-20 13:40:28', NULL),
	(11, 'Whisnu', '2024-05-20 13:50:21', NULL);

-- Dumping structure for table library.tblbooks
CREATE TABLE IF NOT EXISTS `tblbooks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int DEFAULT NULL,
  `AuthorId` int DEFAULT NULL,
  `ISBNNumber` int DEFAULT NULL,
  `BookPrice` int DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `BookTypeId` int DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(150) DEFAULT NULL,
  `deskripsi` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblbooks: ~11 rows (approximately)
DELETE FROM `tblbooks`;
INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `BookTypeId`, `UpdationDate`, `path`, `deskripsi`) VALUES
	(2, 'aa', 4, 10, 122, 5, '2024-05-30 15:31:04', 2, '2024-05-30 15:56:40', NULL, NULL),
	(3, 'bb', 4, 10, 22, 2, '2024-05-30 15:31:30', 2, '2024-05-30 15:31:31', NULL, NULL),
	(4, 'WW', 4, 10, 112, 98, '2024-05-28 19:00:26', 1, '2024-05-30 15:34:14', '/Tugas Kelompok 1-rev2/ebooks/ArenaVariablesGuide.pdf', NULL),
	(5, 'cc', 4, 10, 122, 1, '2024-05-30 15:31:04', 2, '2024-05-30 15:54:54', NULL, NULL),
	(6, 'dd', 4, 10, 22, 2, '2024-05-30 15:31:30', 2, '2024-05-30 15:54:55', NULL, NULL),
	(7, 'ee', 4, 10, 112, 98, '2024-05-28 19:00:26', 1, '2024-05-30 15:55:01', '/Tugas Kelompok 1-rev2/ebooks/ArenaVariablesGuide.pdf', NULL),
	(8, 'ff', 4, 10, 123, NULL, '2024-05-30 16:13:30', 1, NULL, NULL, NULL),
	(9, 'ff', 4, 10, 12, NULL, '2024-05-30 16:14:15', 1, NULL, NULL, NULL),
	(10, 'ff', 5, 10, 12, NULL, '2024-05-30 16:14:43', 1, NULL, NULL, NULL),
	(11, 'aa', 6, 10, 12, NULL, '2024-05-30 16:15:11', 1, NULL, NULL, NULL),
	(12, 'asd', 4, 10, 12, 12, '2024-05-30 16:17:35', 1, NULL, NULL, NULL);

-- Dumping structure for table library.tblbooksreq
CREATE TABLE IF NOT EXISTS `tblbooksreq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int DEFAULT NULL,
  `AuthorId` int DEFAULT NULL,
  `ISBNNumber` int DEFAULT NULL,
  `BookPrice` int DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `BookTypeId` int DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(150) DEFAULT NULL,
  `deskripsi` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblbooksreq: ~3 rows (approximately)
DELETE FROM `tblbooksreq`;
INSERT INTO `tblbooksreq` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `BookTypeId`, `UpdationDate`, `path`, `deskripsi`) VALUES
	(8, 'ff', 5, 10, 12, 12, '2024-05-30 16:16:12', 1, NULL, NULL, NULL),
	(9, 'a', 4, 10, 1, 1, '2024-05-30 16:16:43', 1, NULL, NULL, NULL),
	(10, 'gg', 5, 10, 12, 12, '2024-05-30 16:19:12', 1, NULL, NULL, NULL),
	(11, 'aav', 4, 10, 12, 12, '2024-05-30 16:48:55', 1, NULL, NULL, NULL),
	(12, 'agf', 4, 10, 23, NULL, '2024-05-30 16:53:44', 1, NULL, NULL, NULL);

-- Dumping structure for table library.tblcategory
CREATE TABLE IF NOT EXISTS `tblcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblcategory: ~4 rows (approximately)
DELETE FROM `tblcategory`;
INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
	(4, 'Romantic', 1, '2017-07-04 18:35:25', '2017-07-06 16:00:42'),
	(5, 'Technology', 1, '2017-07-04 18:35:39', '2017-07-08 17:13:03'),
	(6, 'Science', 1, '2017-07-04 18:35:55', '0000-00-00 00:00:00'),
	(7, 'Management', 0, '2017-07-04 18:36:16', '0000-00-00 00:00:00'),
	(8, 'Engineering', 1, '2024-05-28 09:51:02', '2024-05-28 18:53:06');

-- Dumping structure for table library.tblissuedbookdetails
CREATE TABLE IF NOT EXISTS `tblissuedbookdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BookId` int DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `RetrunStatus` int DEFAULT NULL,
  `fine` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblissuedbookdetails: ~0 rows (approximately)
DELETE FROM `tblissuedbookdetails`;
INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
	(1, 1, 'SID002', '2017-07-15 06:09:47', '2017-07-15 11:15:20', 1, 0),
	(2, 1, 'SID002', '2017-07-15 06:12:27', '2017-07-15 11:15:23', 1, 5),
	(3, 3, 'SID002', '2017-07-15 06:13:40', '2024-05-19 16:31:54', 1, 0),
	(4, 3, 'SID002', '2017-07-15 06:23:23', '2017-07-15 11:22:29', 1, 2),
	(5, 1, 'SID009', '2017-07-15 10:59:26', '2024-05-19 16:31:57', 1, 0),
	(6, 3, 'SID011', '2017-07-15 18:02:55', '2024-05-19 16:30:37', 1, 0),
	(7, NULL, 'SID013', '2024-05-20 13:46:03', NULL, NULL, NULL),
	(8, 3, 'SID013', '2024-05-20 13:46:55', '2024-05-20 13:47:23', 1, 0),
	(9, 3, 'SID013', '2024-05-20 13:48:16', '2024-05-20 13:49:20', 1, 0),
	(10, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:42', 1, 0),
	(11, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:39', 1, 0),
	(12, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:37', 1, 0),
	(13, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:34', 1, 0),
	(14, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:30', 1, 0),
	(15, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:09:07', 1, 0),
	(16, 4, 'SID012', '2024-05-28 17:00:00', '2024-05-28 19:08:55', 1, 0),
	(17, 4, 'SID014', '2024-05-28 17:00:00', NULL, 0, NULL),
	(18, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(19, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(20, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(21, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(22, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(23, 4, 'SID013', '2024-05-29 17:00:00', NULL, 0, NULL),
	(24, 2, 'SID009', '2024-05-29 17:00:00', NULL, 0, NULL);

-- Dumping structure for table library.tblstudents
CREATE TABLE IF NOT EXISTS `tblstudents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `NIMId` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `StudentId` (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table library.tblstudents: ~5 rows (approximately)
DELETE FROM `tblstudents`;
INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `NIMId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
	(11, 'SID012', 'Kelamin', 'I0322002', '0812', 'WWW', 1, '2024-05-19 16:04:51', '2024-05-28 19:19:06'),
	(12, 'SID013', 'Deo', 'I0322002', '0812', 'WWW', 1, '2024-05-20 13:34:43', '2024-05-28 19:19:01'),
	(13, 'SID014', 'Whisnu', 'I0321108', '0812', 'WWW', 1, '2024-05-28 19:16:02', NULL),
	(14, 'SID009', 'a', 'a', NULL, 'a', 1, '2024-05-30 14:39:07', '2024-05-30 14:40:08');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

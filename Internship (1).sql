-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2023 at 04:08 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Internship`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblapplicants`
--

CREATE TABLE `tblapplicants` (
  `APPLICANTID` int(11) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASS` varchar(255) NOT NULL,
  `EMAILADDRESS` varchar(255) NOT NULL,
  `FNAME` varchar(255) DEFAULT '',
  `LNAME` varchar(255) DEFAULT '',
  `MNAME` varchar(255) DEFAULT '',
  `ADDRESS` text DEFAULT '',
  `SEX` enum('MALE','FEMALE') DEFAULT 'MALE',
  `CIVILSTATUS` varchar(255) DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  `BIRTHPLACE` varchar(255) DEFAULT '',
  `AGE` int(11) DEFAULT 0,
  `CONTACTNO` varchar(20) DEFAULT '',
  `DEGREE` varchar(255) DEFAULT 'Not Specified',
  `APPLICANTPHOTO` varchar(255) DEFAULT 'default_photo.jpg',
  `EMAIL_VERIFIED` tinyint(1) DEFAULT 0,
  `EMAIL_VERIFICATION_TOKEN` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFICATION_CODE` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblapplicants`
--

INSERT INTO `tblapplicants` (`APPLICANTID`, `USERNAME`, `PASS`, `EMAILADDRESS`, `FNAME`, `LNAME`, `MNAME`, `ADDRESS`, `SEX`, `CIVILSTATUS`, `BIRTHDATE`, `BIRTHPLACE`, `AGE`, `CONTACTNO`, `DEGREE`, `APPLICANTPHOTO`, `EMAIL_VERIFIED`, `EMAIL_VERIFICATION_TOKEN`, `EMAIL_VERIFICATION_CODE`) VALUES
(20231138, 'sujal', 'beb6f7ab38da544ff1ea46ae248e21a541ebe378', 'sujalbhavsar22@gmail.com', 'Sujal', 'Bhavsar', 'c', 'Australia', 'MALE', NULL, '1998-10-03', 'India', 25, '0123456789', 'Fresher', 'photos/avatar.png', 1, NULL, '130470'),
(20231147, 'abc', '164bf51fec1d15b1bbef2121d5f6f46639097d1a', 'abc@gmail.com', '', '', '', '', 'MALE', NULL, NULL, '', 0, '', 'Not Specified', 'default_photo.jpg', 1, NULL, '653555');

-- --------------------------------------------------------

--
-- Table structure for table `tblattachmentfile`
--

CREATE TABLE `tblattachmentfile` (
  `ID` int(11) NOT NULL,
  `FILEID` varchar(30) DEFAULT NULL,
  `JOBID` int(11) NOT NULL,
  `FILE_NAME` varchar(90) NOT NULL,
  `FILE_LOCATION` varchar(255) NOT NULL,
  `USERATTACHMENTID` int(11) NOT NULL,
  `VIDEO_LOCATION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblattachmentfile`
--

INSERT INTO `tblattachmentfile` (`ID`, `FILEID`, `JOBID`, `FILE_NAME`, `FILE_LOCATION`, `USERATTACHMENTID`, `VIDEO_LOCATION`) VALUES
(58, '20231163', 15, 'DOCUMENT', '/resume/03102023095932Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231138, '/resume/03102023095932Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `tblautonumbers`
--

CREATE TABLE `tblautonumbers` (
  `AUTOID` int(11) NOT NULL,
  `AUTOSTART` int(11) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOKEY` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblautonumbers`
--

INSERT INTO `tblautonumbers` (`AUTOID`, `AUTOSTART`, `AUTOEND`, `AUTOINC`, `AUTOKEY`) VALUES
(1, 1, 22, 1, 'userid'),
(2, 1, 4, 1, 'employeeid'),
(3, 1, 155, 1, 'APPLICANT'),
(4, 1, 164, 1, 'FILEID');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CATEGORYID` int(11) NOT NULL,
  `CATEGORY` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CATEGORYID`, `CATEGORY`) VALUES
(1, 'Technology'),
(3, 'Engineer'),
(4, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `COMPANYID` int(11) NOT NULL,
  `COMPANYNAME` varchar(90) NOT NULL,
  `COMPANYADDRESS` varchar(90) NOT NULL,
  `COMPANYCONTACTNO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`COMPANYID`, `COMPANYNAME`, `COMPANYADDRESS`, `COMPANYCONTACTNO`) VALUES
(1, 'ANZ', 'AU', '023654'),
(2, 'ATMC', 'AU', '035656'),
(3, 'COMMBANK', 'AU', '23165');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `INCID` int(11) NOT NULL,
  `EMPLOYEEID` varchar(30) NOT NULL,
  `FNAME` varchar(50) NOT NULL,
  `LNAME` varchar(50) NOT NULL,
  `MNAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(90) NOT NULL,
  `BIRTHDATE` date NOT NULL,
  `BIRTHPLACE` varchar(90) NOT NULL,
  `AGE` int(11) NOT NULL,
  `SEX` varchar(30) NOT NULL,
  `CIVILSTATUS` varchar(30) NOT NULL,
  `TELNO` varchar(40) NOT NULL,
  `EMP_EMAILADDRESS` varchar(90) NOT NULL,
  `CELLNO` varchar(30) NOT NULL DEFAULT 'DefaultValueHere',
  `POSITION` varchar(50) NOT NULL,
  `WORKSTATS` varchar(90) NOT NULL DEFAULT 'DefaultValueHere',
  `EMPPHOTO` varchar(255) NOT NULL DEFAULT 'default_image.jpg',
  `EMPUSERNAME` varchar(90) NOT NULL,
  `EMPPASSWORD` varchar(125) NOT NULL,
  `DATEHIRED` date NOT NULL,
  `COMPANYID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`INCID`, `EMPLOYEEID`, `FNAME`, `LNAME`, `MNAME`, `ADDRESS`, `BIRTHDATE`, `BIRTHPLACE`, `AGE`, `SEX`, `CIVILSTATUS`, `TELNO`, `EMP_EMAILADDRESS`, `CELLNO`, `POSITION`, `WORKSTATS`, `EMPPHOTO`, `EMPUSERNAME`, `EMPPASSWORD`, `DATEHIRED`, `COMPANYID`) VALUES
(5, '1', 'Sujal', 'Bhavsar', 'C', 'Australia', '1996-04-12', 'india', 27, 'Male', 'none', '1234567890', 'sujalbhavsar22@gmail.com', 'DefaultValueHere', 'TM', 'DefaultValueHere', 'default_image.jpg', '1', '356a192b7913b04c54574d18c28d46e6395428ab', '2023-10-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `FEEDBACKID` int(11) NOT NULL,
  `APPLICANTID` int(11) NOT NULL,
  `REGISTRATIONID` int(11) NOT NULL,
  `FEEDBACK` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfeedback`
--

INSERT INTO `tblfeedback` (`FEEDBACKID`, `APPLICANTID`, `REGISTRATIONID`, `FEEDBACK`) VALUES
(1, 1, 1, 'I\'ve seen your work and it\'s really interesting'),
(2, 3, 2, 'pending'),
(3, 2023194, 100, 'pending'),
(4, 2023194, 101, 'approved'),
(5, 20231138, 102, 'Your application in Progress');

-- --------------------------------------------------------

--
-- Table structure for table `tbljob`
--

CREATE TABLE `tbljob` (
  `JOBID` int(11) NOT NULL,
  `COMPANYID` int(11) NOT NULL,
  `CATEGORY` varchar(250) NOT NULL,
  `OCCUPATIONTITLE` varchar(90) NOT NULL,
  `REQ_NO_EMPLOYEES` int(11) NOT NULL,
  `SALARIES` varchar(255) DEFAULT 'No salary',
  `DURATION_EMPLOYEMENT` varchar(90) NOT NULL,
  `QUALIFICATION_WORKEXPERIENCE` text NOT NULL,
  `JOBDESCRIPTION` text NOT NULL,
  `PREFEREDSEX` varchar(255) DEFAULT NULL,
  `SECTOR_VACANCY` varchar(255) DEFAULT NULL,
  `DATEPOSTED` datetime NOT NULL,
  `JOBSTATUS` varchar(50) DEFAULT 'hiring'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbljob`
--

INSERT INTO `tbljob` (`JOBID`, `COMPANYID`, `CATEGORY`, `OCCUPATIONTITLE`, `REQ_NO_EMPLOYEES`, `SALARIES`, `DURATION_EMPLOYEMENT`, `QUALIFICATION_WORKEXPERIENCE`, `JOBDESCRIPTION`, `PREFEREDSEX`, `SECTOR_VACANCY`, `DATEPOSTED`, `JOBSTATUS`) VALUES
(15, 1, 'Technology', 'Accounting', 2, '122000', '3 years', 'Qualification/Work Experience: Bachelor\\\'s degree in a related field.Prior internship or relevant work experience is a plus.', 'We are seeking enthusiastic engineering interns to join our team. As an intern, you will have the opportunity to work on exciting technology projects, gain hands-on experience, and contribute to our innovative solutions.', '', '', '2023-10-03 01:49:00', 'hiring'),
(18, 3, 'Engineer', 'Engineer1', 2, 'No salary', '3 years', 'ss', 'ss', '', '', '2023-10-04 01:47:00', 'hiring'),
(19, 1, 'Technology', 'Engineer', 2, '122000', '3 years', 'ss', 'ss', '', '', '2023-10-04 01:53:00', 'hiring');

-- --------------------------------------------------------

--
-- Table structure for table `tbljobregistration`
--

CREATE TABLE `tbljobregistration` (
  `REGISTRATIONID` int(11) NOT NULL,
  `COMPANYID` int(11) NOT NULL,
  `JOBID` int(11) NOT NULL,
  `APPLICANTID` int(11) NOT NULL,
  `APPLICANT` varchar(90) NOT NULL,
  `REGISTRATIONDATE` date NOT NULL,
  `REMARKS` varchar(255) NOT NULL DEFAULT 'Pending',
  `FILEID` varchar(30) DEFAULT NULL,
  `PENDINGAPPLICATION` tinyint(1) NOT NULL DEFAULT 1,
  `HVIEW` tinyint(1) NOT NULL DEFAULT 1,
  `DATETIMEAPPROVED` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbljobregistration`
--

INSERT INTO `tbljobregistration` (`REGISTRATIONID`, `COMPANYID`, `JOBID`, `APPLICANTID`, `APPLICANT`, `REGISTRATIONDATE`, `REMARKS`, `FILEID`, `PENDINGAPPLICATION`, `HVIEW`, `DATETIMEAPPROVED`) VALUES
(2, 1, 1, 3, 'rozy', '2023-05-26', 'pending', '1', 0, 0, '2023-08-23 21:24:04'),
(3, 3, 3, 2023139, 'sujal bhavsar', '2023-08-28', 'Pending', '2023116', 1, 1, '2023-08-28 06:40:00'),
(4, 3, 3, 2023140, 'rozy rozy', '2023-08-28', 'Pending', '2023117', 1, 1, '2023-08-28 09:19:00'),
(5, 3, 3, 2023141, 'ddsdas sda', '2023-08-29', 'Pending', '2023119', 1, 1, '2023-08-29 03:49:00'),
(6, 3, 3, 2023142, 'sujal bhavd', '2023-08-31', 'Pending', '2023129', 1, 1, '2023-08-31 05:39:00'),
(7, 3, 3, 2023143, 'sujal c', '2023-08-31', 'Pending', '2023138', 1, 1, '2023-08-31 07:28:00'),
(8, 3, 3, 2023144, 'par par', '2023-08-31', 'Pending', '2023139', 1, 1, '2023-08-31 07:36:00'),
(9, 3, 3, 2023140, 'rozy rozy', '2023-08-31', 'Pending', '2023140', 1, 1, '2023-08-31 07:49:00'),
(10, 3, 3, 2023145, 'sujal c', '2023-08-31', 'Pending', '2023156', 1, 1, '2023-08-31 13:26:00'),
(11, 3, 3, 2023146, 'par par', '2023-09-04', 'Pending', '2023161', 1, 1, '2023-09-04 01:23:00'),
(12, 3, 3, 2023147, 'sujal bhavsar', '2023-09-04', 'Pending', '2023162', 1, 1, '2023-09-04 03:58:00'),
(13, 3, 3, 2023148, 'sc sc', '2023-09-04', 'Pending', '2023163', 1, 1, '2023-09-04 04:10:00'),
(14, 3, 3, 2023149, 'Sujal bhavsar', '2023-09-04', 'Pending', '2023164', 1, 1, '2023-09-04 05:38:00'),
(15, 3, 3, 2023150, 'sujal bhavsar', '2023-09-04', 'Pending', '2023165', 1, 1, '2023-09-04 05:40:00'),
(16, 3, 3, 2023151, 'sujal bsdhasd', '2023-09-04', 'Pending', '2023167', 1, 1, '2023-09-04 09:44:00'),
(17, 3, 3, 2023140, 'rozy bral', '2023-09-04', 'Pending', '2023168', 1, 1, '2023-09-04 10:15:00'),
(18, 3, 3, 2023153, 'abc abc', '2023-09-04', 'Pending', '2023169', 1, 1, '2023-09-04 23:08:00'),
(19, 3, 3, 2023154, 'abc abc', '2023-09-04', 'Pending', '2023170', 1, 1, '2023-09-04 23:10:00'),
(20, 3, 3, 2023160, 'xyz xyz', '2023-09-04', 'Pending', '2023171', 1, 1, '2023-09-04 23:41:00'),
(21, 3, 3, 2023161, 'xyz xyz', '2023-09-04', 'Pending', '2023172', 1, 1, '2023-09-04 23:43:00'),
(22, 3, 3, 2023162, 'xyz xyz', '2023-09-04', 'Pending', '2023173', 1, 1, '2023-09-04 23:55:00'),
(23, 3, 3, 2023139, 'rozy bral', '2023-09-05', 'Pending', '2023174', 1, 1, '2023-09-05 23:47:00'),
(24, 3, 3, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023186', 1, 1, '2023-09-06 00:52:00'),
(25, 3, 3, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023188', 1, 1, '2023-09-06 00:53:00'),
(26, 1, 2, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023189', 1, 1, '2023-09-06 02:21:00'),
(27, 1, 2, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023190', 1, 1, '2023-09-06 02:32:00'),
(28, 3, 1, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023191', 1, 1, '2023-09-06 02:33:00'),
(29, 1, 2, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023192', 1, 1, '2023-09-06 02:35:00'),
(30, 1, 2, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023193', 1, 1, '2023-09-06 02:40:00'),
(31, 3, 1, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023194', 1, 1, '2023-09-06 02:43:00'),
(33, 3, 1, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023196', 1, 1, '2023-09-06 02:44:00'),
(34, 3, 1, 2023139, 'rozy bral', '2023-09-06', 'Pending', '2023197', 1, 1, '2023-09-06 02:45:00'),
(35, 3, 1, 2023140, 'rozy Bral', '2023-09-06', 'Pending', '2023198', 1, 1, '2023-09-06 02:50:00'),
(36, 3, 1, 2023140, 'rozy Bral', '2023-09-06', 'Pending', '2023199', 1, 1, '2023-09-06 02:56:00'),
(37, 1, 2, 2023140, 'rozy Bral', '2023-09-06', 'Pending', '20231100', 1, 1, '2023-09-06 03:10:00'),
(38, 3, 3, 2023139, 'SUJAL BHAVSAR', '2023-09-10', 'Pending', '20231101', 1, 1, '2023-09-10 11:50:00'),
(39, 3, 1, 2023139, 'SUJAL c BHAVSAR', '2023-09-11', 'Pending', '20231102', 1, 1, '2023-09-11 03:11:00'),
(40, 3, 1, 2023139, 'SUJAL c BHAVSAR', '2023-09-11', 'Pending', '20231103', 1, 1, '2023-09-11 03:18:00'),
(41, 3, 3, 2023148, 'sujal sc', '2023-09-11', 'Pending', '20231104', 1, 1, '2023-09-11 06:54:00'),
(42, 3, 1, 2023139, 'ROZY BRAL', '2023-09-11', 'Pending', '20231105', 1, 1, '2023-09-11 23:46:00'),
(43, 1, 2, 2023139, 'ROZY BRAL', '2023-09-11', 'Pending', '20231106', 1, 1, '2023-09-11 23:46:00'),
(44, 1, 2, 2023139, 'ROZY BRAL', '2023-09-11', 'Pending', '20231109', 1, 1, '2023-09-11 23:54:00'),
(45, 1, 2, 2023139, 'ROZY BRAL', '2023-09-11', 'Pending', '20231110', 1, 1, '2023-09-11 23:55:00'),
(46, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231112', 1, 1, '2023-09-12 00:01:00'),
(47, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231113', 1, 1, '2023-09-12 00:05:00'),
(48, 1, 2, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231114', 1, 1, '2023-09-12 00:13:00'),
(49, 1, 2, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231115', 1, 1, '2023-09-12 00:14:00'),
(50, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231116', 1, 1, '2023-09-12 00:17:00'),
(51, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231117', 1, 1, '2023-09-12 00:23:00'),
(52, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231118', 1, 1, '2023-09-12 00:28:00'),
(53, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231120', 1, 1, '2023-09-12 00:38:00'),
(54, 3, 3, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231121', 1, 1, '2023-09-12 00:40:00'),
(55, 3, 3, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231122', 1, 1, '2023-09-12 00:42:00'),
(56, 3, 3, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231123', 1, 1, '2023-09-12 00:47:00'),
(57, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231124', 1, 1, '2023-09-12 00:54:00'),
(58, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231125', 1, 1, '2023-09-12 01:01:00'),
(59, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:06:00'),
(60, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:07:00'),
(61, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:08:00'),
(62, 1, 2, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:09:00'),
(63, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:13:00'),
(64, 3, 1, 2023140, 'rozy Bral', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:16:00'),
(65, 1, 2, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:19:00'),
(66, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:23:00'),
(67, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:25:00'),
(68, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:31:00'),
(69, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:34:00'),
(70, 3, 1, 2023139, 'ROZY BRAL', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 01:44:00'),
(71, 3, 1, 2023139, 'Sujal bhavsar', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 02:04:00'),
(72, 3, 1, 2023139, 'Sujal bhavsar', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 02:11:00'),
(73, 3, 3, 2023139, 'Sujal bhavsar', '2023-09-12', 'Pending', '20231126', 1, 1, '2023-09-12 02:14:00'),
(74, 1, 2, 2023139, 'Sujal bhavsar', '2023-09-12', 'Pending', '20231127', 1, 1, '2023-09-12 02:20:00'),
(75, 1, 2, 2023187, 'sc sc', '2023-09-13', 'Pending', '20231128', 1, 1, '2023-09-13 04:14:00'),
(77, 3, 1, 2023190, 'veer patel', '2023-09-13', 'Pending', '20231130', 1, 1, '2023-09-13 05:36:00'),
(80, 3, 1, 2023139, 'Sujal bhavsar', '2023-09-18', 'Pending', '20231133', 1, 1, '2023-09-18 06:06:00'),
(81, 1, 6, 2023144, 'par par', '2023-09-21', 'Pending', '20231138', 1, 1, '2023-09-21 09:11:00'),
(82, 3, 1, 2023144, 'par par', '2023-09-21', 'Pending', '20231140', 1, 1, '2023-09-21 09:20:00'),
(83, 3, 1, 2023144, 'par par', '2023-09-21', 'Pending', '20231141', 1, 1, '2023-09-21 09:24:00'),
(84, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231143', 1, 1, '2023-09-21 09:27:00'),
(85, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231144', 1, 1, '2023-09-21 09:28:00'),
(86, 1, 5, 2023144, 'par par', '2023-09-21', 'Pending', '20231146', 1, 1, '2023-09-21 09:35:00'),
(87, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231147', 1, 1, '2023-09-21 09:37:00'),
(88, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231148', 1, 1, '2023-09-21 09:44:00'),
(89, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231151', 1, 1, '2023-09-21 09:48:00'),
(90, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231152', 1, 1, '2023-09-21 09:50:00'),
(91, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231153', 1, 1, '2023-09-21 09:52:00'),
(92, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231154', 1, 1, '2023-09-21 09:52:00'),
(93, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231155', 1, 1, '2023-09-21 09:53:00'),
(94, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231156', 1, 1, '2023-09-21 12:44:00'),
(95, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '202320230921125003R', 1, 1, '2023-09-21 12:50:00'),
(96, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231158', 1, 1, '2023-09-21 12:54:00'),
(97, 1, 5, 2023144, 'par par', '2023-09-21', 'Pending', '20231159', 1, 1, '2023-09-21 12:58:00'),
(98, 2, 4, 2023144, 'par par', '2023-09-21', 'Pending', '20231160', 1, 1, '2023-09-21 12:59:00'),
(99, 3, 3, 2023144, 'par par', '2023-09-21', 'Pending', '20231160', 1, 1, '2023-09-21 13:03:00'),
(100, 1, 6, 2023194, 'ss ss', '2023-09-24', 'pending', '20231161', 0, 1, '2023-09-28 09:57:44'),
(101, 1, 5, 2023194, 'ss ss', '2023-09-24', 'approved', '20231162', 0, 1, '2023-09-25 10:16:09'),
(102, 1, 15, 20231138, ' ', '2023-10-03', 'Your application in Progress', '20231163', 0, 1, '2023-10-04 07:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `USERID` varchar(30) NOT NULL,
  `FULLNAME` varchar(40) NOT NULL,
  `USERNAME` varchar(90) NOT NULL,
  `PASS` varchar(90) NOT NULL,
  `ROLE` varchar(30) NOT NULL,
  `PICLOCATION` varchar(255) DEFAULT NULL,
  `COMPANYID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`USERID`, `FULLNAME`, `USERNAME`, `PASS`, `ROLE`, `PICLOCATION`, `COMPANYID`) VALUES
('111', 'bob', 'bob', 'e17d441439027eafbb30fdcc4e548c877ae933d2', 'Administrator', NULL, 1),
('121', 'vc', 'vc', '3a6f049c78ad5ca836eee0f6bc3ab823d4938963', 'Administrator', NULL, 1),
('15', 'Sujal', 'admin', '23d42f5f3f66498b2c8ff4c20b8c5ac826e47146', 'Administrator', 'photos/avatar.png', 1),
('16', 'rozy', 'rozy', '76544739cb201dd0fbe9b491f4b7c84e76544db0', 'Administrator', NULL, NULL),
('17', 'veer', 'veer', '9218562abf2159c2ae93abd35164d1e8a17bd69d', 'Staff', 'photos/avatar.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tracking_events`
--

CREATE TABLE `tbl_tracking_events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `event_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblapplicants`
--
ALTER TABLE `tblapplicants`
  ADD PRIMARY KEY (`APPLICANTID`),
  ADD UNIQUE KEY `unique_username` (`USERNAME`),
  ADD UNIQUE KEY `unique_email` (`EMAILADDRESS`);

--
-- Indexes for table `tblattachmentfile`
--
ALTER TABLE `tblattachmentfile`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblautonumbers`
--
ALTER TABLE `tblautonumbers`
  ADD PRIMARY KEY (`AUTOID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CATEGORYID`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`COMPANYID`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`INCID`),
  ADD UNIQUE KEY `EMPLOYEEID` (`EMPLOYEEID`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`FEEDBACKID`);

--
-- Indexes for table `tbljob`
--
ALTER TABLE `tbljob`
  ADD PRIMARY KEY (`JOBID`);

--
-- Indexes for table `tbljobregistration`
--
ALTER TABLE `tbljobregistration`
  ADD PRIMARY KEY (`REGISTRATIONID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`USERID`),
  ADD KEY `fk_company_user` (`COMPANYID`);

--
-- Indexes for table `tbl_tracking_events`
--
ALTER TABLE `tbl_tracking_events`
  ADD PRIMARY KEY (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblattachmentfile`
--
ALTER TABLE `tblattachmentfile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tblautonumbers`
--
ALTER TABLE `tblautonumbers`
  MODIFY `AUTOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CATEGORYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `COMPANYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `INCID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `FEEDBACKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbljob`
--
ALTER TABLE `tbljob`
  MODIFY `JOBID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbljobregistration`
--
ALTER TABLE `tbljobregistration`
  MODIFY `REGISTRATIONID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_tracking_events`
--
ALTER TABLE `tbl_tracking_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD CONSTRAINT `fk_company_user` FOREIGN KEY (`COMPANYID`) REFERENCES `tblcompany` (`COMPANYID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

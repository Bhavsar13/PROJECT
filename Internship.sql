-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2023 at 12:21 AM
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
  `APPLICANTPHOTO` varchar(255) DEFAULT 'default_photo.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblapplicants`
--

INSERT INTO `tblapplicants` (`APPLICANTID`, `USERNAME`, `PASS`, `EMAILADDRESS`, `FNAME`, `LNAME`, `MNAME`, `ADDRESS`, `SEX`, `CIVILSTATUS`, `BIRTHDATE`, `BIRTHPLACE`, `AGE`, `CONTACTNO`, `DEGREE`, `APPLICANTPHOTO`) VALUES
(2023140, 'rozy12', '', 'rozy@gmail.com', 'rozy', 'Bral', 'ss', 'ss', 'FEMALE', 'MARRIED', '1991-04-18', 'saddasdf', 32, '341351535', 'aseraersdf', 'photos/avatar.png'),
(2023144, 'par', '55abeddc0e1983698e11e47b63ce19d3718f3e35', 'par@gmail.com', 'par', 'par', 'par', 'par', 'FEMALE', 'MARRIED', '1996-02-28', 'par', 27, '131232131', 'par', 'photos/avatar.png'),
(2023189, 'ABC11', '', 'abc@gmail.com', 'abc', 'c21121', 'abc', 'ssa', 'FEMALE', 'SINGLE', '1998-09-13', 'sdasd', 25, '231233113', 'Notdsadd', 'photos/avatar.png'),
(2023190, 'veer', '9218562abf2159c2ae93abd35164d1e8a17bd69d', 'veer@gmail.com', 'veer', 'patel', 'v', 'verer', 'FEMALE', 'SINGLE', '1998-09-13', 'asdsad', 25, '213456789', 'Not Specified', 'photos/about.png'),
(2023194, 'ss', 'a1500ff63cec41d76d631431547c33cfccf6d7a1', 'ss1@gmail.com', 'ss', 'ss', 'ss', 'dsdadasasad', 'FEMALE', NULL, '1998-09-20', 'ssdsd', 25, '323232', 'Not Specifiedsdsds', 'photos/avatar.png');

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
(1, '20231126', 2, 'Resume', '/resume/12092023010937Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023140, NULL),
(2, '20231126', 1, 'Resume', '/resume/12092023011327Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023140, NULL),
(3, '20231126', 1, 'Resume', '/resume/12092023011638Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023140, NULL),
(4, '20231126', 2, 'Resume', '/resume/12092023011917Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(5, '20231126', 1, 'Resume', '/resume/12092023012345Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(6, '20231126', 1, 'Resume', '/resume/12092023012540Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(7, '20231126', 1, 'Resume', '/resume/12092023013123Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(8, '20231126', 1, 'Resume', '/resume/12092023013346Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(9, '20231126', 1, 'Resume', '/resume/12092023013456Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(10, '20231126', 1, 'Resume', '/resume/12092023014422Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(11, '20231126', 1, 'Resume', '/resume/12092023020433Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(12, '20231126', 1, 'Resume', '/resume/12092023021108inverse py.docx', 2023139, NULL),
(13, '20231126', 3, 'Resume', '/resume/12092023021439Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(14, '20231127', 2, 'Resume', '/resume/12092023022021Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(15, '20231128', 2, 'Resume', '/resume/13092023041427Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023187, NULL),
(16, '20231129', 1, 'Resume', '/resume/13092023051046Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023189, NULL),
(17, '20231130', 1, 'Resume', '/resume/13092023053634Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023190, NULL),
(18, '20231131', 1, 'Resume', '/resume/13092023014932Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023189, NULL),
(19, '20231132', 1, 'Resume', '/resume/13092023020234Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023189, NULL),
(20, '20231133', 1, 'Resume', '/resume/18092023060653Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023139, NULL),
(21, '20231138', 6, 'Resume', '/resume/21092023091139Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(22, '20231139', 1, 'Resume', '/resume/21092023091945Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(23, '20231140', 1, 'Resume', '/resume/21092023092013Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(24, '20231141', 1, 'Resume', '/resume/21092023092454Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023092454Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(25, '20231141', 1, 'Video', '/resume/21092023092454Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023092454Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(26, '20231142', 4, 'Resume', '/resume/21092023092717Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(27, '20231143', 4, 'Resume', '/resume/21092023092740Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(28, '20231144', 3, 'Resume', '/resume/21092023092835Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023092835Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(29, '20231144', 3, 'Video', '/resume/21092023092835Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023092835Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(30, '20231145', 5, 'Resume', '/resume/21092023093445Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(31, '20231146', 5, 'Resume', '/resume/21092023093547Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(32, '20231147', 4, 'Resume', '/resume/21092023093712Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023093712Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(33, '20231147', 4, 'Video', '/resume/21092023093712Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023093712Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(34, '20231148', 4, 'Resume', '21092023094420Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023094420Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(35, '20231148', 4, 'Video', '21092023094420Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023094420Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(36, '20231149', 3, 'Resume', '/resume/21092023094632Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(37, '20231150', 3, 'Resume', '/resume/21092023094829Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(38, '20231150', 3, 'Video', '/resume/21092023094829Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, NULL),
(39, '20231151', 3, 'Resume', '/resume/21092023094859Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023094859Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(40, '20231151', 3, 'Video', '/resume/21092023094859Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023094859Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(41, '20231152', 3, 'Resume', '/resume/21092023095008Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023095008Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(42, '20231152', 3, 'Video', '/resume/21092023095008Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023095008Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(43, '20231155', 3, 'Resume', '/resume/21092023095316Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023095316Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(44, '20231155', 3, 'Video', '/resume/21092023095316Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023095316Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(45, '20231156', 4, 'Resume', '/resume/21092023124454Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023124454Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(46, '20231156', 4, 'Video', '/resume/21092023124454Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023124454Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(47, '20230921125003R', 3, 'Resume', '/resume/21092023125003Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, NULL),
(48, '20230921125003V', 3, 'Video', '/resume/21092023125003Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, NULL),
(49, '20231158', 4, 'Resume', '/resume/21092023125432Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023125432Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(50, '20231158', 4, 'Video', '/resume/21092023125432Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023125432Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(51, '20231159', 5, 'DOCUMENT', '/resume/21092023125842Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023125842Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(52, '20231159', 5, 'DOCUMENT', '/resume/21092023125842Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023125842Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(53, '20231160', 4, 'DOCUMENT', '/resume/21092023125954Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023125954Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(54, '20231160', 4, 'DOCUMENT', '/resume/21092023125954Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4', 2023144, '/resume/21092023125954Assessment 4_Sprint retrospective for Sprint1 Sample.docx'),
(55, '20231160', 3, 'DOCUMENT', '/resume/21092023010316Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023144, '/resume/21092023010316Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(56, '20231161', 6, 'DOCUMENT', '/resume/24092023123421Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023194, '/resume/24092023123421Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(57, '20231162', 5, 'DOCUMENT', '/resume/24092023125630Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 2023194, '/resume/24092023125630Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4');

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
(1, 1, 4, 1, 'userid'),
(2, 1, 2, 1, 'employeeid'),
(3, 1, 95, 1, 'APPLICANT'),
(4, 1, 163, 1, 'FILEID');

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
(4, 'IT'),
(5, 'Civil Engineer'),
(11, 'Digital Marketing'),
(17, 'Bank'),
(18, 'Rece');

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
(3, 'COMMBANK', 'AU', '23165'),
(4, 'NAB1', 'AU', '0625656899'),
(5, 'IT Company', 'AUz', '04564123'),
(6, 'ACU', 'Acu', '2039466');

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
(2, '2', 'vc1', 'vc', 'vc', 'vc', '1997-08-23', 'vc', 26, 'Male', 'Single', '0102030405', 'sujal@gmail.com', 'DefaultValueHere', 'vc', 'DefaultValueHere', 'default_image.jpg', '2', 'da4b9237bacccdf19c0760cab7aec4a8359010b0', '2023-08-31', 1),
(3, '3', 'cc', 'cc', 'cc', 'cc', '1995-08-23', 'cc', 28, 'Male', 'Single', '1020304050', 'cc@gmail.com', 'DefaultValueHere', 'cc', 'DefaultValueHere', 'default_image.jpg', '3', '77de68daecd823babbb58edb1c8e14d7106e83bb', '2023-08-31', 2);

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
(3, 2023194, 100, 'Approved');

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
(1, 3, 'Technology', 'Accounting', 6, '15000', 'jan 30', 'Two year Experience', 'We are looking for a bachelor of science in information technology.', 'Male/Female', 'yes', '2023-08-20 00:00:00', 'hiring'),
(3, 3, 'Engineer', 'Engineer', 2, '122000', '3 years', 'ccccccccccc', 'ccccccccccc', 'Male', 'cccccccc', '2023-08-23 15:48:00', 'hiring'),
(4, 2, 'Technology', 'Engineer', 2, '122000', '3 years', 'sdsad', 'asdsd', 'Male', 'dsds', '2023-09-18 06:59:00', 'hiring'),
(5, 1, 'IT', 'Engineer', 2, '122000', '3 years', 'dfddssf', 'dsdfsdfs', 'Female', 'dsdsddsds', '2023-09-18 09:09:00', 'hiring'),
(6, 1, 'Engineer', 'Engineer', 23, '12121', 'ss', '32323', 'sdasdasd', 'Male/Female', 'dssdd', '2023-09-18 12:20:00', 'hiring'),
(7, 2, 'Engineer', 'Engineer', 23, 'No salary', '20 months', 'Masters of Technology', 'We are looking for a Master of technology in information technology.', 'Male/Female', 'Yes', '2023-09-24 00:44:00', 'hiring'),
(8, 6, 'Digital', 'Accounting', 2, '122000', '3 years', 'sds', 'dadasd', 'None', '', '2023-09-25 00:19:00', 'hiring');

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
(100, 1, 6, 2023194, 'ss ss', '2023-09-24', 'Approved', '20231161', 0, 1, '2023-09-24 08:36:28'),
(101, 1, 5, 2023194, 'ss ss', '2023-09-24', 'Pending', '20231162', 1, 1, '2023-09-24 00:56:00');

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
  `PICLOCATION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`USERID`, `FULLNAME`, `USERNAME`, `PASS`, `ROLE`, `PICLOCATION`) VALUES
('0001', 'Sujal', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 'photos/avatar.png'),
('2018001', 'rozy', 'rozy', '76544739cb201dd0fbe9b491f4b7c84e76544db0', 'Administrator', ''),
('3', 'vc', 'vc', '3a6f049c78ad5ca836eee0f6bc3ab823d4938963', 'Staff', 'photos/avatar.png');

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
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblattachmentfile`
--
ALTER TABLE `tblattachmentfile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tblautonumbers`
--
ALTER TABLE `tblautonumbers`
  MODIFY `AUTOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CATEGORYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `COMPANYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `INCID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `FEEDBACKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbljob`
--
ALTER TABLE `tbljob`
  MODIFY `JOBID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbljobregistration`
--
ALTER TABLE `tbljobregistration`
  MODIFY `REGISTRATIONID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

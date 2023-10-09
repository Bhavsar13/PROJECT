-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2023 at 07:42 AM
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
(20231155, 'abc', '164bf51fec1d15b1bbef2121d5f6f46639097d1a', 'abc@gmail.com', 'Rozy', 'Bral', 'R', 'AU', 'FEMALE', NULL, '1998-10-08', 'India', 25, '012345678', 'Not Specified', 'photos/avatar.png', 1, NULL, '474286'),
(20231156, 'rozy', '76544739cb201dd0fbe9b491f4b7c84e76544db0', 'rozy@gmail.com', '', '', '', '', 'MALE', NULL, NULL, '', 0, '', 'Not Specified', 'default_photo.jpg', 1, NULL, '094985');

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
(58, '20231163', 15, 'DOCUMENT', '/resume/03102023095932Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231138, '/resume/03102023095932Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(59, '20231164', 18, 'DOCUMENT', '/resume/08102023101340Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231155, '/resume/08102023101340Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(60, '20231165', 15, 'DOCUMENT', '/resume/08102023102640Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231155, '/resume/08102023102640Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(61, '20231166', 18, 'DOCUMENT', '/resume/08102023114213Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231138, '/resume/08102023114213Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4'),
(62, '20231167', 19, 'DOCUMENT', '/resume/09102023051056Assessment 4_Sprint retrospective for Sprint1 Sample.docx', 20231138, '/resume/09102023051056Meeting with Sujal Chetankumar BHAVSAR71-20230823_131404-Meeting Recording.mp4');

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
(1, 1, 23, 1, 'userid'),
(2, 1, 5, 1, 'employeeid'),
(3, 1, 157, 1, 'APPLICANT'),
(4, 1, 168, 1, 'FILEID');

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
(1, 'ANZ', 'AU', '1234567890'),
(2, 'ATMC', 'AU', '2345678901'),
(8, 'ACU', 'ACU', '0123456789'),
(9, 'CommBank', 'CommBank', '3456789012');

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
(5, 20231138, 102, 'Approved'),
(6, 20231155, 104, 'Pending'),
(7, 20231155, 103, 'Approved'),
(8, 20231138, 105, 'Pending');

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
(18, 9, 'Engineer', 'Engineer', 2, 'No salary', '3 years', 'Qualification/Work Experience: Bachelor\\\'s degree in a related field.Prior internship or relevant work experience is a plus.', 'We are seeking enthusiastic engineering interns to join our team. As an intern, you will have the opportunity to work on exciting technology projects, gain hands-on experience, and contribute to our innovative solutions.', '', '', '2023-10-04 01:47:00', 'hiring'),
(19, 1, 'Technology', 'Engineer', 2, '122000', '3 years', 'Qualification/Work Experience: Bachelor\\\'s degree in a related field.Prior internship or relevant work experience is a plus.', 'We are seeking enthusiastic engineering interns to join our team. As an intern, you will have the opportunity to work on exciting technology projects, gain hands-on experience, and contribute to our innovative solutions.', '', '', '2023-10-04 01:53:00', 'hiring');

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
(102, 1, 15, 20231138, ' ', '2023-10-03', 'Approved', '20231163', 0, 0, '2023-10-09 14:17:24'),
(103, 9, 18, 20231155, 'Rozy Bral', '2023-10-08', 'Approved', '20231164', 0, 0, '2023-10-09 08:53:06'),
(104, 1, 15, 20231155, 'Rozy Bral', '2023-10-08', 'Pending', '20231165', 0, 0, '2023-10-09 14:16:20'),
(105, 9, 18, 20231138, 'Sujal Bhavsar', '2023-10-08', 'Pending', '20231166', 0, 1, '2023-10-09 08:52:25'),
(106, 1, 19, 20231138, 'Sujal Bhavsar', '2023-10-09', 'Pending', '20231167', 1, 1, '2023-10-09 05:10:00');

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
('122', 'vc', 'vc', '3a6f049c78ad5ca836eee0f6bc3ab823d4938963', 'Staff', NULL, 9),
('15', 'Sujal', 'admin', '23d42f5f3f66498b2c8ff4c20b8c5ac826e47146', 'Administrator', 'photos/avatar.png', NULL),
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
  MODIFY `COMPANYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `INCID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `FEEDBACKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbljob`
--
ALTER TABLE `tbljob`
  MODIFY `JOBID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbljobregistration`
--
ALTER TABLE `tbljobregistration`
  MODIFY `REGISTRATIONID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

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

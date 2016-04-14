-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2016 at 09:52 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `postit`
--

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE IF NOT EXISTS `item_category` (
  `item_id` int(4) NOT NULL,
  `item_category` char(50) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_category`
--

CREATE TABLE IF NOT EXISTS `item_sub_category` (
  `item_id` int(4) NOT NULL,
  `item_sub_category` int(5) NOT NULL,
  `sub_category` char(50) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_detail`
--

CREATE TABLE IF NOT EXISTS `post_detail` (
  `post_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `isOBO` tinyint(1) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `lost_found_date` date NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_detail`
--

INSERT INTO `post_detail` (`post_id`, `price`, `isOBO`, `item_description`, `lost_found_date`) VALUES
(0, 0, -1, '', '2016-03-15'),
(1, 0, -1, '', '2016-03-15'),
(2, 10, -1, '1', '2016-03-05'),
(3, 0, -1, 't', '2016-03-05'),
(4, 0, -1, 'f', '2016-03-05'),
(5, 10, -1, 'Test', '2016-03-08'),
(6, 5, -1, '5', '2016-03-08'),
(7, 5, -1, '6', '2016-03-08'),
(8, 10, -1, 'twelve', '2016-03-08'),
(9, 10, -1, '11', '2016-03-08'),
(10, 11, -1, '11', '2016-03-08'),
(11, 11, -1, '11', '2016-03-08'),
(12, 11, -1, '11', '2016-03-08'),
(13, 10, -1, '10', '2016-03-08'),
(14, 2, -1, '2', '2016-03-08'),
(15, 11, -1, '11', '2016-03-08'),
(16, 1, -1, '1', '2016-03-08'),
(17, 10, -1, '1', '2016-03-08'),
(18, 10, -1, 'Hello There', '2016-03-09'),
(19, 100, -1, 'Hello world', '2016-03-09'),
(20, 10, -1, 'asdfsdf', '2016-03-10'),
(21, 10, -1, 'te', '2016-03-10'),
(26, 12, -1, 'Hello', '2016-03-22'),
(27, 0, -1, '', '2016-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `post_image`
--

CREATE TABLE IF NOT EXISTS `post_image` (
  `post_id` int(10) NOT NULL,
  `file_name` char(255) NOT NULL,
  `file_type` char(10) NOT NULL,
  `file_size` int(10) NOT NULL,
  `file_content` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_image`
--

INSERT INTO `post_image` (`post_id`, `file_name`, `file_type`, `file_size`, `file_content`) VALUES
(0, '', '', 0, '../post_image/08-03-2016-22-04-35-midterm designing.rap'),
(0, '', '', 0, '../post_image/08-03-2016-22-04-35-MidtermQuestion1 (1).rap'),
(0, '', '', 0, '../post_image/08-03-2016-22-04-35-MidtermQuestion1 (2).rap'),
(0, '', '', 0, '../post_image/08-03-2016-22-04-35-midtermquestion1.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-07-51-Exam 1 Implementing 1.1.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-07-51-Exam 1 Implementing 1.2.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-07-51-exam 3.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-07-51-exam 4.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-07-51-ExOneImplementOneCOP2512S16.rap'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-10-51-2016 - spring - IT Programming Fundamentals - Syllabus.pdf'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-10-51-ATM GOLAM BARI_health-summary-09212016-to-02022016.pdf'),
(0, 'Array', 'Array', 0, '../post_image/08-03-2016-22-10-51-ATM GOLAM BARI_health-summary-12182015.pdf'),
(0, 'midtermquestion2.rap', 'applicatio', 11431, '../post_image/08-03-2016-22-16-23-midtermquestion2.rap'),
(0, 'Programs.docx', 'applicatio', 14929, '../post_image/08-03-2016-22-16-23-Programs.docx'),
(0, 'ques1.rap', 'applicatio', 10712, '../post_image/08-03-2016-22-16-23-ques1.rap'),
(0, 'question2design.rap', 'applicatio', 11602, '../post_image/08-03-2016-22-16-23-question2design.rap'),
(0, 'analyzev1.0.sh', 'applicatio', 8250, '../post_image/09-03-2016-23-04-08-analyzev1.0.sh'),
(19, '2016 - spring - IT Programming Fundamentals - Syllabus.pdf', 'applicatio', 207708, '../post_image/09-03-2016-23-12-59-2016 - spring - IT Programming Fundamentals - Syllabus.pdf'),
(19, 'analyzev1.0.sh', 'applicatio', 8250, '../post_image/09-03-2016-23-12-59-analyzev1.0.sh'),
(20, '2016 - spring - IT Programming Fundamentals - Syllabus.pdf', 'applicatio', 207708, '../post_image/10-03-2016-04-44-39-2016 - spring - IT Programming Fundamentals - Syllabus.pdf'),
(21, 'biweeksch2016.xls', 'ms-excel', 33792, '../post_image/10-03-2016-04-58-00-biweeksch2016.xls'),
(26, 'Abstract.docx', 'document', 13433, '../post_image/22-03-2016-22-23-14-Abstract.docx'),
(26, 'abstract.txt', 'text/plain', 1013, '../post_image/22-03-2016-22-23-14-abstract.txt'),
(26, 'Bank of America _ Online Banking _ Transfer Funds _ Between Your Accounts at Bank of America.pdf', 'applicatio', 104009, '../post_image/22-03-2016-22-23-14-Bank of America _ Online Banking _ Transfer Funds _ Between Your Accounts at Bank of America.pdf'),
(27, 'Abstract.docx', 'applicatio', 13433, '../post_image/22-03-2016-22-27-24-Abstract.docx'),
(27, 'abstract.txt', 'text/plain', 1013, '../post_image/22-03-2016-22-27-24-abstract.txt');

-- --------------------------------------------------------

--
-- Table structure for table `post_master`
--

CREATE TABLE IF NOT EXISTS `post_master` (
  `post_id` int(10) NOT NULL,
  `post_date` date NOT NULL,
  `post_type_id` int(2) NOT NULL,
  `user_email` char(255) NOT NULL,
  `item_id` int(10) NOT NULL,
  `item_sub_id` int(5) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_master`
--

INSERT INTO `post_master` (`post_id`, `post_date`, `post_type_id`, `user_email`, `item_id`, `item_sub_id`) VALUES
(0, '0000-00-00', -1, '', -1, -1),
(1, '2016-03-15', -1, 'aasdfsdf', -1, -1),
(2, '2016-03-05', -1, 'rokeya@khu.ac.kr', -1, -1),
(3, '2016-03-05', -1, 'baricsdu@yahoo.com', -1, -1),
(4, '2016-03-05', -1, 'rokeya@khu.ac.k', -1, -1),
(5, '2016-03-08', -1, 'baricsdu@yahoo.comics', -1, -1),
(6, '2016-03-08', -1, 'bari@mail.usf.edu', -1, -1),
(7, '2016-03-08', -1, 'baricsdu@yahoo.comtu', -1, -1),
(8, '2016-03-08', -1, 'ba@mail', -1, -1),
(9, '2016-03-08', -1, 'ba@cs', -1, -1),
(10, '2016-03-08', -1, 'b@m', -1, -1),
(11, '2016-03-08', -1, 'bb@u', -1, -1),
(12, '2016-03-08', -1, 'a@c', -1, -1),
(13, '2016-03-08', -1, 'a', -1, -1),
(14, '2016-03-08', -1, 'abc', -1, -1),
(15, '2016-03-08', -1, 'bdef', -1, -1),
(16, '2016-03-08', -1, 'aaaaa', -1, -1),
(17, '2016-03-08', -1, 'bddd', -1, -1),
(18, '2016-03-09', -1, 'baricsdu@yahoo.come', -1, -1),
(19, '2016-03-09', -1, 'baricsdu@yahoo.comes', -1, -1),
(20, '2016-03-10', -1, 'asdfsf', -1, -1),
(21, '2016-03-10', -1, 'baricsdu@yahoo', -1, -1),
(26, '2016-03-22', -1, 'baricsdu@yahoo.com0000', -1, -1),
(27, '2016-03-22', -1, 'baricsdu@yahoo.comuuu', -1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `post_type`
--

CREATE TABLE IF NOT EXISTS `post_type` (
  `post_type_id` int(2) NOT NULL,
  `type_name` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universal_ids`
--

CREATE TABLE IF NOT EXISTS `universal_ids` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `universal_ids`
--

INSERT INTO `universal_ids` (`post_id`, `user_id`) VALUES
(27, 0),
(27, 0),
(27, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_email` char(100) NOT NULL,
  `first_name` char(100) NOT NULL,
  `last_name` char(100) NOT NULL,
  `address` char(255) NOT NULL,
  `city` char(100) NOT NULL DEFAULT 'Tampa',
  `zip` int(10) NOT NULL,
  `country` char(100) NOT NULL DEFAULT 'USA',
  `phone` char(15) NOT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`user_email`, `first_name`, `last_name`, `address`, `city`, `zip`, `country`, `phone`) VALUES
('', '', '', '', '', 0, '', ''),
('a', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('a@c', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('aaaaa', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('aasdfsdf', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('abc', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('asdfsf', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('b@m', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('ba@cs', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('ba@mail', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('bari@mail.usf.edu', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.com', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.com0000', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court, APT 20', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.come', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court, APT 20', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.comes', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court, APT 20', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.comics', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.comtu', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('baricsdu@yahoo.comuuu', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court, APT 20', 'Tampa', 33612, 'USA', '8132205568'),
('bb@u', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('bddd', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('bdef', 'ATM GOLAM', 'BARI', '2318 Campus Lake Court', 'Tampa', 33612, 'USA', '8132205568'),
('rokeya@khu.ac.k', 'MST ROKEYA', 'REAZ', '2318 Campus Lake Court', 'TAMPA', 33612, 'USA', '8132205568'),
('rokeya@khu.ac.kr', 'MST ROKEYA', 'REAZ', '2318 Campus Lake Court', 'TAMPA', 33612, 'USA', '8132205568');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_email` char(255) NOT NULL,
  `user_password` char(255) NOT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_email`, `user_password`) VALUES
('', '76GSsWGxby'),
('a', 'N3mVSZ2mhb'),
('a@c', '5nvsNXdYjb'),
('aaaaa', '729NFZ7QD9'),
('aasdfsdf', 'Ya4ffCaxXL'),
('abc', 'd57N8Apy4H'),
('asdfsf', 'rDHWLbnhfD'),
('b@m', 'S83XwR2LMa'),
('ba@cs', 'QDh4dcdpAw'),
('ba@mail', 'kNzzPqkf4s'),
('bari@mail.usf.edu', 'XkkMNY67sZ'),
('baricsdu@yahoo', 'rpTjbPnDnn'),
('baricsdu@yahoo.com', 'GvbaNXGYpX'),
('baricsdu@yahoo.com0000', 'YfKUURAzYs'),
('baricsdu@yahoo.come', 'vpUnGBDx56'),
('baricsdu@yahoo.comes', 'Sv8CUaU436'),
('baricsdu@yahoo.comics', 'QK6avqzArC'),
('baricsdu@yahoo.comtu', '4NZk8khcGy'),
('baricsdu@yahoo.comuuu', 'X6NLbs8vjz'),
('bb@u', '9S4RSZX2Ly'),
('bddd', 'zvGFgNzM9D'),
('bdef', 'MUBT4QkLK2'),
('rokeya@khu.ac.k', 'qpc3BXDa9S'),
('rokeya@khu.ac.kr', '5Rq8AfvRj8');

-- --------------------------------------------------------

--
-- Table structure for table `user_security_ans`
--

CREATE TABLE IF NOT EXISTS `user_security_ans` (
  `user_email` char(255) NOT NULL,
  `q1id` int(3) NOT NULL,
  `q1ans` char(50) NOT NULL,
  `q2id` int(3) NOT NULL,
  `q2ans` char(50) NOT NULL,
  `q3id` int(3) NOT NULL,
  `q3ans` char(50) NOT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_security_ques`
--

CREATE TABLE IF NOT EXISTS `user_security_ques` (
  `qid` int(3) NOT NULL,
  `ques` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

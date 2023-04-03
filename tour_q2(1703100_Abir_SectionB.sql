-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 06:30 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tour_q2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `BUS_NO` int(5) NOT NULL,
  `SOURCE` varchar(20) DEFAULT NULL,
  `DESTINATION` varchar(20) DEFAULT NULL,
  `COACH_TYPE` varchar(10) DEFAULT NULL,
  `FAIR` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`BUS_NO`, `SOURCE`, `DESTINATION`, `COACH_TYPE`, `FAIR`) VALUES
(20, 'Dhaka', 'Rajshahi', 'AC', 1600),
(22, 'Rajshahi', 'Dhaka', 'AC', 1600),
(30, 'Dhaka', 'Khulna', 'Non AC', 800),
(35, 'Chittagong', 'Dhaka', 'AC', 2000),
(40, 'Dhaka', 'Kolkata', 'AC', 5300);

-- --------------------------------------------------------

--
-- Table structure for table `cancellation`
--

CREATE TABLE `cancellation` (
  `PNR_NO` int(9) DEFAULT NULL,
  `NO_OF_SEATS` int(8) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CONTACT_NO` int(11) DEFAULT NULL,
  `STATUS` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancellation`
--

INSERT INTO `cancellation` (`PNR_NO`, `NO_OF_SEATS`, `ADDRESS`, `CONTACT_NO`, `STATUS`) VALUES
(3, 4, 'Modonhata, Gulistan, 1212', 1675641332, 'can'),
(5, 1, 'Rupnagar, Mirpur, 1215', 1812376560, 'can');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `TICKET_NO` int(11) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `AGE` int(4) DEFAULT NULL,
  `SEX` char(6) NOT NULL,
  `CONTACT_NO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`TICKET_NO`, `NAME`, `AGE`, `SEX`, `CONTACT_NO`) VALUES
(303, 'Shisir', 45, 'Female', 1675641332),
(301, 'Tamim', 25, 'Male', 1812375570),
(305, 'Sakib', 65, 'Male', 1812376560),
(302, 'Liton', 17, 'Male', 1813050250),
(304, 'Fahmida', 55, 'Female', 1813050251);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `PNR_NO` int(9) NOT NULL,
  `NO_OF_SEATS` int(8) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CONTACT_NO` int(10) DEFAULT NULL,
  `STATUS` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`PNR_NO`, `NO_OF_SEATS`, `ADDRESS`, `CONTACT_NO`, `STATUS`) VALUES
(1, 5, '1216 Mirpur, Dhaka', 1812375570, 'boo'),
(2, 1, '235, Vodra, Rajshahi', 1813050250, 'boo'),
(3, 4, 'Modonhata, Gulistan,1212', 1675641332, 'boo'),
(4, 2, 'Kamalpur,Chittagong, 1217', 1813050251, 'boo'),
(5, 1, 'Rupnagar, Mirpur, 1215', 1812376560, 'boo');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TICKET_NO` int(9) NOT NULL,
  `AGE` int(4) DEFAULT NULL,
  `SEX` char(6) NOT NULL,
  `SOURCE` varchar(20) DEFAULT NULL,
  `DESTINATION` varchar(20) DEFAULT NULL,
  `DEP_TIME` varchar(20) DEFAULT NULL,
  `JOURNEY_DATE` date DEFAULT NULL,
  `BUS_NO` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TICKET_NO`, `AGE`, `SEX`, `SOURCE`, `DESTINATION`, `DEP_TIME`, `JOURNEY_DATE`, `BUS_NO`) VALUES
(301, 25, 'Male', 'Dhaka', 'Rajshahi', '12:00PM', '2021-07-01', 20),
(302, 17, 'Male', 'Rajshahi', 'Dhaka', '12:00PM', '2021-07-01', 22),
(303, 45, 'Female', 'Dhaka', 'Khulna', '11:00PM', '2021-07-01', 30),
(304, 55, 'Female', 'Chittagong', 'Dhaka', '12:00PM', '2021-07-01', 35),
(305, 65, 'Male', 'Dhaka', 'Kolkata', '11:00PM', '2021-07-01', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`BUS_NO`);

--
-- Indexes for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD KEY `PNR_NO` (`PNR_NO`),
  ADD KEY `CONTACT_NO` (`CONTACT_NO`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`CONTACT_NO`),
  ADD KEY `TICKET_NO` (`TICKET_NO`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`PNR_NO`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_NO`),
  ADD KEY `BUS_NO` (`BUS_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD CONSTRAINT `cancellation_ibfk_1` FOREIGN KEY (`PNR_NO`) REFERENCES `reservation` (`PNR_NO`),
  ADD CONSTRAINT `cancellation_ibfk_2` FOREIGN KEY (`CONTACT_NO`) REFERENCES `passenger` (`CONTACT_NO`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`TICKET_NO`) REFERENCES `ticket` (`TICKET_NO`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`BUS_NO`) REFERENCES `bus` (`BUS_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

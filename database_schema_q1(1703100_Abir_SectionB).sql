-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 06:29 PM
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
-- Database: `database_schema_q1`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(20) NOT NULL,
  `cust_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`) VALUES
(101, 'Tamim'),
(102, 'Soumya'),
(103, 'Liton'),
(104, 'Mahmudullah'),
(105, 'Musfiq'),
(106, 'Sakib'),
(107, 'Sohan'),
(108, 'Mahedi'),
(109, 'Mustafizur'),
(110, 'Nasum');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(40) DEFAULT NULL,
  `price` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `price`) VALUES
(10001, 'icecream', 300),
(10002, 'sugar', 50),
(10003, 'chips', 100),
(10004, 'pen', 10),
(10005, 'cokies', 200),
(10006, 'choclate', 400),
(10007, 'biscuit', 200),
(10008, 'nuts', 200),
(10009, 'juice', 70),
(10010, 'tea', 15);

-- --------------------------------------------------------

--
-- Table structure for table `relation_r_i`
--

CREATE TABLE `relation_r_i` (
  `cust_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `bill_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relation_r_i`
--

INSERT INTO `relation_r_i` (`cust_id`, `item_id`, `bill_no`) VALUES
(101, 10001, 5),
(103, 10002, 8),
(102, 10003, 1),
(105, 10004, 3),
(104, 10005, 4),
(107, 10006, 7),
(106, 10007, 9),
(109, 10008, 2),
(108, 10009, 10),
(110, 10010, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `bill_no` int(20) NOT NULL,
  `bill_date` date DEFAULT NULL,
  `qty_sold` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`bill_no`, `bill_date`, `qty_sold`) VALUES
(1, '2021-07-01', 15),
(2, '2021-07-01', 20),
(3, '2021-07-02', 20),
(4, '2021-07-03', 12),
(5, '2021-07-04', 5),
(6, '2021-07-04', 8),
(7, '2021-07-04', 25),
(8, '2021-07-05', 28),
(9, '2021-07-06', 32),
(10, '2021-07-07', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `relation_r_i`
--
ALTER TABLE `relation_r_i`
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bill_no` (`bill_no`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`bill_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relation_r_i`
--
ALTER TABLE `relation_r_i`
  ADD CONSTRAINT `relation_r_i_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `relation_r_i_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `relation_r_i_ibfk_3` FOREIGN KEY (`bill_no`) REFERENCES `sale` (`bill_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

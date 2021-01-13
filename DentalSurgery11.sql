-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 22, 2020 at 01:21 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DentalSurgery`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `patientId` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reason` text NOT NULL,
  `duration` time NOT NULL,
  `status` enum('scheduled','attended','cancelled','late cancellation') NOT NULL,
  `id` int(11) NOT NULL,
  `dentistId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`patientId`, `date`, `time`, `reason`, `duration`, `status`, `id`, `dentistId`) VALUES
(101, '2020-06-13', '13:00:00', 'checkup', '00:15:00', 'scheduled', 10113, 11),
(102, '2020-06-12', '10:30:00', 'filling', '00:20:00', 'scheduled', 10212, 11),
(103, '2020-05-12', '12:45:00', 'oral cleaning', '00:30:00', 'late cancellation', 10312, 11),
(104, '2020-06-14', '14:30:00', 'filling', '00:20:00', 'scheduled', 10412, 11),
(105, '2020-06-13', '09:45:00', 'cleaning', '00:30:00', 'cancelled', 10513, 11),
(106, '2020-04-14', '09:00:00', 'filling', '00:20:00', 'attended', 10614, 11),
(107, '2020-04-14', '09:30:00', 'cleaning', '00:30:00', 'attended', 10714, 11),
(107, '2020-04-16', '10:30:00', 'filling', '00:20:00', 'attended', 10716, 11),
(108, '2020-04-13', '11:30:00', 'filling', '00:20:00', 'attended', 10813, 11),
(109, '2020-04-14', '14:30:00', 'checkup', '00:45:00', 'attended', 10914, 11),
(109, '2020-06-14', '09:30:00', 'extraction', '00:30:00', 'scheduled', 11014, 11);

-- --------------------------------------------------------

--
-- Stand-in structure for view `appointmentDiary`
-- (See below for the actual view)
--
CREATE TABLE `appointmentDiary` (
`id` int(11)
,`time` time
,`status` enum('scheduled','attended','cancelled','late cancellation')
,`duration` time
,`reason` text
,`email` varchar(100)
,`phone` varchar(50)
,`name` varchar(50)
,`surname` varchar(50)
,`date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `amount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `date`, `appointmentId`, `amount`) VALUES
(123, '2020-05-12', 10312, '10.00'),
(124, '2020-04-15', 10614, '51.00'),
(125, '2020-04-15', 10714, '60.00'),
(126, '2020-04-14', 10813, '55.00'),
(127, '2020-04-15', 10914, '45.00'),
(128, '2020-04-17', 10716, '55.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `billPayments`
-- (See below for the actual view)
--
CREATE TABLE `billPayments` (
`billId` int(11)
,`patient` varchar(101)
,`appointmentDate` date
,`patientEmail` varchar(100)
,`paymentReceipt` int(16)
,`billDate` date
,`reason` text
,`billAmount` decimal(5,2)
,`paymentAmount` decimal(15,2)
,`paymentDate` date
,`totalPayments` decimal(37,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`id`, `name`, `surname`, `email`, `phone`, `address`) VALUES
(11, 'Mary', 'Mulcahy', 'mMulcahey@dentalpractice.ie', '0986343421', 'Small town, Co. Cork'),
(12, 'Dr. Sarah', 'Livingston', 'slivingston@surgery.ie', '0987556421', 'Orthodonitc Surgery, north Cork city, co. cork'),
(13, 'Dr. Laura', 'ORourke', 'sorourke@surgery.ie', '0987597632', 'maxillofacial surgery, south Cork city, co. cork'),
(14, 'Dr. Niamh', 'Kinsella', 'kinsella@corkgeneral.ie', '09874432351', 'Oral pathology, Cork General Hospital, co. cork'),
(15, 'Oonagh', 'Larkin', 'olarking@google.com', '098644532', 'Dental Surgery, unit 3 forest grove, Co. Cork'),
(16, 'Cathall', 'Moore', 'cmoore@outlook.ie', '09755543', 'Dental Surgery and practice, 40 lismore Road, Co. Cork'),
(17, 'Peter', 'Creann', 'pcreann@outlook.com', '0979765674332', '12 lough view, co. Cork');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `surname`, `address`, `email`, `phone`) VALUES
(101, 'John', 'Dillon', 'fitzwilliam Quay Dublin 4 ', 'jdillion@google.com', '098765432'),
(102, 'Mary', 'Langley', 'hawthorn grove cork ', 'mlangley@google.com', '097777666'),
(103, 'Kim', 'Kardashian', 'Callabassas Cork', 'kkardash@aol.com', '5558885554'),
(104, 'Gui', 'Bernard', '15 sunnydrive cork', 'gbernard@gmail.ie', '0999776543'),
(105, 'Joeseph', 'Exotic', 'Fota drive cork', 'jexostic@gmail.ie', '006654321'),
(106, 'June', 'Smith', 'Ballybeg Cork', 'jsmith@gmail.ie', '087654356'),
(107, 'Angela', 'Murphy', 'grange close Co. Cork', 'amurphy@email.ie', '098443231'),
(108, 'Andreas', 'Quinn', 'Georges Quay village Co. Cork', 'aquinne@gmail.com', '09844321'),
(109, 'Katarina', 'Koti', 'Montenotte, co. Cork', ' kcoti@aol.com', '078553423262');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `billId` int(11) NOT NULL,
  `date` date NOT NULL,
  `method` enum('visa','cash','cheque') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `receiptNumber` int(16) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`billId`, `date`, `method`, `amount`, `receiptNumber`, `id`) VALUES
(123, '2020-05-13', 'visa', '10.00', 45303, 303),
(125, '2020-04-16', 'cash', '30.00', 45304, 304),
(126, '2020-04-15', 'visa', '55.00', 45305, 305),
(127, '2020-04-16', 'visa', '45.00', 45306, 306),
(125, '2020-04-20', 'cash', '15.00', 45307, 307);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(50) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `type` enum('cancellation fee','filling','checkup','extraction','oral cleaning') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `fee`, `type`) VALUES
(11, '60.00', 'oral cleaning'),
(12, '55.00', 'filling'),
(13, '45.00', 'checkup'),
(14, '35.00', 'extraction'),
(15, '10.00', 'cancellation fee');

-- --------------------------------------------------------

--
-- Table structure for table `specialisation`
--

CREATE TABLE `specialisation` (
  `dentistId` int(50) DEFAULT NULL,
  `specialisation` enum('orthodontics','endodontics','periodontics','prosthodontics','general practice') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialisation`
--

INSERT INTO `specialisation` (`dentistId`, `specialisation`) VALUES
(11, 'general practice'),
(12, 'orthodontics'),
(12, 'general practice'),
(13, 'prosthodontics'),
(14, 'periodontics'),
(14, 'general practice'),
(15, 'orthodontics'),
(15, 'general practice'),
(16, 'periodontics'),
(17, 'endodontics'),
(17, 'periodontics');

-- --------------------------------------------------------

--
-- Structure for view `appointmentDiary`
--
DROP TABLE IF EXISTS `appointmentDiary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `appointmentDiary`  AS  select `appointment`.`id` AS `id`,`appointment`.`time` AS `time`,`appointment`.`status` AS `status`,`appointment`.`duration` AS `duration`,`appointment`.`reason` AS `reason`,`patient`.`email` AS `email`,`patient`.`phone` AS `phone`,`patient`.`name` AS `name`,`patient`.`surname` AS `surname`,`appointment`.`date` AS `date` from (`patient` left join `appointment` on(`patient`.`id` = `appointment`.`patientId`)) ;

-- --------------------------------------------------------

--
-- Structure for view `billPayments`
--
DROP TABLE IF EXISTS `billPayments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `billPayments`  AS  select `bill`.`id` AS `billId`,concat(`patient`.`name`,' ',`patient`.`surname`) AS `patient`,`appointment`.`date` AS `appointmentDate`,`patient`.`email` AS `patientEmail`,`payment`.`receiptNumber` AS `paymentReceipt`,`bill`.`date` AS `billDate`,`appointment`.`reason` AS `reason`,`bill`.`amount` AS `billAmount`,`payment`.`amount` AS `paymentAmount`,`payment`.`date` AS `paymentDate`,(select sum(`payment`.`amount`) from `payment` where `payment`.`billId` = `bill`.`id`) AS `totalPayments` from (`patient` left join (`appointment` left join (`payment` left join `bill` on(`bill`.`id` = `payment`.`billId`)) on(`bill`.`appointmentId` = `appointment`.`id`)) on(`patient`.`id` = `appointment`.`patientId`)) where `bill`.`id` is not null ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `dentistId` (`dentistId`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appID` (`appointmentId`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billId` (`billId`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialisation`
--
ALTER TABLE `specialisation`
  ADD UNIQUE KEY `dentistId` (`dentistId`,`specialisation`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`dentistId`) REFERENCES `dentist` (`id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`id`);

--
-- Constraints for table `specialisation`
--
ALTER TABLE `specialisation`
  ADD CONSTRAINT `specialisation_ibfk_1` FOREIGN KEY (`dentistId`) REFERENCES `dentist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

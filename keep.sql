-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2023 at 07:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keep`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `preArchived` tinyint(1) NOT NULL,
  `noteColor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sharing`
--

CREATE TABLE `sharing` (
  `id` int(11) NOT NULL,
  `notesId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `share_to_Id` int(11) NOT NULL,
  `notification_status` tinyint(1) NOT NULL,
  `sharing_hours` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `notesId` int(11) NOT NULL,
  `image` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `image` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `image`) VALUES
(1, 'bhavya@gmail.com', 'Bhavya', '$2y$10$x/LYYSXz4GwOm6zhiPawl.pNtE2n0QLIC8U1ccqqqV3Hj57ar8Guy', '1.jpg'),
(2, 'hnm@gmail.com', 'hnm', '$2y$10$x/LYYSXz4GwOm6zhiPawl.pNtE2n0QLIC8U1ccqqqV3Hj57ar8Guy', '2.jpg'),
(3, 'darshit@gmail.com', 'Darshit', '$2y$10$x/LYYSXz4GwOm6zhiPawl.pNtE2n0QLIC8U1ccqqqV3Hj57ar8Guy', '3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `sharing`
--
ALTER TABLE `sharing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notesId` (`notesId`),
  ADD KEY `share_to_Id` (`share_to_Id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notesId` (`notesId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sharing`
--
ALTER TABLE `sharing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `sharing`
--
ALTER TABLE `sharing`
  ADD CONSTRAINT `sharing_ibfk_1` FOREIGN KEY (`notesId`) REFERENCES `notes` (`id`),
  ADD CONSTRAINT `sharing_ibfk_2` FOREIGN KEY (`share_to_Id`) REFERENCES `users` (`id`);

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`notesId`) REFERENCES `notes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

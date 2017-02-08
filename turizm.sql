-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2017 at 02:46 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turuzim`
--

-- --------------------------------------------------------

--
-- Table structure for table `isci`
--

CREATE TABLE `isci` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `vezifesi` varchar(50) DEFAULT NULL,
  `musteri_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musteri`
--

CREATE TABLE `musteri` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `secdiyi_paket` varchar(50) DEFAULT NULL,
  `odediyi_pul` int(50) DEFAULT NULL,
  `isci_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musteri_isci`
--

CREATE TABLE `musteri_isci` (
  `id` int(11) NOT NULL,
  `musteri_id` int(50) DEFAULT NULL,
  `isci_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sifaris`
--

CREATE TABLE `sifaris` (
  `id` int(11) NOT NULL,
  `musteri_id` int(50) DEFAULT NULL,
  `isci_id` int(50) DEFAULT NULL,
  `sifaris_sayi` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turlar`
--

CREATE TABLE `turlar` (
  `id` int(11) NOT NULL,
  `seyahet_mekanlari` varchar(50) DEFAULT NULL,
  `baslama_vaxti` int(50) DEFAULT NULL,
  `bitme_vaxti` int(50) DEFAULT NULL,
  `musteri_id` int(50) DEFAULT NULL,
  `isci_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `isci`
--
ALTER TABLE `isci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `musteri_isci`
--
ALTER TABLE `musteri_isci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`),
  ADD KEY `isci_id` (`isci_id`);

--
-- Indexes for table `sifaris`
--
ALTER TABLE `sifaris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isci_id` (`isci_id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Indexes for table `turlar`
--
ALTER TABLE `turlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`),
  ADD KEY `isci_id` (`isci_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isci`
--
ALTER TABLE `isci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `musteri`
--
ALTER TABLE `musteri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `musteri_isci`
--
ALTER TABLE `musteri_isci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sifaris`
--
ALTER TABLE `sifaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `turlar`
--
ALTER TABLE `turlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `musteri_isci`
--
ALTER TABLE `musteri_isci`
  ADD CONSTRAINT `musteri_isci_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`),
  ADD CONSTRAINT `musteri_isci_ibfk_2` FOREIGN KEY (`isci_id`) REFERENCES `isci` (`id`);

--
-- Constraints for table `sifaris`
--
ALTER TABLE `sifaris`
  ADD CONSTRAINT `sifaris_ibfk_1` FOREIGN KEY (`isci_id`) REFERENCES `isci` (`id`),
  ADD CONSTRAINT `sifaris_ibfk_2` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`);

--
-- Constraints for table `turlar`
--
ALTER TABLE `turlar`
  ADD CONSTRAINT `turlar_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`),
  ADD CONSTRAINT `turlar_ibfk_2` FOREIGN KEY (`isci_id`) REFERENCES `isci` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

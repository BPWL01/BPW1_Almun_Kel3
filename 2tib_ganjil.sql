-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2022 at 10:46 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2tib_ganjil`
--

-- --------------------------------------------------------

--
-- Table structure for table `logbook`
--

CREATE TABLE `logbook` (
  `id_logbook` int(5) NOT NULL,
  `username` varchar(12) NOT NULL,
  `id_peminjaman` int(6) NOT NULL,
  `no_pc` varchar(40) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` enum('diproses','whitelist','blacklist') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(12) NOT NULL,
  `password` varchar(16) NOT NULL,
  `akses` enum('mahasiswa','ail','kajur','kalab','pudir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `akses`) VALUES
('ail', '123', 'ail'),
('kajur', '123', 'kajur'),
('kalab', '123', 'kalab'),
('mahasiswa', '123', 'mahasiswa'),
('pudir', '123', 'pudir');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(6) NOT NULL,
  `username` varchar(12) NOT NULL,
  `penanggung_jawab` varchar(30) NOT NULL,
  `anggota` varchar(100) NOT NULL,
  `ruangan_lab` varchar(50) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `status` enum('diajukan','diterima','ditolak','selesai','logbook telah diisi') NOT NULL,
  `level_peminjaman` enum('level 1','level 2','level 3','') NOT NULL,
  `upload_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penjadwalan`
--

CREATE TABLE `penjadwalan` (
  `id_penjadwalan` int(3) NOT NULL,
  `ruangan_lab` varchar(50) NOT NULL,
  `status` enum('Ada','Tidak Ada','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjadwalan`
--

INSERT INTO `penjadwalan` (`id_penjadwalan`, `ruangan_lab`, `status`) VALUES
(1, 'lab. 313', 'Ada'),
(2, 'GOR PCR', 'Ada'),
(3, 'Auditorium', 'Ada'),
(4, 'Kantin PCR', 'Ada'),
(5, 'GSG', 'Ada'),
(6, 'Ruangan 118', 'Ada'),
(7, 'Ruangan 156', 'Ada'),
(8, 'Ruangan 120', 'Ada'),
(9, 'Ruangan 119', 'Ada'),
(10, 'Ruangan 124', 'Ada'),
(11, 'Ruangan 125', 'Ada'),
(12, 'Ruangan 126', 'Ada'),
(13, 'Ruangan 127', 'Ada'),
(14, 'Ruangan 128', 'Ada'),
(15, 'Ruangan 129', 'Ada'),
(16, 'Ruangan 130', 'Ada'),
(17, 'Kamar Lantai Bawak Dormitory', 'Ada'),
(18, 'Kamar Lantai Atas Dormitory', 'Ada'),
(19, 'Meeting Room 203', 'Ada'),
(20, 'Meeting Room 351', 'Ada'),
(21, 'Depan Lobby GSG', 'Ada'),
(22, 'Lapangan Dormitory', 'Ada'),
(23, 'Home Stay', 'Ada'),
(24, 'Amphi Dalam', 'Ada'),
(25, 'Amphi Luar', 'Ada'),
(26, 'Hall GSG', 'Ada'),
(27, 'Lobby GSG', 'Ada'),
(28, 'Main Hall', 'Ada'),
(30, 'Mesjid', 'Ada'),
(31, 'Student Center', 'Ada'),
(32, 'Ruangan 254', 'Ada'),
(33, 'Ruangan 256', 'Ada'),
(34, 'Ruangan 303', 'Ada'),
(35, 'Ruangan 305', 'Ada'),
(38, 'Ruangan 134', 'Ada'),
(39, 'Ruangan 140', 'Ada'),
(40, 'Ruangan 151', 'Ada'),
(41, 'Ruangan 152', 'Ada'),
(42, 'Ruangan 153', 'Ada'),
(43, 'Ruangan 154', 'Ada'),
(44, 'Ruangan 155', 'Ada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`id_logbook`),
  ADD UNIQUE KEY `lb_username` (`username`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `pm_username` (`username`);

--
-- Indexes for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  ADD PRIMARY KEY (`id_penjadwalan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logbook`
--
ALTER TABLE `logbook`
  MODIFY `id_logbook` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logbook_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 06:34 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tatib_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` int(20) NOT NULL,
  `nama_pelanggaran` text NOT NULL,
  `kategori` enum('kedisiplinan','kerapian','kerajinan','') NOT NULL,
  `poin` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `nama_pelanggaran`, `kategori`, `poin`, `created_at`, `updated_at`) VALUES
(1, 'Mencuci Tangan', 'kedisiplinan', 300, '2019-12-10 04:27:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `poin_siswa`
--

CREATE TABLE `poin_siswa` (
  `id` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poin_siswa`
--

INSERT INTO `poin_siswa` (`id`, `id_siswa`, `id_pelanggaran`, `tanggal`, `keterangan`, `id_petugas`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2019-12-10 07:50:01', 'Dia mencuri susu Ultra-Man di Koperasi Siswa.', 1, '2019-12-10 01:06:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(191) NOT NULL,
  `nama_siswa` varchar(191) NOT NULL,
  `kelas` varchar(191) NOT NULL,
  `langgar` varchar(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `langgar`, `created_at`, `updated_at`) VALUES
(1, '0812/338.103', 'Jungkook', 'XI RPL 9', 'T', '2019-12-10 01:15:13', '0000-00-00 00:00:00'),
(2, '0812/641.01121', 'Hasimyurod', 'XII TJA 8', 'Y', '2019-12-10 04:39:40', '0000-00-00 00:00:00'),
(3, '0812/641.012', 'Bejo Alhamid', 'XII TKJ 1', 'T', '2019-12-10 02:23:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` enum('admin','petugas','','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Pak Eurod', 'eurod@smktelkom-mlg.sch.id', '1', 'admin', '2019-12-10 04:41:43', '0000-00-00 00:00:00'),
(3, 'Syuft', 'syuft@smktelkom-mlg.sch.id', '2', 'admin', '2019-12-10 05:08:20', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poin_siswa`
--
ALTER TABLE `poin_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `poin_siswa`
--
ALTER TABLE `poin_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

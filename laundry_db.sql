-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 02:06 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `iddetail` int(11) NOT NULL,
  `idjenispakaian` int(11) NOT NULL,
  `kd_transaksi` int(11) NOT NULL,
  `berat` double DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `bayar` double DEFAULT NULL,
  `biayaambil` double DEFAULT NULL,
  `biayaantar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`iddetail`, `idjenispakaian`, `kd_transaksi`, `berat`, `jumlah`, `bayar`, `biayaambil`, `biayaantar`) VALUES
(27, 1, 31, 6, 4, 100000, 5000, 5000),
(28, 2, 31, 5, 5, 135000, 5000, 5000),
(29, 3, 32, 5, 5, 260000, 5000, 5000),
(30, 2, 32, 5, 6, 160000, 5000, 5000),
(31, 1, 33, 0, 20, 0, 0, 0),
(32, 2, 33, 0, 2, 50000, 0, 0),
(33, 1, 34, 10, 50, 150000, 0, 0),
(34, 3, 35, 0, 1, 50000, 0, 0),
(35, 1, 37, 10, 10, 20000, 0, 0),
(36, 3, 38, 0, 1, 50000, 0, 0),
(37, 1, 39, 2, 20, 4000, 0, 0),
(38, 3, 40, 0, 2, 100000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detailpemesanan`
--

CREATE TABLE `detailpemesanan` (
  `iddetailpemesanan` int(11) NOT NULL,
  `pemesanan_id` int(11) NOT NULL,
  `idjenispakaian` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detailpemesanan`
--

INSERT INTO `detailpemesanan` (`iddetailpemesanan`, `pemesanan_id`, `idjenispakaian`, `jumlah`) VALUES
(5, 25, 1, 4),
(6, 25, 2, 5),
(7, 26, 3, 5),
(8, 26, 2, 6),
(9, 27, 1, 20),
(10, 27, 2, 2),
(11, 28, 1, 50),
(12, 29, 3, 1),
(13, 31, 1, 10),
(14, 32, 3, 1),
(15, 33, 1, 20),
(16, 34, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jenispakaian`
--

CREATE TABLE `jenispakaian` (
  `idjenispakaian` int(11) NOT NULL,
  `jenis` varchar(45) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `statusbiaya` enum('perkilo','perpotong') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenispakaian`
--

INSERT INTO `jenispakaian` (`idjenispakaian`, `jenis`, `harga`, `statusbiaya`) VALUES
(1, 'Pakaian Biasa/Kaos', 2000, 'perkilo'),
(2, 'Karpet', 25000, 'perpotong'),
(3, 'Bad Cover', 50000, 'perpotong'),
(4, 'Jeans', 5000, 'perpotong'),
(5, 'Jaket', 4000, 'perpotong');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kd_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(45) DEFAULT NULL,
  `bagian` varchar(45) DEFAULT NULL,
  `iduser` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kd_pegawai`, `nama_pegawai`, `bagian`, `iduser`) VALUES
(5, 'admin', 'administrasi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(45) DEFAULT NULL,
  `jk` varchar(45) DEFAULT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama`, `alamat`, `no_hp`, `jk`, `iduser`) VALUES
(10, 'Davis Wtimena', 'Hamadi', '0813116546', 'Pria', 7),
(11, 'Puja Maysa Arya', 'Jember', '082331322173', 'Pria', 8),
(13, 'Dian Pangestuti', 'Jember', '081334442178', 'Wanita', 10),
(14, 'Ayu', 'Malng', '88666282828282', 'Wanita', 11),
(15, 'Fuad Hasyim', 'Puger', '0823345467890', 'Pria', 12),
(16, 'Junio Ajuma', 'Ambulu', '082334554132', 'Pria', 13);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `kd_pemesanan` varchar(20) NOT NULL,
  `tgl_pemesanan` date DEFAULT NULL,
  `kd_pelanggan` int(11) NOT NULL,
  `status` enum('Boking','Proses','Selesai','Batal') DEFAULT 'Boking'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `kd_pemesanan`, `tgl_pemesanan`, `kd_pelanggan`, `status`) VALUES
(25, 'LNY-00001', '2020-07-31', 10, 'Selesai'),
(26, 'LNY-00002', '2020-07-31', 10, 'Selesai'),
(27, 'LNY-00003', '2021-10-11', 11, 'Selesai'),
(28, 'LNY-00004', '2021-10-11', 11, 'Selesai'),
(29, 'LNY-00005', '2022-05-19', 13, 'Selesai'),
(30, 'LNY-00006', '2022-06-02', 15, 'Selesai'),
(31, 'LNY-00007', '2022-06-03', 15, 'Selesai'),
(32, 'LNY-00008', '2022-06-03', 15, 'Selesai'),
(33, 'LNY-00009', '2022-06-05', 16, 'Selesai'),
(34, 'LNY-00010', '2022-06-05', 16, 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `kd_profile` int(11) NOT NULL,
  `nama_laundry` varchar(45) DEFAULT NULL,
  `alamat_laundry` varchar(45) DEFAULT NULL,
  `no_tlp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`kd_profile`, `nama_laundry`, `alamat_laundry`, `no_tlp`) VALUES
(1, 'Laundryy Express', 'Perum Bumi Mangli Permai Blok D 12', '082331322173');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pemesanan` int(11) NOT NULL,
  `kd_transaksi` int(11) NOT NULL,
  `kd_pegawai` int(11) NOT NULL,
  `tgl_ambil` date DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pemesanan`, `kd_transaksi`, `kd_pegawai`, `tgl_ambil`, `total`) VALUES
(25, 31, 5, '2020-07-29', 235000),
(26, 32, 5, '2020-07-28', 420000),
(27, 33, 5, '2021-10-11', 50000),
(28, 34, 5, '2021-10-11', 150000),
(29, 35, 5, '2022-05-19', 50000),
(30, 36, 5, '2022-06-01', 0),
(31, 37, 5, '2022-06-03', 20000),
(32, 38, 5, '2022-06-03', 50000),
(33, 39, 5, '2022-06-05', 4000),
(34, 40, 5, '2022-06-05', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `jenis` enum('Admin','Member') NOT NULL DEFAULT 'Member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `jenis`) VALUES
(1, 'deni', '21232f297a57a5a743894a0e4a801fc3', 'Member'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(6, 'bagus', '17b38fc02fd7e92f3edeb6318e3066d8', 'Member'),
(7, 'david', '172522ec1028ab781d9dfd17eaca4427', 'Member'),
(8, 'puja', 'fbf5e9f8938140ff79cb7e8e2d3d6c99', 'Member'),
(9, 'yosa123', 'd41d8cd98f00b204e9800998ecf8427e', 'Member'),
(10, 'dian123', '2d26b61eafa05991ceb1a8975604354a', 'Member'),
(11, 'ayuastari', 'd41d8cd98f00b204e9800998ecf8427e', 'Member'),
(12, 'fuad123', '25f9e794323b453885f5181f1b624d0b', 'Member'),
(13, 'junio123', '827ccb0eea8a706c4c34a16891f84e7b', 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `fk_detail_jenispakaian1_idx` (`idjenispakaian`),
  ADD KEY `fk_detail_transaksi1_idx` (`kd_transaksi`);

--
-- Indexes for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD PRIMARY KEY (`iddetailpemesanan`),
  ADD KEY `fk_detailpemesanan_pemesanan1_idx` (`pemesanan_id`),
  ADD KEY `fk_detailpemesanan_jenispakaian1_idx` (`idjenispakaian`);

--
-- Indexes for table `jenispakaian`
--
ALTER TABLE `jenispakaian`
  ADD PRIMARY KEY (`idjenispakaian`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kd_pegawai`),
  ADD KEY `fk_pegawai_user1_idx` (`iduser`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`),
  ADD KEY `fk_pelanggan_user1_idx` (`iduser`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pemesanan_pelanggan_idx` (`kd_pelanggan`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`kd_profile`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `fk_transaksi_pegawai1_idx` (`kd_pegawai`),
  ADD KEY `fk_transaksi_pemesanan1_idx` (`id_pemesanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  MODIFY `iddetailpemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jenispakaian`
--
ALTER TABLE `jenispakaian`
  MODIFY `idjenispakaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `kd_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `kd_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `kd_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kd_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `fk_detail_jenispakaian1` FOREIGN KEY (`idjenispakaian`) REFERENCES `jenispakaian` (`idjenispakaian`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_transaksi1` FOREIGN KEY (`kd_transaksi`) REFERENCES `transaksi` (`kd_transaksi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD CONSTRAINT `fk_detailpemesanan_jenispakaian1` FOREIGN KEY (`idjenispakaian`) REFERENCES `jenispakaian` (`idjenispakaian`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailpemesanan_pemesanan1` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_pegawai_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `fk_pemesanan_pelanggan` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pegawai1` FOREIGN KEY (`kd_pegawai`) REFERENCES `pegawai` (`kd_pegawai`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaksi_pemesanan1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

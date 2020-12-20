-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 07:48 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bird_usbc`
--

-- --------------------------------------------------------

--
-- Table structure for table `burung`
--

CREATE TABLE `burung` (
  `id_burung` int(11) NOT NULL,
  `nama_burung` varchar(50) NOT NULL,
  `deskripsi_burung` text NOT NULL,
  `perawatan_kandang` text NOT NULL,
  `perawatan_makan` text NOT NULL,
  `vid_burung` varchar(50) DEFAULT NULL,
  `img_burung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `burung`
--

INSERT INTO `burung` (`id_burung`, `nama_burung`, `deskripsi_burung`, `perawatan_kandang`, `perawatan_makan`, `vid_burung`, `img_burung`) VALUES
(38, 'Cucak Rowo', 'Cucak rawa adalah sejenis burung pengicau dari suku Pycnonotidae. Burung ini juga dikenal umum sebagai krakau, nama di Kapuas Hulu, Kalbar, cucakrawa, cangkurawah, dan barau-barau. Dalam bahasa Inggris disebut Straw-headed Bulbul, mengacu pada warna kepalanya yang kuning-jerami pucat.', 'Lokasi penangkaran mudah dikenal dan dijangkau para penggemar, dekat dengan jalan serta transportasinya mudah. Kalau mungkin tidak berada dalam kota dan lebih baik lagi bila berlatar belakang pegunungan yang masih menyerupai hutan. Hal ini akan sangat mendukung keindahan suasana penangkaran. Karena, selain hasil yang akan diharapkan, kombinasi antara alam yang indah dan kicauan burung yang akan memberikan kenikmatan tersendiri.', 'Makanan favorit Pepaya, Pisang Kepok Putih, Apel, Pir, Tomat dan beberapa buah lainnya. Kemudian untuk pakan tambahan seperti angkrik, Orong-orong, Kroto, Ulat Hongkong, Ulat Bambu, Kelabang, Belalang dan lainnya.', 'https://www.youtube.com/embed/FkRMnd4zjhE', 'hq720.jpg'),
(40, 'Jalak Bali', 'Jalak Bali (Leucopsar rothschildi) adalah sejenis burung pengicau berukuran sedang, dengan panjang lebih kurang 25cm[1], dari suku Sturnidae. Ia turut dikenali sebagai Curik Ketimbang Jalak.[2] Jalak Bali hanya ditemukan di hutan bagian barat Pulau Bali dan merupakan hewan endemik Indonesia. Burung ini juga merupakan satu-satunya spesies endemik Bali dan pada tahun 1991 dinobatkan sebagai lambang fauna Provinsi Bali.', 'Jalak bali umumnya menyukai kandang yang tinggi karena sangat suka bertengger di dahan yang letaknya tinggi. Untuk itu, tinggi ideal kandang penangkaran minimal 2,5 meter. Meski tidak ada ukuran baku yang pasti, idealnya bagian dalam kandang dibuat dengan ukuran besar atau melebar supaya memudahkan proses perkawinan. Dalam kandang pun harus disediakan tempat pakan, tempat minum dan bak mandi. Di samping itu, kondisi kandang harus mudah terkena sinar matahari karena intensitas sinar matahari juga memengaruhi produktivitas perkawinan.', 'Di alam, burung Jalak Bali dapat ditemukan di hutan dan semak belukar. Makanan favorit burung ini di habitat aslinya yaitu berupa serangga, cacing, dan jangkrik. Selain makanan berupa hewan atau serangga-serangga kecil, burung Jalak Bali pun sangat suka mengonsumsi biji-bijian dan buah-buahan sebagai makanannya, contoh makanan tersebut di antaranya yaitu Juwet (Zizygium cumini), Jambu (Psidium guajava), dan pisang (Musa paradisica).', 'https://www.youtube.com/embed/EorXbuipeP0', '23a416b2d796ffe2f0b3ee71150fe429.jpg');

--
-- Triggers `burung`
--
DELIMITER $$
CREATE TRIGGER `Burung` AFTER INSERT ON `burung` FOR EACH ROW INSERT INTO detail_burung (fk_burung) VALUES (NEW.id_burung)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_burung`
--

CREATE TABLE `detail_burung` (
  `id_detail_burung` int(11) NOT NULL,
  `fk_burung` int(11) NOT NULL,
  `harga_burung` int(11) NOT NULL DEFAULT 0,
  `usia_burung` int(11) NOT NULL DEFAULT 1,
  `stok_burung` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_burung`
--

INSERT INTO `detail_burung` (`id_detail_burung`, `fk_burung`, `harga_burung`, `usia_burung`, `stok_burung`) VALUES
(33, 38, 1500000, 10, 30),
(37, 40, 5000000, 12, 50);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_burung`
--

CREATE TABLE `gallery_burung` (
  `id_gallery` int(11) NOT NULL,
  `fk_detail_burung` int(11) NOT NULL,
  `foto_gallery` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery_burung`
--

INSERT INTO `gallery_burung` (`id_gallery`, `fk_detail_burung`, `foto_gallery`) VALUES
(47, 33, 'burung-cucak-rowo.jpg'),
(48, 37, 'c47e62ce94527ed450d62b4cb6f79986.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `password`, `email`, `role`) VALUES
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'teambirdie@polinema.ac.id', 1),
(13, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 1),
(18, 'daffa', '135a4e22cda0e0a68499e6d6e2a861aa', 'daffa@gmail.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `burung`
--
ALTER TABLE `burung`
  ADD PRIMARY KEY (`id_burung`);

--
-- Indexes for table `detail_burung`
--
ALTER TABLE `detail_burung`
  ADD PRIMARY KEY (`id_detail_burung`),
  ADD KEY `Detail_Burung` (`fk_burung`);

--
-- Indexes for table `gallery_burung`
--
ALTER TABLE `gallery_burung`
  ADD PRIMARY KEY (`id_gallery`),
  ADD KEY `fk_detail_burung` (`fk_detail_burung`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `burung`
--
ALTER TABLE `burung`
  MODIFY `id_burung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `detail_burung`
--
ALTER TABLE `detail_burung`
  MODIFY `id_detail_burung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `gallery_burung`
--
ALTER TABLE `gallery_burung`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_burung`
--
ALTER TABLE `detail_burung`
  ADD CONSTRAINT `Detail_Burung` FOREIGN KEY (`fk_burung`) REFERENCES `burung` (`id_burung`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_burung`
--
ALTER TABLE `gallery_burung`
  ADD CONSTRAINT `gallery_burung_ibfk_1` FOREIGN KEY (`fk_detail_burung`) REFERENCES `detail_burung` (`id_detail_burung`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

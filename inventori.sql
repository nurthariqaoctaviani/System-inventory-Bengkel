-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2023 at 08:00 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`, `category_description`, `created_at`) VALUES
(1, 'Sparepart', '', '2023-01-20 03:18:05'),
(2, 'Oli', '', '2023-01-20 03:18:05'),
(3, 'mobil xenia', '', '2023-01-20 03:18:05'),
(4, 'mobil granmax', 'Barang', '2023-01-20 03:18:05'),
(5, 'mobil kijang', NULL, '2023-01-20 03:18:54'),
(6, 'mobil carry', NULL, '2023-01-20 03:18:54'),
(7, 'mobil toyota', NULL, '2023-01-20 03:19:20'),
(8, 'mobil agya', NULL, '2023-01-20 03:19:20'),
(9, 'mobil apv', NULL, '2023-01-20 03:20:05'),
(10, 'aksesoris', NULL, '2023-01-20 03:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `customer_code` varchar(64) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` char(16) DEFAULT NULL,
  `customer_address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id_customer`, `customer_code`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `created_at`) VALUES
(1, 'CUS24042021001', 'Rahma', 'rahma@mail.com', '081939448489', 'Purwakarta', '2023-01-21 03:05:37'),
(2, 'CUS11062021002', 'Muhammad Agung', 'agung@gmail.com', '082632179863', 'Garut', '2023-01-20 05:12:20'),
(3, 'CUS24012023003', 'ira dwi ', 'ira@gmai.com', '081939448485', 'perum citalang indah', '2023-01-24 07:01:45'),
(4, 'CUS24012023004', 'tari', 'tRI@MAIL.COM', '089688041798', 'PERUM CITALANG INDAH', '2023-01-24 07:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `incoming_items`
--

CREATE TABLE `incoming_items` (
  `id_incoming_items` int(11) NOT NULL,
  `id_items` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `incoming_item_code` varchar(64) NOT NULL,
  `incoming_item_qty` int(11) NOT NULL,
  `incoming_item_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incoming_items`
--

INSERT INTO `incoming_items` (`id_incoming_items`, `id_items`, `id_supplier`, `incoming_item_code`, `incoming_item_qty`, `incoming_item_date`) VALUES
(2, 1, 2, 'TRX-M11062021001', 21, '2021-06-11 18:40:19'),
(3, 4, 3, 'TRX-M24012023002', 5, '2023-01-24 04:42:34'),
(4, 2, 2, 'TRX-M24012023003', 100, '2023-01-24 07:44:05'),
(5, 2, 1, 'TRX-M25012023004', 10, '2023-01-25 10:33:29'),
(12, 3, 2, 'TRX-M01022023005', 50, '2023-02-01 13:06:37'),
(13, 3, 3, 'TRX-M01022023006', 50, '2023-02-01 13:07:00');

--
-- Triggers `incoming_items`
--
DELIMITER $$
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `incoming_items` FOR EACH ROW BEGIN
	UPDATE items SET item_stock=item_stock+NEW.incoming_item_qty
    WHERE id_item = NEW.id_items;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id_item` int(11) NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `item_code` varchar(64) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_stock` int(11) NOT NULL,
  `item_stock_min` int(11) NOT NULL,
  `item_price` float NOT NULL,
  `item_description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id_item`, `id_category`, `id_unit`, `item_code`, `item_name`, `item_image`, `item_stock`, `item_stock_min`, `item_price`, `item_description`, `created_at`) VALUES
(1, 2, 4, 'BRG23042021001', 'OLI FILTER  T120 SS', 'BRG230420210011.jpg', 53, 0, 35000, 'ready stock, cocok untuk MitsubishiT120SS.\r\nToko kami menjual product-product spareparts mobil berkualitas dengan harga bersaing.', '2023-01-20 03:23:01'),
(2, 1, 3, 'BRG11062021002', 'BOOSTER ASSY K/SUPER BIRKES', 'BRG11062021002.jpg', 75, 0, 550000, 'servo rem assy kijang super kf 40\r\nBrake booster assy / servo rem assy kijang super kf 40\r\nHarga 1 pcs', '2023-01-25 10:33:29'),
(3, 3, 3, 'BRG18012023003', 'WATER PUMP AVZ', 'BRG18012023003.jpg', 30, 0, 300000, 'Aliran: 90 liter/detik.\r\nTekanan: 0,05 mm. Daya Hg\r\n: 11 kW\r\nRpm: 1500\r\nDimensi: 1000х575х1040', '2023-02-02 06:08:37'),
(4, 1, 3, 'BRG23012023004', 'OLI FILTER CARRY ', 'BRG23012023004.JPG', 18, 0, 85000, 'BrandRYCO\r\nManufacturer Part NumberZ418\r\neBay Product ID (ePID)252492741', '2023-01-24 04:42:34'),
(5, 1, 3, 'BRG23012023005', 'Suzuki Aerio Oil Filter', 'BRG23012023005.JPG', 13, 0, 55000, 'Parts 11386QV 2003 2004 2005 2006', '2023-01-23 10:16:11'),
(6, 1, 3, 'BRG23012023006', 'OLI FILTER FUTURA ', 'BRG23012023006.jpg', 12, 0, 50000, 'harga tertera harga satuan / per pcs', '2023-01-23 10:18:51'),
(7, 1, 4, 'BRG23012023007', 'AIR ACCU BLACK BESAR MERAH 1,5 LT', 'BRG23012023007.JPG', 20, 0, 10000, 'Cocok digunakan untuk PENGISIAN PERTAMA segala merk dan tipe AKI MOBIL atau AKI MOTOR anda.', '2023-01-23 10:21:59'),
(8, 1, 4, 'BRG23012023008', 'AIR ACCU BLACK KECIL 500ML ', 'BRG23012023008.JPG', 20, 0, 8000, 'Air Aki Zuur merk YUASA Kemasan 500ml.\r\nStok terupdate dengan kemasan baru!', '2023-01-23 10:23:20'),
(9, 1, 4, 'BRG23012023009', 'AIR COOLANT 1 L', 'BRG23012023009.JPG', 16, 0, 25000, 'BERFUNGSI UNTUK :\r\nPENDINGIN MESIN MOROR MATIC ANDA, MOTOR BEBEK ANDAN DAN MOTOR BESAR (MOGE ANDAN)', '2023-01-23 10:26:18'),
(10, 1, 4, 'BRG23012023010', 'AIR COOLANT 5 L', 'BRG23012023010.JPG', 13, 0, 45000, 'Petroasia Super Radiator Coolant 5L\r\nCairan warna HIJAU\r\n', '2023-01-23 10:28:05'),
(11, 1, 3, 'BRG23012023011', 'BOOSTER ASSY K/SUPER BIRKES', 'BRG23012023011.JPG', 7, 0, 650000, 'Booster Assy / Brake Booster / Booster Rem\r\n\r\nMerk : GB\r\nSeri : 44610-38040\r\n\r\nDapat Digunakan/Diaplikasikan Pada Mobil :\r\n- Toyota Kijang Kapsul 7K', '2023-01-23 10:30:55'),
(12, 1, 5, 'BRG23012023012', 'BUSH STEER FUT/ S88 FUJI048750 85000', 'BRG23012023012.JPG', 23, 0, 65000, 'Berat : 500 g\r\nBUSHING STEERING / BUSH STEER UNTUK MOBIL SUZUKI FUTURA / MITSUBISHI T-120SS / DAIHATSU S-88 (48750-85001)', '2023-01-23 10:33:52'),
(13, 1, 3, 'BRG23012023013', 'BACK UP SWTICH ST 100 TOP-02-6010S', 'BRG23012023013.JPG', 10, 0, 35000, 'Mobil : Carry 1.0 / ST100\r\nMerk : TOP\r\nNo. Part : 02-6010S\r\nOEM No. Part : 37610-79502', '2023-01-23 10:35:34'),
(14, 1, 3, 'BRG23012023014', 'BOHLAM OSRAM 12 V 5 W 12/19', 'BRG23012023014.JPG', 30, 0, 10000, 'ORIGINAL OSRAM ASLI\r\nharga per 1 biji', '2023-01-23 10:37:30'),
(15, 2, 4, 'BRG23012023015', 'OLI SHELL HELIX HX 5 15W-40 1L', 'BRG23012023015.JPG', 12, 0, 53000, 'OLI SHELL HELIX HX5 15W-40 1 LTR\r\n-FOR DIESEL AND GASOLINE ENGINES\r\n-PREMIUM MULTI GRADE MOTOR OIL\r\n-ACTIVE CLEANSING TECHNOLOGY SHELL HELIX HX5 15W-40', '2023-01-23 10:40:19'),
(16, 2, 4, 'BRG23012023016', 'OLI TMO 10W-40 4L', 'BRG23012023016.JPG', 26, 0, 200000, 'Toyota Motor Oil SAE 10W-40 merupakan produk premium dengan API SN, dibuat khusus untuk mesin bensin Toyota. Telah teruji dan disetujui oleh Toyota dan memenuhi standar kualitas yang ditetapkan Toyota. Formula tepat untuk semua jenis mesin bensin Toyota termasuk mesin jenis turbocharge. Perlindungan sempurna untuk semua mesin yang menggunakan pelumas tipe API SN, SAE 10W-40.', '2023-01-23 10:43:41'),
(17, 2, 4, 'BRG23012023017', 'OLI SHELL RIMULA R4X 15W40 DIESEL ', 'BRG23012023017.JPG', 16, 0, 350000, 'Shell Rimula R4X 15W-40 kemasan 5 Liter. Unique, active technology for high power, modern engines.\r\n\r\nShell Rimula R4X dirancang untuk memberikan tiga perlindungan untuk meningkatkan kehandalan mesin dan oli. ', '2023-01-23 10:46:47'),
(18, 2, 5, 'BRG23012023018', 'OLI SHOCKBLEKER ', 'BRG23012023018.JPG', 13, 0, 150000, 'Oli Fork Sintetik perfoma tinggi memberikan handling yang lebih responsif dan cocok dengan semua sistim, termasuk damping rod, catridge, baldder, fork konvesional & terbalik.', '2023-01-23 10:51:22'),
(19, 2, 4, 'BRG23012023019', 'OLI MESRAN SUPER SG/CD 20W50 1L', 'BRG23012023019.JPG', 21, 0, 50000, 'MESRAN SUPER SAE 20W-50didesain dari High Viscosity index base oil dan aditif pilihan yang dibutuhkan untuk pelumasan kendaraan berbahan bakar bensin yang mensyaratkan pelumas dengan klasifikasi mutu APISG/CD', '2023-01-23 10:55:29'),
(20, 2, 4, 'BRG23012023020', 'OLI POWER STERING ', 'BRG23012023020.JPG', 12, 0, 50000, 'Isi: 1 Quart (946 ml)\r\nCairan Bening tutup botol BIRU\r\nCairan Merah tutup botol MERAH', '2023-01-23 10:59:16'),
(21, 2, 5, 'BRG23012023021', 'OLI CVT HONDA ', 'BRG23012023021.JPG', 20, 0, 300000, 'Oli Khusus mobil transmisi CVT', '2023-01-23 11:04:07'),
(22, 3, 3, 'BRG23012023022', 'VANTBELT 4PK 1735', 'BRG23012023022.JPG', 3, 0, 75000, 'Temperature range : - 18 C to +80 C\r\nLess noise during operation\r\nLong service time', '2023-01-23 11:06:08'),
(23, 3, 3, 'BRG23012023023', 'BOOT STIR 219', 'BRG23012023023.JPG', 15, 0, 50000, '**HARGA ADALAH HARGA SATUAN (1 BARANG). ORDER 2 BUAH UNTUK KANAN-KIRI / SEPASANG!!**\r\n\r\nBoot long tie rod Honda CRV Gen.3 2400 cc (2007-2012).', '2023-01-23 11:13:33'),
(24, 1, 3, 'BRG24012023024', 'OLI SHELL RIMULA R4X 15W40 DIESEL ', 'BRG24012023024.JPG', 1, 0, 250, '', '2023-01-24 04:39:49'),
(25, 2, 3, 'BRG24012023025', 'OLI SHELL RIMULA R4X 15W40 DIESEL ', 'BRG24012023025.JPG', 3, 0, 20, 'tersedia', '2023-01-24 07:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `outcoming_items`
--

CREATE TABLE `outcoming_items` (
  `id_outcoming_item` int(11) NOT NULL,
  `id_items` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `outcoming_item_code` varchar(64) NOT NULL,
  `outcoming_item_qty` int(11) NOT NULL,
  `outcoming_item_price` float NOT NULL,
  `outcoming_item_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outcoming_items`
--

INSERT INTO `outcoming_items` (`id_outcoming_item`, `id_items`, `id_customer`, `outcoming_item_code`, `outcoming_item_qty`, `outcoming_item_price`, `outcoming_item_date`) VALUES
(3, 1, 1, 'TRX-K11062021001', 12, 0, '2021-06-11 18:30:28'),
(4, 2, 2, 'TRX-K11062021002', 21, 0, '2021-06-11 18:57:48'),
(5, 2, 2, 'TRX-K24012023003', 50, 0, '2023-01-24 07:46:11'),
(15, 3, 4, 'TRX-K01022023004', 10, 0, '2023-02-01 13:15:21'),
(16, 3, 2, 'TRX-K02022023005', 60, 0, '2023-02-02 06:08:37');

--
-- Triggers `outcoming_items`
--
DELIMITER $$
CREATE TRIGGER `barang_keluar` AFTER INSERT ON `outcoming_items` FOR EACH ROW BEGIN
	UPDATE items SET item_stock=item_stock-NEW.outcoming_item_qty
    WHERE id_item = NEW.id_items;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stok_gudang_keluar`
--

CREATE TABLE `stok_gudang_keluar` (
  `id_stok_gudang_keluar` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` enum('Bagus','Rusak','Hilang') NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_gudang_keluar`
--

INSERT INTO `stok_gudang_keluar` (`id_stok_gudang_keluar`, `id_item`, `qty`, `status`, `tanggal`) VALUES
(6, 3, 10, 'Bagus', '2023-02-01 20:15:21'),
(7, 3, 100, 'Hilang', '2023-02-01 20:53:04'),
(8, 3, 10, 'Hilang', '2023-02-01 21:01:01'),
(9, 4, 20, 'Rusak', '2023-02-01 21:01:11'),
(10, 3, 30, 'Rusak', '2023-02-01 21:02:03'),
(11, 4, 100, 'Rusak', '2023-02-01 21:02:45'),
(13, 3, 2, 'Rusak', '2023-02-02 12:44:44'),
(14, 3, 40, 'Rusak', '2023-02-02 12:46:51'),
(15, 3, 60, 'Bagus', '2023-02-02 13:08:37'),
(16, 2, 5, 'Hilang', '2023-02-02 15:37:48'),
(17, 3, 0, 'Bagus', '2023-02-02 15:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `stok_gudang_masuk`
--

CREATE TABLE `stok_gudang_masuk` (
  `id_stok_gudang_masuk` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` enum('Bagus','Rusak','Hilang') NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_gudang_masuk`
--

INSERT INTO `stok_gudang_masuk` (`id_stok_gudang_masuk`, `id_item`, `qty`, `status`, `tanggal`) VALUES
(11, 3, 100, 'Bagus', '2023-02-01 20:29:41'),
(12, 3, 150, 'Bagus', '2023-02-01 20:29:59'),
(13, 4, 100, 'Bagus', '2023-02-01 20:59:41'),
(14, 3, 2, 'Bagus', '2023-02-02 12:46:27'),
(15, 2, 100, 'Bagus', '2023-02-02 12:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` int(11) NOT NULL,
  `supplier_code` varchar(64) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_email` varchar(100) NOT NULL,
  `supplier_phone` char(16) DEFAULT NULL,
  `supplier_address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `supplier_code`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_address`, `created_at`) VALUES
(1, 'SPL24042021001', 'Budi Doremi', 'budi@mail.com', '081939448487', 'Jl. Indah, No.11 Gomong Lama, Bandung.', '2023-01-21 02:48:24'),
(2, 'SPL11062021002', 'Muhammad Kuswari', 'muhammad@gmail.com', '081939448488', 'Jl. Bunga Matahari, No.11 Gomong Lama, Mataram.', '2023-01-20 04:58:37'),
(3, 'SPL24012023003', 'riefa khania', 'riefaa15@gmail.com', '081318122115', 'Kp. Kaum Plered Purwakarta', '2023-01-24 04:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id_unit` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `unit_description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id_unit`, `unit_name`, `unit_description`, `created_at`) VALUES
(3, 'Pcs', '', '2021-04-23 21:18:48'),
(4, 'Liter', '', '2021-04-23 21:18:52'),
(5, 'Kilogram', '', '2021-04-23 21:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` char(16) DEFAULT NULL,
  `user_address` text,
  `user_avatar` varchar(255) DEFAULT 'default.jpg',
  `user_password` varchar(255) NOT NULL,
  `user_role` enum('admin','staff') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `user_name`, `user_email`, `user_phone`, `user_address`, `user_avatar`, `user_password`, `user_role`, `created_at`) VALUES
(1, 'Riefa Khania Putri', 'admin@gmail.com', '081939448487', 'Plered ,  purwakarta', '1674197729661.png', '$2y$10$/ePeCDWkJXlcHhqjD4vje.zO6r2ejISJTJ4AS4mtLt1JIDBNwoFRu', 'admin', '2023-02-01 05:30:52'),
(2, 'Staff Bunga', 'staff@gmail.com', '085156031903', 'Bandung', '1674194428821.png', '$2y$10$ychqFGRIZFy5UzR0FIrxV.kHbpSZLIK7Dnabw1NUh6eED/iCbE0Uu', 'staff', '2023-02-01 05:30:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `incoming_items`
--
ALTER TABLE `incoming_items`
  ADD PRIMARY KEY (`id_incoming_items`),
  ADD KEY `id_items` (`id_items`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `outcoming_items`
--
ALTER TABLE `outcoming_items`
  ADD PRIMARY KEY (`id_outcoming_item`),
  ADD KEY `id_items` (`id_items`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `stok_gudang_keluar`
--
ALTER TABLE `stok_gudang_keluar`
  ADD PRIMARY KEY (`id_stok_gudang_keluar`),
  ADD KEY `id_item` (`id_item`);

--
-- Indexes for table `stok_gudang_masuk`
--
ALTER TABLE `stok_gudang_masuk`
  ADD PRIMARY KEY (`id_stok_gudang_masuk`),
  ADD KEY `id_item` (`id_item`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `incoming_items`
--
ALTER TABLE `incoming_items`
  MODIFY `id_incoming_items` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `outcoming_items`
--
ALTER TABLE `outcoming_items`
  MODIFY `id_outcoming_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `stok_gudang_keluar`
--
ALTER TABLE `stok_gudang_keluar`
  MODIFY `id_stok_gudang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stok_gudang_masuk`
--
ALTER TABLE `stok_gudang_masuk`
  MODIFY `id_stok_gudang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incoming_items`
--
ALTER TABLE `incoming_items`
  ADD CONSTRAINT `incoming_items_ibfk_1` FOREIGN KEY (`id_items`) REFERENCES `items` (`id_item`),
  ADD CONSTRAINT `incoming_items_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id_unit`);

--
-- Constraints for table `outcoming_items`
--
ALTER TABLE `outcoming_items`
  ADD CONSTRAINT `outcoming_items_ibfk_1` FOREIGN KEY (`id_items`) REFERENCES `items` (`id_item`),
  ADD CONSTRAINT `outcoming_items_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2026 at 05:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_produk`
--
CREATE DATABASE IF NOT EXISTS `db_produk` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_produk`;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--
-- Error reading structure for table db_produk.kategori: #1932 - Table &#039;db_produk.kategori&#039; doesn&#039;t exist in engine
-- Error reading data for table db_produk.kategori: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_produk`.`kategori`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--
-- Error reading structure for table db_produk.produk: #1932 - Table &#039;db_produk.produk&#039; doesn&#039;t exist in engine
-- Error reading data for table db_produk.produk: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_produk`.`produk`&#039; at line 1
--
-- Database: `eventhub`
--
CREATE DATABASE IF NOT EXISTS `eventhub` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eventhub`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Seminar'),
(2, 'Workshop'),
(3, 'Lomba');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `quota` int(11) DEFAULT 0,
  `image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `title`, `description`, `location`, `event_date`, `quota`, `image`, `created_at`) VALUES
(1, 1, 'Seminar UI/UX Pastel Day', 'Seminar seru tentang UI/UX dengan vibes pastel lucu. Ganti teks aja ya!', 'Jakarta', '2026-02-10', 50, 'img1.jpg', '2026-01-04 16:19:18'),
(2, 1, 'Seminar Public Speaking', 'Belajar komunikasi & percaya diri. Tinggal ganti teks aja.', 'Bandung', '2026-02-11', 40, 'img2.jpg', '2026-01-04 16:19:18'),
(3, 1, 'Seminar Career Talk', 'Talkshow karir bareng mentor profesional.', 'Surabaya', '2026-02-12', 60, 'img3.jpg', '2026-01-04 16:19:18'),
(4, 1, 'Seminar Digital Marketing', 'Belajar marketing kekinian untuk pemula.', 'Online', '2026-02-13', 100, 'img4.jpg', '2026-01-04 16:19:18'),
(5, 1, 'Seminar Design Thinking', 'Cari ide kreatif dengan metode design thinking.', 'Yogyakarta', '2026-02-14', 35, 'img5.jpg', '2026-01-04 16:19:18'),
(6, 2, 'Workshop Web PHP Native', 'Workshop bikin web dengan PHP native dan Bootstrap.', 'Jakarta', '2026-03-01', 25, 'img6.jpg', '2026-01-04 16:19:18'),
(7, 2, 'Workshop Data Analytics', 'Latihan analisis data pakai Excel & dasar Python.', 'Bandung', '2026-03-02', 30, 'img7.jpg', '2026-01-04 16:19:18'),
(8, 2, 'Workshop UI Figma', 'Belajar desain UI di Figma dari 0.', 'Online', '2026-03-03', 80, 'img8.jpg', '2026-01-04 16:19:18'),
(9, 2, 'Workshop Copywriting', 'Latihan bikin caption promosi yang menarik.', 'Semarang', '2026-03-04', 20, 'img9.jpg', '2026-01-04 16:19:18'),
(10, 2, 'Workshop Video Editing', 'Belajar edit video ala creator.', 'Surabaya', '2026-03-05', 25, 'img10.jpg', '2026-01-04 16:19:18'),
(11, 3, 'Lomba Poster Digital', 'Kompetisi poster digital bertema kreativitas.', 'Online', '2026-01-20', 200, 'img11.jpg', '2026-01-04 16:19:18'),
(12, 3, 'Lomba Essay Nasional', 'Kompetisi essay mahasiswa tingkat nasional.', 'Online', '2026-01-21', 150, 'img12.jpg', '2026-01-04 16:19:18'),
(13, 3, 'Lomba Business Plan', 'Kompetisi rencana bisnis untuk startup muda.', 'Jakarta', '2026-01-22', 80, 'img13.jpg', '2026-01-04 16:19:18'),
(14, 3, 'Lomba Fotografi', 'Kompetisi foto bertema kehidupan kampus.', 'Bandung', '2026-01-23', 120, 'img14.jpg', '2026-01-04 16:19:18'),
(15, 3, 'Lomba Hackathon Mini', 'Hackathon mini untuk pemula.', 'Surabaya', '2026-01-24', 60, 'img15.jpg', '2026-01-04 16:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `phone`, `address`, `created_at`) VALUES
(1, 'Admin EventHub', 'admin@eventhub.com', '$2y$10$zJf2GzEw5c0Hq6Cj5bYIY.sxTgVQ6w6VvG8kPq/1I2g3wV9fY9mNy', 'admin', NULL, NULL, '2026-01-04 16:19:18'),
(2, 'syifa', 'syifa@gmail.com', '$2y$10$826e.72ZJVB6dvg9HOAYoeS/0ntAT1vBInoCR1XZz5iEHM4TwCeci', 'user', NULL, NULL, '2026-01-04 16:38:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
--
-- Database: `event_management`
--
CREATE DATABASE IF NOT EXISTS `event_management` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `event_management`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL DEFAULT 0,
  `stok` int(11) NOT NULL DEFAULT 0,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `judul`, `deskripsi`, `kategori`, `tanggal`, `lokasi`, `harga`, `stok`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Event Contoh 1', 'Ini adalah deskripsi event contoh nomor 1. Nanti deskripsi ini akan diganti sesuai event asli.', 'Lomba Internasional', '2026-01-05', 'Kampus / Zoom / Aula 1', 39073, 90, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(2, 'Event Contoh 2', 'Ini adalah deskripsi event contoh nomor 2. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-06', 'Kampus / Zoom / Aula 2', 44776, 31, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(3, 'Event Contoh 3', 'Ini adalah deskripsi event contoh nomor 3. Nanti deskripsi ini akan diganti sesuai event asli.', 'Seminar', '2026-01-07', 'Kampus / Zoom / Aula 3', 0, 92, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(4, 'Event Contoh 4', 'Ini adalah deskripsi event contoh nomor 4. Nanti deskripsi ini akan diganti sesuai event asli.', 'Seminar', '2026-01-08', 'Kampus / Zoom / Aula 4', 16785, 22, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(5, 'Event Contoh 5', 'Ini adalah deskripsi event contoh nomor 5. Nanti deskripsi ini akan diganti sesuai event asli.', 'PKM', '2026-01-09', 'Kampus / Zoom / Aula 5', 15465, 52, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(6, 'Event Contoh 6', 'Ini adalah deskripsi event contoh nomor 6. Nanti deskripsi ini akan diganti sesuai event asli.', 'Seminar', '2026-01-10', 'Kampus / Zoom / Aula 6', 0, 81, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(7, 'Event Contoh 7', 'Ini adalah deskripsi event contoh nomor 7. Nanti deskripsi ini akan diganti sesuai event asli.', 'Lomba Internasional', '2026-01-11', 'Kampus / Zoom / Aula 7', 44158, 91, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(8, 'Event Contoh 8', 'Ini adalah deskripsi event contoh nomor 8. Nanti deskripsi ini akan diganti sesuai event asli.', 'Seminar', '2026-01-12', 'Kampus / Zoom / Aula 8', 41018, 70, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(9, 'Event Contoh 9', 'Ini adalah deskripsi event contoh nomor 9. Nanti deskripsi ini akan diganti sesuai event asli.', 'Lomba Nasional', '2026-01-13', 'Kampus / Zoom / Aula 9', 0, 70, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(10, 'Event Contoh 10', 'Ini adalah deskripsi event contoh nomor 10. Nanti deskripsi ini akan diganti sesuai event asli.', 'PKM', '2026-01-14', 'Kampus / Zoom / Aula 10', 21993, 53, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(11, 'Event Contoh 11', 'Ini adalah deskripsi event contoh nomor 11. Nanti deskripsi ini akan diganti sesuai event asli.', 'PKM', '2026-01-15', 'Kampus / Zoom / Aula 11', 27442, 27, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(12, 'Event Contoh 12', 'Ini adalah deskripsi event contoh nomor 12. Nanti deskripsi ini akan diganti sesuai event asli.', 'P2MW', '2026-01-16', 'Kampus / Zoom / Aula 12', 0, 62, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(13, 'Event Contoh 13', 'Ini adalah deskripsi event contoh nomor 13. Nanti deskripsi ini akan diganti sesuai event asli.', 'PKM', '2026-01-17', 'Kampus / Zoom / Aula 13', 36071, 83, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(14, 'Event Contoh 14', 'Ini adalah deskripsi event contoh nomor 14. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-18', 'Kampus / Zoom / Aula 14', 28173, 39, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(15, 'Event Contoh 15', 'Ini adalah deskripsi event contoh nomor 15. Nanti deskripsi ini akan diganti sesuai event asli.', 'Seminar', '2026-01-19', 'Kampus / Zoom / Aula 15', 0, 80, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(16, 'Event Contoh 16', 'Ini adalah deskripsi event contoh nomor 16. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-20', 'Kampus / Zoom / Aula 16', 35487, 10, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(17, 'Event Contoh 17', 'Ini adalah deskripsi event contoh nomor 17. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-21', 'Kampus / Zoom / Aula 17', 30040, 76, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(18, 'Event Contoh 18', 'Ini adalah deskripsi event contoh nomor 18. Nanti deskripsi ini akan diganti sesuai event asli.', 'Lomba Internasional', '2026-01-22', 'Kampus / Zoom / Aula 18', 0, 55, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(19, 'Event Contoh 19', 'Ini adalah deskripsi event contoh nomor 19. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-23', 'Kampus / Zoom / Aula 19', 24026, 69, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(20, 'Event Contoh 20', 'Ini adalah deskripsi event contoh nomor 20. Nanti deskripsi ini akan diganti sesuai event asli.', 'Webinar', '2026-01-24', 'Kampus / Zoom / Aula 20', 11208, 96, NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_03_174555_add_role_to_users_table', 1),
(5, '2026_01_04_000621_create_events_table', 1),
(6, '2026_01_04_141805_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `total_harga` int(11) NOT NULL DEFAULT 0,
  `status` enum('pending','sukses','gagal') NOT NULL DEFAULT 'sukses',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `event_id`, `jumlah`, `total_harga`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 39073, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(2, 2, 14, 1, 28173, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(3, 2, 8, 1, 41018, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(4, 2, 7, 1, 44158, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(5, 2, 4, 1, 16785, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(6, 2, 5, 1, 15465, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(7, 2, 12, 1, 0, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(8, 2, 12, 1, 0, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(9, 2, 9, 1, 0, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(10, 2, 13, 1, 36071, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(11, 2, 5, 1, 15465, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(12, 2, 7, 1, 44158, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(13, 2, 15, 1, 0, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(14, 2, 20, 1, 11208, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(15, 2, 17, 1, 30040, 'sukses', '2026-01-04 07:59:47', '2026-01-04 07:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('85icZK0sKMbThTvejp7IAdCgOG8MecyWKn6G9HKD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1ZtekVXNm5BcGMxYURVN2ZLZXBiUDVuTWFVWnVTRGp2VEhEbGdnaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767539613),
('WdmVanPtrepYhVm3DaHgFG2vWTD4rLO6mltWoDad', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEpuZWZlZUlCOXVYa051SHV0V1Q1Tkh1anZqenZKMzVBTFZUSW5CYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767538828);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', NULL, NULL, '$2y$12$JyE9L1fm0aewBsJz/uBAB.czgadiqTefdOQEkrQ7oaCWQQ.0ENdEK', NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47'),
(2, 'User', 'user@gmail.com', 'user', NULL, NULL, '$2y$12$t18rFot5Gwj2C8U7FjGkFOYLDVQp5bFzJrmZIygPinDth/a9tfHku', NULL, '2026-01-04 07:59:47', '2026-01-04 07:59:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_event_id_foreign` (`event_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--
-- Error reading structure for table phpmyadmin.pma__bookmark: #1932 - Table &#039;phpmyadmin.pma__bookmark&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__bookmark: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__bookmark`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--
-- Error reading structure for table phpmyadmin.pma__central_columns: #1932 - Table &#039;phpmyadmin.pma__central_columns&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__central_columns: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__central_columns`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--
-- Error reading structure for table phpmyadmin.pma__column_info: #1932 - Table &#039;phpmyadmin.pma__column_info&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__column_info: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__column_info`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--
-- Error reading structure for table phpmyadmin.pma__designer_settings: #1932 - Table &#039;phpmyadmin.pma__designer_settings&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__designer_settings: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__designer_settings`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--
-- Error reading structure for table phpmyadmin.pma__export_templates: #1932 - Table &#039;phpmyadmin.pma__export_templates&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__export_templates: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__export_templates`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--
-- Error reading structure for table phpmyadmin.pma__favorite: #1932 - Table &#039;phpmyadmin.pma__favorite&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__favorite: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__favorite`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--
-- Error reading structure for table phpmyadmin.pma__history: #1932 - Table &#039;phpmyadmin.pma__history&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__history: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__history`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--
-- Error reading structure for table phpmyadmin.pma__navigationhiding: #1932 - Table &#039;phpmyadmin.pma__navigationhiding&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__navigationhiding: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__navigationhiding`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--
-- Error reading structure for table phpmyadmin.pma__pdf_pages: #1932 - Table &#039;phpmyadmin.pma__pdf_pages&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__pdf_pages: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__pdf_pages`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--
-- Error reading structure for table phpmyadmin.pma__recent: #1932 - Table &#039;phpmyadmin.pma__recent&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__recent: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__recent`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--
-- Error reading structure for table phpmyadmin.pma__relation: #1932 - Table &#039;phpmyadmin.pma__relation&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__relation: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__relation`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--
-- Error reading structure for table phpmyadmin.pma__savedsearches: #1932 - Table &#039;phpmyadmin.pma__savedsearches&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__savedsearches: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__savedsearches`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--
-- Error reading structure for table phpmyadmin.pma__table_coords: #1932 - Table &#039;phpmyadmin.pma__table_coords&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__table_coords: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__table_coords`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--
-- Error reading structure for table phpmyadmin.pma__table_info: #1932 - Table &#039;phpmyadmin.pma__table_info&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__table_info: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__table_info`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--
-- Error reading structure for table phpmyadmin.pma__table_uiprefs: #1932 - Table &#039;phpmyadmin.pma__table_uiprefs&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__table_uiprefs`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--
-- Error reading structure for table phpmyadmin.pma__tracking: #1932 - Table &#039;phpmyadmin.pma__tracking&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__tracking: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__tracking`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--
-- Error reading structure for table phpmyadmin.pma__userconfig: #1932 - Table &#039;phpmyadmin.pma__userconfig&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__userconfig: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__userconfig`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--
-- Error reading structure for table phpmyadmin.pma__usergroups: #1932 - Table &#039;phpmyadmin.pma__usergroups&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__usergroups: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__usergroups`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--
-- Error reading structure for table phpmyadmin.pma__users: #1932 - Table &#039;phpmyadmin.pma__users&#039; doesn&#039;t exist in engine
-- Error reading data for table phpmyadmin.pma__users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `phpmyadmin`.`pma__users`&#039; at line 1
--
-- Database: `siak_upi`
--
CREATE DATABASE IF NOT EXISTS `siak_upi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siak_upi`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--
-- Error reading structure for table siak_upi.mahasiswa: #1932 - Table &#039;siak_upi.mahasiswa&#039; doesn&#039;t exist in engine
-- Error reading data for table siak_upi.mahasiswa: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `siak_upi`.`mahasiswa`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Error reading structure for table siak_upi.user: #1932 - Table &#039;siak_upi.user&#039; doesn&#039;t exist in engine
-- Error reading data for table siak_upi.user: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `siak_upi`.`user`&#039; at line 1
--
-- Database: `simbs`
--
CREATE DATABASE IF NOT EXISTS `simbs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simbs`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--
-- Error reading structure for table simbs.buku: #1932 - Table &#039;simbs.buku&#039; doesn&#039;t exist in engine
-- Error reading data for table simbs.buku: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `simbs`.`buku`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--
-- Error reading structure for table simbs.kategori: #1932 - Table &#039;simbs.kategori&#039; doesn&#039;t exist in engine
-- Error reading data for table simbs.kategori: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `simbs`.`kategori`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Error reading structure for table simbs.user: #1932 - Table &#039;simbs.user&#039; doesn&#039;t exist in engine
-- Error reading data for table simbs.user: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `simbs`.`user`&#039; at line 1
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

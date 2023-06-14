-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 06:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis`
--

-- --------------------------------------------------------

--
-- Table structure for table `apply_leave`
--

CREATE TABLE `apply_leave` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `num_of_days` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'new',
  `type_leave` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apply_leave`
--

INSERT INTO `apply_leave` (`id`, `users_id`, `from`, `to`, `num_of_days`, `status`, `type_leave`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-05-15', '2023-05-16', '2', '1', 'OL', '2023-05-14 21:36:25', '2023-05-14 21:40:50'),
(2, 4, '2023-05-16', '2023-05-17', '2', '1', 'SL', '2023-05-14 21:42:08', '2023-05-14 21:42:37');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kurtis Crist', 'jesus.kuvalis@reichel.com', 'admin', '2023-05-13 11:16:36', '$2y$10$RcKk01ad8K49JVrgzmI5vOIk6UfhKmY4zcDPevwzEXdCSLq66vhzK', 'zBA2cogOqXBkpuqbqftkjvD28uFp9bvyzI8r7lURPyR2FBkbwQjBO1yN5lNI', '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(2, 'Felicia Casper', 'awolff@jakubowski.biz', 'user', '0000-00-00 00:00:00', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', '1oOPJzaQCOG8tN5GJLII9Z0pg1VyoEjDJZxNL7wS27q5IhNxBVp7cHbw9eGB', '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(3, 'Alicia Wisozk', 'nzemlak@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(4, 'John Sipes DVM', 'baron.kuhlman@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(5, 'Dr. Cordie Bergstrom', 'jwiegand@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(6, 'Cameron Gulgowski', 'bosco.landen@hauck.net', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(7, 'Bridget Reichert MD', 'kkassulke@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(8, 'Itzel Torp', 'curt.cronin@larson.biz', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(9, 'Danika Hand', 'cstark@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(10, 'Dr. Abbigail Klocko DVM', 'nwintheiser@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(12, 'Sylvan Rutherford Sr.', 'ekilback@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(13, 'Dr. Leonie Gleichner', 'walter.alfonzo@harvey.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(14, 'Prof. Lilliana Wunsch DVM', 'abernathy.jalyn@heidenreich.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(15, 'Jevon O\'Connell', 'jackson.strosin@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(16, 'Isabell Kuhic', 'bettie19@cartwright.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(17, 'Hugh Glover', 'dgoyette@kuhic.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(18, 'Elwin Hamill DVM', 'cordell.gorczany@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(19, 'Ronny Kris II', 'conn.geovanny@carroll.net', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(20, 'Ms. Elta Schaden', 'zboncak.columbus@goldner.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(21, 'Dr. Michaela Kerluke', 'kschulist@jacobi.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(22, 'Eula D\'Amore', 'bednar.waino@koch.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(23, 'Kylee Rempel', 'hollis.bogisich@daugherty.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(24, 'Jackeline Kub II', 'trever01@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(25, 'Tyrel Harris PhD', 'jerod.schiller@nitzsche.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(26, 'Miss Ollie Friesen Jr.', 'zena30@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(27, 'Dr. Consuelo Ruecker IV', 'thurman.boehm@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(28, 'Mrs. Marilie Hauck MD', 'modesta66@hickle.info', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(29, 'Shea Lockman', 'zking@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(30, 'Belle Zemlak DVM', 'dedrick.hilpert@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(31, 'Spencer Tromp', 'bashirian.lawson@schoen.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(32, 'Dr. Cullen Cormier PhD', 'tconn@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(33, 'Miss Matilde Crona MD', 'hryan@herman.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(34, 'Nathaniel Haag II', 'roselyn.wuckert@stanton.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(35, 'Chloe Wyman', 'terrence70@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(36, 'Audrey Hettinger DVM', 'ardella.halvorson@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(37, 'Prof. Titus Nitzsche DDS', 'johnson.lyric@collins.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(38, 'Marielle Schaden', 'barton.virgie@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(39, 'Pearline Abshire Sr.', 'nicholas.roob@roberts.info', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(40, 'Jaylen Tremblay', 'tblanda@mcdermott.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(41, 'Sylvester Senger MD', 'gregg.osinski@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(42, 'Mr. Randy Renner', 'gussie.nicolas@wilderman.info', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(43, 'Rowena Olson', 'edwardo.padberg@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(44, 'Haskell Gutkowski', 'aleen.hermiston@yost.biz', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(45, 'Karen Considine', 'dasia.mohr@predovic.net', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(46, 'Mr. Joseph Rolfson', 'collins.amy@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(47, 'Susanna Bartell', 'hickle.buddy@gmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(48, 'Ayden Hane', 'flatley.sandra@hotmail.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(49, 'Maya Turcotte IV', 'wilford.donnelly@yahoo.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(50, 'Gaetano Prosacco', 'fcorkery@morar.com', 'user', '2023-05-13 11:16:36', '$2y$10$AQNS/xRF3fiDaz//SnXGheXqej9zjvUEQWRHiedmtuOFR9L6QTBOW', NULL, '2023-05-13 11:16:36', '2023-05-13 11:16:36'),
(51, 'test', 'test@mail.com', 'user', NULL, '$2y$10$N0dSZ0oPO3NAWh0sTTLJUucm1NWI95LdfAIc13w1CVVgLEalA6kFq', NULL, '2023-05-16 22:52:58', '2023-05-16 22:52:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apply_leave`
--
ALTER TABLE `apply_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `apply_leave`
--
ALTER TABLE `apply_leave`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

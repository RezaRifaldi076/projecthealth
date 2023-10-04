-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Okt 2023 pada 12.10
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_projecthealth`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'pengelola sistem'),
(2, 'dokter', 'pengguna sistem'),
(3, 'pasien', 'pengguna sistem');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 3),
(2, 4),
(2, 22),
(3, 5),
(3, 8),
(3, 10),
(3, 11),
(3, 13),
(3, 14),
(3, 15),
(3, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'admin', NULL, '2023-09-21 06:45:38', 0),
(2, '::1', 'admin', NULL, '2023-09-21 06:49:54', 0),
(3, '::1', 'admin@gmail.com', 3, '2023-09-21 06:52:42', 1),
(4, '::1', 'dokter@gmail.com', 4, '2023-09-21 06:53:59', 1),
(5, '::1', 'pasien@gmail.com', 5, '2023-09-21 06:55:50', 1),
(6, '::1', 'admin@gmail.com', 3, '2023-09-21 07:11:18', 1),
(7, '::1', 'admin@gmail.com', 3, '2023-09-21 07:54:46', 1),
(8, '::1', 'admin@gmail.com', 3, '2023-09-21 11:23:24', 1),
(9, '::1', 'admin@gmail.com', 3, '2023-09-21 14:57:53', 1),
(10, '::1', 'admin@gmail.com', 3, '2023-09-21 15:00:54', 1),
(11, '::1', 'dokter@gmail.com', 4, '2023-09-21 15:01:19', 1),
(12, '::1', 'admin@gmail.com', 3, '2023-09-21 15:23:06', 1),
(13, '::1', 'admin@gmail.com', 3, '2023-09-21 15:37:21', 1),
(14, '::1', 'dokter@gmail.com', 4, '2023-09-21 15:37:53', 1),
(15, '::1', 'admin@gmail.com', 3, '2023-09-21 15:39:26', 1),
(16, '::1', 'dokter@gmail.com', 4, '2023-09-21 15:47:44', 1),
(17, '::1', 'pasien@gmail.com', 5, '2023-09-21 15:49:30', 1),
(18, '::1', 'pasien@gmail.com', 5, '2023-09-24 12:40:12', 1),
(19, '::1', 'tes@gmail.com', 6, '2023-09-24 14:34:01', 1),
(20, '::1', 'admin@gmail.com', 3, '2023-09-24 14:44:43', 1),
(21, '::1', 'admin@gmail.com', 3, '2023-09-24 14:57:40', 1),
(22, '::1', 'tes@gmail.com', 7, '2023-09-24 14:57:46', 1),
(23, '::1', 'admin@gmail.com', 3, '2023-09-24 18:44:16', 1),
(24, '::1', 'dokter@gmail.com', 4, '2023-09-24 20:06:49', 1),
(25, '::1', 'dokter@gmail.com', 4, '2023-09-24 20:11:56', 1),
(26, '::1', 'pasien@gmail.com', 5, '2023-09-24 20:18:21', 1),
(27, '::1', 'pasien@gmail.com', 5, '2023-09-25 01:30:35', 1),
(28, '::1', 'pasien@gmail.com', 5, '2023-09-25 05:04:55', 1),
(29, '::1', 'pasien@gmail.com', 5, '2023-09-25 06:04:32', 1),
(30, '::1', 'admin@gmail.com', 3, '2023-09-25 06:05:52', 1),
(31, '::1', 'admin@gmail.com', 3, '2023-09-25 06:15:18', 1),
(32, '::1', 'admin@gmail.com', 3, '2023-09-25 06:26:08', 1),
(33, '::1', 'admin@gmail.com', 3, '2023-09-25 10:29:27', 1),
(34, '::1', 'pasien@gmail.com', 5, '2023-09-25 10:31:43', 1),
(35, '::1', 'admin@gmail.com', 3, '2023-09-25 10:41:12', 1),
(36, '::1', 'admin@gmail.com', 3, '2023-09-25 10:50:59', 1),
(37, '::1', 'pasien@gmail.com', 5, '2023-09-25 11:06:50', 1),
(38, '::1', 'admin@gmail.com', 3, '2023-09-25 11:20:36', 1),
(39, '::1', 'admin@gmail.com', 3, '2023-09-26 09:30:07', 1),
(40, '::1', 'pasien@gmail.com', 5, '2023-09-26 10:01:43', 1),
(41, '::1', 'dokter@gmail.com', 4, '2023-09-26 10:30:35', 1),
(42, '::1', 'pasien@gmail.com', 5, '2023-09-26 10:43:16', 1),
(43, '::1', 'admin@gmail.com', 3, '2023-09-26 11:00:38', 1),
(44, '::1', 'admin@gmail.com', 3, '2023-09-26 11:29:31', 1),
(45, '::1', 'admin@gmail.com', 3, '2023-09-26 15:25:34', 1),
(46, '::1', 'admin@gmail.com', 3, '2023-10-01 11:18:43', 1),
(47, '::1', 'admin@gmail.com', 3, '2023-10-01 15:47:21', 1),
(48, '::1', 'admin@gmail.com', 3, '2023-10-02 18:04:00', 1),
(49, '::1', 'admin@gmail.com', 3, '2023-10-03 04:31:35', 1),
(50, '::1', 'asien1', 19, '2023-10-03 06:09:03', 0),
(51, '::1', 'admin@gmail.com', 3, '2023-10-03 06:34:32', 1),
(52, '::1', 'cobadulu@gmail.com', 20, '2023-10-03 06:35:32', 1),
(53, '::1', 'cobadulu@gmail.com', 20, '2023-10-03 06:42:51', 1),
(54, '::1', 'admin@gmail.com', 3, '2023-10-03 06:44:03', 1),
(55, '::1', 'admin@gm', NULL, '2023-10-03 06:44:27', 0),
(56, '::1', 'admin@gmail.com', 3, '2023-10-03 06:44:36', 1),
(57, '::1', 'cobadulu@gmail.com', 20, '2023-10-03 06:47:38', 1),
(58, '::1', 'admin@gmail.com', 3, '2023-10-03 10:56:29', 1),
(59, '::1', 'admin@gmail.com', 3, '2023-10-03 16:37:01', 1),
(60, '::1', 'admin@gmail.com', 3, '2023-10-04 02:37:49', 1),
(61, '::1', 'tespasien', NULL, '2023-10-04 03:23:31', 0),
(62, '::1', 'pasien@gmail.com', 5, '2023-10-04 03:23:43', 1),
(63, '::1', 'dokter@gmail.com', 4, '2023-10-04 04:07:16', 1),
(64, '::1', 'pasien@gmail.com', 5, '2023-10-04 04:11:27', 1),
(65, '::1', 'dokter@gmail.com', 4, '2023-10-04 04:12:02', 1),
(66, '::1', 'pasien@gmail.com', 5, '2023-10-04 04:15:21', 1),
(67, '::1', 'dokter@gmail.com', 4, '2023-10-04 04:16:26', 1),
(68, '::1', 'dokter@gmail.com', 4, '2023-10-04 04:47:23', 1),
(69, '::1', 'pasien@gmail.com', 5, '2023-10-04 04:54:25', 1),
(70, '::1', 'dokter@gmail.com', 4, '2023-10-04 05:04:51', 1),
(71, '::1', 'cobadulu@gmail.com', 20, '2023-10-04 05:17:53', 1),
(72, '::1', 'a3@gmail.com', 10, '2023-10-04 05:18:33', 1),
(73, '::1', 'dokter@gmail.com', 4, '2023-10-04 05:19:33', 1),
(74, '::1', 'admin@gmail.com', 3, '2023-10-04 05:46:57', 1),
(75, '::1', 'admin@gmail.com', 3, '2023-10-04 05:51:21', 1),
(76, '::1', 'cobadulu@gmail.com', 22, '2023-10-04 09:34:54', 1),
(77, '::1', 'admin@gmail.com', 3, '2023-10-04 09:49:35', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `chatbox` int(11) NOT NULL,
  `chat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id`, `chatbox`, `chat`) VALUES
(1, 2, 'halo, pasien');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chatbox`
--

CREATE TABLE `chatbox` (
  `id` int(255) NOT NULL,
  `dokter` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `pasien` varchar(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chatbox`
--

INSERT INTO `chatbox` (`id`, `dokter`, `pasien`) VALUES
(2, 'dokter', 'pasien');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(255) NOT NULL,
  `dokter` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `pasien` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `dokter`, `pasien`, `tanggal`, `status`) VALUES
(1, 'dokter', 'pasien', '2023-09-15', 2),
(6, 'dokter', 'coba3', '2023-10-04', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(255) NOT NULL,
  `id_pertanyaan` int(255) NOT NULL,
  `jawaban` varchar(2500) NOT NULL,
  `benar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jawaban`
--

INSERT INTO `jawaban` (`id`, `id_pertanyaan`, `jawaban`, `benar`) VALUES
(1, 1, 'p1a', 0),
(2, 1, 'p1b', 1),
(3, 2, 'p2a', 1),
(4, 2, 'p2b', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1695206196, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id` int(255) NOT NULL,
  `pasien` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `skor` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id`, `pasien`, `skor`, `tanggal`) VALUES
(1, 'pasien', 80, '0000-00-00'),
(2, 'pasien', 90, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tes`
--

CREATE TABLE `tes` (
  `id` int(255) NOT NULL,
  `pertanyaan` varchar(5000) NOT NULL,
  `skor` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tes`
--

INSERT INTO `tes` (`id`, `pertanyaan`, `skor`) VALUES
(1, 'pertanyaan 1', 10),
(2, 'pertanyaan 2', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `user_groups` varchar(255) NOT NULL DEFAULT 'pasien',
  `user_image` varchar(255) NOT NULL DEFAULT 'default.svg',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `user_groups`, `user_image`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'admin@gmail.com', 'admin', 'admin', 'default.svg', '$2y$10$2.x5xL/G7eojO8ykvTI1MuAO1JNSWpvQIPRFoGkEUoqHAbuezEaRi', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-21 06:52:35', '2023-09-21 06:52:35', NULL),
(4, 'dokter@gmail.com', 'dokter', 'dokter', 'default.svg', '$2y$10$qqBfvsiVwVpSQr4woFH9ieKnEVI1Fttwhp6VQ1Y7y8VsEG3AqofX6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-21 06:53:45', '2023-09-21 06:53:45', NULL),
(5, 'pasien@gmail.com', 'pasien', 'pasien', 'default.svg', '$2y$10$H1Ssi2K7ZTKqmYjRHHpaCuYAp5/bILyLUziPZWUlCW6WfjMH9yIM2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-21 06:55:42', '2023-09-21 06:55:42', NULL),
(8, 'coba@gmail.com', 'coba', 'pasien', 'default.svg', '$2y$10$4y0QxQfxBLOM3MR3HKYGm.HerDCSrHNngRTl1iW4Dmvg2.WCSx0fG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:24:54', '2023-09-26 11:24:54', NULL),
(10, 'a3@gmail.com', 'coba3', 'pasien', 'default.svg', '$2y$10$VeYhmadOiyyeFFgsqVblwOeKE4arH9bUPof5MMV9SixLP8Nzm1CrC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:25:45', '2023-09-26 11:25:45', NULL),
(11, 'a4@gmail.com', 'coba4', 'pasien', 'default.svg', '$2y$10$DzIYYaYk7bCBZLKzpPQkHuuyTR6rAPhLllpDlsV4tcxjl5loFcrHa', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:26:25', '2023-09-26 11:26:25', NULL),
(13, 'f2@gmail.com', 'faker2', 'pasien', 'default.svg', '$2y$10$GiShq85TfnJJqI6zsYts5OT6qs50oStC62O6dywG9C4ok7J8tzMT6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:27:52', '2023-09-26 11:27:52', NULL),
(14, 'f3@gmail.com', 'faker3', 'pasien', 'default.svg', '$2y$10$Apu90xC9HewHMTbCtE.P1OVnW7nB.wALfy2y4W/A9pJkEcRRjf6DS', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:28:19', '2023-09-26 11:28:19', NULL),
(15, 'f4@gmail.com', 'faker4', 'pasien', 'default.svg', '$2y$10$7pKtlzmBXpFBhMEdahiUbOjs6J/pYcr6X.M8M0Q2MLfoFbhlriQCW', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:28:36', '2023-09-26 11:28:36', NULL),
(16, 'f5@gmail.com', 'faker5', 'pasien', 'default.svg', '$2y$10$iqrSJ25bwCcL8JqM6CU1Me9767a.HOXe94PBzae3LuJm5MUnPXXaW', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-09-26 11:28:55', '2023-09-26 11:28:55', NULL),
(22, 'cobadulu@gmail.com', 'cobs', 'dokter', 'default.svg', '$2y$10$uXzIK1XARtppxOgHXnZD9.2375hvlw.Azq./WoJhcgnfmVthKUEay', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-10-04 09:34:28', '2023-10-04 09:34:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `chatbox`
--
ALTER TABLE `chatbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien` (`pasien`),
  ADD KEY `chatbox_ibfk_2` (`dokter`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter` (`dokter`) USING BTREE,
  ADD KEY `pasien` (`pasien`) USING BTREE;

--
-- Indeks untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tes`
--
ALTER TABLE `tes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_groups` (`user_groups`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `chatbox`
--
ALTER TABLE `chatbox`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tes`
--
ALTER TABLE `tes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `chatbox`
--
ALTER TABLE `chatbox`
  ADD CONSTRAINT `chatbox_ibfk_1` FOREIGN KEY (`dokter`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `chatbox_ibfk_2` FOREIGN KEY (`dokter`) REFERENCES `users` (`username`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`dokter`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`pasien`) REFERENCES `users` (`username`);

--
-- Ketidakleluasaan untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `jawaban_ibfk_1` FOREIGN KEY (`id_pertanyaan`) REFERENCES `tes` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_groups`) REFERENCES `auth_groups` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

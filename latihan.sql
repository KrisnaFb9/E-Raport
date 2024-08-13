-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2023 pada 14.24
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `nomor` varchar(10) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` enum('Sakit','Ijin','Alfa') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`nomor`, `nisn`, `tanggal`, `keterangan`, `created_at`, `updated_at`) VALUES
('1', '21010101', '2023-06-08', 'Alfa', '2023-06-08 01:52:30', '2023-06-08 01:52:30'),
('2', '21010102', '2023-06-30', 'Ijin', '2023-06-09 06:36:29', '2023-06-09 06:36:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `kode_guru` varchar(4) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `kode_mapel` varchar(4) NOT NULL,
  `wali_kelas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`kode_guru`, `nama_guru`, `kode_mapel`, `wali_kelas`, `created_at`, `updated_at`) VALUES
('G001', 'Widyatami Aswita', 'M001', 8, '2023-06-07 18:07:15', '2023-06-07 11:07:15'),
('G002', 'Deviana Ananta', 'M002', 7, '2023-06-09 14:20:35', '2023-06-09 07:20:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_nilai`
--

CREATE TABLE `jenis_nilai` (
  `kode_jenisnilai` varchar(4) NOT NULL,
  `nama_jenisnilai` enum('Nilai UH','Nilai MID','Nilai UAS','Rata-Rata UH','Rata-Rata NA') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(4) NOT NULL,
  `kelas` enum('7','8','9') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `kode_mapel` varchar(4) NOT NULL,
  `mata_pelajaran` enum('Pendidikan Agama','Ilmu Pengetahuan Alam (IPA)','Ilmu Pengetahuan Sosial (IPS)','Matematika','Seni Budaya','Pendidikan Jasmani, Olahraga, dan Kesehatan','Teknologi Informasi dan Komunikasi (TIK)','Pendidikan Kewarganegaraan (PKN)','Bahasa Indonesia','Bahasa Inggris') NOT NULL,
  `kode_guru` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`kode_mapel`, `mata_pelajaran`, `kode_guru`, `created_at`, `updated_at`) VALUES
('M001', 'Teknologi Informasi dan Komunikasi (TIK)', 'G001', '2023-06-08 09:09:51', '2023-06-08 09:32:12'),
('M002', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'G002', '2023-06-09 06:14:06', '2023-06-09 06:34:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_02_041144_add_role_as_to_users_table', 2),
(7, '2023_06_06_040857_add_details_to_user_table', 3),
(8, '2023_06_06_041814_add_details_to_users_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_siswa`
--

CREATE TABLE `nilai_siswa` (
  `no` int(11) NOT NULL,
  `n_uh1` int(11) NOT NULL,
  `n_uh2` int(11) NOT NULL,
  `n_uh3` int(11) NOT NULL,
  `n_uh4` int(11) NOT NULL,
  `n_uh5` int(11) NOT NULL,
  `rata_uh` int(11) NOT NULL,
  `n_mid` int(11) NOT NULL,
  `n_uas` int(11) NOT NULL,
  `rata_na` int(11) NOT NULL,
  `keterangan` varchar(15) NOT NULL,
  `kode_mapel` varchar(4) NOT NULL,
  `kode_jenisnilai` varchar(4) NOT NULL,
  `kode_smt` varchar(4) NOT NULL,
  `kode_kelas` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode_kelas` varchar(4) NOT NULL,
  `kode_mapel` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nama`, `kode_kelas`, `kode_mapel`, `created_at`, `updated_at`) VALUES
('21010101', 'Dani Nugroho Wicaksono', 'K001', 'M001', '2023-06-04 03:22:48', '2023-06-07 11:06:13'),
('21010102', 'Bramudya Aldo Winanto', 'K002', 'M002', '2023-06-04 05:10:41', '2023-06-09 06:00:46'),
('21010103', 'Krisna Febrianti', 'K003', 'M003', '2023-06-04 05:11:18', '2023-06-09 06:00:57'),
('21010104', 'Ita Ayu Pratiwi', 'K004', 'M004', '2023-06-09 06:00:29', '2023-06-09 06:00:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `smt`
--

CREATE TABLE `smt` (
  `kode_smt` varchar(4) NOT NULL,
  `smt` varchar(15) NOT NULL,
  `tahun_pelajaran` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `smt`
--

INSERT INTO `smt` (`kode_smt`, `smt`, `tahun_pelajaran`, `created_at`, `updated_at`) VALUES
('KS01', 'GENAP', '2018', '2023-06-08 09:04:10', '2023-06-08 09:04:10'),
('KS02', 'GANJIL', '2019', '2023-06-09 06:03:10', '2023-06-09 06:06:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','pelajar','guru') NOT NULL DEFAULT 'pelajar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(9, 'guru', 'guru@gmail.com', NULL, '$2y$10$OF2WOzkRua.Tqgxga2ozxOzvcVH9NrCJcbE5Z85nnxmEM4YvimpTK', NULL, '2023-06-06 04:19:59', '2023-06-06 04:19:59', 'guru'),
(10, 'pelajar', 'pelajar@gmail.com', NULL, '$2y$10$cmWZdkJx.IL0cnxC7eiuCuDtrIDkVlGagi.Xn6onwMB980969TsPO', NULL, '2023-06-06 04:21:10', '2023-06-06 04:21:10', 'pelajar'),
(11, 'admin', 'admin@gmail.com', NULL, '$2y$10$L53.CT5nCSBj96igH5eYkufCDY2S9Iof3Yg/.Dv49U03MuRhz40Ym', NULL, '2023-06-06 04:24:50', '2023-06-06 04:24:50', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`nomor`),
  ADD KEY `nisn` (`nisn`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`kode_guru`),
  ADD KEY `kode_mapel` (`kode_mapel`);

--
-- Indeks untuk tabel `jenis_nilai`
--
ALTER TABLE `jenis_nilai`
  ADD PRIMARY KEY (`kode_jenisnilai`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kode_mapel`),
  ADD KEY `kode_guru` (`kode_guru`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai_siswa`
--
ALTER TABLE `nilai_siswa`
  ADD PRIMARY KEY (`no`),
  ADD KEY `kode_mapel` (`kode_mapel`),
  ADD KEY `kode_jenisnilai` (`kode_jenisnilai`),
  ADD KEY `kode_smt` (`kode_smt`),
  ADD KEY `kode_kelas` (`kode_kelas`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kode_kelas` (`kode_kelas`),
  ADD KEY `kode_mapel` (`kode_mapel`);

--
-- Indeks untuk tabel `smt`
--
ALTER TABLE `smt`
  ADD PRIMARY KEY (`kode_smt`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

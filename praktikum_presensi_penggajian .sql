-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Feb 2022 pada 12.45
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum_presensi_penggajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bagian`
--

CREATE TABLE `bagian` (
  `id` int(11) NOT NULL,
  `nama_bagian` varchar(255) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bagian`
--

INSERT INTO `bagian` (`id`, `nama_bagian`, `karyawan_id`, `lokasi_id`) VALUES
(2, 'Administrasi', 2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bagian_karyawan`
--

CREATE TABLE `bagian_karyawan` (
  `id` int(11) NOT NULL,
  `bagian_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bagian_karyawan`
--

INSERT INTO `bagian_karyawan` (`id`, `bagian_id`, `karyawan_id`, `tanggal_mulai`) VALUES
(1, 2, 2, '2022-02-01'),
(2, 2, 1, '2022-02-23');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `belajar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `belajar` (
`idBagian` int(11)
,`nama_bagian` varchar(255)
,`idLokasi` int(11)
,`nama_lokasi` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(255) NOT NULL,
  `gapok_jabatan` double NOT NULL,
  `tunjangan_jabatan` double NOT NULL,
  `uang_makan_perhari` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`, `gapok_jabatan`, `tunjangan_jabatan`, `uang_makan_perhari`) VALUES
(1, 'System Analyst', 2400000, 500000, 40000),
(2, 'Project Manager', 2300000, 450000, 38000),
(3, 'Senior Programmer', 2200000, 400000, 36000),
(4, 'Junior Programmer', 2100000, 350000, 34000),
(5, 'Intern', 1000000, 100000, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan_karyawan`
--

CREATE TABLE `jabatan_karyawan` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(255) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan_karyawan`
--

INSERT INTO `jabatan_karyawan` (`id`, `karyawan_id`, `jabatan_id`, `tanggal_mulai`) VALUES
(2, 1, 1, '2022-02-01'),
(3, 2, 1, '2022-02-23'),
(4, 3, 2, '2022-02-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `handphone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `pengguna_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nik`, `nama_lengkap`, `handphone`, `email`, `tanggal_masuk`, `pengguna_id`) VALUES
(1, '003', 'John Doe', '081234567', 'jhon.doe@gmail.com', '2022-02-08', 1),
(2, '004', 'Fulan Bin Fulan', '081234567', 'fulan@gmail.com', '2022-01-30', 2),
(3, '005', 'Mawar Kurniani', '01234567', 'mawar@gmail.com', '2022-02-24', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id`, `nama_lokasi`) VALUES
(1, 'Banjarmasin Utara'),
(2, 'Banjarmasin Timur'),
(3, 'Banjarbaru Selatan'),
(4, 'Banjarbaru Utara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggajian`
--

CREATE TABLE `penggajian` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bulan` char(2) NOT NULL,
  `gapok` double NOT NULL,
  `tunjangan` double NOT NULL,
  `uang_makan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penggajian`
--

INSERT INTO `penggajian` (`id`, `karyawan_id`, `tahun`, `bulan`, `gapok`, `tunjangan`, `uang_makan`) VALUES
(1, 1, 2020, '11', 12100000, 2150000, 3800000),
(2, 2, 2021, '2', 9700000, 1650000, 3000000),
(4, 1, 2020, '12', 12100000, 2150000, 3928000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `peran` enum('ADMIN','USER') DEFAULT NULL,
  `login_terakhir` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `peran`, `login_terakhir`) VALUES
(1, 'annga124', '123', 'USER', '2022-02-09 02:38:55'),
(2, 'admin', '202cb962ac59075b964b07152d234b70', 'ADMIN', NULL),
(3, 'mawar', '202cb962ac59075b964b07152d234b70', 'USER', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `presentasi`
--

CREATE TABLE `presentasi` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `keteranagn` enum('HADIR','SAKIT','IZIN','CUTI','LIBUR','TIDAK HADIR') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur untuk view `belajar`
--
DROP TABLE IF EXISTS `belajar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `belajar`  AS  select distinct `bagian`.`id` AS `idBagian`,`bagian`.`nama_bagian` AS `nama_bagian`,`bagian`.`lokasi_id` AS `idLokasi`,`lokasi`.`nama_lokasi` AS `nama_lokasi` from (`lokasi` join `bagian` on((`bagian`.`lokasi_id` = `lokasi`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bagian`
--
ALTER TABLE `bagian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bagian_karyawan`
--
ALTER TABLE `bagian_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan_karyawan`
--
ALTER TABLE `jabatan_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penggajian`
--
ALTER TABLE `penggajian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bagian`
--
ALTER TABLE `bagian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bagian_karyawan`
--
ALTER TABLE `bagian_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jabatan_karyawan`
--
ALTER TABLE `jabatan_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `penggajian`
--
ALTER TABLE `penggajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

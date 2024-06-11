-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2024 at 10:49 AM
-- Server version: 10.2.41-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dosq28_pbo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `id_lulus` int(11) NOT NULL,
  `tgl_yudisium` date DEFAULT NULL,
  `no_ijazah` varchar(50) DEFAULT NULL,
  `judul_skripsi` text DEFAULT NULL,
  `ipk_lulus` decimal(4,2) DEFAULT NULL,
  `id_wisuda` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `bidang_kerja` varchar(255) DEFAULT NULL,
  `perusahaan_kerja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`id_lulus`, `tgl_yudisium`, `no_ijazah`, `judul_skripsi`, `ipk_lulus`, `id_wisuda`, `id_mahasiswa`, `bidang_kerja`, `perusahaan_kerja`) VALUES
(1, '2024-07-01', 'IJZ12345', 'Sistem Informasi Manajemen', '3.75', 1, 1, 'IT', 'PT ABC'),
(2, '2023-07-01', 'IJZ67890', 'Analisis Data', '3.60', 2, 2, 'Finance', 'Bank XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `badan_hukum`
--

CREATE TABLE `badan_hukum` (
  `id_badan_hukum` int(11) NOT NULL,
  `nama_badan_hukum` varchar(255) DEFAULT NULL,
  `nama_perguruan_tinggi` varchar(255) DEFAULT NULL,
  `kode_perguruan_tinggi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `badan_hukum`
--

INSERT INTO `badan_hukum` (`id_badan_hukum`, `nama_badan_hukum`, `nama_perguruan_tinggi`, `kode_perguruan_tinggi`) VALUES
(1, 'PT X', 'Universitas X', 'UNX'),
(2, 'PT Y', 'Universitas Y', 'UNY');

-- --------------------------------------------------------

--
-- Table structure for table `bobot_nilai`
--

CREATE TABLE `bobot_nilai` (
  `id_nilai` int(11) NOT NULL,
  `nilai_huruf` varchar(2) DEFAULT NULL,
  `bobot` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `bobot_nilai`
--

INSERT INTO `bobot_nilai` (`id_nilai`, `nilai_huruf`, `bobot`) VALUES
(1, 'A', '4.00'),
(2, 'B', '3.00');

-- --------------------------------------------------------

--
-- Table structure for table `data_loker`
--

CREATE TABLE `data_loker` (
  `id_loker` int(11) NOT NULL,
  `loker` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `tgl_loker` date DEFAULT NULL,
  `ket_loker` text DEFAULT NULL,
  `jenis_loker` varchar(255) DEFAULT NULL,
  `id_wisuda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `data_loker`
--

INSERT INTO `data_loker` (`id_loker`, `loker`, `nama_perusahaan`, `tgl_loker`, `ket_loker`, `jenis_loker`, `id_wisuda`) VALUES
(1, 'Software Engineer', 'PT ABC', '2024-06-01', 'Full-time', 'IT', 1),
(2, 'Data Analyst', 'Bank XYZ', '2023-06-01', 'Full-time', 'Finance', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nidn` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nidn`, `id_user`) VALUES
(1, '123456789', 1);
(2, '50123', 2);
(3, '50124', 9);
(4, '50134', 10);
(5, '50234', 11);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `id_badan_hukum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `fakultas`, `id_badan_hukum`) VALUES
(1, 'Fakultas Teknik', 1),
(2, 'Fakultas Ekonomi', 1),
(3, 'Fakultas Hukum', 2);

-- --------------------------------------------------------

--
-- Table structure for table `grup`
--

CREATE TABLE `grup` (
  `id_grup` int(11) NOT NULL,
  `grup` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `grup`
--

INSERT INTO `grup` (`id_grup`, `grup`) VALUES
(1, 'Admin'),
(2, 'Dosen'),
(3, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `hari` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`id_hari`, `hari`) VALUES
(1, 'Senin'),
(2, 'Selasa');

-- --------------------------------------------------------

--
-- Table structure for table `honor_ajar`
--

CREATE TABLE `honor_ajar` (
  `id_honor_ajar` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `jumlah_honor` decimal(15,2) DEFAULT NULL,
  `jumlah_sks` int(11) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_waktu_kuliah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `honor_ajar`
--

INSERT INTO `honor_ajar` (`id_honor_ajar`, `bulan`, `tahun`, `jumlah_honor`, `jumlah_sks`, `id_dosen`, `id_waktu_kuliah`) VALUES
(1, 1, 2024, '1000000.00', 6, 1, 1),
(2, 2, 2024, '1500000.00', 9, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kul`
--

CREATE TABLE `jadwal_kul` (
  `id_jadwal` int(11) NOT NULL,
  `id_jam` int(11) DEFAULT NULL,
  `id_hari` int(11) DEFAULT NULL,
  `id_ruang` int(11) DEFAULT NULL,
  `id_kelas_krs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jadwal_kul`
--

INSERT INTO `jadwal_kul` (`id_jadwal`, `id_jam`, `id_hari`, `id_ruang`, `id_kelas_krs`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jam_pelajaran`
--

CREATE TABLE `jam_pelajaran` (
  `id_jam` int(11) NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `sks_jam` int(11) DEFAULT NULL,
  `id_waktu_kuliah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jam_pelajaran`
--

INSERT INTO `jam_pelajaran` (`id_jam`, `jam_mulai`, `jam_selesai`, `sks_jam`, `id_waktu_kuliah`) VALUES
(1, '08:00:00', '09:30:00', 1, 1),
(2, '10:00:00', '11:30:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_jenis_kelamin` int(11) NOT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_matkul`
--

CREATE TABLE `jenis_matkul` (
  `id_jenis_matkul` int(11) NOT NULL,
  `jenis_matkul` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jenis_matkul`
--

INSERT INTO `jenis_matkul` (`id_jenis_matkul`, `jenis_matkul`) VALUES
(1, 'Wajib'),
(2, 'Pilihan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pendaftaran`
--

CREATE TABLE `jenis_pendaftaran` (
  `id_jenis_pendaftaran` int(11) NOT NULL,
  `jenis_pendaftaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jenis_pendaftaran`
--

INSERT INTO `jenis_pendaftaran` (`id_jenis_pendaftaran`, `jenis_pendaftaran`) VALUES
(1, 'Reguler'),
(2, 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ruang`
--

CREATE TABLE `jenis_ruang` (
  `id_jenis_ruang` int(11) NOT NULL,
  `jenis_ruang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jenis_ruang`
--

INSERT INTO `jenis_ruang` (`id_jenis_ruang`, `jenis_ruang`) VALUES
(1, 'Teori'),
(2, 'Praktikum');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tagihan`
--

CREATE TABLE `jenis_tagihan` (
  `id_jns_tagihan` int(11) NOT NULL,
  `jenis_tagihan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `jenis_tagihan`
--

INSERT INTO `jenis_tagihan` (`id_jns_tagihan`, `jenis_tagihan`) VALUES
(1, 'SPP'),
(2, 'UKT');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `kehadiran` tinyint(1) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `kehadiran`, `id_mahasiswa`) VALUES
(1, 1, 1),
(2, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `id_waktu_kuliah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`, `id_waktu_kuliah`) VALUES
(1, 'TI1', 1),
(2, 'TI2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_detil`
--

CREATE TABLE `kelas_detil` (
  `id_kelas_detil` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `kode_kelas` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kelas_detil`
--

INSERT INTO `kelas_detil` (`id_kelas_detil`, `id_kelas`, `kode_kelas`, `semester`, `id_progdi`) VALUES
(1, 1, 'TI1A', 1, 1),
(2, 2, 'TI2B', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_krs`
--

CREATE TABLE `kelas_krs` (
  `id_kelas_krs` int(11) NOT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_thn_akademik` int(11) DEFAULT NULL,
  `id_kelas_detil` int(11) DEFAULT NULL,
  `id_matkul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kelas_krs`
--

INSERT INTO `kelas_krs` (`id_kelas_krs`, `id_dosen`, `id_thn_akademik`, `id_kelas_detil`, `id_matkul`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `keluar`
--

CREATE TABLE `keluar` (
  `id_keluar` int(11) NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `alasan_keluar` text DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `keluar`
--

INSERT INTO `keluar` (`id_keluar`, `tgl_keluar`, `alasan_keluar`, `id_mahasiswa`) VALUES
(1, '2024-03-01', 'Pindah ke universitas lain', 1),
(2, '2023-03-01', 'Masalah pribadi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `krs_khs`
--

CREATE TABLE `krs_khs` (
  `id_krs` int(11) NOT NULL,
  `tugas` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `kuis` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `nilai_angka` decimal(5,2) DEFAULT NULL,
  `id_kelas_krs` int(11) DEFAULT NULL,
  `id_nilai` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `krs_khs`
--

INSERT INTO `krs_khs` (`id_krs`, `tugas`, `mid`, `kuis`, `semester`, `nilai_angka`, `id_kelas_krs`, `id_nilai`, `id_mahasiswa`) VALUES
(1, 80, 85, 75, 1, '85.00', 1, 1, 1),
(2, 70, 75, 65, 2, '75.00', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `kurikulum` varchar(255) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id_kurikulum`, `kurikulum`, `id_progdi`) VALUES
(1, 'Kurikulum 2024', 1),
(2, 'Kurikulum 2023', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum_matkul`
--

CREATE TABLE `kurikulum_matkul` (
  `id_kurikulum` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `kurikulum_matkul`
--

INSERT INTO `kurikulum_matkul` (`id_kurikulum`, `id_matkul`, `semester`) VALUES
(1, 1, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL,
  `id_thn_akademik` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_waktu_kuliah` int(11) DEFAULT NULL,
  `id_jenis_pendaftaran` int(11) DEFAULT NULL,
  `sekolah_asal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `id_user`, `id_progdi`, `id_thn_akademik`, `id_kelas`, `id_waktu_kuliah`, `id_jenis_pendaftaran`, `sekolah_asal`) VALUES
(1, 3, 1, 1, 1, 1, 1, 'SMA X'),
(2, 4, 3, 2, 2, 2, 2, 'SMA Y'),
(3, 5, 3, 2, 2, 2, 2, 'SMA Y'),
(4, 6, 3, 2, 2, 2, 2, 'SMA Y');

-- --------------------------------------------------------

--
-- Table structure for table `master_tagihan`
--

CREATE TABLE `master_tagihan` (
  `id_master_tagihan` int(11) NOT NULL,
  `jumlah_tagihan` decimal(15,2) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL,
  `id_thn_akademik` int(11) DEFAULT NULL,
  `id_jns_tagihan` int(11) DEFAULT NULL,
  `id_waktu_kuliah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `master_tagihan`
--

INSERT INTO `master_tagihan` (`id_master_tagihan`, `jumlah_tagihan`, `id_progdi`, `id_thn_akademik`, `id_jns_tagihan`, `id_waktu_kuliah`) VALUES
(1, '1000000.00', 1, 1, 1, 1),
(2, '1500000.00', 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(50) DEFAULT NULL,
  `nama_matkul` varchar(255) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL,
  `id_jenis_matkul` int(11) DEFAULT NULL,
  `id_jenis_ruang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_matkul`, `kode_matkul`, `nama_matkul`, `sks`, `id_progdi`, `id_jenis_matkul`, `id_jenis_ruang`) VALUES
(1, 'TI101', 'Algoritma dan Pemrograman', 3, 1, 1, 1),
(2, 'TI102', 'Basis Data', 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_transfer`
--

CREATE TABLE `nilai_transfer` (
  `id_nilai_transfer` int(11) NOT NULL,
  `kode_matkul_asal` varchar(50) DEFAULT NULL,
  `nama_matkul_asal` varchar(255) DEFAULT NULL,
  `sks_asal` int(11) DEFAULT NULL,
  `id_nilai` int(11) DEFAULT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `nilai_transfer`
--

INSERT INTO `nilai_transfer` (`id_nilai_transfer`, `kode_matkul_asal`, `nama_matkul_asal`, `sks_asal`, `id_nilai`, `id_matkul`, `id_mahasiswa`) VALUES
(1, 'TI101', 'Algoritma dan Pemrograman', 3, 1, 1, 1),
(2, 'TI102', 'Basis Data', 3, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembimbing`
--

CREATE TABLE `pembimbing` (
  `id_pembimbing` int(11) NOT NULL,
  `pembimbing_ke` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `pembimbing`
--

INSERT INTO `pembimbing` (`id_pembimbing`, `pembimbing_ke`, `id_mahasiswa`, `id_dosen`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `penugasan_dosen`
--

CREATE TABLE `penugasan_dosen` (
  `id_penugasan` int(11) NOT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `penugasan_dosen`
--

INSERT INTO `penugasan_dosen` (`id_penugasan`, `id_dosen`, `id_progdi`, `tahun`) VALUES
(1, 1, 1, '2024'),
(2, 1, 2, '2023');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

CREATE TABLE `pertemuan` (
  `id_pertemuan` int(11) NOT NULL,
  `pertemuan_ke` int(11) DEFAULT NULL,
  `tgl_pertemuan` date DEFAULT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_kelas_krs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `pertemuan`
--

INSERT INTO `pertemuan` (`id_pertemuan`, `pertemuan_ke`, `tgl_pertemuan`, `jam_masuk`, `jam_keluar`, `id_dosen`, `id_kelas_krs`) VALUES
(1, 1, '2024-02-01', '08:00:00', '09:30:00', 1, 1),
(2, 2, '2024-02-08', '10:00:00', '11:30:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pmb`
--

CREATE TABLE `pmb` (
  `id_pmb` int(11) NOT NULL,
  `no_test` varchar(50) DEFAULT NULL,
  `nilai_test` decimal(5,2) DEFAULT NULL,
  `tgl_test` date DEFAULT NULL,
  `id_status_registrasi` int(11) DEFAULT NULL,
  `id_jenis_pendaftaran` int(11) DEFAULT NULL,
  `sekolah_asal` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_progdi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `pmb`
--

INSERT INTO `pmb` (`id_pmb`, `no_test`, `nilai_test`, `tgl_test`, `id_status_registrasi`, `id_jenis_pendaftaran`, `sekolah_asal`, `id_user`, `id_progdi`) VALUES
(1, '12345', '85.50', '2024-01-10', 1, 1, 'SMA A', 3, 1),
(2, '67890', '90.00', '2023-01-10', 2, 2, 'SMA B', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `prasyarat_matkul`
--

CREATE TABLE `prasyarat_matkul` (
  `id_prasyarat` int(11) NOT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `id_matkul_pra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `prasyarat_matkul`
--

INSERT INTO `prasyarat_matkul` (`id_prasyarat`, `id_matkul`, `id_matkul_pra`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id_progdi` int(11) NOT NULL,
  `program_studi` varchar(255) DEFAULT NULL,
  `id_fakultas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`id_progdi`, `program_studi`, `id_fakultas`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Teknik Mesin', 1),
(3, 'Ekonomi Manajemen', 2),
(4, 'Ilmu Hukum', 3);

-- --------------------------------------------------------

--
-- Table structure for table `publikasi_dosen`
--

CREATE TABLE `publikasi_dosen` (
  `id_publikasi_dosen` int(11) NOT NULL,
  `tgl_publikasi` date DEFAULT NULL,
  `judul` text DEFAULT NULL,
  `jenis_publikasi` varchar(255) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `publikasi_dosen`
--

INSERT INTO `publikasi_dosen` (`id_publikasi_dosen`, `tgl_publikasi`, `judul`, `jenis_publikasi`, `id_dosen`) VALUES
(1, '2024-05-01', 'Teknologi Blockchain', 'Jurnal Internasional', 1),
(2, '2023-05-01', 'Machine Learning', 'Konferensi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(11) NOT NULL,
  `kd_ruang` varchar(50) DEFAULT NULL,
  `id_jenis_ruang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `kd_ruang`, `id_jenis_ruang`) VALUES
(1, 'R101', 1),
(2, 'R102', 2);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_semester`, `semester`) VALUES
(1, 'Ganjil'),
(2, 'Genap');

-- --------------------------------------------------------

--
-- Table structure for table `status_master`
--

CREATE TABLE `status_master` (
  `id_status_master` int(11) NOT NULL,
  `status_master` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `status_master`
--

INSERT INTO `status_master` (`id_status_master`, `status_master`) VALUES
(1, 'Aktif'),
(2, 'Non-Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `status_mhs`
--

CREATE TABLE `status_mhs` (
  `id_status_master` int(11) NOT NULL,
  `id_thn_akademik` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `status_mhs`
--

INSERT INTO `status_mhs` (`id_status_master`, `id_thn_akademik`, `id_mahasiswa`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `status_registrasi`
--

CREATE TABLE `status_registrasi` (
  `id_status_registrasi` int(11) NOT NULL,
  `status_registrasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `status_registrasi`
--

INSERT INTO `status_registrasi` (`id_status_registrasi`, `status_registrasi`) VALUES
(1, 'Terdaftar'),
(2, 'Belum Terdaftar');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `kode_tagihan` varchar(50) DEFAULT NULL,
  `jumlah_tagihan` decimal(15,2) DEFAULT NULL,
  `lunas` tinyint(1) DEFAULT NULL,
  `id_thn_akademik` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `id_master_tagihan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `kode_tagihan`, `jumlah_tagihan`, `lunas`, `id_thn_akademik`, `id_mahasiswa`, `id_master_tagihan`) VALUES
(1, 'TGH12345', '1000000.00', 1, 1, 1, 1),
(2, 'TGH67890', '1500000.00', 0, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id_thn_akademik` int(11) NOT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `tahun_akademik` varchar(9) DEFAULT NULL,
  `id_semester` int(11) DEFAULT NULL,
  `tgl_mulai_pmb` date DEFAULT NULL,
  `tgl_akhir_pmb` date DEFAULT NULL,
  `tgl_mulai_smt` date DEFAULT NULL,
  `tgl_akhir_smt` date DEFAULT NULL,
  `flag_aktif` tinyint(1) DEFAULT NULL,
  `flag_pmb` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id_thn_akademik`, `tahun`, `tahun_akademik`, `id_semester`, `tgl_mulai_pmb`, `tgl_akhir_pmb`, `tgl_mulai_smt`, `tgl_akhir_smt`, `flag_aktif`, `flag_pmb`) VALUES
(1, '2024', '2024/2025', 1, '2024-01-01', '2024-02-01', '2024-02-15', '2024-07-15', 1, 1),
(2, '2023', '2023/2024', 2, '2023-01-01', '2023-02-01', '2023-02-15', '2023-07-15', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `gelar_depan` varchar(50) DEFAULT NULL,
  `nama_awal` varchar(255) DEFAULT NULL,
  `nama_akhir` varchar(255) DEFAULT NULL,
  `gelar_belakang` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_jenis_kelamin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `gelar_depan`, `nama_awal`, `nama_akhir`, `gelar_belakang`, `email`, `password`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `id_jenis_kelamin`) VALUES
(1, 'Dr.', 'Budi', 'Santoso', 'M.Sc.', 'budi@example.com', 'password123', 'Jakarta', '1980-01-01', 'Jl. Kebon Jeruk No. 5', 1),
(2, 'Prof.', 'Ani', 'Wijaya', 'Ph.D.', 'ani@example.com', 'password123', 'Bandung', '1975-05-15', 'Jl. Merdeka No. 10', 2),
(3, NULL, 'Joko', 'Susilo', NULL, 'joko@example.com', 'password123', 'Surabaya', '1990-12-25', 'Jl. Pahlawan No. 15', 1),
(4, NULL, 'Indah', 'Lestari', NULL, 'indah@example.com', 'password123', 'indramyau', '2014-06-11', 'bandung', 2),
(5, NULL, 'Lukman', 'Hakim', NULL, 'lukman@example.com', 'password123', 'Jakarta', '2014-06-17', 'Bandung', 1),
(6, NULL, 'Nani', 'Supryani', NULL, 'nani@example.com', 'password123', 'Indramayu', '2014-05-22', 'Indramayu', 2);
(7, NULL, 'Hesti', 'Purwadinata', NULL, 'hesti@example.com', 'password123', 'Indramayu', '2014-06-22', 'Indramayu', 2);
(8, NULL, 'Kiki', 'Saputi', NULL, 'kiki@example.com', 'password123', 'Indramayu', '2014-05-22', 'Bandung', 2);
(9, NULL, 'Andre', 'Taulani','M.M', 'andre@example.com', 'password123', 'Indramayu', '2014-02-22', 'Jakarta', 1);
(10, NULL, 'Andika', 'Pratama','M.T', 'andika@example.com', 'password123', 'Indramayu', '1981-02-22', 'Jakarta', 1);
(11, NULL, 'Usi', 'Pratama','M.Kom', 'usi@example.com', 'password123', 'Bandung', '1981-03-22', 'Jakarta', 2);
(12, NULL, 'Windi', 'Sari', NULL, 'windi@example.com', 'password123', 'Semarang', '1991-03-22', 'Semarang', 2);
(13, NULL, 'Gisela', 'Anastesi', NULL, 'gisel@example.com', 'password123', 'Badung', '1990-03-06', 'Badung', 2);
(14, NULL, 'Vina', 'Ningsih', NULL, 'vina@example.com', 'password123', 'Cirebon', '1996-03-06', 'Cirebon', 2);
(15, NULL, 'Trisno', 'Sanjaya', NULL, 'trsino@example.com', 'password123', 'Indrmayu', '2008-03-06', 'Indramayu', 1);
(16, NULL, 'jamal', 'Udin', NULL, 'jamal@example.com', 'password123', 'Indrmayu', '2001-04-06', 'Indramayu', 1);
(17, NULL, 'Nikko', 'Adrian', NULL, 'nikko@example.com', 'password123', 'Indrmayu', '1996-02-29', 'Indramayu', 1);
(18, NULL, 'Andi', 'Rusnandi', NULL, 'andirus@example.com', 'password123', 'Indrmayu', '1986-02-29', 'majalengka', 1);
(19, NULL, 'Riskun', 'Salam', NULL, 'riskun@example.com', 'password123', 'Indrmayu', '1998-05-29', 'Indramayu', 1);
(20, NULL, 'Godogan', 'Boled', NULL, 'boled@example.com', 'password123', 'Indrmayu', '1945-07-02', 'Indramayu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_grup`
--

CREATE TABLE `user_grup` (
  `id_user_grup` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_grup` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `user_grup`
--

INSERT INTO `user_grup` (`id_user_grup`, `id_user`, `id_grup`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `waktu_kuliah`
--

CREATE TABLE `waktu_kuliah` (
  `id_waktu_kuliah` int(11) NOT NULL,
  `waktu_kuliah` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `waktu_kuliah`
--

INSERT INTO `waktu_kuliah` (`id_waktu_kuliah`, `waktu_kuliah`) VALUES
(1, 'Pagi'),
(2, 'Sore');

-- --------------------------------------------------------

--
-- Table structure for table `wisuda`
--

CREATE TABLE `wisuda` (
  `id_wisuda` int(11) NOT NULL,
  `tgl_wisuda` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `wisuda`
--

INSERT INTO `wisuda` (`id_wisuda`, `tgl_wisuda`) VALUES
(1, '2024-08-01'),
(2, '2023-08-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id_lulus`),
  ADD KEY `id_wisuda` (`id_wisuda`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `badan_hukum`
--
ALTER TABLE `badan_hukum`
  ADD PRIMARY KEY (`id_badan_hukum`);

--
-- Indexes for table `bobot_nilai`
--
ALTER TABLE `bobot_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `data_loker`
--
ALTER TABLE `data_loker`
  ADD PRIMARY KEY (`id_loker`),
  ADD KEY `id_wisuda` (`id_wisuda`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`),
  ADD KEY `id_badan_hukum` (`id_badan_hukum`);

--
-- Indexes for table `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`id_grup`);

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indexes for table `honor_ajar`
--
ALTER TABLE `honor_ajar`
  ADD PRIMARY KEY (`id_honor_ajar`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_waktu_kuliah` (`id_waktu_kuliah`);

--
-- Indexes for table `jadwal_kul`
--
ALTER TABLE `jadwal_kul`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_jam` (`id_jam`),
  ADD KEY `id_hari` (`id_hari`),
  ADD KEY `id_ruang` (`id_ruang`),
  ADD KEY `id_kelas_krs` (`id_kelas_krs`);

--
-- Indexes for table `jam_pelajaran`
--
ALTER TABLE `jam_pelajaran`
  ADD PRIMARY KEY (`id_jam`),
  ADD KEY `id_waktu_kuliah` (`id_waktu_kuliah`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `jenis_matkul`
--
ALTER TABLE `jenis_matkul`
  ADD PRIMARY KEY (`id_jenis_matkul`);

--
-- Indexes for table `jenis_pendaftaran`
--
ALTER TABLE `jenis_pendaftaran`
  ADD PRIMARY KEY (`id_jenis_pendaftaran`);

--
-- Indexes for table `jenis_ruang`
--
ALTER TABLE `jenis_ruang`
  ADD PRIMARY KEY (`id_jenis_ruang`);

--
-- Indexes for table `jenis_tagihan`
--
ALTER TABLE `jenis_tagihan`
  ADD PRIMARY KEY (`id_jns_tagihan`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_waktu_kuliah` (`id_waktu_kuliah`);

--
-- Indexes for table `kelas_detil`
--
ALTER TABLE `kelas_detil`
  ADD PRIMARY KEY (`id_kelas_detil`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_progdi` (`id_progdi`);

--
-- Indexes for table `kelas_krs`
--
ALTER TABLE `kelas_krs`
  ADD PRIMARY KEY (`id_kelas_krs`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_thn_akademik` (`id_thn_akademik`),
  ADD KEY `id_kelas_detil` (`id_kelas_detil`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `krs_khs`
--
ALTER TABLE `krs_khs`
  ADD PRIMARY KEY (`id_krs`),
  ADD KEY `id_kelas_krs` (`id_kelas_krs`),
  ADD KEY `id_nilai` (`id_nilai`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`),
  ADD KEY `id_progdi` (`id_progdi`);

--
-- Indexes for table `kurikulum_matkul`
--
ALTER TABLE `kurikulum_matkul`
  ADD PRIMARY KEY (`id_kurikulum`,`id_matkul`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_progdi` (`id_progdi`),
  ADD KEY `id_thn_akademik` (`id_thn_akademik`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_waktu_kuliah` (`id_waktu_kuliah`),
  ADD KEY `id_jenis_pendaftaran` (`id_jenis_pendaftaran`);

--
-- Indexes for table `master_tagihan`
--
ALTER TABLE `master_tagihan`
  ADD PRIMARY KEY (`id_master_tagihan`),
  ADD KEY `id_progdi` (`id_progdi`),
  ADD KEY `id_thn_akademik` (`id_thn_akademik`),
  ADD KEY `id_jns_tagihan` (`id_jns_tagihan`),
  ADD KEY `id_waktu_kuliah` (`id_waktu_kuliah`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_matkul`),
  ADD UNIQUE KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `id_progdi` (`id_progdi`),
  ADD KEY `id_jenis_matkul` (`id_jenis_matkul`),
  ADD KEY `id_jenis_ruang` (`id_jenis_ruang`);

--
-- Indexes for table `nilai_transfer`
--
ALTER TABLE `nilai_transfer`
  ADD PRIMARY KEY (`id_nilai_transfer`),
  ADD KEY `id_nilai` (`id_nilai`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `pembimbing`
--
ALTER TABLE `pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indexes for table `penugasan_dosen`
--
ALTER TABLE `penugasan_dosen`
  ADD PRIMARY KEY (`id_penugasan`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_progdi` (`id_progdi`);

--
-- Indexes for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD PRIMARY KEY (`id_pertemuan`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_kelas_krs` (`id_kelas_krs`);

--
-- Indexes for table `pmb`
--
ALTER TABLE `pmb`
  ADD PRIMARY KEY (`id_pmb`),
  ADD KEY `id_status_registrasi` (`id_status_registrasi`),
  ADD KEY `id_jenis_pendaftaran` (`id_jenis_pendaftaran`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_progdi` (`id_progdi`);

--
-- Indexes for table `prasyarat_matkul`
--
ALTER TABLE `prasyarat_matkul`
  ADD PRIMARY KEY (`id_prasyarat`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_matkul_pra` (`id_matkul_pra`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id_progdi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indexes for table `publikasi_dosen`
--
ALTER TABLE `publikasi_dosen`
  ADD PRIMARY KEY (`id_publikasi_dosen`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`),
  ADD KEY `id_jenis_ruang` (`id_jenis_ruang`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `status_master`
--
ALTER TABLE `status_master`
  ADD PRIMARY KEY (`id_status_master`);

--
-- Indexes for table `status_mhs`
--
ALTER TABLE `status_mhs`
  ADD PRIMARY KEY (`id_status_master`,`id_thn_akademik`,`id_mahasiswa`),
  ADD KEY `id_thn_akademik` (`id_thn_akademik`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `status_registrasi`
--
ALTER TABLE `status_registrasi`
  ADD PRIMARY KEY (`id_status_registrasi`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `id_thn_akademik` (`id_thn_akademik`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_master_tagihan` (`id_master_tagihan`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id_thn_akademik`),
  ADD KEY `id_semester` (`id_semester`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_jenis_kelamin` (`id_jenis_kelamin`);

--
-- Indexes for table `user_grup`
--
ALTER TABLE `user_grup`
  ADD PRIMARY KEY (`id_user_grup`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_grup` (`id_grup`);

--
-- Indexes for table `waktu_kuliah`
--
ALTER TABLE `waktu_kuliah`
  ADD PRIMARY KEY (`id_waktu_kuliah`);

--
-- Indexes for table `wisuda`
--
ALTER TABLE `wisuda`
  ADD PRIMARY KEY (`id_wisuda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id_lulus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `badan_hukum`
--
ALTER TABLE `badan_hukum`
  MODIFY `id_badan_hukum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bobot_nilai`
--
ALTER TABLE `bobot_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_loker`
--
ALTER TABLE `data_loker`
  MODIFY `id_loker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grup`
--
ALTER TABLE `grup`
  MODIFY `id_grup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `honor_ajar`
--
ALTER TABLE `honor_ajar`
  MODIFY `id_honor_ajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal_kul`
--
ALTER TABLE `jadwal_kul`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jam_pelajaran`
--
ALTER TABLE `jam_pelajaran`
  MODIFY `id_jam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_matkul`
--
ALTER TABLE `jenis_matkul`
  MODIFY `id_jenis_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_pendaftaran`
--
ALTER TABLE `jenis_pendaftaran`
  MODIFY `id_jenis_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_ruang`
--
ALTER TABLE `jenis_ruang`
  MODIFY `id_jenis_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_tagihan`
--
ALTER TABLE `jenis_tagihan`
  MODIFY `id_jns_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas_detil`
--
ALTER TABLE `kelas_detil`
  MODIFY `id_kelas_detil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas_krs`
--
ALTER TABLE `kelas_krs`
  MODIFY `id_kelas_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keluar`
--
ALTER TABLE `keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `krs_khs`
--
ALTER TABLE `krs_khs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_tagihan`
--
ALTER TABLE `master_tagihan`
  MODIFY `id_master_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai_transfer`
--
ALTER TABLE `nilai_transfer`
  MODIFY `id_nilai_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembimbing`
--
ALTER TABLE `pembimbing`
  MODIFY `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penugasan_dosen`
--
ALTER TABLE `penugasan_dosen`
  MODIFY `id_penugasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pertemuan`
--
ALTER TABLE `pertemuan`
  MODIFY `id_pertemuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pmb`
--
ALTER TABLE `pmb`
  MODIFY `id_pmb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prasyarat_matkul`
--
ALTER TABLE `prasyarat_matkul`
  MODIFY `id_prasyarat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id_progdi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `publikasi_dosen`
--
ALTER TABLE `publikasi_dosen`
  MODIFY `id_publikasi_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_master`
--
ALTER TABLE `status_master`
  MODIFY `id_status_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_registrasi`
--
ALTER TABLE `status_registrasi`
  MODIFY `id_status_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id_thn_akademik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_grup`
--
ALTER TABLE `user_grup`
  MODIFY `id_user_grup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waktu_kuliah`
--
ALTER TABLE `waktu_kuliah`
  MODIFY `id_waktu_kuliah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wisuda`
--
ALTER TABLE `wisuda`
  MODIFY `id_wisuda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_wisuda`) REFERENCES `wisuda` (`id_wisuda`),
  ADD CONSTRAINT `alumni_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `data_loker`
--
ALTER TABLE `data_loker`
  ADD CONSTRAINT `data_loker_ibfk_1` FOREIGN KEY (`id_wisuda`) REFERENCES `wisuda` (`id_wisuda`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fakultas_ibfk_1` FOREIGN KEY (`id_badan_hukum`) REFERENCES `badan_hukum` (`id_badan_hukum`);

--
-- Constraints for table `honor_ajar`
--
ALTER TABLE `honor_ajar`
  ADD CONSTRAINT `honor_ajar_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `honor_ajar_ibfk_2` FOREIGN KEY (`id_waktu_kuliah`) REFERENCES `waktu_kuliah` (`id_waktu_kuliah`);

--
-- Constraints for table `jadwal_kul`
--
ALTER TABLE `jadwal_kul`
  ADD CONSTRAINT `jadwal_kul_ibfk_1` FOREIGN KEY (`id_jam`) REFERENCES `jam_pelajaran` (`id_jam`),
  ADD CONSTRAINT `jadwal_kul_ibfk_2` FOREIGN KEY (`id_hari`) REFERENCES `hari` (`id_hari`),
  ADD CONSTRAINT `jadwal_kul_ibfk_3` FOREIGN KEY (`id_ruang`) REFERENCES `ruang` (`id_ruang`),
  ADD CONSTRAINT `jadwal_kul_ibfk_4` FOREIGN KEY (`id_kelas_krs`) REFERENCES `kelas_krs` (`id_kelas_krs`);

--
-- Constraints for table `jam_pelajaran`
--
ALTER TABLE `jam_pelajaran`
  ADD CONSTRAINT `jam_pelajaran_ibfk_1` FOREIGN KEY (`id_waktu_kuliah`) REFERENCES `waktu_kuliah` (`id_waktu_kuliah`);

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_waktu_kuliah`) REFERENCES `waktu_kuliah` (`id_waktu_kuliah`);

--
-- Constraints for table `kelas_detil`
--
ALTER TABLE `kelas_detil`
  ADD CONSTRAINT `kelas_detil_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `kelas_detil_ibfk_2` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`);

--
-- Constraints for table `kelas_krs`
--
ALTER TABLE `kelas_krs`
  ADD CONSTRAINT `kelas_krs_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_krs_ibfk_2` FOREIGN KEY (`id_thn_akademik`) REFERENCES `tahun_akademik` (`id_thn_akademik`),
  ADD CONSTRAINT `kelas_krs_ibfk_3` FOREIGN KEY (`id_kelas_detil`) REFERENCES `kelas_detil` (`id_kelas_detil`),
  ADD CONSTRAINT `kelas_krs_ibfk_4` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`);

--
-- Constraints for table `keluar`
--
ALTER TABLE `keluar`
  ADD CONSTRAINT `keluar_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `krs_khs`
--
ALTER TABLE `krs_khs`
  ADD CONSTRAINT `krs_khs_ibfk_1` FOREIGN KEY (`id_kelas_krs`) REFERENCES `kelas_krs` (`id_kelas_krs`),
  ADD CONSTRAINT `krs_khs_ibfk_2` FOREIGN KEY (`id_nilai`) REFERENCES `bobot_nilai` (`id_nilai`),
  ADD CONSTRAINT `krs_khs_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD CONSTRAINT `kurikulum_ibfk_1` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`);

--
-- Constraints for table `kurikulum_matkul`
--
ALTER TABLE `kurikulum_matkul`
  ADD CONSTRAINT `kurikulum_matkul_ibfk_1` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id_kurikulum`),
  ADD CONSTRAINT `kurikulum_matkul_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`id_thn_akademik`) REFERENCES `tahun_akademik` (`id_thn_akademik`),
  ADD CONSTRAINT `mahasiswa_ibfk_4` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `mahasiswa_ibfk_5` FOREIGN KEY (`id_waktu_kuliah`) REFERENCES `waktu_kuliah` (`id_waktu_kuliah`),
  ADD CONSTRAINT `mahasiswa_ibfk_6` FOREIGN KEY (`id_jenis_pendaftaran`) REFERENCES `jenis_pendaftaran` (`id_jenis_pendaftaran`);

--
-- Constraints for table `master_tagihan`
--
ALTER TABLE `master_tagihan`
  ADD CONSTRAINT `master_tagihan_ibfk_1` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`),
  ADD CONSTRAINT `master_tagihan_ibfk_2` FOREIGN KEY (`id_thn_akademik`) REFERENCES `tahun_akademik` (`id_thn_akademik`),
  ADD CONSTRAINT `master_tagihan_ibfk_3` FOREIGN KEY (`id_jns_tagihan`) REFERENCES `jenis_tagihan` (`id_jns_tagihan`),
  ADD CONSTRAINT `master_tagihan_ibfk_4` FOREIGN KEY (`id_waktu_kuliah`) REFERENCES `waktu_kuliah` (`id_waktu_kuliah`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`),
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`id_jenis_matkul`) REFERENCES `jenis_matkul` (`id_jenis_matkul`),
  ADD CONSTRAINT `mata_kuliah_ibfk_3` FOREIGN KEY (`id_jenis_ruang`) REFERENCES `jenis_ruang` (`id_jenis_ruang`);

--
-- Constraints for table `nilai_transfer`
--
ALTER TABLE `nilai_transfer`
  ADD CONSTRAINT `nilai_transfer_ibfk_1` FOREIGN KEY (`id_nilai`) REFERENCES `bobot_nilai` (`id_nilai`),
  ADD CONSTRAINT `nilai_transfer_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`),
  ADD CONSTRAINT `nilai_transfer_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `pembimbing`
--
ALTER TABLE `pembimbing`
  ADD CONSTRAINT `pembimbing_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `pembimbing_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `penugasan_dosen`
--
ALTER TABLE `penugasan_dosen`
  ADD CONSTRAINT `penugasan_dosen_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `penugasan_dosen_ibfk_2` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`);

--
-- Constraints for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `pertemuan_ibfk_2` FOREIGN KEY (`id_kelas_krs`) REFERENCES `kelas_krs` (`id_kelas_krs`);

--
-- Constraints for table `pmb`
--
ALTER TABLE `pmb`
  ADD CONSTRAINT `pmb_ibfk_1` FOREIGN KEY (`id_status_registrasi`) REFERENCES `status_registrasi` (`id_status_registrasi`),
  ADD CONSTRAINT `pmb_ibfk_2` FOREIGN KEY (`id_jenis_pendaftaran`) REFERENCES `jenis_pendaftaran` (`id_jenis_pendaftaran`),
  ADD CONSTRAINT `pmb_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pmb_ibfk_4` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`);

--
-- Constraints for table `prasyarat_matkul`
--
ALTER TABLE `prasyarat_matkul`
  ADD CONSTRAINT `prasyarat_matkul_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`),
  ADD CONSTRAINT `prasyarat_matkul_ibfk_2` FOREIGN KEY (`id_matkul_pra`) REFERENCES `mata_kuliah` (`id_matkul`);

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`);

--
-- Constraints for table `publikasi_dosen`
--
ALTER TABLE `publikasi_dosen`
  ADD CONSTRAINT `publikasi_dosen_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`id_jenis_ruang`) REFERENCES `jenis_ruang` (`id_jenis_ruang`);

--
-- Constraints for table `status_mhs`
--
ALTER TABLE `status_mhs`
  ADD CONSTRAINT `status_mhs_ibfk_1` FOREIGN KEY (`id_status_master`) REFERENCES `status_master` (`id_status_master`),
  ADD CONSTRAINT `status_mhs_ibfk_2` FOREIGN KEY (`id_thn_akademik`) REFERENCES `tahun_akademik` (`id_thn_akademik`),
  ADD CONSTRAINT `status_mhs_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`id_thn_akademik`) REFERENCES `tahun_akademik` (`id_thn_akademik`),
  ADD CONSTRAINT `tagihan_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `tagihan_ibfk_3` FOREIGN KEY (`id_master_tagihan`) REFERENCES `master_tagihan` (`id_master_tagihan`);

--
-- Constraints for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD CONSTRAINT `tahun_akademik_ibfk_1` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_jenis_kelamin`) REFERENCES `jenis_kelamin` (`id_jenis_kelamin`);

--
-- Constraints for table `user_grup`
--
ALTER TABLE `user_grup`
  ADD CONSTRAINT `user_grup_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `user_grup_ibfk_2` FOREIGN KEY (`id_grup`) REFERENCES `grup` (`id_grup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

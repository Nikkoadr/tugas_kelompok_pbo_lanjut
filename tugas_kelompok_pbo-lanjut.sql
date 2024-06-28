-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 28 Jun 2024 pada 10.03
-- Versi server: 8.0.33
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_kelompok_pbo-lanjut`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alumni`
--

CREATE TABLE `alumni` (
  `id_alumni` int NOT NULL,
  `id_mahasiswa` int DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `alumni`
--

INSERT INTO `alumni` (`id_alumni`, `id_mahasiswa`, `pekerjaan`, `no_hp`) VALUES
(1, 1, 'Programmer', '081234567890'),
(2, 2, 'Engineer', '081234567891');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `nidn` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `id_user`, `nidn`, `jabatan`) VALUES
(1, 2, '123456', 'Profesor'),
(2, 9, '123457', 'Lektor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int NOT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `id_badan_hukum` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `fakultas`, `id_badan_hukum`) VALUES
(1, 'Fakultas Teknik', 1),
(2, 'Fakultas Ekonomi', 1),
(3, 'Fakultas Hukum', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `grup`
--

CREATE TABLE `grup` (
  `id_grup` int NOT NULL,
  `grup` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `grup`
--

INSERT INTO `grup` (`id_grup`, `grup`) VALUES
(1, 'Admin'),
(2, 'Dosen'),
(3, 'Mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lampiran_tugas_akhir`
--

CREATE TABLE `lampiran_tugas_akhir` (
  `id_lampiran` int NOT NULL,
  `id_tugas_akhir` int DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `lokasi_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `lampiran_tugas_akhir`
--

INSERT INTO `lampiran_tugas_akhir` (`id_lampiran`, `id_tugas_akhir`, `nama_file`, `lokasi_file`) VALUES
(1, 1, 'Proposal_Tugas_Akhir.pdf', '/path/to/Proposal_Tugas_Akhir.pdf'),
(2, 1, 'Presentasi_Tugas_Akhir.pptx', '/path/to/Presentasi_Tugas_Akhir.pptx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_kerja`
--

CREATE TABLE `lowongan_kerja` (
  `id_lowongan` int NOT NULL,
  `posisi` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `deskripsi` text,
  `kualifikasi` text,
  `tanggal_buka` date DEFAULT NULL,
  `tanggal_tutup` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `lowongan_kerja`
--

INSERT INTO `lowongan_kerja` (`id_lowongan`, `posisi`, `perusahaan`, `lokasi`, `deskripsi`, `kualifikasi`, `tanggal_buka`, `tanggal_tutup`) VALUES
(1, 'Backend Developer', 'PT RST', 'Jakarta', 'Mengembangkan API dan sistem backend.', 'Pengalaman minimal 2 tahun di bidang terkait.', '2024-01-01', '2024-01-01'),
(2, 'Frontend Developer', 'XYZ Solutions', 'Surabaya', 'Membangun antarmuka pengguna untuk aplikasi web.', 'Pengalaman minimal 1 tahun di bidang terkait.', '2024-01-15', '2024-04-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_progdi` int DEFAULT NULL,
  `sekolah_asal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `id_user`, `id_progdi`, `sekolah_asal`) VALUES
(1, 3, 1, 'SMA N 1 Jakarta'),
(2, 4, 1, 'SMA N 2 Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelamar`
--

CREATE TABLE `pelamar` (
  `id_pelamar` int NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `id_lowongan` int DEFAULT NULL,
  `tanggal_melamar` date DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Dalam Proses'
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `pelamar`
--

INSERT INTO `pelamar` (`id_pelamar`, `nama`, `email`, `no_hp`, `id_lowongan`, `tanggal_melamar`, `status`) VALUES
(1, 'Budi Santoso', 'budi@example.com', '081234567890', 1, '2024-01-05', 'Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penguji_tugas_akhir`
--

CREATE TABLE `penguji_tugas_akhir` (
  `id_penguji` int NOT NULL,
  `id_tugas_akhir` int DEFAULT NULL,
  `id_dosen_penguji` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `penguji_tugas_akhir`
--

INSERT INTO `penguji_tugas_akhir` (`id_penguji`, `id_tugas_akhir`, `id_dosen_penguji`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta_wisuda`
--

CREATE TABLE `peserta_wisuda` (
  `id_peserta` int NOT NULL,
  `id_mahasiswa` int DEFAULT NULL,
  `id_wisuda` int DEFAULT NULL,
  `no_urut` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `peserta_wisuda`
--

INSERT INTO `peserta_wisuda` (`id_peserta`, `id_mahasiswa`, `id_wisuda`, `no_urut`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `id_progdi` int NOT NULL,
  `progdi` varchar(255) DEFAULT NULL,
  `id_fakultas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`id_progdi`, `progdi`, `id_fakultas`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Teknik Elektro', 1),
(3, 'Manajemen', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `publikasi`
--

CREATE TABLE `publikasi` (
  `id_publikasi` int NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `jenis` varchar(100) DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `abstrak` text,
  `id_dosen` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `publikasi`
--

INSERT INTO `publikasi` (`id_publikasi`, `judul`, `jenis`, `tahun`, `abstrak`, `id_dosen`) VALUES
(1, 'Implementasi Machine Learning dalam Sistem Informasi', 'Jurnal', '2022', 'Penelitian ini membahas implementasi machine learning dalam pengembangan sistem informasi.', 1),
(2, 'Studi Kasus Penggunaan IoT di Industri 4.0', 'Konferensi', '2023', 'Studi kasus ini membahas aplikasi Internet of Things (IoT) di lingkungan industri 4.0.', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_revisi_tugas_akhir`
--

CREATE TABLE `riwayat_revisi_tugas_akhir` (
  `id_riwayat_revisi` int NOT NULL,
  `id_tugas_akhir` int DEFAULT NULL,
  `tanggal_revisi` date DEFAULT NULL,
  `deskripsi_revisi` text
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `riwayat_revisi_tugas_akhir`
--

INSERT INTO `riwayat_revisi_tugas_akhir` (`id_riwayat_revisi`, `id_tugas_akhir`, `tanggal_revisi`, `deskripsi_revisi`) VALUES
(1, 1, '2024-05-25', 'Revisi judul tugas akhir sesuai saran dosen pembimbing.'),
(2, 1, '2024-06-01', 'Revisi isi laporan akhir sesuai masukan dari penguji.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas_akhir`
--

CREATE TABLE `tugas_akhir` (
  `id_tugas_akhir` int NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text,
  `id_mahasiswa` int DEFAULT NULL,
  `id_dosen_pembimbing` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `tanggal_penyerahan` date DEFAULT NULL,
  `catatan` text
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `tugas_akhir`
--

INSERT INTO `tugas_akhir` (`id_tugas_akhir`, `judul`, `deskripsi`, `id_mahasiswa`, `id_dosen_pembimbing`, `status`, `nilai`, `tanggal_penyerahan`, `catatan`) VALUES
(1, 'Implementasi Sistem Informasi Akademik Berbasis Web', 'Deskripsi singkat tentang implementasi sistem informasi akademik menggunakan teknologi web.', 1, 1, 'selesai', 85.50, '2024-05-30', 'Catatan tambahan dari dosen pembimbing.'),
(2, 'Analisis dan Perancangan Jaringan IoT', 'Deskripsi singkat tentang analisis dan perancangan jaringan Internet of Things (IoT) untuk keperluan industri.', 2, 2, 'diajukan', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gelar_depan` varchar(255) DEFAULT NULL,
  `nama_awal` varchar(255) DEFAULT NULL,
  `nama_akhir` varchar(255) DEFAULT NULL,
  `gelar_belakang` varchar(255) DEFAULT NULL,
  `id_grup` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `gelar_depan`, `nama_awal`, `nama_akhir`, `gelar_belakang`, `id_grup`) VALUES
(1, 'admin', 'admin123', 'admin@univ.ac.id', 'Dr', 'Dohari', 'Ajja', 'MKV', 1),
(2, 'dosen1', 'dosen123', 'dosen1@univ.ac.id', '', 'Trenggono', 'yaaa', 'MP4', 2),
(3, 'mhs1', 'mhs123', 'mhs1@univ.ac.id', '', 'Godogan', 'Boled', '', 3),
(4, 'mhs2', 'mhs123', 'mhs2@univ.ac.id', '', 'Godogan', 'Endas', '', 3),
(9, 'dosen2', 'dosen123', 'dosen2@univ.ac.id', '', 'Saba', 'nurrr', 'M.Kom', 2),
(10, 'dosen3', 'dosen123', 'dosen3@univ.ac.id', '', 'Lukman', 'nurhakim', '', 2),
(11, 'dosen4', 'dosen123', 'dosen4@univ.ac.id', '', 'diding', 'dong', '', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisuda`
--

CREATE TABLE `wisuda` (
  `id_wisuda` int NOT NULL,
  `wisuda` varchar(255) DEFAULT NULL,
  `tgl_wisuda` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data untuk tabel `wisuda`
--

INSERT INTO `wisuda` (`id_wisuda`, `wisuda`, `tgl_wisuda`) VALUES
(1, 'Wisuda 2024', '2024-06-15'),
(2, 'Wisuda 2023', '2023-06-15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id_alumni`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indeks untuk tabel `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`id_grup`);

--
-- Indeks untuk tabel `lampiran_tugas_akhir`
--
ALTER TABLE `lampiran_tugas_akhir`
  ADD PRIMARY KEY (`id_lampiran`),
  ADD KEY `id_tugas_akhir` (`id_tugas_akhir`);

--
-- Indeks untuk tabel `lowongan_kerja`
--
ALTER TABLE `lowongan_kerja`
  ADD PRIMARY KEY (`id_lowongan`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_progdi` (`id_progdi`);

--
-- Indeks untuk tabel `pelamar`
--
ALTER TABLE `pelamar`
  ADD PRIMARY KEY (`id_pelamar`),
  ADD KEY `id_lowongan` (`id_lowongan`);

--
-- Indeks untuk tabel `penguji_tugas_akhir`
--
ALTER TABLE `penguji_tugas_akhir`
  ADD PRIMARY KEY (`id_penguji`),
  ADD KEY `id_tugas_akhir` (`id_tugas_akhir`),
  ADD KEY `id_dosen_penguji` (`id_dosen_penguji`);

--
-- Indeks untuk tabel `peserta_wisuda`
--
ALTER TABLE `peserta_wisuda`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_wisuda` (`id_wisuda`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id_progdi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indeks untuk tabel `publikasi`
--
ALTER TABLE `publikasi`
  ADD PRIMARY KEY (`id_publikasi`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `riwayat_revisi_tugas_akhir`
--
ALTER TABLE `riwayat_revisi_tugas_akhir`
  ADD PRIMARY KEY (`id_riwayat_revisi`),
  ADD KEY `id_tugas_akhir` (`id_tugas_akhir`);

--
-- Indeks untuk tabel `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  ADD PRIMARY KEY (`id_tugas_akhir`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_dosen_pembimbing` (`id_dosen_pembimbing`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_grup` (`id_grup`);

--
-- Indeks untuk tabel `wisuda`
--
ALTER TABLE `wisuda`
  ADD PRIMARY KEY (`id_wisuda`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id_alumni` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `grup`
--
ALTER TABLE `grup`
  MODIFY `id_grup` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lampiran_tugas_akhir`
--
ALTER TABLE `lampiran_tugas_akhir`
  MODIFY `id_lampiran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lowongan_kerja`
--
ALTER TABLE `lowongan_kerja`
  MODIFY `id_lowongan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelamar`
--
ALTER TABLE `pelamar`
  MODIFY `id_pelamar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penguji_tugas_akhir`
--
ALTER TABLE `penguji_tugas_akhir`
  MODIFY `id_penguji` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `peserta_wisuda`
--
ALTER TABLE `peserta_wisuda`
  MODIFY `id_peserta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id_progdi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `publikasi`
--
ALTER TABLE `publikasi`
  MODIFY `id_publikasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `riwayat_revisi_tugas_akhir`
--
ALTER TABLE `riwayat_revisi_tugas_akhir`
  MODIFY `id_riwayat_revisi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  MODIFY `id_tugas_akhir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `wisuda`
--
ALTER TABLE `wisuda`
  MODIFY `id_wisuda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `lampiran_tugas_akhir`
--
ALTER TABLE `lampiran_tugas_akhir`
  ADD CONSTRAINT `lampiran_tugas_akhir_ibfk_1` FOREIGN KEY (`id_tugas_akhir`) REFERENCES `tugas_akhir` (`id_tugas_akhir`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_progdi`) REFERENCES `program_studi` (`id_progdi`);

--
-- Ketidakleluasaan untuk tabel `pelamar`
--
ALTER TABLE `pelamar`
  ADD CONSTRAINT `pelamar_ibfk_1` FOREIGN KEY (`id_lowongan`) REFERENCES `lowongan_kerja` (`id_lowongan`);

--
-- Ketidakleluasaan untuk tabel `penguji_tugas_akhir`
--
ALTER TABLE `penguji_tugas_akhir`
  ADD CONSTRAINT `penguji_tugas_akhir_ibfk_1` FOREIGN KEY (`id_tugas_akhir`) REFERENCES `tugas_akhir` (`id_tugas_akhir`),
  ADD CONSTRAINT `penguji_tugas_akhir_ibfk_2` FOREIGN KEY (`id_dosen_penguji`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `peserta_wisuda`
--
ALTER TABLE `peserta_wisuda`
  ADD CONSTRAINT `peserta_wisuda_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `peserta_wisuda_ibfk_2` FOREIGN KEY (`id_wisuda`) REFERENCES `wisuda` (`id_wisuda`);

--
-- Ketidakleluasaan untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`);

--
-- Ketidakleluasaan untuk tabel `publikasi`
--
ALTER TABLE `publikasi`
  ADD CONSTRAINT `publikasi_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `riwayat_revisi_tugas_akhir`
--
ALTER TABLE `riwayat_revisi_tugas_akhir`
  ADD CONSTRAINT `riwayat_revisi_tugas_akhir_ibfk_1` FOREIGN KEY (`id_tugas_akhir`) REFERENCES `tugas_akhir` (`id_tugas_akhir`);

--
-- Ketidakleluasaan untuk tabel `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  ADD CONSTRAINT `tugas_akhir_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `tugas_akhir_ibfk_2` FOREIGN KEY (`id_dosen_pembimbing`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_grup`) REFERENCES `grup` (`id_grup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Bulan Mei 2024 pada 15.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kemitraan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `nomor_telpon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`user_name`, `password`, `id_admin`, `nomor_telpon`) VALUES
('andin', '789', 1, '081234567893'),
('azriel', '456', 2, '081234567894'),
('rehan', '123', 3, '081234567895');

-- --------------------------------------------------------

--
-- Struktur dari tabel `franchise`
--

CREATE TABLE `franchise` (
  `id_franchise` int(11) NOT NULL,
  `nama_franchise` varchar(50) NOT NULL,
  `lokasi_franchise` varchar(100) NOT NULL,
  `deskripsi_franchise` varchar(200) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `status` varchar(10) DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `franchise`
--

INSERT INTO `franchise` (`id_franchise`, `nama_franchise`, `lokasi_franchise`, `deskripsi_franchise`, `id_pemilik`, `status`) VALUES
(1, 'Burger King', 'Jl. A. Yani', 'Restoran cepat saji global', 1, 'belum'),
(2, 'KFC', 'Jl. Pahlawan', 'Restoran ayam goreng', 2, 'belum'),
(3, 'McDonalds', 'Jl. Kartini', 'Jaringan restoran burger dunia', 3, 'belum'),
(4, 'Starbucks', 'Jl. Pangeran Antasari', 'Jaringan kedai kopi internasional', 4, 'belum'),
(5, 'Dominos Pizza', 'Jl. Diponegoro', 'Restoran pizza internasional', 5, 'belum'),
(6, 'Dunkin', 'Jl. M.T. Haryono', 'Jaringan toko kopi dan donat', 6, 'belum'),
(7, 'Subway', 'Jl. Sudirman', 'Restoran sandwich sehat', 7, 'belum'),
(8, 'Pizza Hut', 'Jl. Ahmad Yani', 'Restoran pizza internasional', 8, 'belum'),
(9, 'J.Co Donuts', 'Jl. Gatot Subroto', 'Toko donat dan kopi', 9, 'belum'),
(10, 'Chatime', 'Jl. Jenderal Sudirman', 'Jaringan minuman bubble tea', 10, 'belum'),
(11, 'Lotteria', 'Jl. A. Yani', 'Restoran cepat saji Korea Selatan', 11, 'belum'),
(12, 'Wendys', 'Jl. Pahlawan', 'Restoran cepat saji burger AS', 12, 'belum'),
(13, 'Auntie Annes', 'Jl. Kartini', 'Toko pretzel AS', 13, 'belum'),
(14, 'Cinnabon', 'Jl. Pangeran Antasari', 'Toko roti manis AS', 14, 'belum'),
(15, 'Texas Chicken', 'Jl. Diponegoro', 'Restoran ayam goreng AS', 15, 'belum'),
(16, 'Baskin Robbins', 'Jl. M.T. Haryono', 'Toko es krim internasional', 16, 'belum'),
(17, 'Carls Jr.', 'Jl. Sudirman', 'Restoran burger AS', 17, 'belum'),
(18, 'Mr. Pancake', 'Jl. Ahmad Yani', 'Restoran pancake', 18, 'belum'),
(19, 'Sushi Tei', 'Jl. Gatot Subroto', 'Restoran sushi Jepang', 19, 'belum'),
(20, 'PHD (Pizza Hut Delivery)', 'Jl. Jenderal Sudirman', 'Layanan pengantaran pizza', 20, 'belum'),
(21, 'Burger King', 'Jl. A. Yani', 'Restoran cepat saji global', 21, 'belum'),
(22, 'KFC', 'Jl. Pahlawan', 'Restoran ayam goreng', 22, 'belum'),
(23, 'McDonalds', 'Jl. Kartini', 'Jaringan restoran burger dunia', 23, 'belum'),
(24, 'Starbucks', 'Jl. Pangeran Antasari', 'Jaringan kedai kopi internasional', 24, 'belum'),
(25, 'Dominos Pizza', 'Jl. Diponegoro', 'Restoran pizza internasional', 25, 'belum'),
(26, 'Dunkin', 'Jl. M.T. Haryono', 'Jaringan toko kopi dan donat', 26, 'belum'),
(27, 'Subway', 'Jl. Sudirman', 'Restoran sandwich sehat', 27, 'belum'),
(28, 'Pizza Hut', 'Jl. Ahmad Yani', 'Restoran pizza internasional', 28, 'belum'),
(29, 'J.Co Donuts', 'Jl. Gatot Subroto', 'Toko donat dan kopi', 29, 'belum'),
(30, 'Chatime', 'Jl. Jenderal Sudirman', 'Jaringan minuman bubble tea', 30, 'belum'),
(31, 'Lotteria', 'Jl. A. Yani', 'Restoran cepat saji Korea Selatan', 31, 'belum'),
(32, 'Wendys', 'Jl. Pahlawan', 'Restoran cepat saji burger AS', 32, 'belum'),
(33, 'Auntie Annes', 'Jl. Kartini', 'Toko pretzel AS', 33, 'belum'),
(34, 'Cinnabon', 'Jl. Pangeran Antasari', 'Toko roti manis AS', 34, 'belum'),
(35, 'Texas Chicken', 'Jl. Diponegoro', 'Restoran ayam goreng AS', 35, 'belum'),
(36, 'Baskin Robbins', 'Jl. M.T. Haryono', 'Toko es krim internasional', 36, 'belum'),
(37, 'Carls Jr.', 'Jl. Sudirman', 'Restoran burger AS', 37, 'belum'),
(38, 'Mr. Pancake', 'Jl. Ahmad Yani', 'Restoran pancake', 38, 'sudah'),
(39, 'Sushi Tei', 'Jl. Gatot Subroto', 'Restoran sushi Jepang', 39, 'sudah'),
(40, 'PHD (Pizza Hut Delivery)', 'Jl. Jenderal Sudirman', 'Layanan pengantaran pizza', 40, 'sudah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pedagang`
--

CREATE TABLE `pedagang` (
  `id_pedagang` int(11) NOT NULL,
  `nama_pedagang` varchar(50) NOT NULL,
  `kontak_pedagang` varchar(13) NOT NULL,
  `alamat_pedagang` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pedagang`
--

INSERT INTO `pedagang` (`id_pedagang`, `nama_pedagang`, `kontak_pedagang`, `alamat_pedagang`, `password`) VALUES
(1, 'adi nugroho', '08123456789', 'Jl. Diponegoro', '123'),
(2, 'Budi Santoso', '08765432100', 'Jl. M.T. Haryono', '123'),
(3, 'Citra dewi', '08567891234', 'Jl. Sudirman', '123'),
(4, 'Citra dewi', '08111222333', 'Jl. Ahmad Yani', '123'),
(5, 'Eka Putri', '08123456789', 'Jl. Pahlawan', '123'),
(6, 'Fajar Kurniawan', '08765432100', 'Jl. Kartini', '123'),
(7, 'Gita Permatasari', '08567891234', 'Jl. Pangeran Antasari', '123'),
(8, 'Hadi Wirawan', '08111222333', 'Jl. Diponegoro', '123'),
(9, 'Indah Sari', '08123456789', 'Jl. M.T. Haryono', '123'),
(10, 'Joko Susilo', '08765432100', 'Jl. Sudirman', '123'),
(11, 'Kartika Wulandari', '08567891234', 'Jl. Ahmad Yani', '123'),
(12, 'Lukman Hakim', '08111222333', 'Jl. Pahlawan', '123'),
(13, 'Mega Pratiwi', '08123456789', 'Jl. Kartini', '123'),
(14, 'Nita Rahayu', '08765432100', 'Jl. Pangeran Antasari', '123'),
(15, 'Opik Firmansyah', '08567891234', 'Jl. Diponegoro', '123'),
(16, 'Putra Ramadhan', '08111222333', 'Jl. M.T. Haryono', '123'),
(17, 'Rani Permata', '08123456789', 'Jl. Sudirman', '123'),
(18, 'Siska Indriani', '08765432100', 'Jl. Ahmad Yani', '123'),
(19, 'Taufik Hidayat', '08567891234', 'Jl. Pahlawan', '123'),
(20, 'Uci Rahman', '08111222333', 'Jl. Kartini', '123'),
(21, 'Vina Maulida', '08123456789', 'Jl. Diponegoro', '123'),
(22, 'Wahyu Kusuma', '08765432100', 'Jl. M.T. Haryono', '123'),
(23, 'Xavier Pangestu', '08567891234', 'Jl. Sudirman', '123'),
(24, 'Yuniarti Sari', '08111222333', 'Jl. Ahmad Yani', '123'),
(25, 'Zainul Abidin', '08123456789', 'Jl. Pahlawan', '123'),
(26, 'Ani Mawarti', '08765432100', 'Jl. Kartini', '123'),
(27, 'Bambang Sutrisno', '08567891234', 'Jl. Pangeran Antasari', '123'),
(28, 'Cindy Dewi', '08111222333', 'Jl. Diponegoro', '123'),
(29, 'Denny Kuriniawan', '08123456789', 'Jl. M.T. Haryono', '123'),
(30, 'Eka Putra', '08765432100', 'Jl. Sudirman', '123'),
(31, 'Fahmi Ridwan', '08567891234', 'Jl. Ahmad Yani', '123'),
(32, 'Gita Permata', '08111222333', 'Jl. Pahlawan', '123'),
(33, 'Hendra Gunawan', '08123456789', 'Jl. Kartini', '123'),
(34, 'Ika Septiani', '08765432100', 'Jl. Pangeran Antasari', '123'),
(35, 'Joko Santoso', '08567891234', 'Jl. Diponegoro', '123'),
(36, 'Kiki Ramadhan', '08111222333', 'Jl. M.T. Haryono', '123'),
(37, 'Lia Wijaya', '08123456789', 'Jl. Sudirman', '123'),
(38, 'Maulana Yusuf', '08765432100', 'Jl. Ahmad Yani', '123'),
(39, 'Nadia Rahmawati', '08567891234', 'Jl. Pahlawan', '123'),
(40, 'Oscar Pramata', '08272632981', 'Jl. Kartini', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik_franchise`
--

CREATE TABLE `pemilik_franchise` (
  `id_pemilik` int(11) NOT NULL,
  `nama_pemilik` varchar(50) NOT NULL,
  `kontak_pemilik` varchar(13) NOT NULL,
  `alamat_pemilik` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemilik_franchise`
--

INSERT INTO `pemilik_franchise` (`id_pemilik`, `nama_pemilik`, `kontak_pemilik`, `alamat_pemilik`) VALUES
(1, 'PT. Burger King Indonesia', '021-12345678', 'Jakarta'),
(2, 'PT. Fast Food Indonesia', '021-87654321', 'Jakarta'),
(3, 'PT. McDonalds Indonesia', '021-98765432', 'Jakarta'),
(4, 'PT. Starbucks Indonesia', '021-55556666', 'Jakarta'),
(5, 'PT. Dominos Pizza Indonesia', '021-33334444', 'Jakarta'),
(6, 'PT. Dunkin Indonesia', '021-66667777', 'Jakarta'),
(7, 'PT. Subway Indonesia', '021-99998888', 'Jakarta'),
(8, 'PT. Pizza Hut Indonesia', '021-11112222', 'Jakarta'),
(9, 'PT. J.Co Donuts Indonesia', '021-44445555', 'Jakarta'),
(10, 'PT. Chatime Indonesia', '021-77778888', 'Jakarta'),
(11, 'PT. Lotteria Indonesia', '021-88889999', 'Jakarta'),
(12, 'PT. Wendys Indonesia', '021-00001111', 'Jakarta'),
(13, 'PT. Auntie Annes Indonesia', '021-22223333', 'Jakarta'),
(14, 'PT. Cinnabon Indonesia', '021-77776666', 'Jakarta'),
(15, 'PT. Texas Chicken Indonesia', '021-44446666', 'Jakarta'),
(16, 'PT. Baskin Robbins Indonesia', '021-99991111', 'Jakarta'),
(17, 'PT. Carls Jr. Indonesia', '021-22224444', 'Jakarta'),
(18, 'PT. Mr. Pancake Indonesia', '021-88884444', 'Jakarta'),
(19, 'PT. Sushi Tei Indonesia', '021-11113333', 'Jakarta'),
(20, 'PT. PHD Indonesia', '021-55557777', 'Jakarta'),
(21, 'PT. Burger King Indonesia', '021-12345678', 'Jakarta'),
(22, 'PT. Fast Food Indonesia', '021-87654321', 'Jakarta'),
(23, 'PT. McDonalds Indonesia', '021-98765432', 'Jakarta'),
(24, 'PT. Starbucks Indonesia', '021-55556666', 'Jakarta'),
(25, 'PT. Dominos Pizza Indonesia', '021-33334444', 'Jakarta'),
(26, 'PT. Dunkin Indonesia', '021-66667777', 'Jakarta'),
(27, 'PT. Subway Indonesia', '021-99998888', 'Jakarta'),
(28, 'PT. Pizza Hut Indonesia', '021-11112222', 'Jakarta'),
(29, 'PT. J.Co Donuts Indonesia', '021-44445555', 'Jakarta'),
(30, 'PT. Chatime Indonesia', '021-77778888', 'Jakarta'),
(31, 'PT. Lotteria Indonesia', '021-88889999', 'Jakarta'),
(32, 'PT. Wendys Indonesia', '021-00001111', 'Jakarta'),
(33, 'PT. Auntie Annes Indonesia', '021-22223333', 'Jakarta'),
(34, 'PT. Cinnabon Indonesia', '021-77776666', 'Jakarta'),
(35, 'PT. Texas Chicken Indonesia', '021-44446666', 'Jakarta'),
(36, 'PT. Baskin Robbins Indonesia', '021-99991111', 'Jakarta'),
(37, 'PT. Carls Jr. Indonesia', '021-22224444', 'Jakarta'),
(38, 'PT. Mr. Pancake Indonesia', '021-88884444', 'Jakarta'),
(39, 'PT. Sushi Tei Indonesia', '021-11113333', 'Jakarta'),
(40, 'PT. PHD Indonesia', '021-55557777', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_franchise`
--

CREATE TABLE `produk_franchise` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `keterangan_produk` varchar(100) NOT NULL,
  `harga_produk` varchar(50) NOT NULL,
  `id_franchise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_franchise`
--

INSERT INTO `produk_franchise` (`id_produk`, `nama_produk`, `keterangan_produk`, `harga_produk`, `id_franchise`) VALUES
(1, 'Whopper Burger', 'Burger Kings signature burger', '35000', 1),
(2, 'Bucket Ayam Original', 'Ayam goreng KFC', '85000', 2),
(3, 'Big Mac', 'McDonalds iconic burger', '40000', 3),
(4, 'Caramel Macchiato', 'Starbucks coffee beverage', '45000', 4),
(5, 'Extravaganzza', 'Pizza Dominos paling top', '120000', 5),
(6, 'Donat Asin', 'Dunkin Donuts classic donut', '15000', 6),
(7, 'Veggie Delite', 'Subways healthy sandwich', '35000', 7),
(8, 'Super Supreme', 'Pizza Huts signature pizza', '110000', 8),
(9, 'J.Pops', 'J.Co Donuts bite-sized donuts', '10000', 9),
(10, 'Pearl Milk Tea', 'Chatimes popular bubble tea', '25000', 10),
(11, 'Bulgogi Burger', 'Lotterias Korean burger', '45000', 11),
(12, 'Baconator', 'Wendys juicy bacon burger', '50000', 12),
(13, 'Pretzel Dog', 'Auntie Annes classic pretzel', '20000', 13),
(14, 'Classic Roll', 'Cinnabons classic cinnamon roll', '30000', 14),
(15, 'Crispy Chicken', 'Texas Chickens crispy chicken', '40000', 15),
(16, 'Love Potion', 'Baskin Robbins romantic ice cream', '35000', 16),
(17, 'Western Bacon Cheeseburger', 'Carls Jr.s classic burger', '55000', 17),
(18, 'Chocolate Pancake', 'Mr. Pancakes chocolate pancake', '25000', 18),
(19, 'Salmon Sashimi', 'Sushi Teis fresh sashimi', '60000', 19),
(20, 'Cheese Lovers', 'PHDs pizza for cheese lovers', '100000', 20),
(21, 'Whopper Burger', 'Burger Kings signature burger', '35000', 21),
(22, 'Bucket Ayam Original', 'Ayam goreng KFC', '85000', 22),
(23, 'Big Mac', 'McDonalds iconic burger', '40000', 23),
(24, 'Caramel Macchiato', 'Starbucks coffee beverage', '45000', 24),
(25, 'Extravaganzza', 'Pizza Dominos paling top', '120000', 25),
(26, 'Donat Asin', 'Dunkin Donuts classic donut', '15000', 26),
(27, 'Veggie Delite', 'Subways healthy sandwich', '35000', 27),
(28, 'Super Supreme', 'Pizza Huts signature pizza', '110000', 28),
(29, 'J.Pops', 'J.Co Donuts bite-sized donuts', '10000', 29),
(30, 'Pearl Milk Tea', 'Chatimes popular bubble tea', '25000', 30),
(31, 'Bulgogi Burger', 'Lotterias Korean burger', '45000', 31),
(32, 'Baconator', 'Wendys juicy bacon burger', '50000', 32),
(33, 'Pretzel Dog', 'Auntie Annes classic pretzel', '20000', 33),
(34, 'Classic Roll', 'Cinnabons classic cinnamon roll', '30000', 34),
(35, 'Crispy Chicken', 'Texas Chickens crispy chicken', '40000', 35),
(36, 'Love Potion', 'Baskin Robbins romantic ice cream', '35000', 36),
(37, 'Western Bacon Cheeseburger', 'Carls Jr.s classic burger', '55000', 37),
(38, 'Chocolate Pancake', 'Mr. Pancakes chocolate pancake', '25000', 38),
(39, 'Salmon Sashimi', 'Sushi Teis fresh sashimi', '60000', 39),
(40, 'keren', 'murah', '12000', 40);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `franchise`
--
ALTER TABLE `franchise`
  ADD PRIMARY KEY (`id_franchise`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indeks untuk tabel `pedagang`
--
ALTER TABLE `pedagang`
  ADD PRIMARY KEY (`id_pedagang`);

--
-- Indeks untuk tabel `pemilik_franchise`
--
ALTER TABLE `pemilik_franchise`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indeks untuk tabel `produk_franchise`
--
ALTER TABLE `produk_franchise`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_franchise` (`id_franchise`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `franchise`
--
ALTER TABLE `franchise`
  ADD CONSTRAINT `franchise_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik_franchise` (`id_pemilik`);

--
-- Ketidakleluasaan untuk tabel `produk_franchise`
--
ALTER TABLE `produk_franchise`
  ADD CONSTRAINT `produk_franchise_ibfk_1` FOREIGN KEY (`id_franchise`) REFERENCES `franchise` (`id_franchise`),
  ADD CONSTRAINT `produk_franchise_ibfk_2` FOREIGN KEY (`id_franchise`) REFERENCES `franchise` (`id_franchise`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

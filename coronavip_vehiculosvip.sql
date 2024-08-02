-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2024 at 02:19 PM
-- Server version: 8.0.39-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `corona_tours`
--

-- --------------------------------------------------------

--
-- Table structure for table `coronavip_vehiculosvip`
--

CREATE TABLE `coronavip_vehiculosvip` (
  `id` bigint NOT NULL,
  `name` varchar(200) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `Number_passengers` int NOT NULL,
  `amount_luggage` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coronavip_vehiculosvip`
--

INSERT INTO `coronavip_vehiculosvip` (`id`, `name`, `tipo`, `Number_passengers`, `amount_luggage`, `image`, `order`, `created_at`, `update_at`, `user_id`) VALUES
(1, 'mercedes benz clase E', 'vehiculo_lujo', 2, 2, 'articles/RT_V_19c1891d3cc248969ec93e739275b420.png', 1, '2024-07-29 01:10:37.773231', '2024-07-31 00:55:45.629244', 1),
(2, 'mercedes vito de lujo', 'mini_van_lujo', 5, 5, 'articles/MB_ClaseV_exterior_1_485x366.png', 2, '2024-07-29 01:12:55.146916', '2024-07-31 01:00:07.117239', 1),
(3, 'mercedes sprinter de lujo', 'van_lujo', 15, 15, 'articles/file_20201014133116.jpg', 3, '2024-07-29 01:15:02.129284', '2024-07-31 01:03:34.965146', 1),
(4, 'toyota prado / fortune expedisi', 'camioneta', 3, 3, 'articles/4.PRADO-GRIS-METALICO.jpg', 0, '2024-07-30 22:45:45.000083', '2024-07-31 01:10:08.339131', 1),
(5, 'audi a8', 'lujo', 2, 2, 'articles/RT_V_23a9abb1e6db429f8d8c88439ed32bdc.png', 0, '2024-07-30 22:49:13.406168', '2024-07-31 01:14:04.913853', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coronavip_vehiculosvip`
--
ALTER TABLE `coronavip_vehiculosvip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coronavip_vehiculosvip_user_id_26f601c6_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coronavip_vehiculosvip`
--
ALTER TABLE `coronavip_vehiculosvip`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coronavip_vehiculosvip`
--
ALTER TABLE `coronavip_vehiculosvip`
  ADD CONSTRAINT `coronavip_vehiculosvip_user_id_26f601c6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 31, 2025 at 05:40 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int NOT NULL,
  `title` varchar(500) NOT NULL,
  `genre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `release_date` date NOT NULL,
  `description` varchar(3000) NOT NULL,
  `image_file` varchar(500) NOT NULL,
  `image_alt` varchar(500) NOT NULL,
  `singer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `genre`, `release_date`, `description`, `image_file`, `image_alt`, `singer_id`) VALUES
(1, '1989', 'Synth-pop, Electropop, Pop', '2014-10-27', 'A synth-pop reinvention that won Album of the Year at the Grammys.', '1989.jpg', 'Taylor Swift 1989 album cover', 1),
(2, 'Future Nostalgia', 'Dance-pop, Disco, Electro-pop, Funk-pop', '2020-03-27', 'A disco-pop dance album full of retro vibes with a modern twist.', 'future_nostalgia.jpg', 'Dua Lipa Future Nostalgia album cover', 2),
(3, 'Thriller', 'Pop, Rock, Funk, R&B', '1982-11-30', 'The best-selling album of all time, blending pop, rock, and funk.', 'thriller.jpg', 'Michael Jackson Thriller album cover', 3),
(4, '25', 'Soul, Pop, Pop Ballad', '2015-11-20', 'Soulful pop ballads showcasing Adele’s powerful vocals.', '25.jpg', 'Adele 25 album cover', 4),
(5, 'Teenage Dream', 'Pop, Dance-pop, Electropop', '2010-08-24', 'Pop perfection with multiple No. 1 singles.', 'teenage_dream.jpg', 'Katy Perry Teenage Dream album cover', 5),
(6, 'Confessions on a Dance Floor', 'Dance-pop, Eurodisco, Electropop, House', '2005-11-15', 'A return to dance-pop with continuous club tracks.', 'confessions.jpg', 'Madonna Confessions on a Dance Floor album cover', 6),
(7, 'Chromatica', 'Dance-pop, House, Electropop', '2020-05-29', 'A futuristic pop-dance journey with emotional depth.', 'chromatica.jpg', 'Lady Gaga Chromatica album cover', 7),
(8, 'Fine Line', 'Pop Rock, Soft Rock, Psychedelic Pop', '2019-12-13', 'Genre-blending pop-rock with heartfelt lyrics and melodies.', 'fine_line.jpg', 'Harry Styles Fine Line album cover', 8),
(9, 'Emotion', 'Synth-pop, Indie Pop, 80s Pop Revival', '2015-06-24', 'A cult favorite with 80s-inspired synth-pop gems.', 'emotion.jpg', 'Carly Rae Jepsen Emotion album cover', 9),
(10, 'SOUR', 'Pop Rock, Pop Punk, Indie Pop', '2021-05-21', 'A breakout debut with emotional teen anthems mixing pop and rock.', 'sour.jpg', 'Olivia Rodrigo SOUR album cover', 10);

-- --------------------------------------------------------

--
-- Table structure for table `singers`
--

CREATE TABLE `singers` (
  `id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `age` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `singers`
--

INSERT INTO `singers` (`id`, `name`, `age`) VALUES
(1, 'Taylor Swift', 34),
(2, 'Dua Lipa', 29),
(3, 'Michael Jackson', 50),
(4, 'Adele', 36),
(5, 'Katy Perry', 40),
(6, 'Madonna', 65),
(7, 'Lady Gaga', 38),
(8, 'Harry Styles', 30),
(9, 'Carly Rae Jepsen', 39),
(10, 'Olivia Rodrigo', 22);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `singers`
--
ALTER TABLE `singers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `singers`
--
ALTER TABLE `singers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 07:35 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instagram`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `profile_image` text NOT NULL,
  `comment_text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `username`, `profile_image`, `comment_text`, `date`) VALUES
(1, 8, 7, 'puja01', 'puja01.jpg', 'amazing pic', '2023-03-29 07:59:00'),
(3, 7, 7, 'puja01', 'puja01.jpg', 'awesome pics', '2023-03-29 08:34:00'),
(7, 1, 14, 'dino123', 'dino123.jpg', 'cool pictures', '2023-03-30 06:49:00'),
(9, 9, 14, 'dino123', 'dino123.jpg', 'awesome picture', '2023-03-30 06:53:00'),
(10, 13, 4, 'tammy01', 'tammy01.jpg', 'cute cute pic', '2023-03-30 07:03:00'),
(11, 15, 15, 'johndoe01', 'johndoe01.jpg', 'hello', '2023-03-30 07:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `other_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `user_id`, `other_user_id`) VALUES
(2, 2, 5),
(6, 2, 7),
(9, 2, 6),
(16, 14, 6),
(18, 4, 5),
(19, 4, 7),
(20, 4, 13),
(22, 15, 2),
(24, 13, 15),
(25, 13, 4),
(26, 15, 13);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(5, 7, 6),
(6, 7, 7),
(7, 7, 9),
(8, 2, 9),
(9, 14, 9),
(10, 14, 7),
(12, 4, 13),
(13, 4, 11),
(14, 15, 14),
(15, 15, 15),
(16, 15, 9);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` text NOT NULL,
  `caption` varchar(250) NOT NULL,
  `hashtags` varchar(250) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(50) NOT NULL,
  `profile_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `likes`, `image`, `caption`, `hashtags`, `date`, `username`, `profile_image`) VALUES
(1, 2, 0, '1679988146.jpg', 'Awesome Pics', '#wonderfulpics', '2023-03-28 09:22:26', 'dip0101', 'dip0101.jpg'),
(2, 2, 0, '1679988233.jpg', 'awesome pics', '#awesome', '2023-03-28 09:23:53', 'dip0101', 'dip0101.jpg'),
(3, 2, 0, '1679990192.jpg', 'Bridges', '#bridge', '2023-03-28 09:56:32', 'dip0101', 'dip0101.jpg'),
(4, 4, 0, '1680015440.jpg', 'beautiful nature', '#nature', '2023-03-28 16:57:20', 'tammy01', 'tammy01.jpg'),
(5, 5, 0, '1680015602.jpg', 'Happy days', '#happy', '2023-03-28 17:00:02', 'ellijah01', 'ellijah01.jpg'),
(6, 5, 1, '1680015635.jpg', 'hello', '#hieveryone', '2023-03-28 17:00:35', 'ellijah01', 'ellijah01.jpg'),
(7, 6, 2, '1680015726.jpg', 'Hi fam', '#fam', '2023-03-28 17:02:06', 'raj01', 'raj01.jpg'),
(9, 7, 4, '1680093567.jpg', 'beautiful nature', '#valley', '2023-03-29 14:39:27', 'puja01', 'puja01.jpg'),
(11, 13, 1, '1680152285.jpg', 'hey', '#mirror #selfie', '2023-03-30 06:58:05', 'dipankar111', 'dipankar111.jpg'),
(12, 13, 0, '1680152319.jpg', 'saddy', '#sad', '2023-03-30 06:58:39', 'dipankar111', 'dipankar111.jpg'),
(13, 13, 1, '1680152357.jpg', 'cute pic', '#cute', '2023-03-30 06:59:17', 'dipankar111', 'dipankar111.jpg'),
(14, 4, 1, '1680152590.jpg', '🥰', '#awesome', '2023-03-30 07:03:10', 'tammy01', 'tammy01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `followers` int(11) NOT NULL,
  `following` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `bio` text DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `image`, `followers`, `following`, `post`, `bio`) VALUES
(2, 'dip0101', 'e10adc3949ba59abbe56e057f20f883e', 'qwer@gmail.com', 'dip0101.jpg', 1, 3, 3, 'hi everyone'),
(4, 'tammy01', 'e10adc3949ba59abbe56e057f20f883e', 'tammysins@gmail.com', 'tammy01.jpg', 1, 3, 2, 'this is my new profile\r\n'),
(5, 'ellijah01', 'e10adc3949ba59abbe56e057f20f883e', 'carpenter@gmail.com', 'ellijah01.jpg', 2, 0, 2, 'Hi I am a professional carpenter\r\n'),
(6, 'raj01', 'e10adc3949ba59abbe56e057f20f883e', 'raj@gmail.com', 'raj01.jpg', 2, 0, 1, 'Hi I am Raj\r\n'),
(7, 'puja01', 'e10adc3949ba59abbe56e057f20f883e', 'puja01@gmail.com', 'puja01.jpg', 2, 0, 2, 'this is puja from india\r\n'),
(13, 'dipankar111', 'e10adc3949ba59abbe56e057f20f883e', 'dipankar19octr@gmail.com', 'dipankar111.jpg', 2, 2, 3, 'I am a Youtuber'),
(14, 'dino123', 'e10adc3949ba59abbe56e057f20f883e', 'dino@gmail.com', 'dino123.jpg', 0, 1, 1, 'Hi am dino'),
(15, 'johndoe01', 'e10adc3949ba59abbe56e057f20f883e', 'johndoe@gmail.com', 'johndoe01.jpg', 1, 2, 1, 'Hi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

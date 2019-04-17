-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2017 at 05:40 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shareit`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `is_slide` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `name`, `picture`, `link`, `is_slide`) VALUES
(1, '	Node JS', '1-28105325649843.jpeg', 'http://vinaenter.edu.vn/', 0),
(2, 'Android', '2-28110954510052.jpeg', 'http://vinaenter.edu.vn/', 0),
(3, 'Clean Code', '3-28117662309019.jpeg', 'http://vinaenter.edu.vn/', 1),
(4, 'Dirty Cow', '4-28124993804948.jpeg', 'http://vinaenter.edu.vn/', 0),
(5, 'Sublime Text', '5-12901333890592.jpeg', 'http://vinaenter.edu.vn/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cat_list`
--

CREATE TABLE `cat_list` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_list`
--

INSERT INTO `cat_list` (`id`, `name`, `parent_id`) VALUES
(1, 'Đào tạo', 0),
(2, 'Công nghệ', 0),
(3, 'Lập trình', 0),
(4, 'Java', 3),
(5, 'Android', 3),
(6, 'Ios', 3),
(7, 'Web-Design', 3),
(8, 'Tài liệu', 0),
(9, 'Sự kiện', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name_cmt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_cmt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `web_cmt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_id` int(255) NOT NULL,
  `news_id` int(255) NOT NULL,
  `active` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `name_cmt`, `email_cmt`, `web_cmt`, `date_create`, `parent_id`, `news_id`, `active`) VALUES
(15, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 0, 4, 1),
(16, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 15, 4, 1),
(17, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 15, 4, 1),
(18, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 15, 4, 1),
(19, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 0, 4, 1),
(20, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 0, 4, 1),
(21, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 0, 4, 1),
(22, 'ewafsdfasd', 'dsafsad', 'ádfsdaf', 'ádfdsafasd', '2017-05-15 13:07:54', 0, 4, 1),
(23, '123', '123', '123', '123', '2017-05-15 13:58:20', 21, 4, 0),
(25, '123', '123', '123', '123', '2017-05-15 14:15:58', 20, 4, 0),
(26, '123', '123', '123', '123', '2017-05-15 14:15:59', 20, 4, 0),
(42, '123', '123', '123', '123', '2017-05-15 14:16:27', 20, 4, 0),
(43, '123', '123', '123', '123', '2017-05-15 14:16:28', 20, 4, 0),
(44, '123', '123', '123', '123', '2017-05-15 14:16:28', 20, 4, 0),
(45, '1', '1', '1', '1', '2017-05-15 15:03:03', 20, 4, 0),
(46, '1', '1', '1', '1', '2017-05-15 15:06:39', 20, 4, 0),
(47, '4', '2', '3', '3', '2017-05-15 15:06:55', 20, 4, 0),
(48, 'fdsdfgfdsdfg', 'ádfgfdsasdf', 'gfdsasdfghgfds', 'dfggfdsdfg', '2017-05-15 15:08:20', 21, 4, 0),
(49, 'ewqrweqrew', 'ưeqrqwe', 'qưerqwe', 'rqwerqwer', '2017-05-15 15:10:00', 22, 4, 0),
(50, '1111111111111111111', '11111111', '11111111111111111111', '11111111111111111', '2017-05-15 15:10:51', 21, 4, 0),
(51, '333333333333333333', '333333333', '3333333333', '33333333333333333333', '2017-05-15 15:12:16', 0, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(255) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(255) NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(255) NOT NULL,
  `active` int(255) DEFAULT '0',
  `is_slide` int(255) NOT NULL DEFAULT '0',
  `view` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name`, `preview`, `detail`, `date_create`, `created_by`, `picture`, `cat_id`, `active`, `is_slide`, `view`) VALUES
(1, 'Đà Nẵng cùng Vietnam Web Summit', 'Đà Nẵng cùng Vietnam Web Summit', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. hôm trước, sẵn sàng đâm va vào tàu Việt Nam.', '2017-05-13 14:39:18', 1, '', 1, 0, 0, 0),
(2, 'Cộng đồng công nghệ Hà Nội tưng bừng hào hứng', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-13 21:14:09', 1, '', 1, 0, 0, 1),
(3, 'Responsive Images trên Web', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-14 22:08:35', 2, '3-13541593204457.jpeg', 2, 1, 1, 3),
(4, 'Lập trình PHP từ A-Z', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-14 21:57:15', 4, '5-13083525351064.jpeg', 3, 1, 1, 23),
(5, 'Lập trình JAVA từ A-Z', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Java cũng là một trong nhưng ngôn ngữ lập trình sử dụng phổ biến nhất thế giới, dùng để xây dựng các phần mềm, ứng dụng khác nhau, viết các ứng dụng web, xây dựng các ứng dụng trong doanh nghiệp, siêu thị, bệnh viện, ngân hàng…', '2017-05-14 22:05:31', 3, '2-13075796963873.jpeg', 3, 1, 1, 3),
(7, '1', '1', '1', '2017-05-14 12:04:31', 1, '5-66463369123497.jpeg', 1, 0, 0, 1),
(8, '2', '2', '2', '2017-05-14 12:04:00', 1, '3-66483025316348.jpeg', 7, 0, 0, 0),
(9, '3', '3', '3', '2017-05-14 20:25:24', 1, '4-11376886353688.jpeg', 1, 0, 0, 0),
(10, '4', '4', '4', '2017-05-14 20:25:53', 1, '2-11406203875089.jpeg', 1, 0, 0, 0),
(11, '4', '4', '4', '2017-05-14 20:25:53', 1, '2-11406203875089.jpeg', 1, 0, 0, 0),
(12, '3', '3', '3', '2017-05-14 20:25:24', 1, '4-11376886353688.jpeg', 1, 0, 0, 0),
(13, 'Lập trình JAVA từ A-Z', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Java cũng là một trong nhưng ngôn ngữ lập trình sử dụng phổ biến nhất thế giới, dùng để xây dựng các phần mềm, ứng dụng khác nhau, viết các ứng dụng web, xây dựng các ứng dụng trong doanh nghiệp, siêu thị, bệnh viện, ngân hàng…', '2017-05-14 12:04:55', 3, '2-13075796963873.jpeg', 3, 1, 1, 0),
(14, '1', '1', '1', '2017-05-14 12:04:31', 1, '5-66463369123497.jpeg', 1, 0, 0, 0),
(15, 'Lập trình PHP từ A-Z', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-14 12:04:22', 4, '5-13083525351064.jpeg', 3, 1, 1, 0),
(16, '2', '2', '2', '2017-05-14 12:04:00', 1, '3-66483025316348.jpeg', 7, 0, 0, 0),
(17, 'Responsive Images trên Web', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-13 21:21:38', 2, '3-13541593204457.jpeg', 2, 1, 1, 0),
(18, 'Cộng đồng công nghệ Hà Nội tưng bừng hào hứng', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. ', '2017-05-13 21:14:09', 1, '1-18021005035249.jpeg', 1, 0, 0, 0),
(19, 'Đà Nẵng cùng Vietnam Web Summit', 'Đà Nẵng cùng Vietnam Web Summit', 'Tôi và thằng bạn thân vẫn chia sẻ, trò chuyện trước những tin vịt đã truyền qua lớp khác. hôm trước, sẵn sàng đâm va vào tàu Việt Nam.', '2017-05-13 14:39:18', 1, '1-18010814929213.jpeg', 1, 1, 1, 1),
(21, '241231432', '2342134231', '421341234213', '2017-05-15 00:29:32', 1, '1-26025155018676.jpeg', 10, 0, 0, 0),
(22, 'sfasdafasf', 'ádfasdfsdaf', 'sdafdsafsafsda', '2017-05-15 00:30:34', 1, '1-26087001161609.jpeg', 10, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `level`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'VinaEnter Edu', 'knightnit96@gmail.com', 'admin'),
(2, 'vinaenter', '202cc6ac1aaf316c3b7419f6345e62f4', 'VinaEnter Tech', 'knightnit96@gmail.com', 'mod'),
(3, 'knight', '202cc6ac1aaf316c3b7419f6345e62f4', 'VinaEnter Mod', 'knightnit96@gmail.com', 'editor'),
(4, 'knightnit96', '202cc6ac1aaf316c3b7419f6345e62f4', 'Thuận', '123@gmail.com', 'editor'),
(9, '1', '665f644e43731ff9db3d341da5c827e1', '1', '1', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_list`
--
ALTER TABLE `cat_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cat_list`
--
ALTER TABLE `cat_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

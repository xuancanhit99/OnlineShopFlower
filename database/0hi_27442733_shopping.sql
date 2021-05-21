-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 21, 2021 lúc 06:13 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `0hi_27442733_shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '123456789', '2021-02-24 19:22:15', '03-03-2021 12:39:51 AM'),
(2, 'users', '123', '2021-04-06 20:13:29', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Букеты', 'mo ta', '2021-03-02 17:18:06', '25-03-2021 07:17:06 PM'),
(8, 'Цветы', 'MO TA', '2021-03-02 17:36:12', '25-03-2021 07:21:41 PM'),
(9, 'Подарочные наборы', 'MO TA', '2021-03-02 18:41:49', '25-03-2021 07:21:56 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(9, 7, '22', 1, '2021-04-06 20:30:05', 'COD', 'in Process'),
(10, 7, '24', 1, '2021-04-06 20:48:58', 'COD', NULL),
(11, 4, '23', 1, '2021-04-07 20:37:38', 'COD', NULL),
(12, 4, '22', 1, '2021-04-07 21:45:12', 'COD', NULL),
(13, 4, '23', 1, '2021-04-07 21:46:54', 'COD', NULL),
(14, 4, '23', 1, '2021-04-07 21:48:57', 'COD', NULL),
(15, 10, '22', 1, '2021-04-07 22:42:55', 'COD', NULL),
(16, 10, '22', 1, '2021-04-07 22:46:13', 'COD', NULL),
(17, 10, '25', 1, '2021-04-07 22:49:34', 'Debit / Credit card', NULL),
(18, 14, '25', 4, '2021-04-09 10:32:51', 'COD', NULL),
(19, 4, '24', 2, '2021-04-09 12:52:59', 'Debit / Credit card', NULL),
(20, 1, '23', 1, '2021-04-14 16:21:30', NULL, NULL),
(21, 1, '25', 1, '2021-04-14 16:21:30', NULL, NULL),
(23, 4, '22', 1, '2021-04-20 12:38:54', NULL, NULL),
(24, 4, '23', 1, '2021-04-20 12:38:54', NULL, NULL),
(25, 4, '24', 1, '2021-04-23 09:59:04', NULL, NULL),
(26, 4, '24', 0, '2021-04-23 10:04:53', NULL, NULL),
(27, 4, '22', 1, '2021-05-17 16:40:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(6, 9, 'in Process', 'don hang cua hoang anh', '2021-04-06 20:30:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 7, 14, 'Романтичный ', 'XYZ', 1899, 1999, 'Этот букет составлен из классических красных роз.', 'bo hoa 11.jpg', 'bo hoa 11.jpg', 'bo hoa 11.jpg', 99, 'In Stock', '2021-03-02 17:20:26', NULL),
(23, 8, 15, 'Одностебельная роза ', 'ABC', 150, 200, 'Покажите свою любовь красивой одностебельной красной розой.', 'hoa 1.jpg', 'hoa 1.jpg', 'hoa 1.jpg', 99, 'In Stock', '2021-03-02 18:44:44', NULL),
(24, 9, 16, 'КОШКА ЛИ-ЛИ С СОВОЙ ', 'EDF', 1099, 1299, 'В лапах у Лили забавная игрушка - розовая сова из флиса. Также на кошачьем ушке нежно-розовый бантик.', 'qua 1.jpg', 'qua 1.jpg', 'qua 1.jpg', 99, 'In Stock', '2021-03-02 18:47:37', NULL),
(25, 7, 17, 'Лилии', 'ABC', 2099, 2199, 'Утонченные цветы с прекрасным ароматом. Букеты из них потрясающе красивы и всегда производят впечатление.', 'hoa_ly.jpg', 'hoa_ly.jpg', 'hoa_ly.jpg', 99, 'In Stock', '2021-03-03 18:52:09', NULL),
(26, 7, 18, 'Букет \"Алиса\" ', 'XYZ', 1499, 1599, 'Это королева цветов. Она отличается исключительной красотой. Более популярного цветка во всем мире вы не найдете. Букет роз можно дарить и на официальное торжество, и в качестве комплимента любимой девушке.', 'hoahong.jpg', 'hoahong.jpg', 'hoahong.jpg', 99, 'In Stock', '2021-03-03 18:56:19', NULL),
(27, 7, 17, 'Альстромерия', 'EDF', 2199, 2299, 'Альстромерия – нежный цветок с роскошной цветовой гаммой. Отличается исключительной стойкостью – букет из альстромерий может сохранять свежий вид почти целый месяц. Букет из альстромерий хорошо дарить тем, у кого высокая чувствительность к запахам, поскольку они не имеют выраженного аромата.', 'bohoa3.jpg', 'bohoa3.jpg', 'bohoa3.jpg', 99, 'In Stock', '2021-03-03 18:59:07', NULL),
(28, 8, 19, 'Тюльпаны ', 'XYZ', 299, 399, 'Тюльпаны – очаровывают своей нежностью и элегантностью. Букет тюльпанов – идеальный весенний вариант для ваших любимых.', 'tulip.jpg', 'tulip.jpg', 'tulip.jpg', 99, 'In Stock', '2021-03-03 19:01:14', NULL),
(29, 8, 20, 'Хризантема ', 'EDF', 399, 599, 'Хризантема – выразительный цветок. Имеет довольно широкую цветовую палитру. Их можно дарить по поводу и без повода.', 'hoacuc.jpg', 'hoacuc.jpg', 'hoacuc.jpg', 99, 'In Stock', '2021-03-03 19:03:01', NULL),
(30, 9, 21, 'Сладкая мечта', 'HANAAA', 2899, 2999, 'Подарочный набор \"Сладкая мечта\" Эта корзина, наполнена всем необходимым для создания душевного комфорта и хорошего настроения! В состав входит букет роз, чай и различные сладости.', 'byket1.jpg', 'byket1.jpg', 'byket1.jpg', 99, 'In Stock', '2021-03-03 19:06:04', NULL),
(31, 9, 21, 'Богатство чувств', 'HANAAA', 2299, 2499, 'Набор \"Богатство чувств\". Яркий и запоминающийся подарок по поводу и без. В состав входит: коробочка в форме сердца с прекрасными цветами и вкуснейшими пирожными макарунами. Ваша любимая будет в восторге!', 'byket2.jpg', 'byket2.jpg', 'byket2.jpg', 99, 'In Stock', '2021-03-03 19:07:22', NULL),
(33, 9, 21, 'Сочное лето', 'HANAAA', 3199, 3299, 'Подарочный набор \"Сочное лето\" Потрясающий подарок для любителей фруктов и сладостей. В состав входит букет роз, фрукты и шоколад.', 'byket4.jpg', 'byket4.jpg', 'byket4.jpg', 99, 'In Stock', '2021-03-03 19:10:06', NULL),
(34, 9, 21, 'Нежность', 'HANAAA', 3199, 3299, 'Подарочный набор \"Нежность\". Порадует Вашу любимую нежным сочетанием приятных цветов самого набора. В комплект входит букет нежнейших роз, вкуснейшие конфеты и милая мягкая игрушка.', 'byket3.jpg', 'byket3.jpg', 'byket3.jpg', 99, 'In Stock', '2021-03-25 11:32:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(14, 7, 'Свадьба ', '2021-03-02 17:18:19', '25-03-2021 07:25:29 PM'),
(15, 8, 'Одиночный цветок ', '2021-03-02 18:44:12', '25-03-2021 07:25:54 PM'),
(16, 9, 'Мягкие игрушки ', '2021-03-02 18:46:24', '25-03-2021 07:26:19 PM'),
(17, 7, 'Нежный ', '2021-03-03 18:49:50', '25-03-2021 07:26:37 PM'),
(18, 7, 'Любовь', '2021-03-03 18:53:29', '25-03-2021 08:14:38 PM'),
(19, 8, 'Тюльпаны ', '2021-03-03 18:59:38', '25-03-2021 07:28:49 PM'),
(20, 8, 'Хризантема', '2021-03-03 19:01:56', '25-03-2021 07:29:47 PM'),
(21, 9, 'Милая', '2021-03-03 19:04:16', '25-03-2021 07:30:06 PM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 19:26:06', '03-03-2021 01:21:27 AM', 1),
(25, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 19:52:18', NULL, 0),
(26, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 19:52:24', NULL, 1),
(27, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 08:33:14', NULL, 1),
(28, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 09:24:38', NULL, 1),
(29, 'gubgbg@bggjb.com', 0x3a3a3100000000000000000000000000, '2021-03-19 11:00:23', '19-03-2021 05:03:40 PM', 1),
(30, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:28:08', NULL, 0),
(31, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:29:10', NULL, 0),
(32, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:30:59', NULL, 0),
(33, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:31:19', NULL, 0),
(34, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:32:04', NULL, 1),
(35, 'a@me.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:38:08', '25-03-2021 05:08:42 PM', 1),
(36, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 11:38:55', '25-03-2021 05:09:29 PM', 1),
(37, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-30 20:46:24', NULL, 1),
(38, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 09:26:31', '02-04-2021 02:57:32 PM', 1),
(39, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 09:28:01', '02-04-2021 03:01:36 PM', 1),
(40, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 09:33:10', '02-04-2021 03:03:51 PM', 1),
(41, 'anh99hoangtran@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 09:37:58', NULL, 0),
(42, 'anh99hoangtran@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 11:08:34', NULL, 0),
(43, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 11:08:51', '02-04-2021 04:38:58 PM', 1),
(44, 'anh99hoangtran@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 11:30:27', NULL, 0),
(45, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 12:16:44', '02-04-2021 05:47:42 PM', 1),
(46, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 16:40:24', NULL, 1),
(47, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 20:01:53', '07-04-2021 01:38:58 AM', 1),
(48, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 20:29:02', NULL, 0),
(49, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 20:30:01', '07-04-2021 02:04:45 AM', 1),
(50, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 20:48:45', '07-04-2021 02:46:42 AM', 1),
(51, 'xuancanhit99@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 21:20:16', '07-04-2021 03:44:16 AM', 1),
(52, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-07 20:16:58', NULL, 1),
(53, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-07 20:19:41', NULL, 1),
(54, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-07 20:47:55', '08-04-2021 02:50:35 AM', 1),
(55, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-07 21:28:50', '08-04-2021 03:01:30 AM', 1),
(56, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-07 21:44:45', '08-04-2021 03:20:26 AM', 1),
(57, '2@gamil.com', 0x3a3a3100000000000000000000000000, '2021-04-07 22:40:36', NULL, 1),
(58, 'anh@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-09 10:30:44', '09-04-2021 04:00:57 PM', 1),
(59, 'anh@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-09 10:31:17', '09-04-2021 06:11:08 PM', 1),
(60, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-09 12:52:48', '14-04-2021 10:06:01 PM', 1),
(61, 'hoanganhmirea@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 16:36:42', '14-04-2021 10:12:38 PM', 1),
(62, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 16:42:51', NULL, 0),
(63, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 16:42:59', NULL, 1),
(64, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 16:44:03', NULL, 0),
(65, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 16:44:11', '14-04-2021 11:48:28 PM', 1),
(66, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-14 18:18:35', NULL, 1),
(67, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-15 09:13:33', NULL, 1),
(68, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-17 21:09:57', NULL, 1),
(69, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-17 23:22:29', NULL, 1),
(70, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-18 08:05:56', NULL, 0),
(71, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-18 08:06:02', NULL, 1),
(72, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-20 12:09:05', '20-04-2021 05:42:43 PM', 1),
(73, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-20 12:12:50', NULL, 1),
(74, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-20 14:35:32', NULL, 1),
(75, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-23 09:58:43', NULL, 1),
(76, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-29 20:17:35', NULL, 1),
(77, 'anna@gmail.com', 0x33372e3233302e3135372e3332000000, '2021-04-30 07:37:25', NULL, 1),
(78, 'hoanganhmirea@gmail.com', 0x33372e3233302e3135372e3332000000, '2021-04-30 10:40:05', '30-04-2021 04:43:26 PM', 1),
(79, 'anna@gmail.com', 0x33372e3233302e3135372e3332000000, '2021-04-30 11:21:42', NULL, 0),
(80, 'anna@gmail.com', 0x33372e3233302e3135372e3332000000, '2021-04-30 11:21:49', NULL, 1),
(81, 'anna@gmail.com', 0x3231332e38372e3136312e3135330000, '2021-05-17 16:38:12', NULL, 0),
(82, 'anna@gmail.com', 0x3231332e38372e3136312e3135330000, '2021-05-17 16:38:21', NULL, 1),
(83, 'a@me.com', 0x3138352e3132322e32382e3230320000, '2021-05-17 18:36:09', NULL, 1),
(84, 'anna@gmail.com', 0x3231332e38372e3136312e3135330000, '2021-05-17 18:50:53', NULL, 1),
(85, 'xuancanhit99@gmail.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:04:39', '18-05-2021 12:38:41 AM', 1),
(86, 'xuancanhit99@gmail.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:08:58', '18-05-2021 12:41:12 AM', 1),
(87, 'xuancanhit99@gmail.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:21:47', '18-05-2021 12:54:01 AM', 1),
(88, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:24:37', NULL, 0),
(89, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:25:13', NULL, 0),
(90, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:25:31', '18-05-2021 01:02:31 AM', 1),
(91, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:33:04', '18-05-2021 01:05:42 AM', 1),
(92, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:42:29', '18-05-2021 01:13:18 AM', 1),
(93, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:43:31', '18-05-2021 01:18:02 AM', 1),
(94, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 19:55:54', '18-05-2021 01:39:50 AM', 1),
(95, '1@a.com', 0x3a3a3100000000000000000000000000, '2021-05-17 20:17:20', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'Anna', 'anna@gmail.com', 1234578, '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 19:25:48', NULL),
(5, 'v?vyfrt', 'gubgbg@bggjb.com', 0, 'e807f1fcf82d132f9bb018ca6738a19f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 10:59:26', NULL),
(6, 'A', 'a@me.com', 1234578, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 11:37:54', NULL),
(7, 'Hoang Anh', 'hoanganhmirea@gmail.com', 8985896655, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-02 09:26:00', NULL),
(8, 'Xuan Canh', 'xuancanhit99@gmail.com', 12321412312, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 21:20:06', NULL),
(9, 'Cuong', '1@a.com', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 21:52:58', NULL),
(10, 'Kami', '2@gamil.com', 43535565355, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 22:34:54', NULL),
(11, '1', '2@gamil.com', 43535565355, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 22:36:15', NULL),
(12, '1', '1@dinhcuong.me', 54521673617, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 22:36:55', NULL),
(13, '3', '1@g.com', 123456789, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 22:37:21', NULL),
(14, 'Hoang Anh', 'anh@gmail.com', 89858966552, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-09 10:30:02', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(65, 9, 28, '2021-05-21 12:37:33'),
(66, 9, 28, '2021-05-21 12:38:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

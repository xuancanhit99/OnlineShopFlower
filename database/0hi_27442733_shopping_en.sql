-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 21, 2021 lúc 06:14 PM
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
-- Cơ sở dữ liệu: `0hi_27442733_shopping_en`
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
(1, 'admin', '123456789', '2021-02-24 19:22:15', '03-03-2021 12:39:51 AM');

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
(7, 'Bouquets ', 'mo ta', '2021-03-02 20:18:06', '25-03-2021 07:18:24 PM'),
(8, 'Flowers ', 'MO TA', '2021-03-02 20:36:12', '25-03-2021 07:18:39 PM'),
(9, 'Gift Baskets ', 'MO TA', '2021-03-02 21:41:49', '25-03-2021 07:18:56 PM');

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
(7, 4, '23', 1, '2021-04-07 20:28:14', 'Internet Banking', NULL);

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
(22, 7, 14, 'Romantic', 'XYZ', 1899, 1999, '<span id=\"docs-internal-guid-31d511a9-7fff-ee61-cb18-fb12e435b2a4\"><span style=\"font-size: 14pt; font-family: &quot;Times New Roman&quot;; color: rgb(33, 37, 41); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">This bouquet is composed of classic red roses.</span></span><br>', 'bo hoa 11.jpg', 'bo hoa 11.jpg', 'bo hoa 11.jpg', 99, 'In Stock', '2021-03-02 20:20:26', NULL),
(23, 8, 15, 'Single Stem Rose', 'ABC', 150, 200, '<span id=\"docs-internal-guid-c2f099a9-7fff-4c84-ce87-ab8e7f893fc8\"><span style=\"font-size: 14pt; font-family: &quot;Times New Roman&quot;; color: rgb(33, 37, 41); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Show your love with a beautiful single stem red rose.</span></span><br>', 'hoa 1.jpg', 'hoa 1.jpg', 'hoa 1.jpg', 99, 'In Stock', '2021-03-02 21:44:44', NULL),
(24, 9, 16, 'CAT LI-LI WITH OWL', 'EDF', 1099, 1299, '<span id=\"docs-internal-guid-dd2baa65-7fff-a052-8add-258e79b753f2\"><span style=\"font-size: 14pt; font-family: &quot;Times New Roman&quot;; color: rgb(33, 37, 41); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Lili has a funny toy in her paws - a pink owl made of fleece. Also on the kitty is a soft pink bow on the ear.</span></span><br>', 'qua 1.jpg', 'qua 1.jpg', 'qua 1.jpg', 99, 'In Stock', '2021-03-02 21:47:37', NULL),
(25, 7, 17, 'Lilies ', 'ABC', 2099, 2199, 'Lilies are exquisite flowers with a wonderful scent. The bouquets of them are stunningly beautiful and always make an impression.<br>', 'hoa_ly.jpg', 'hoa_ly.jpg', 'hoa_ly.jpg', 99, 'In Stock', '2021-03-03 21:52:09', NULL),
(26, 7, 18, 'Bouquet \"Alice\" ', 'XYZ', 1499, 1599, 'Rose is the queen of flowers. It is of exceptional beauty. You will not find a more popular flower in the whole world. A bouquet of roses can be given both for an official celebration, and as a compliment to your girlfriend.<br>', 'hoahong.jpg', 'hoahong.jpg', 'hoahong.jpg', 99, 'In Stock', '2021-03-03 21:56:19', NULL),
(27, 7, 17, 'Alstroemeria', 'EDF', 2199, 2299, 'Alstroemeria is a delicate flower with a luxurious color scheme. Differs in exceptional durability - a bouquet of alstroemeria can keep a fresh look for almost a month. It is good to give a bouquet of alstroemeria to those who have a high sensitivity to smells, since they do not have a pronounced aroma.<br>', 'bohoa3.jpg', 'bohoa3.jpg', 'bohoa3.jpg', 99, 'In Stock', '2021-03-03 21:59:07', NULL),
(28, 8, 19, 'Tulips Single', 'XYZ', 299, 399, 'Tulips - fascinate with their tenderness and elegance. A bouquet of tulips is the perfect spring option for your loved ones.<br>', 'tulip.jpg', 'tulip.jpg', 'tulip.jpg', 99, 'In Stock', '2021-03-03 22:01:14', NULL),
(29, 8, 20, 'Chrysanthemum Single', 'EDF', 399, 599, 'Chrysanthemum is an expressive flower. Has a fairly wide color palette. They can be given with or without reason.<br>', 'hoacuc.jpg', 'hoacuc.jpg', 'hoacuc.jpg', 99, 'In Stock', '2021-03-03 22:03:01', NULL),
(30, 9, 21, 'Sweet Dream', 'HANAAA', 2899, 2999, 'Gift set \"Sweet Dream\" This basket is filled with everything you need to create peace of mind and good mood! The composition includes a bouquet of roses, tea and various sweets.<br>', 'byket1.jpg', 'byket1.jpg', 'byket1.jpg', 99, 'In Stock', '2021-03-03 22:06:04', NULL),
(31, 9, 21, 'Wealth of Feelings', 'HANAAA', 2299, 2499, 'Wealth of Feelings set. A bright and memorable gift with or without reason. Contains: heart-shaped box with lovely flowers and delicious macaroon cakes. Your beloved will be delighted!<br>', 'byket2.jpg', 'byket2.jpg', 'byket2.jpg', 99, 'In Stock', '2021-03-03 22:07:22', NULL),
(32, 9, 21, 'Tenderness', 'HANAAA', 2499, 2599, 'Gift set \"Tenderness\". Will delight your beloved with a delicate combination of pleasant colors of the set itself. The set includes a bouquet of the most delicate roses, delicious sweets and a cute soft toy.<br>', 'byket3.jpg', 'byket3.jpg', 'byket3.jpg', 99, 'In Stock', '2021-03-03 22:08:46', NULL),
(33, 9, 21, 'Juicy Summer', 'HANAAA', 3199, 3299, 'Gift set \"Juicy Summer\" A great gift for lovers of fruits and sweets. The composition includes a bouquet of roses, fruits and chocolate.<br>', 'byket4.jpg', 'byket4.jpg', 'byket4.jpg', 99, 'In Stock', '2021-03-03 22:10:06', NULL);

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
(14, 7, 'Wedding', '2021-03-02 20:18:19', '03-03-2021 01:49:18 AM'),
(15, 8, 'Single flower ', '2021-03-02 21:44:12', NULL),
(16, 9, 'Stuffed Toys', '2021-03-02 21:46:24', NULL),
(17, 7, 'Delicate ', '2021-03-03 21:49:50', '04-03-2021 03:20:14 AM'),
(18, 7, 'Loves', '2021-03-03 21:53:29', NULL),
(19, 8, 'Tulips', '2021-03-03 21:59:38', NULL),
(20, 8, 'Chrysanthemum', '2021-03-03 22:01:56', NULL),
(21, 9, 'Sweet', '2021-03-03 22:04:16', NULL);

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
(37, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-30 20:46:24', '02-04-2021 04:54:12 PM', 1),
(38, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 11:24:20', '08-04-2021 01:47:28 AM', 1);

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
(6, 'A', 'a@me.com', 1234578, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 11:37:54', NULL);

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
(3, 5, 22, '2021-03-19 11:33:24'),
(4, 9, 23, '2021-05-17 19:56:00'),
(5, 9, 22, '2021-05-17 19:56:04'),
(6, 9, 23, '2021-05-21 00:12:56'),
(7, 9, 28, '2021-05-21 00:13:00'),
(8, 9, 23, '2021-05-21 00:13:16'),
(9, 9, 25, '2021-05-21 00:13:25'),
(10, 9, 22, '2021-05-21 00:13:38'),
(11, 9, 22, '2021-05-21 00:13:43'),
(12, 9, 25, '2021-05-21 00:13:46'),
(13, 9, 26, '2021-05-21 00:13:49'),
(14, 9, 22, '2021-05-21 00:16:33'),
(15, 9, 22, '2021-05-21 00:16:41'),
(16, 9, 22, '2021-05-21 12:32:23'),
(17, 9, 22, '2021-05-21 12:32:36');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

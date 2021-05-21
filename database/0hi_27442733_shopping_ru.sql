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
-- Cơ sở dữ liệu: `0hi_27442733_shopping_ru`
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
(1, 'admin', '123456789', '2021-02-24 16:22:15', '03-03-2021 12:39:51 AM');

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
(10, 4, '25', 4, '2021-04-07 17:23:35', 'COD', NULL);

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
(21, 9, 'Наборы', '2021-03-03 19:04:16', '30-04-2021 03:46:55 PM');

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
(24, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 16:26:06', '03-03-2021 01:21:27 AM', 1),
(25, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 16:52:18', NULL, 0),
(26, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 16:52:24', NULL, 1),
(27, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 05:33:14', NULL, 1),
(28, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 06:24:38', NULL, 1),
(29, 'gubgbg@bggjb.com', 0x3a3a3100000000000000000000000000, '2021-03-19 08:00:23', '19-03-2021 05:03:40 PM', 1),
(30, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:28:08', NULL, 0),
(31, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:29:10', NULL, 0),
(32, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:30:59', NULL, 0),
(33, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:31:19', NULL, 0),
(34, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:32:04', NULL, 1),
(35, 'a@me.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:38:08', '25-03-2021 05:08:42 PM', 1),
(36, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 08:38:55', '25-03-2021 05:09:29 PM', 1),
(37, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 09:30:18', '25-03-2021 06:04:40 PM', 1),
(38, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-25 09:36:51', NULL, 1),
(39, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-26 07:47:21', '26-03-2021 05:29:51 PM', 1),
(40, '', 0x3a3a3100000000000000000000000000, '2021-03-26 09:01:58', NULL, 0),
(41, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-30 07:15:45', NULL, 0),
(42, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-30 07:15:55', '30-03-2021 03:49:07 PM', 1),
(43, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-30 07:19:26', NULL, 1),
(44, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 08:23:52', NULL, 1),
(45, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 08:29:43', '02-04-2021 04:59:54 PM', 1),
(46, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 08:32:56', '02-04-2021 05:46:08 PM', 1),
(47, 'anna@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-02 09:16:39', '02-04-2021 05:47:50 PM', 1);

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
(4, 'Anna', 'anna@gmail.com', 1234578, '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 16:25:48', NULL),
(5, 'v?vyfrt', 'gubgbg@bggjb.com', 0, 'e807f1fcf82d132f9bb018ca6738a19f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 07:59:26', NULL),
(6, 'A', 'a@me.com', 1234578, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 08:37:54', NULL);

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
(3, 5, 22, '2021-03-19 08:33:24');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

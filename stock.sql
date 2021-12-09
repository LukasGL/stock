-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2021 a las 05:46:14
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `attribute_parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attribute_parent_id`) VALUES
(5, 'Blue', 2),
(6, 'White', 2),
(7, 'M', 3),
(8, 'L', 3),
(9, 'Green', 2),
(10, 'Black', 2),
(12, 'Grey', 2),
(13, 'S', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `active`) VALUES
(4, 'Royal Canin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `active`) VALUES
(5, 'Favoritos', 1),
(6, 'Alimento', 1),
(7, 'Antiparasitarios Externos', 1),
(8, 'Antiparasitarios Internos', 1),
(9, 'Arenas', 1),
(10, 'Vitaminas', 1),
(11, 'Shampoos', 1),
(12, 'Sustratos', 1),
(13, 'Reembasado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `service_charge_value` varchar(255) NOT NULL,
  `vat_charge_value` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `company_name`, `service_charge_value`, `vat_charge_value`, `address`, `phone`, `country`, `message`, `currency`) VALUES
(1, 'Oh My Dog!', '13', '10', 'Madrid', '758676851', 'Chile', 'hello everyone one', 'CLP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `permission`) VALUES
(1, 'Administrator', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}'),
(4, 'Administrador de Productos', 'a:11:{i:0;s:8:\"viewUser\";i:1;s:14:\"createCategory\";i:2;s:14:\"updateCategory\";i:3;s:12:\"viewCategory\";i:4;s:14:\"deleteCategory\";i:5;s:13:\"createProduct\";i:6;s:13:\"updateProduct\";i:7;s:11:\"viewProduct\";i:8;s:13:\"deleteProduct\";i:9;s:11:\"viewProfile\";i:10;s:13:\"updateSetting\";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `qtybefore` varchar(255) NOT NULL,
  `qtyafter` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `history`
--

INSERT INTO `history` (`id`, `id_product`, `name`, `sku`, `qtybefore`, `qtyafter`, `date`) VALUES
(20, 586, 'Cracul 20 comp', '7800006008467', '0', '15', '2021-02-26 00:12:03'),
(21, 41, 'Cat Chow Gato Hogareño 8 Kg (Bolsa vieja)', '7613034872982', '0', '20', '2021-02-26 00:13:28'),
(24, 586, 'Cracul 20 comp', '7800006008467', '15', '0', '2021-02-26 00:29:51'),
(26, 582, 'SIRDOG Perfume Lady 80 ml', '7800006006999', '0', '1', '2021-02-26 00:41:57'),
(27, 582, 'SIRDOG Perfume Lady 80 ml', '7800006006999', '1', '0', '2021-02-26 00:58:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `gross_amount` varchar(255) NOT NULL,
  `service_charge_rate` varchar(255) NOT NULL,
  `service_charge` varchar(255) NOT NULL,
  `vat_charge_rate` varchar(255) NOT NULL,
  `vat_charge` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `bill_no`, `customer_name`, `customer_address`, `customer_phone`, `date_time`, `gross_amount`, `service_charge_rate`, `service_charge`, `vat_charge_rate`, `vat_charge`, `net_amount`, `discount`, `paid_status`, `user_id`) VALUES
(4, 'BILPR-E409', '', '', '', '1612908039', '1000.00', '13', '130.00', '10', '100.00', '1230.00', '', 2, 1),
(5, 'BILPR-6DC4', '', '', '', '1612908072', '3000.00', '13', '390.00', '10', '300.00', '3690.00', '', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_item`
--

CREATE TABLE `orders_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders_item`
--

INSERT INTO `orders_item` (`id`, `order_id`, `product_id`, `qty`, `rate`, `amount`) VALUES
(8, 4, 5, '1', '1000', '1000.00'),
(9, 5, 5, '1', '1000', '1000.00'),
(10, 5, 4, '1', '1000', '1000.00'),
(11, 5, 5, '1', '1000', '1000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `attribute_value_id` text DEFAULT NULL,
  `brand_id` text NOT NULL,
  `category_id` text NOT NULL,
  `store_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `price`, `qty`, `image`, `description`, `attribute_value_id`, `brand_id`, `category_id`, `store_id`, `availability`) VALUES
(11, 'Agility Cats Adulto 10 kg.', '7798075341366', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(12, 'Agility Cats Adulto 1,5 kg.', '7798075341328', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(13, 'Agility Cats Control de Peso 1,5 kg.', '7798075341335', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(14, 'Agility Cats Urinary 1,5 kg.', '7798075341342', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(15, 'Alfa Dog Adulto Premium 20 Kg', '7804660760181', '33990', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"6\"]', 3, 1),
(16, 'Alfa Dog Cachorro  Premium 10 Kg', '7804660760211', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(17, 'Alfa Dog Raza Pequeña Premium 10 Kg', '7804660760204', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"6\"]', 3, 1),
(18, 'Alfa Dog Raza Peque�a  Premium 3 Kg', '7804660760235', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(19, 'Alfa Dog Senior Premium 20 Kg', '7804660760242', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(20, 'Bavaro Force 18 Kg cachorro', '4032254743644', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(21, 'Bavaro Task 18 Kg Adulto', '4032254743620', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(22, 'Bavaro Work 18 Kg trabajo', '4032254743637', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(23, 'Tyson 25 Kg', '7805644000972', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(24, 'XT21 25kg', '7804425000699', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(25, 'Regal Pet Adulto 18 Kg', '7804630370297', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(26, 'Sabrokan 25 Kg', '7804100002550', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(27, 'Cachupin carne 25 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(28, 'Can adulto 18 Kg.', '7804419000889', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(29, 'Can cachorro 18 Kg.', '7804419000872', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(30, 'CanDiet  Premium Adulto 20 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(31, 'CanDiet Super Premium Adulto 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(32, 'CanDiet Super Premium Adulto 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(33, 'CanDiet Super Premium Cachorro 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(34, 'CanDiet Super Premium Cachorro 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(35, 'Cat Chow  Carne 15 Kg', '7613035951167', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(36, 'Cat Chow  Carne 8 Kg', '7613035951204', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(37, 'Cat Chow  DeliMix 24 Kg', '7613287155153', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(38, 'Cat Chow  DeliMix 8 Kg', '7613035951426', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(39, 'Cat Chow  Gatitos 15 Kg', '7613034913166', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(40, 'Cat Chow  Gatitos 8 Kg', '7613035951235', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(41, 'Cat Chow Gato Hogareño 8 Kg (Bolsa vieja)', '7613034872982', '0', '20', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(42, 'Cat Chow  pescado 15 Kg (Bolsa vieja)', '7613035951433', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(43, 'Cat Chow  pescado 8 Kg', '7613035951488', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(44, 'Cat Chow  Peso Saludable 8 Kg (Bolsa vieja)', '7613035696433', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(45, 'Champion dog cachorro 18 Kg.', '7804100000891', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(46, 'Champion dog carne 18 Kg.', '7804100103356', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(47, 'Champion dog carne Raza P 18 Kg.', '7804100001331', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(48, 'Champion dog Senior 18 Kg', '7804100002895', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(49, 'Champion dog Senior 8 Kg', '7804100002192', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(50, 'Champion katt Gatitos 20 kg', '7804100002659', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(51, 'Champion katt Gatitos 8 kg', '7804100001096', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(52, 'Champion katt Adulto Pescado 20 Kg', '7804100000471', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(53, 'Dog Chow  Cachorro RMG 18 Kg.', '7613036672863', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(54, 'Dog Chow adulto  Rmg 8 kg', '7613035950597', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(55, 'Dog Chow adulto Longevidad + 7 A�os 18 kg', '7613036972703', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(56, 'Dog Chow adulto Longevidad + 7 A�os 8 kg', '7613035950504', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(57, 'Dog Chow adulto Mediano Peque�o Carne y Pollo 18 Kg.', '7613036972642', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(58, 'Dog Chow adulto Mediano Peque�o PAVO 18 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(59, 'Dog Chow adulto raza peque�a 21 kg', '7613034284266', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(60, 'Dog Chow adulto raza peque�a 8 kg', '7613035951082', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(61, 'Dog Chow adulto Rmg 18 Kg.', '7613036672917', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(62, 'Dog Chow Cachorro RMG 15 kg', '7613035950917', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(63, 'Dog Chow Cachorro RMG 8 kg', '7613035950955', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(64, 'Dog Chow Adulto RMG 3 kg', '7613035950528', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(65, 'Dog Chow Cachorro RMG 3 kg', '7613035950924', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(66, 'Dog Chow Adulto MP 3 kg', '7613035951662', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(67, 'Dog Chow Cachorro MP 3 kg', '7613035950849', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(68, 'Dog Chow Sano y en Forma 18 kg', '7613036972680', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(69, 'Dog Chow Sano y en Forma 8 kg', '7613035950511', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(70, 'Earthborn Adulto Vantage 12 Kg', '34846720013', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(71, 'Earthborn Coastal Catch 12 Kg', '34846720815', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(72, 'Earthborn Coastal Catch 2,5 Kg', '34846720839', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(73, 'Earthborn Large Breed 12 Kg', '34846720914', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(74, 'Earthborn Meadow Feast With Lamb Meal 12 Kg', '34846720716', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(75, 'Earthborn Ocean Fusion 12 Kg', '34846720112', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(76, 'Earthborn Ocean Fusion 2,5 Kg', '34846720136', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(77, 'Earthborn Primitive Feline 2 Kg', '34846720044', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(78, 'Earthborn Primitive Feline 6 Kg', '34846720051', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(79, 'Earthborn Primitive Natural 12 Kg', '34846720419', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(80, 'Earthborn Primitive Natural 2,5 Kg', '34846720433', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(81, 'Earthborn Puppy Vantage 12 Kg', '34846714128', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(82, 'Earthborn Puppy Vantage 2,5 Kg', '34846720235', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(83, 'Earthborn Small Breed Adulto 2,27 Kg', '34846714302', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(84, 'Earthborn Weight Control 12 Kg', '34846720969', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(85, 'Earthborn Wild See Catch 2 Kg', '34846720143', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(86, 'Earthborn Wild See Catch 6 Kg', '34846720150', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(87, 'Ekos Cat 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(88, 'Eukanuba  Adulto Medium 13,6 Kg', '19014711345', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(89, 'Eukanuba  Adulto Small Breed 6,8 Kg', '19014711284', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(90, 'Eukanuba  Puppy LB 15 Kg', '19014711376', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(91, 'Eukanuba  Puppy Medium 15 Kg', '19014711369', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(92, 'Eukanuba Adulto LB 15 Kg', '19014711338', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(93, 'Eukanuba Puppy Small Breed 6,8 Kg', '19014711291', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(94, 'Eukanuba Senior Large Breed 13,6 Kg', '19014711215', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(95, 'Eukanuba Senior Small Breed 6,8 Kg', '19014711307', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(96, 'Eukanuba Senior Small Breed 2,7 Kg', '19014710973', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(97, 'Eukanuba Adulto Small Breed 2,7 Kg', '19014710959', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(98, 'Excellent Adulto Formula 15 Kg', '7613036672979', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(99, 'Excellent Adulto Large Breed 15 Kg', '7613035951525', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(100, 'Excellent Adulto RMG 18 (15+3) Kg', '7613037020748', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(101, 'Excellent Puppy RMG 18 (15+3) Kg', '7613037020403', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(102, 'Excellent Puppy Large Breed 15 Kg', '7613035951532', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(103, 'Fit  Senior Raza grande 20 Kg.', '7804658500072', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(104, 'Fit adulto raza  peq 10 kg', '7804658500003', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(105, 'Fit cachorro 10 Kg.', '7804658500027', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(106, 'Fit cachorro 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(107, 'Fit formula Adulto 20 Kg.', '7804658500034', '33500', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"6\"]', 3, 1),
(108, 'Fit Gato 10 Kg', '7800006006715', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(109, 'Fit Light 20 kg', '7804658500119', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(110, 'Fit Senior Raza Peque�a  10 Kg.', '7804658500089', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(111, 'Free Go adulto 10 Kg', '7804643350002', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(112, 'Free Go adulto 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(113, 'Free Go Optimus  adulto 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(114, 'Instict Chiken 11,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(115, 'Instict Pato 9 Kg', '769949658122', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(116, 'Instict Pavo 10 Kg', '769949653110', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(117, 'Instict Salmon 11,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(118, 'Instict Salmon 9 Kg', '769949658160', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(119, 'Josera JosiCat 10 kg', '4032254753391', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(120, 'Joseras Festival adulto 15 Kg.', '4032254212607', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(121, 'Joseras Junior 18 Kg.', '4032254745556', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(122, 'Joseras Kids 15 Kg', '4032254211501', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(123, 'Joseras Light Vital 15 Kg', '4032254744047', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(124, 'Joseras Miniwell 15 Kg', '4032254740728', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(125, 'Joseras Balance 15 Kg', '4032254211600', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(126, 'Joseras Regular Adulto 18 Kg.', '4032254745624', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"6\"]', 3, 1),
(127, 'Master Cat Salmon Sardina 20k', '7801920001398', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(128, 'Master dog cachorro 18 kg', '7801920000841', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(129, 'Master Dog Carne 18 kg', '7801920000193', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(130, 'Master Dog Raza Peque�a 8 kg', '7802575533241', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(131, 'Masterdog Senior 8 kg', '7802575533258', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(132, 'Mastin Adulto 22 Kg', '7804630370389', '26800', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"6\"]', 3, 1),
(133, 'Mastin Adulto 3 Kg', '7804630370006', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(134, 'Mastin Cachorro 15 Kg', '7804630370051', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(135, 'Mastin Cachorro 3 Kg', '7804630370044', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(136, 'Mastin Raza Pequeña 10 Kg', '7804630370310', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(137, 'Mastin Senior 20 kg', '7804630370334', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(138, 'Mazuri Erizo 0,5 Kg', '742832504157', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(139, 'Mazuri Erizo 1,5 Kg', '742832770637', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(140, 'Mazuri Hamster y Gerbil Diet 350 gr.', '19213594602', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(141, 'Mazuri Pig Guinea 1 Kg.', '742832504140', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(142, 'Mazuri Rabbit   1 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(143, 'Mazuri Rata Mause', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(144, 'Mazuri Tortuga Aquatic Diet 340 Gr', '727613010300', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(145, 'MazuriFerret (Huron ) 2,26 Kg', '727613004743', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(146, 'Natural Food Premium Adulto 15 Kg', '7804656010030', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(147, 'Natural Food Premium Adulto Bone Joint 15 Kg', '7804656010122', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(148, 'Natural Food Premium Adulto RP 10 Kg', '7804656010146', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(149, 'Natural Food Premium Cachorro 10 Kg', '7804656010016', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(150, 'Natural Food Premium Gato Adulto7,5 Kg', '7804656010160', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(151, 'Natural Food Premium Gato indor 7,5 Kg', '7804656010153', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(152, 'Natural Food Premium Senior 15 Kg', '7804656010139', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(153, 'Nutience Gr. Fee Dog Pavo/Pollo 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(154, 'Nutience Original Adulto Medium 11,5 Kg', '15561760393', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(155, 'Nutience Original Adulto Small 5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(156, 'Nutra Gold Adulto Holistic DUCK  13,6 Kg', '74198612093', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(157, 'Nutra Gold Adulto Holistic Large Breed  15 Kg', '74198606993', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(158, 'Nutra Gold Adulto Holistic Medium  15 Kg', '74198607044', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(159, 'Nutra Gold Breed Formula 20 Kg', '74198602926', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(160, 'Nutra Gold Puppy Holistic Large Breed  15 Kg', '74198606795', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(161, 'Nutra Gold Salmon  15 Kg', '74198607143', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(162, 'Nutrique Large Adulto Dog 15 Kg', '7798098846862', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(163, 'Nutrique Large Puppy Dog 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(164, 'Nutrique Medium Adulto Dog 12 Kg', '7798098846831', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(165, 'Nutrique Medium Adulto Dog 3 Kg', '7798098846824', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(166, 'Nutrique Medium Puppy Dog 12 Kg', '7798098846732', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(167, 'Nutrique Toy y Mini Adulto Dog 3 Kg', '7798098846794', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(168, 'Nutrique Toy y Mini Puppy Dog 3 Kg', '7798098846701', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(169, 'Nutrique Healthy Wight Dog 3 Kg', '7798098846947', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(170, 'Nutrique Sterilised Cat 2 Kg', '7798098847098', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(171, 'Pedigree Adulto 21 Kg', '7797453000659', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(172, 'Pedigree Cachorro 21 Kg.', '7797453000642', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(173, 'Pedigree Senior 21 Kg', '7797453000680', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(174, 'Pedigree Raza Peque�a 21 Kg.', '7797453000673', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(175, 'Powerdog Adulto RMG 18 Kg', '7804630170187', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(176, 'Pro Plan  Feline 1 Kg', '7613039886748', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(177, 'Pro Plan  Feline 3 Kg', '7613039900277', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(178, 'Pro Plan  Feline 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(179, 'Pro Plan  Feline Sterilized 1 Kg', '7613039947630', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(180, 'Pro Plan  Feline Sterilized 3 Kg', '7613039947784', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(181, 'Pro Plan  Feline Sterilized 7,5 Kg', '7613039947661', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(182, 'Pro Plan Adult  Active Mind  RMG 15 Kg', '7613287032911', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(183, 'Pro Plan Adult  Active Mind  RMG 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(184, 'Pro Plan Adult  Active Mind  RP 3 Kg', '7613287031969', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(185, 'Pro Plan Adult  Active Mind  RP 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(186, 'Pro Plan Adult  RG 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(187, 'Pro Plan Adult Mediano 15 Kg', '7613287031082', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(188, 'Pro Plan Adult Mediano 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(189, 'Pro Plan Adult Small Breed 1 Kg', '7613287029164', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(190, 'Pro Plan Adult Small Breed 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(191, 'Pro Plan Adult Small Breed 7,5 Kg', '7613287029515', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(192, 'Pro Plan Canine Complete Reduce Caloric 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(193, 'Pro Plan Canine Hydrilyzed 7,48 Kg', '38100136671', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(194, 'Pro Plan Canine Hydrilyzed 2,72 Kg', '38100138521', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(195, 'Pro Plan Canine Hypoallergenic 11 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(196, 'Pro Plan Canine Hypoallergenic 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(197, 'Pro Plan Canine OM 2,0 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(198, 'Pro Plan Canine OM 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(199, 'Pro Plan Canine Smmal Breed Reduce Caloric 3 Kg', '7613287032942', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(200, 'Pro Plan Exigent  RP 3  Kg', '7613287035196', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(201, 'Pro Plan Exigent  RP 7,5  Kg', '7613287035264', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(202, 'Pro Plan Kitten 1 Kg', '7613039886557', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(203, 'Pro Plan Kitten 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(204, 'Pro Plan Kitten 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(205, 'Pro Plan Puppy Medium Breed 15 Kg', '7613287028549', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(206, 'Pro Plan Puppy Medium Breed 3 Kg', '7613287028204', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(207, 'Pro Plan Puppy Large B. 15 Kg', '7613287029034', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(208, 'Pro Plan Puppy Small Breed 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(209, 'Pro Plan Puppy Small Breed 3 Kg', '7613287028051', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(210, 'Pro Plan Puppy Small Breed 7,5 Kg', '7613287028129', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(211, 'Pro Plan Sensitive Adulto Cordero  15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(212, 'Pro Plan Sensitive Adulto Cordero  3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(213, 'Pro Plan Sensitive Puppy Cordero  15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(214, 'Pro Plan Sensitive Puppy Cordero  3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(215, 'Pro Plan Sensitive Skin Adulto RMG Salmon 15  Kg', '7613287035011', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(216, 'Pro Plan Sensitive Skin Salmon Complete 3  Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(217, 'Pro Plan Sensitive Skin Salmon RP 3  Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(218, 'Pro Plan Urinary Feline 1 Kg', '7613039947692', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(219, 'Pro Plan Urinary Feline 3 Kg', '7613039947111', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(220, 'Pro Plan Urinary Feline 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(221, 'RC  mini Junior 2,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(222, 'RC  mini Junior 3 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(223, 'RC  Pastor Aleman Junior 12 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(224, 'RC Babycat 1,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(225, 'RC Beagle Adulto 3 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(226, 'RC Beagle Adulto 3 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(227, 'RC Bulldog Frances Adulto 2,5 Kg', '7896181219118', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(228, 'RC Bulldog Frances Junior  3 Kg', '7790187005488', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(229, 'RC Bulldog Junior 12 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(230, 'RC Cardiac Canino 2 Kg', '7896181213666', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(231, 'RC Chihuahua  Adulto 1 kg', '7790187005525', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(232, 'RC Dachshund  2,5 Kg', '7896181297932', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(233, 'RC Dachshund Junior 2,5 Kg', '7908248300247', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(234, 'RC Energy Profesional 20 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(235, 'RC Felin Exigent  1,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(236, 'RC Felin Indoor   1,5 Kg.', '7790187338715', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(237, 'RC Felin Indoor   2 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(238, 'RC Felin Indoor   7,5 Kg.', '7790187338722', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(239, 'RC Felin Indoor 7+   1,5 Kg.', '7896181215790', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(240, 'RC Felin Indoor Long Hair   1,5 Kg.', '7790187339460', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(241, 'RC Felin Obesity 1,5 Kg.', '7896181215356', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(242, 'RC Feline Gastrointestinal 1,5 Kg', '7790187339170', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(243, 'RC Feline Hair & Skin Care 1,5 Kg.', '7896181213406', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(244, 'RC Feline Hairball Care 1,5 Kg.', '7896181213420', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(245, 'RC Feline Hypoallergenic 1,5 Kg.', '7896181215370', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(246, 'RC Feline Light 1,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(247, 'RC Feline Renal 1,5 Kg.', '7790187338517', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(248, 'RC Feline Senior Ageing +12 a�os 2 kg.', '3182550786218', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(249, 'RC Feline Sensible 1,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(250, 'RC Feline Urinary Care 0,4 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(251, 'RC Feline Urinary Care 1,5 Kg.', '7790187340350', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(252, 'RC Feline Urinary Care 7,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(253, 'RC Feline Urinary HD 1,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(254, 'RC Feline Weight Control 1,5 Kg.', '7790187003132', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(255, 'RC Fit 32  1,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(256, 'RC Fit 32  7,5 kg', '7896181212584', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(257, 'RC Gastrointestinal Canine 10 Kg', '7790187339156', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(258, 'RC Gastrointestinal Canine 2 Kg', '7896181213567', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(259, 'RC Giant Adulto 15 Kg', '7790187004160', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(260, 'RC Giant Junior 15 Kg', '7896181212027', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(261, 'RC Giant Puppy 15 Kg', '7790187339811', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(262, 'RC Hepatic Canine 10 Kg', '7896181213659', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(263, 'RC Hepatic Canine 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(264, 'RC Hepatic Feline 1,5 Kg.', '7790187003804', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(265, 'RC Hypoallegenic Canine  2 Kg', '7896181213543', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(266, 'RC Hypoallegenic Canine  Mini 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(267, 'RC Hypoallegenic Canine 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(268, 'RC Hypoallegenic Canine 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(269, 'RC Kitten  1,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(270, 'RC Kitten 7,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(271, 'RC Kitten Sterilised 1,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(272, 'RC Lata Beauty Adulto', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(273, 'RC Lata Calorie Control Feline 162 gr.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(274, 'RC Lata Gastrointestinal Canino 385 gr', '30111663207', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(275, 'RC Lata Gastrointestinal Felino 165 gr', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(276, 'RC Lata Hepatic Canino 200 gr.', '9003579308479', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(277, 'RC Lata Hidrolizado Canino 390 gr.', '30111771513', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(278, 'RC Lata Mature 8+', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(279, 'RC Lata Puppy', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(280, 'RC Lata Recovery 165 gr.', '30111260208', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(281, 'RC Lata Renal Suport Canino 385 gr.', '30111472632', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(282, 'RC Lata Renal Suport Feline 162 gr.', '30111441850', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(283, 'RC Lata Urinary Feline SO 165 gr.', '30111470751', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(284, 'RC Lata Weight Care Adulto 165 gr', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(285, 'RC Maltes 1 Kg', '7896181215004', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(286, 'RC Maxi adulto +5   15 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(287, 'RC Maxi adulto 15 kg', '7896181211822', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(288, 'RC Maxi Ageing 8+  15 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(289, 'RC Maxi Ageing 8+  15 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(290, 'RC Maxi Dermaconfort 10 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(291, 'RC Maxi Junior 15 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(292, 'RC Maxi Junior 15 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(293, 'RC Medium Adult +7  15 Kg', '7896181216940', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(294, 'RC Medium Adult 15 Kg', '7896181211884', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(295, 'RC Medium Adult 2,5 Kg', '7896181219156', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(296, 'RC Medium Dermaconfort 10 Kg', '7896181217350', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(297, 'RC Medium Junior 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(298, 'RC Medium puppy 15 Kg', '7896181211921', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(299, 'RC Medium Puppy 2,5 Kg', '7896181218845', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(300, 'RC Medium Weight Care 15 Kg', '7790187004054', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(301, 'RC mini adulto 1 Kg.', '7896181212089', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(302, 'RC mini adulto 2,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(303, 'RC mini adulto 3 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(304, 'RC mini adulto 7,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(305, 'RC mini adulto 7,5 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(306, 'RC mini adulto 8+    1 Kg', '7790187340572', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(307, 'RC mini adulto 8+    2,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(308, 'RC mini adulto 8+    3 Kg', '7790187340510', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(309, 'RC mini Ageing 12+  2,5 Kg', '7896181297895', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(310, 'RC mini Ageing 12+  3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(311, 'RC mini Dermaconfort 2,5 kg', '7896181219132', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(312, 'RC mini Indoor 2,5 kg', '7896181297925', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(313, 'RC mini Indoor 3 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(314, 'RC mini Junior 1 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(315, 'RC mini junior 7,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(316, 'RC mini junior 7,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(317, 'RC mini Ligth 2,5 kg', '7896181218968', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(318, 'RC Mini Starter 3 Kg', '7790187339583', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(319, 'RC Mini Sterilised 2,5 kg.', '7896181299073', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(320, 'RC mini Weight Care 3 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(321, 'RC Obesity  Canine 1,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(322, 'RC Obesity  Canine 7,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(323, 'RC Pack Kitten', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(324, 'RC Pack Puppy Mini', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(325, 'RC Persian 1,5 kg', '7790187339422', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(326, 'RC Poodle Adulto 1 Kg', '7896181214670', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(327, 'RC Poodle Adulto  2,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(328, 'RC Poodle Adulto  3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(329, 'RC Poodle Junior  3 Kg', '7790187005501', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(330, 'RC Pug Adulto 2,5 Kg', '7896181297840', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(331, 'RC Pug Junior 2,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(332, 'RC Schnauzer  Adulto 2,5 Kg', '7896181297888', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(333, 'RC Shih Tzu Adulto 2,5 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(334, 'RC Shih Tzu Junior 2,5 kg', '7908248300339', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(335, 'RC Urinary Canino 2 Kg', '7896181213604', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(336, 'RC Urinary Canino 10 Kg', '7896181213611', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(337, 'RC Xsmall Adult 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(338, 'RC Xsmall Adult 2,5 Kg', '7896181218951', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(339, 'RC Xsmall Adult 8+ 1 Kg', '7896181215714', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(340, 'RC Xsmall Ageing 12+ 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(341, 'RC Xsmall Junior 1 Kg', '7896181215684', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(342, 'RC Xsmall Junior 2,5 Kg', '7896181297864', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(343, 'RC Yorkshire Adulto  1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(344, 'RC Yorkshire Adulto  2,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(345, 'RC Yorkshire Adulto  3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(346, 'RC Yorkshire Junior 1 Kg', '7908248300346', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(347, 'RC Yorkshire Junior 2,5 Kg', '7908248300353', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(348, 'RC Yorkshire Junior 3 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(349, 'RC young  female 1,5 Kg.', '7790187003095', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(350, 'RC young  female 3,5 Kg', '7790187003101', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(351, 'RC young male 1,5 Kg.', '7790187003057', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(352, 'RC young male 3,5 Kg.', '7790187003064', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(353, 'RC Satiety 1,5kg.', '7790187339101', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(354, 'Sieger Adulto 15 Kg', '7798075340970', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(355, 'Sieger Cachorro 15 Kg', '7798075340987', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(356, 'Sieger Criadores 20 kg', '7798075340208', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(357, 'Sieger Gato Adulto 1 kg.', '7798075342660', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(358, 'Taste of the Wild Cayon River (Trucha)  6,6 Kg cats', '74198614301', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(359, 'Taste of the Wild Cayon River (Trucha) 2 Kg cats', '74198612383', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(360, 'Taste of the Wild Rocky Mountain (Venado) 2 Kg cats', '74198612314', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(361, 'Taste of the Wild Lowland Creek (Codorniz y Pato) 6,6 Kg cats', '74198614431', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(362, 'Taste of the Wild Pacific Strem adulto (salmon) 12,2 kg dog', '74198614240', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(363, 'Taste of the Wild Pacific Strem adulto (salmon) 2 kg dog', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1);
INSERT INTO `products` (`id`, `name`, `sku`, `price`, `qty`, `image`, `description`, `attribute_value_id`, `brand_id`, `category_id`, `store_id`, `availability`) VALUES
(364, 'Taste of the Wild Pacific Strem adulto (salmon) 5,6 kg dog', '74198614233', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(365, 'Taste of the Wild Pacific Strem puppy (salmon)  12,2 kg dog', '74198614349', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(366, 'Taste of the Wild Pacific Strem puppy (salmon)  2 kg dog', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(367, 'Taste of the Wild Pacific Strem puppy (salmon)  5,6 kg dog', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(368, 'Taste of the Wild Wetland canine Adult (Pato) 12,2 kg dog', '74198614226', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(369, 'Taste of the Wild Wetland canine Adult (Pato) 2 kg dog', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(370, 'Taste of the Wild Wetland canine Adult (Pato) 5,6 kg dog', '74198614219', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(371, 'Therapy Canino  Hypoallergenic 10 Kg', '7798098845391', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(372, 'Therapy Canino  Hypoallergenic 2 Kg', '7798098845384', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(373, 'Therapy Canino Cardiac 10  Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(374, 'Therapy Canino Cardiac 2 Kg', '7798098845346', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(375, 'Therapy Canino Gastrointestinal  10 Kg', '7798098845377', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(376, 'Therapy Canino Gastrointestinal  2 Kg', '7798098845360', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(377, 'Therapy Canino Mobility 15  Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(378, 'Therapy Canino Mobility 2  Kg', '7798098845407', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(379, 'Therapy Canino Obesity 15 Kg', '7798098845438', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(380, 'Therapy Canino Obesity 2 Kg', '7798098845469', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(381, 'Therapy Canino Renal  10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(382, 'Therapy Canino Renal  2 Kg', '7798098845445', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(383, 'Therapy Feline Renal 2 Kg', '7798098845506', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(384, 'Therapy Feline  Gastrointestinal 2 Kg', '7798098845476', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(385, 'Therapy Feline Hypoallergenic 2 Kg', '7798098845483', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(386, 'Therapy Feline Obesity 2 Kg', '7798098845490', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(387, 'Therapy Feline Renal 2 Kg', '7798098845506', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(388, 'Therapy Feline Urinary 2 Kg', '7798098845513', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(389, 'Therapy Feline Urinary 7,5 Kg', '7798098845520', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(390, 'Vital Can Balanced Adulto Large 3 Kg', '7798098843991', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(391, 'Vital Can Balanced Adulto Large 15 Kg', '7798098844004', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(392, 'Vital Can Balanced Adulto Large 17 (15+2) Kg', '7798098847326', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(393, 'Vital Can Balanced Adulto Medium 12 Kg', '7798098844035', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(394, 'Vital Can Balanced Adulto Small 7,5 Kg', '7798098844066', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(395, 'Vital Can Balanced Control Peso 12 Kg', '7798098844196', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(396, 'Vital Can Balanced Control Peso 20 Kg', '7798098844202', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(397, 'Vital Can Balanced Control Peso 3 Kg', '7798098844189', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(398, 'Vital Can Balanced Cordero y Arroz 15 Kg', '7798098847234', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(399, 'Vital Can Balanced Cordero y Arroz 3 Kg', '7798098847210', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(400, 'Vital Can Balanced Puppy Large 15 Kg', '7798098844097', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(401, 'Vital Can Balanced Puppy Large 3 Kg', '7798098844080', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(402, 'Vital Can Balanced Puppy Medium 12 Kg', '7798098844134', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(403, 'Vital Can Balanced Puppy Small 3 Kg', '7798098844165', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(404, 'Vital Can Balanced Puppy Small 7,5 Kg', '7798098844172', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(405, 'Vital Can Balanced Senior Small 7,5 Kg', '7798098844264', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(406, 'Vital Can Balanced Senior Large 15 Kg', '7798098844226', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(407, 'Vital Can Balanced Adult Cat 2 Kg', '7798098843847', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(408, 'Vital Can Balanced Kitten 2 Kg', '7798098843908', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(409, 'Vital Can Balanced Kitten 7,5 Kg', '7798098843915', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(410, 'Vital Can Balanced Control de peso Cat 2 Kg', '7798098843939', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(411, 'Vital Can BELCAN 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(412, 'Vital Can BELCAN Cachorro  15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(413, 'Vital Can BELCAN Adulto  18 Kg', '7798098841171', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(414, 'Vital Can BELCAN A dulto Bolsa 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(415, 'Vital Can BELCAN A dulto PACK 24 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(416, 'Vital Can BELCAT Bolsa 1 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(417, 'Vital Can BELCAT PACK 24 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(418, 'Waffen Criadores Cachorro 15 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(419, 'Waffen Criadores Cachorro 22 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(420, 'Whiskas 10 Kg. (Carne, Pollo, Salmon, Pescado)', '7797453972376', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(421, 'Whiskas Gatito 10 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(422, 'Nutrience Adulo Raza Mediana 11,5 Kg', '15561760393', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(423, 'Lata cannes pollo 375 gr', '7804438002925', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(424, 'Arena Tidy Cats Instan Action Purina Bid�n 6,35 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(425, 'Arena Tidy Cats Scoop LWT Purina Bid�n 2,7 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(426, 'Arena Alta Gama Perfumada 4 kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(427, 'Arena Absorsol 3,6 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(428, 'Arena Lager 2 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(429, 'Arena Aglomerante Fit formula 2 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(430, 'Arena Aglomerante Fit formula 4 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(431, 'Arena Aglomerante Fit formula 10 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(432, 'Arena Cat Litter COOLAN CLEAN 8,6 KG', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(433, 'Arena Fit Formula cristal cat 3,2 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(434, 'Arena Ultra Fresh 1,59 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(435, 'Arena Litters pearls 3,18 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(436, 'Arena Ultra Lite 4,53 kg. 10 lts.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(437, 'Arena Dry Master Cat 2 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(438, 'Arena Master Cat Biodegradable 2 Kg.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(439, 'Arena Sanitaria Top.K9 Ecol�gica 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(440, 'Arena Sanitaria Top.K9 Ecol�gica 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(441, 'Arena Sanitaria Top.K9 Aglutinante 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(442, 'Arena Sanitaria Top.K9 Aglutinante 4 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(443, 'Arena Sanitaria Top.K9  Aromas Aglutinante 10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(444, 'Arena Sanitaria Top.K9 Aglutinante 25 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(445, 'Arena Happy Aglutinante Lavanda, Limon  2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(446, 'Arena Happy Aglutinante Lavanda, Limon 10Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(447, 'Arena Sanitaria Neon 1,8', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(448, 'Arena White Cat 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(449, 'Arena White Cat 4 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(450, 'Arena Easy Clear Lavanda, Limon 8Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(451, 'Bravecto 2 a 4,5 kg', '8713184148988', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(452, 'Bravecto 4,5 a 10 kg', '8713184148971', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(453, 'Bravecto 10 a 20 kg', '8713184148964', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(454, 'Bravecto 20 a 40 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(455, 'Bravecto 40 a 56 kg', '8713184148940', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(456, 'Broadline Gatos 2,5-7,5 kg', '7809599502086', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(457, 'Advocate Gatos 4-8 kg', '4007221048336', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(458, 'Dorazel Plus 300 ml', '7800006002069', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(459, '1 SIMPARICA 1,3-2,5 kg', '7804650311126', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(460, '1 SIMPARICA 2,5-5 kg', '7804650311133', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(461, '1 SIMPARICA 5-10 kg', '7804650311140', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(462, '1 SIMPARICA 10-20 kg', '7804650311157', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(463, '1 SIMPARICA 20-40 kg', '7804650311164', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(464, '3  SIMPARICA 2,5-5 KG', '7804650311065', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(465, '3  SIMPARICA 5-10 KG', '7804650311072', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(466, '3  SIMPARICA 10-20 KG', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(467, '3 SIMPARICA 20-40 KG', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"7\"]', 3, 1),
(468, 'FIPROKILL� Spray 50 ml   4+1', '7800006008993', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(469, 'FIPROKILL� Spray 100 ml   4+1', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(470, 'FIPROKILL� Spray 250 ml', '7800006005800', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(471, 'Frontline Spray 100 cc', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(472, 'Frontline Spray 250 cc', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(473, '3 Nexgard 2 a 4 kg (pulgas y Gar)', '7809599501539', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(474, '3 Nexgard 4 a 10 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(475, '3 Nexgard 10 a 25 k', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(476, '3 Nexgard 25 a 50', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(477, 'Nexgard 2 a 4 kg (pulgas y Gar)', '7809599501461', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(478, 'Nexgard 4 a 10 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(479, 'Nexgard 10 a 25 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(480, 'Nexgard 25 a 50 Kg', '7809599501522', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"5\",\"7\"]', 3, 1),
(481, 'Pipeta Advantage Gato <4Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(482, 'Pipeta Advantage Gato 4 - 8 Kg', '4007221042914', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(483, 'Pipeta Advantix 25 a 40 k', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(484, 'Pipeta Advantix 10 a 25 k', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(485, 'Pipeta Advantix 4 a 10 k', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(486, 'Pipeta Advantix hasta 4 k', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(487, 'Pipeta FIPRODRAG�  Gato', '7800006006449', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(488, 'Pipeta FIPRODRAG� Perro Raza Grande+ 40 Kg', '7800006006487', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(489, 'Pipeta FIPRODRAG� Perro Raza Mediana 20a40 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(490, 'Pipeta FIPRODRAG� Perro Raza Peque�a 10a20 Kg', '7800006006463', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(491, 'Pipeta FIPRODRAG� Perro Raza Muy Peque�a -10 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(492, 'Pipeta Frontline  Plus Gato', '7730997410607', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(493, 'Pipeta Frontline Plus  Perro 0-10 kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(494, 'Pipeta Frontline Plus  Perro 10-20 kg', '7730997410584', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(495, 'Pipeta Frontline Plus Perro 20-40 kg', '7730997410577', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(496, 'Pipeta Frontline Plus Perro 40-60 kg', '7730997410560', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(497, 'Pipeta SINPUL Raza Peque�a <5 kg', '7800006007804', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(498, 'Profender Gato 2,5-5 kg', '7793640808114', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(499, 'Revolution Perro y Gato 2,5 kg', '7804650310129', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(500, 'SINPUL� Spray 200 ml  3+1', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(501, 'SINPUL� Spray 500 ml', '7800006000508', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(502, 'SINPULDRY� gato', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(503, 'SINPULDRY� perro', '7800006000164', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(504, 'Collar EcoDog Antipulgas', '7800006004445', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(505, 'Collar Catti Antipulgas', '7800006000041', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(506, 'Collar Doguican Antipulgas', '7800006000058', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(507, 'Collar Bayticol Plus Antipulgas 35 cm', '7805750401779', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(508, 'Collar Bayticol Plus Antipulgas 48 cm', '7805750400956', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(509, 'Collar Bayticol Plus Antipulgas 66 cm', '7805750400963', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(510, 'Equilibrium Ages ( 60 tabletas )', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(511, 'Equilibrium Artro ( 60 tabletas )', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(512, 'Equilibrium Vitaminas y minerales ( 60 tabletas )', '7501051101058', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(513, 'Apeticat 100 ml', '7800006002908', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(514, 'Apetipet 100 ml', '7800006002724', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(515, 'Doguivit Senior 30 comp', '7800006003769', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(516, 'Omega 3 Pets Gatos 125 ml', '7805350000372', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(517, 'SUPERPET � Omega 6:3 Gato Adulto 125 ml', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(518, 'SUPERPET � Omega 6:3 Perro Adulto 125 ml', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(519, 'SUPERPET � Omega 6:3 Perro puppy 125 ml', '7800006006517', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(520, 'SUPERPET � Omega 6:3 Perro senior 125 ml', '7800006006500', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(521, 'SUPERPET �  Perro 100 gr.(3+1 $3.179)', '7800006000171', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(522, 'Mevermic 10 kg', '7800006010101', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(523, 'Antiparasitario Nanormen 20 ml', '7800006001338', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(524, 'Antiparasitario Nanormen Puppy 20 ml', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(525, 'Antiparasitario Drontal plus 10 k x 2 Tabletas', '7805750400895', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(526, 'Antiparasitario Drontal plus 35 k', '7891106003704', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(527, 'Antiparasitario Drontal Puppy', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(528, 'Antiparasitario Drontal Gato 1 Comprimido', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(529, 'Invermic Perro 10 ml', '7800006000249', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(530, 'Invermic Gato 10 ml', '7800006002861', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(531, 'Antiparasitario Flovovermic  hasta 35 k  20 u', '7800006003349', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(532, 'Antiparasitario Flovovermic  hasta 10 k  60 u', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(533, 'Shampoo Canpupy  350 ml', '7804667990093', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(534, 'Shampoo CANISH� Bals�mico 390', '7800006001598', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(535, 'Shampoo CANISH� Extra Brillo 390', '7800006004469', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(536, 'Shampoo CANISH� Hipoalerg�nico 390', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(537, 'Shampoo CANISH� Extracto de Hierbas 390 ml', '7800006004452', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(538, 'Shampoo Citruspet 390 ml', '7800006007538', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(539, 'Shampoo SINPUL 300 ml', '7800006001550', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(540, 'Shampoo Skin Drag Acondicionador  Vit E 250 ml', '7800006008863', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(541, 'Shampoo Skin Drag Ceramidas 250 ml', '7800006008856', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(542, 'Shampoo Skin Drag Calendula 250 ml', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(543, 'Shampoo Skin Drag Avena 250 ml', '7800006008849', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(544, 'Shampoo Skin Drag  Green Tea 250 ml', '7800006008832', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(545, 'Shampoo Skin Drag  Matico y Aloe vera', '7800006010156', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(546, 'Shampoo Seco TIDY� Gato', '7800006002762', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(547, 'Shampoo Seco TIDY� Perros', '7800006000188', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(548, 'Shampoo SIR DOG� Black 390 ml 4+1', '7800006003691', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(549, 'Shampoo SIR DOG� Conditioner 390 ml  4+1', '7800006008115', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(550, 'Shampoo SIR DOG� Odor  390 ml  4+1', '7800006007040', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(551, 'Shampoo SIR DOG� Shed Control 390 ml  4+1', '7800006003714', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(552, 'Shampoo SIR DOG� White 390 ml  4+1', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(553, 'Shampoo Pet Studio Cachorro', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(554, 'Shampoo Pet Studio Avena', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(555, 'Shampoo Pet Studio Pelo Blanco', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(556, 'Shampoo Mini Pet  50 ml', '7800006009419', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(557, 'Asuntol Jabon perfumado', '7501051151084', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(558, 'SUAVIPET� locion desenredante', '7800006005749', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"11\"]', 3, 1),
(559, 'Sustrato Natural Carefresh 14 Lts', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(560, 'Sustrato Papel Bakan 2 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(561, 'Sustrato My Pet Litter 4 Lt.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(562, 'Sustrato My Pet Bedding 4 Lt.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(563, 'Viruta PINO  CANAIMA 800 gr.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(564, 'Viruta Granel', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(565, 'Viruta Vegetal Dormilon CANAIMA  1,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(566, 'Viruta Pellet Papel CANAIMA', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(567, 'Viruta Vegetal de Maiz CANAIMA  1,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(568, 'Viruta Vegetal de Maiz CANAIMA  1,5 Kg', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"12\"]', 3, 1),
(569, 'MAMISTOP� gato 100', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(570, 'MAMISTOP� Perro 125', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(571, 'MAMISTOP� Perro 250 gr', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(572, 'Leche Lactocan', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(573, 'Matipet Pomada 50 gr.', '7800006007545', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(574, 'Pacifor 10 ML', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(575, 'Paz-Pet 60 ML', '7800006005589', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(576, 'ProPet Probioticos 14 gr.', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(577, 'QUIT OLOR 500 ml', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(578, 'Probioticos Mira Canis 10gr.', '7805750002280', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(579, 'Repelente Holly Pet 150 cc', '0', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(580, 'Lagripet 50 ml', '7800006005350', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(581, 'Pet-otic 100 ml', '7800006003745', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(582, 'SIRDOG Perfume Lady 80 ml', '7800006006999', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(583, 'Colonia Animal Health Blue 160 ml', '7800006008078', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(584, 'Colonia Animal Health Violet 160 ml', '7800006008061', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(585, 'Colonia Animal Health Puppy 160 ml', '7800006003974', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(586, 'Cracul 20 comp', '7800006008467', '0', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', 'null', 3, 1),
(588, 'Re Master dog 1 kg', '0', '1500', '0', '<p>You did not select a file to upload.</p>', '', 'null', 'null', '[\"6\",\"13\"]', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`id`, `name`, `active`) VALUES
(3, 'OH MY DOG!', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone`, `gender`) VALUES
(1, 'adminknst', '$2y$10$yfi5nUQGXUZtMdl27dWAyOd/jMOmATBpiUvJDmUu9hJ5Ro6BE5wsK', 'admin@admin.com', 'john', 'doe', '80789998', 1),
(8, 'paula', '$2y$10$WqxzmZnEYmvoMt/jDv6/ru/H9NtH2CRMOLh.cosMalhfVXkw61Vhq', 'paula@paula.com', 'Paula', 'Lagos', '968487191', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(7, 6, 4),
(8, 7, 4),
(9, 8, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

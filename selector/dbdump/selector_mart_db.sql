-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 10:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selector_mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `item_bundle_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `item_bundle_id`, `name`, `parent_id`) VALUES
(1, 1, 'Manufacturing', NULL),
(2, 2, 'Service', NULL),
(3, 3, 'Other', NULL),
(5, 5, 'Printing', 1),
(6, 6, 'Food and Beverage', 1),
(7, 7, 'Textile and Clothing', 1),
(8, 8, 'Wood', 1),
(9, 9, 'Plastic and Rubber', 1),
(11, 11, 'Metalworking', 1),
(12, 12, 'Machinery', 1),
(13, 13, 'Furniture', 1),
(21, 21, 'Transport and Logistics', 2),
(28, 28, 'Information Technology and Telecommunications', 2),
(97, 97, 'Maritime', 12),
(542, 542, 'Metal works', 11),
(559, 559, 'Plastic processing technology', 3);

-- --------------------------------------------------------

--
-- Table structure for table `form_input`
--

CREATE TABLE `form_input` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `terms_agreed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `form_input`
--

INSERT INTO `form_input` (`id`, `item_id`, `name`, `terms_agreed`) VALUES
(1, 18, 'tere', 1),
(2, 25, 'tere', 1),
(3, 25, 'tere', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_bundle_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `item_bundle_id`, `name`) VALUES
(15, 8, 'Wooden building materials'),
(18, 1, 'Electronics and Optics'),
(19, 1, 'Construction materials'),
(22, 2, 'Tourism'),
(25, 2, 'Business services'),
(29, 3, 'Energy technology'),
(33, 3, 'Environment'),
(35, 2, 'Engineering'),
(37, 3, 'Creative industries'),
(39, 6, 'Milk & dairy products'),
(40, 6, 'Meat & meat products'),
(42, 6, 'Fish & fish products'),
(43, 6, 'Beverages'),
(44, 7, 'Clothing'),
(45, 7, 'Textile'),
(47, 8, 'Wooden houses'),
(53, 559, 'Plastics welding and processing'),
(54, 9, 'Packaging'),
(55, 559, 'Blowing'),
(57, 559, 'Moulding'),
(62, 542, 'Forgings, Fasteners'),
(66, 542, 'Gas, Plasma, Laser cutting'),
(67, 11, 'Construction of metal structures'),
(69, 542, 'MIG, TIG, Aluminum welding'),
(75, 542, 'CNC-machining'),
(91, 12, 'Machinery equipment/tools'),
(93, 12, 'Metal structures'),
(94, 12, 'Machinery components'),
(98, 13, 'Kitchen'),
(99, 13, 'Project furniture'),
(101, 13, 'Living room'),
(111, 21, 'Air'),
(112, 21, 'Road'),
(113, 21, 'Water'),
(114, 21, 'Rail'),
(121, 28, 'Software, Hardware'),
(122, 28, 'Telecommunications'),
(141, 2, 'Translation services'),
(145, 5, 'Labelling and packaging printing'),
(148, 5, 'Advertising'),
(150, 5, 'Book/Periodicals printing'),
(224, 12, 'Manufacture of machinery'),
(227, 12, 'Repair and maintenance service'),
(230, 97, 'Ship repair and conversion'),
(263, 11, 'Houses and buildings'),
(267, 11, 'Metal products'),
(269, 97, 'Boat/Yacht building'),
(271, 97, 'Aluminium and steel workboats'),
(337, 8, 'Other (Wood)'),
(341, 13, 'Outdoor'),
(342, 6, 'Bakery & confectionery products'),
(378, 6, 'Sweets & snack food'),
(385, 13, 'Bedroom'),
(389, 13, 'Bathroom/sauna'),
(390, 13, 'Childrens room'),
(392, 13, 'Office'),
(394, 13, 'other (furniture)'),
(437, 6, 'other'),
(508, 12, 'Other(Machinery)'),
(556, 9, 'Plastic goods'),
(560, 9, 'Plastic profiles'),
(576, 28, 'Programming, Consultancy'),
(581, 28, 'Data processing, Web portals, E-marketing');

-- --------------------------------------------------------

--
-- Table structure for table `item_bundle`
--

CREATE TABLE `item_bundle` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_bundle`
--

INSERT INTO `item_bundle` (`id`) VALUES
(1),
(2),
(3),
(5),
(6),
(7),
(8),
(9),
(11),
(12),
(13),
(21),
(28),
(97),
(542),
(559);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200420200036', '2020-04-20 20:00:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C1FD20CF23` (`item_bundle_id`);

--
-- Indexes for table `form_input`
--
ALTER TABLE `form_input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5B6F9614126F525E` (`item_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251EFD20CF23` (`item_bundle_id`);

--
-- Indexes for table `item_bundle`
--
ALTER TABLE `item_bundle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `form_input`
--
ALTER TABLE `form_input`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=582;

--
-- AUTO_INCREMENT for table `item_bundle`
--
ALTER TABLE `item_bundle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1FD20CF23` FOREIGN KEY (`item_bundle_id`) REFERENCES `item_bundle` (`id`);

--
-- Constraints for table `form_input`
--
ALTER TABLE `form_input`
  ADD CONSTRAINT `FK_5B6F9614126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EFD20CF23` FOREIGN KEY (`item_bundle_id`) REFERENCES `item_bundle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

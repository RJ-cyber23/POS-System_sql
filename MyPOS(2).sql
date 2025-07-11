-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 11, 2025 at 07:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MyPOS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Banks`
--

CREATE TABLE `Banks` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Banks`
--

INSERT INTO `Banks` (`bank_id`, `bank_name`, `account_number`, `create_at`, `update_at`) VALUES
(1, 'yooow', '123', '2025-07-10 10:10:48', '2025-07-10 10:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`brand_id`, `brand_name`) VALUES
(1, 'Panda'),
(2, 'MCDO');

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`category_id`, `category_name`, `create_at`, `update_at`) VALUES
(1, 'School supply', '2025-07-09 09:16:42', '2025-07-09 09:16:42'),
(2, 'Food', '2025-07-10 15:01:30', '2025-07-10 15:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL,
  `customer_code` varchar(25) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `customer_code`, `customer_name`, `contact`, `address`, `create_at`, `update_at`) VALUES
(1, '1100', 'Elong mass', '123', 'star link', '2025-07-10 10:11:30', '2025-07-10 10:11:30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `End_Of_Day_Summary`
-- (See below for the actual view)
--
CREATE TABLE `End_Of_Day_Summary` (
`invoice_date` date
,`total_transactions` bigint(21)
,`total_items_sold` decimal(32,0)
,`total_sales` decimal(42,2)
,`total_cash` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Inventory_Status`
-- (See below for the actual view)
--
CREATE TABLE `Inventory_Status` (
`product_id` int(11)
,`product_name` varchar(100)
,`size` varchar(20)
,`color` varchar(100)
,`quantity_stock_in` decimal(32,0)
,`sales_stock_out` decimal(32,0)
,`quantity_on_hand` decimal(33,0)
,`last_restock_date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `InvoiceCalculatedTotals`
-- (See below for the actual view)
--
CREATE TABLE `InvoiceCalculatedTotals` (
);

-- --------------------------------------------------------

--
-- Table structure for table `Invoices`
--

CREATE TABLE `Invoices` (
  `invoice_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount_tendered` decimal(10,2) DEFAULT NULL,
  `change_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Paid','Partially Paid','Refunded','Pending') DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Invoices`
--

INSERT INTO `Invoices` (`invoice_id`, `customer_id`, `invoice_date`, `total_amount`, `user_id`, `amount_tendered`, `change_amount`, `status`, `create_at`, `update_at`) VALUES
(1, 1, '2025-07-10', 100.00, 1, 100.00, NULL, 'Paid', '2025-07-10 10:15:28', '2025-07-10 10:15:28');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Invoices_Total_Sales`
-- (See below for the actual view)
--
CREATE TABLE `Invoices_Total_Sales` (
`invoice_id` int(11)
,`invoice_date` date
,`customer_name` varchar(50)
,`username` varchar(225)
,`calculated_total_amount` decimal(42,2)
,`total_paid` decimal(32,2)
,`balance` decimal(43,2)
,`payment_status` varchar(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `PaymentMethods`
--

CREATE TABLE `PaymentMethods` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PaymentMethods`
--

INSERT INTO `PaymentMethods` (`payment_method_id`, `method_name`, `description`, `create_at`, `update_at`) VALUES
(1, 'Gcash', NULL, '2025-07-10 10:15:47', '2025-07-10 10:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Payments`
--

INSERT INTO `Payments` (`payment_id`, `invoice_id`, `payment_method_id`, `bank_id`, `amount`, `payment_date`, `user_id`) VALUES
(1, 1, 1, 1, 100.00, '2025-07-10 10:15:54', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Payment_Breakdown`
-- (See below for the actual view)
--
CREATE TABLE `Payment_Breakdown` (
`invoice_id` int(11)
,`customer_name` varchar(50)
,`payment_method_id` int(11)
,`amount` decimal(10,2)
,`payment_date` datetime
,`username` varchar(225)
);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `product_code` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `product_code`, `product_name`, `description`, `category_id`, `brand_id`, `supplier_id`, `create_at`, `update_at`) VALUES
(1, 1001, 'Pen', 'yohoo', 1, 1, 1, '2025-07-09 09:15:21', '2025-07-11 11:18:15'),
(2, 1002, 'bolalo', 'food', 2, 2, 1, '2025-07-10 14:58:37', '2025-07-11 11:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `ProductVariants`
--

CREATE TABLE `ProductVariants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProductVariants`
--

INSERT INTO `ProductVariants` (`variant_id`, `product_id`, `size`, `weight`, `color`, `unit_id`, `base_price`, `cost_price`, `create_at`, `update_at`) VALUES
(1, 1, 'small', '0.6kg', 'red', 1, 8.00, 2.00, '2025-07-09 09:19:00', '2025-07-09 09:20:35'),
(2, 2, 'large', '0.12kl', 'red', 1, 15.00, 8.00, '2025-07-10 15:00:04', '2025-07-10 15:00:04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Profit_For_Product`
-- (See below for the actual view)
--
CREATE TABLE `Profit_For_Product` (
`product_id` int(11)
,`product_name` varchar(100)
,`cost_price` decimal(10,2)
,`base_price` decimal(10,2)
,`ordered_quantity` int(11)
,`sold_quantity` decimal(32,0)
,`total_cost` decimal(20,2)
,`expected_sales` decimal(42,2)
,`total_profit` decimal(43,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseOrderItems`
--

CREATE TABLE `PurchaseOrderItems` (
  `Purchase_Orders_Items_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `ordered_quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `Purchase_Orders_id` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PurchaseOrderItems`
--

INSERT INTO `PurchaseOrderItems` (`Purchase_Orders_Items_id`, `product_id`, `ordered_quantity`, `unit_price`, `received_quantity`, `Purchase_Orders_id`, `create_at`, `update_at`) VALUES
(1, 1, 20, 2.00, 20, 1, '2025-07-09 09:21:55', '2025-07-10 15:16:39'),
(2, 2, 20, 8.00, 20, 1002, '2025-07-10 15:06:03', '2025-07-10 15:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseOrders`
--

CREATE TABLE `PurchaseOrders` (
  `Purchase_Orders_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` enum('Recieved','Process') DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `PurchaseOrders`
--

INSERT INTO `PurchaseOrders` (`Purchase_Orders_id`, `supplier_id`, `order_date`, `status`, `create_at`, `update_at`) VALUES
(1, 1, '2025-07-09', 'Recieved', '2025-07-09 09:23:19', '2025-07-09 12:43:24'),
(1002, 1, '2025-07-11', 'Process', '2025-07-10 15:04:21', '2025-07-10 15:04:35');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Purchase_Orders_Summary`
-- (See below for the actual view)
--
CREATE TABLE `Purchase_Orders_Summary` (
`Purchase_Orders_Items_id` int(11)
,`supplier_name` varchar(50)
,`product_name` varchar(100)
,`ordered_quantity` int(11)
,`unit_price` decimal(10,2)
,`subtotal` decimal(20,2)
,`order_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `ReceiveProducts`
--

CREATE TABLE `ReceiveProducts` (
  `receive_product_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `received_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ReceiveProducts`
--

INSERT INTO `ReceiveProducts` (`receive_product_id`, `product_id`, `quantity`, `unit_price`, `supplier_id`, `received_date`, `user_id`, `create_at`, `update_at`) VALUES
(1, 1, 20, 2.00, 1, '2025-07-09', 1, '2025-07-09 09:43:13', '2025-07-09 09:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE `Sales` (
  `sales_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`sales_id`, `invoice_id`, `product_id`, `quantity`, `unit_price`, `create_at`, `update_at`) VALUES
(1, 1, 1, 2, 8.00, '2025-07-10 10:26:59', '2025-07-10 10:29:56'),
(2, 1, 2, 20, 8.00, '2025-07-11 09:58:06', '2025-07-11 09:58:06');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Sales_Summary`
-- (See below for the actual view)
--
CREATE TABLE `Sales_Summary` (
`invoice_id` int(11)
,`invoice_date` date
,`product_name` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`subtotal` decimal(20,2)
,`username` varchar(225)
);

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

CREATE TABLE `Suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(15) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_contact` varchar(15) NOT NULL,
  `supplier_address` varchar(100) NOT NULL,
  `supplier_email` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `supplier_contact`, `supplier_address`, `supplier_email`, `create_at`, `update_at`) VALUES
(1, '1010', 'dragon', '', '', '', '2025-07-09 09:39:24', '2025-07-09 09:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `Units`
--

CREATE TABLE `Units` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Units`
--

INSERT INTO `Units` (`unit_id`, `unit_name`, `create_at`, `update_at`) VALUES
(1, 'pcs', '2025-07-09 09:20:03', '2025-07-09 09:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `UserRoles`
--

CREATE TABLE `UserRoles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password_hash` varchar(225) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password_hash`, `fullname`, `contact`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'rj', 'asd', '', '', NULL, '2025-07-09 09:42:33', '2025-07-09 09:42:33');

-- --------------------------------------------------------

--
-- Structure for view `End_Of_Day_Summary`
--
DROP TABLE IF EXISTS `End_Of_Day_Summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `End_Of_Day_Summary`  AS SELECT `i`.`invoice_date` AS `invoice_date`, count(distinct `i`.`invoice_id`) AS `total_transactions`, coalesce(sum(`s`.`quantity`),0) AS `total_items_sold`, coalesce(sum(`s`.`quantity` * `s`.`unit_price`),0) AS `total_sales`, coalesce(sum(`p`.`amount`),0) AS `total_cash` FROM ((`Invoices` `i` left join `Sales` `s` on(`s`.`invoice_id` = `i`.`invoice_id`)) left join `Payments` `p` on(`p`.`invoice_id` = `i`.`invoice_id`)) GROUP BY `i`.`invoice_date` ;

-- --------------------------------------------------------

--
-- Structure for view `Inventory_Status`
--
DROP TABLE IF EXISTS `Inventory_Status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Inventory_Status`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`product_name` AS `product_name`, `pv`.`size` AS `size`, `pv`.`color` AS `color`, coalesce(sum(`rp`.`quantity`),0) AS `quantity_stock_in`, coalesce(sum(`s`.`quantity`),0) AS `sales_stock_out`, coalesce(sum(`rp`.`quantity`),0) - coalesce(sum(`s`.`quantity`),0) AS `quantity_on_hand`, max(`rp`.`received_date`) AS `last_restock_date` FROM (((`Products` `p` join `ProductVariants` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `ReceiveProducts` `rp` on(`rp`.`product_id` = `pv`.`variant_id`)) left join `Sales` `s` on(`s`.`product_id` = `p`.`product_id`)) GROUP BY `p`.`product_id`, `pv`.`size`, `pv`.`color` ;

-- --------------------------------------------------------

--
-- Structure for view `InvoiceCalculatedTotals`
--
DROP TABLE IF EXISTS `InvoiceCalculatedTotals`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `InvoiceCalculatedTotals`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `i`.`invoice_date` AS `invoice_date`, `i`.`amount_tendered` AS `amount_tendered`, coalesce(sum(`slt`.`calculated_sub_total`),0) AS `calculated_total_amount`, `i`.`amount_tendered`- coalesce(sum(`slt`.`calculated_sub_total`),0) AS `calculated_change_amount` FROM (`Invoices` `i` left join `SalesLineItemCalculatedTotals` `slt` on(`i`.`invoice_id` = `slt`.`invoice_id`)) GROUP BY `i`.`invoice_id`, `i`.`invoice_date`, `i`.`amount_tendered` ;

-- --------------------------------------------------------

--
-- Structure for view `Invoices_Total_Sales`
--
DROP TABLE IF EXISTS `Invoices_Total_Sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Invoices_Total_Sales`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `i`.`invoice_date` AS `invoice_date`, `c`.`customer_name` AS `customer_name`, `u`.`username` AS `username`, coalesce(sum(`s`.`quantity` * `s`.`unit_price`),0) AS `calculated_total_amount`, coalesce(sum(`p`.`amount`),0) AS `total_paid`, coalesce(sum(`s`.`quantity` * `s`.`unit_price`),0) - coalesce(sum(`p`.`amount`),0) AS `balance`, CASE WHEN coalesce(sum(`p`.`amount`),0) >= coalesce(sum(`s`.`quantity` * `s`.`unit_price`),0) THEN 'Paid' WHEN coalesce(sum(`p`.`amount`),0) > 0 THEN 'Partial' ELSE 'Unpaid' END AS `payment_status` FROM ((((`Invoices` `i` join `Customers` `c` on(`c`.`customer_id` = `i`.`customer_id`)) join `Users` `u` on(`u`.`user_id` = `i`.`user_id`)) left join `Sales` `s` on(`s`.`invoice_id` = `i`.`invoice_id`)) left join `Payments` `p` on(`p`.`invoice_id` = `i`.`invoice_id`)) GROUP BY `i`.`invoice_id` ;

-- --------------------------------------------------------

--
-- Structure for view `Payment_Breakdown`
--
DROP TABLE IF EXISTS `Payment_Breakdown`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Payment_Breakdown`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `c`.`customer_name` AS `customer_name`, `p`.`payment_method_id` AS `payment_method_id`, `p`.`amount` AS `amount`, `p`.`payment_date` AS `payment_date`, `u`.`username` AS `username` FROM (((`Invoices` `i` join `Customers` `c` on(`i`.`customer_id` = `c`.`customer_id`)) join `Payments` `p` on(`p`.`payment_id` = `i`.`invoice_id`)) join `Users` `u` on(`u`.`user_id` = `i`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `Profit_For_Product`
--
DROP TABLE IF EXISTS `Profit_For_Product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Profit_For_Product`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`product_name` AS `product_name`, `pv`.`cost_price` AS `cost_price`, `pv`.`base_price` AS `base_price`, `po`.`ordered_quantity` AS `ordered_quantity`, sum(coalesce(`s`.`quantity`,0)) AS `sold_quantity`, `pv`.`cost_price`* `po`.`ordered_quantity` AS `total_cost`, `pv`.`base_price`* sum(coalesce(`s`.`quantity`,0)) AS `expected_sales`, `pv`.`base_price`* sum(coalesce(`s`.`quantity`,0)) - `pv`.`cost_price` * `po`.`ordered_quantity` AS `total_profit` FROM (((`Products` `p` join `ProductVariants` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `PurchaseOrderItems` `po` on(`po`.`product_id` = `pv`.`variant_id`)) left join `Sales` `s` on(`s`.`product_id` = `p`.`product_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `Purchase_Orders_Summary`
--
DROP TABLE IF EXISTS `Purchase_Orders_Summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Purchase_Orders_Summary`  AS SELECT `poi`.`Purchase_Orders_Items_id` AS `Purchase_Orders_Items_id`, `s`.`supplier_name` AS `supplier_name`, `p`.`product_name` AS `product_name`, `poi`.`ordered_quantity` AS `ordered_quantity`, `poi`.`unit_price` AS `unit_price`, `poi`.`ordered_quantity`* `poi`.`unit_price` AS `subtotal`, `po`.`order_date` AS `order_date` FROM (((`PurchaseOrderItems` `poi` join `Suppliers` `s` on(`s`.`supplier_id` = `poi`.`Purchase_Orders_Items_id`)) join `Products` `p` on(`p`.`product_id` = `poi`.`Purchase_Orders_Items_id`)) join `PurchaseOrders` `po` on(`po`.`Purchase_Orders_id` = `poi`.`Purchase_Orders_Items_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `Sales_Summary`
--
DROP TABLE IF EXISTS `Sales_Summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Sales_Summary`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `i`.`invoice_date` AS `invoice_date`, `p`.`product_name` AS `product_name`, `s`.`quantity` AS `quantity`, `s`.`unit_price` AS `unit_price`, `s`.`quantity`* `s`.`unit_price` AS `subtotal`, `u`.`username` AS `username` FROM (((`Sales` `s` join `Products` `p` on(`s`.`product_id` = `p`.`product_id`)) join `Invoices` `i` on(`i`.`invoice_id` = `s`.`invoice_id`)) join `Users` `u` on(`u`.`user_id` = `s`.`sales_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Banks`
--
ALTER TABLE `Banks`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `customer_id` (`customer_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `PaymentMethods`
--
ALTER TABLE `PaymentMethods`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `ProductVariants`
--
ALTER TABLE `ProductVariants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `PurchaseOrderItems`
--
ALTER TABLE `PurchaseOrderItems`
  ADD PRIMARY KEY (`Purchase_Orders_Items_id`),
  ADD KEY `Purchase_Orders_id` (`Purchase_Orders_id`),
  ADD KEY `variant_id` (`product_id`);

--
-- Indexes for table `PurchaseOrders`
--
ALTER TABLE `PurchaseOrders`
  ADD PRIMARY KEY (`Purchase_Orders_id`),
  ADD KEY `product_id` (`order_date`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `ReceiveProducts`
--
ALTER TABLE `ReceiveProducts`
  ADD PRIMARY KEY (`receive_product_id`),
  ADD KEY `product_id` (`supplier_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `variant_id` (`product_id`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `invoice_id` (`invoice_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `Units`
--
ALTER TABLE `Units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `UserRoles`
--
ALTER TABLE `UserRoles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Banks`
--
ALTER TABLE `Banks`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Brand`
--
ALTER TABLE `Brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Invoices`
--
ALTER TABLE `Invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `PaymentMethods`
--
ALTER TABLE `PaymentMethods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ReceiveProducts`
--
ALTER TABLE `ReceiveProducts`
  MODIFY `receive_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Sales`
--
ALTER TABLE `Sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Suppliers`
--
ALTER TABLE `Suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UserRoles`
--
ALTER TABLE `UserRoles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD CONSTRAINT `Invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Invoices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `Banks` (`bank_id`),
  ADD CONSTRAINT `Payments_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `PaymentMethods` (`payment_method_id`),
  ADD CONSTRAINT `Payments_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`),
  ADD CONSTRAINT `Payments_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`brand_id`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`),
  ADD CONSTRAINT `Products_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`supplier_id`);

--
-- Constraints for table `ProductVariants`
--
ALTER TABLE `ProductVariants`
  ADD CONSTRAINT `ProductVariants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`),
  ADD CONSTRAINT `ProductVariants_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `Units` (`unit_id`);

--
-- Constraints for table `PurchaseOrderItems`
--
ALTER TABLE `PurchaseOrderItems`
  ADD CONSTRAINT `PurchaseOrderItems_ibfk_1` FOREIGN KEY (`Purchase_Orders_id`) REFERENCES `PurchaseOrders` (`Purchase_Orders_id`),
  ADD CONSTRAINT `PurchaseOrderItems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `PurchaseOrders`
--
ALTER TABLE `PurchaseOrders`
  ADD CONSTRAINT `PurchaseOrders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`supplier_id`);

--
-- Constraints for table `ReceiveProducts`
--
ALTER TABLE `ReceiveProducts`
  ADD CONSTRAINT `ReceiveProducts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ReceiveProducts_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`supplier_id`),
  ADD CONSTRAINT `ReceiveProducts_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`invoice_id`),
  ADD CONSTRAINT `Sales_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `UserRoles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

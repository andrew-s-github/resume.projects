CREATE TABLE `products` (
  `product_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) NOT NULL COMMENT 'lamp/stool/chair/table',
  `product_name` varchar(255) NOT NULL,
  `cost` int NOT NULL,
  `sale_price` int NOT NULL,
  `profit` int NOT NULL,
  `vendor_id` int NOT NULL
);

CREATE TABLE `stores` (
  `store_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `manager` varchar(50) NOT NULL
);

CREATE TABLE `vendor` (
  `vendor_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `contact_phone` varchar(50) NOT NULL COMMENT 'phone number',
  `contact_email` varchar(50) NOT NULL COMMENT 'email'
);

CREATE TABLE `user` (
  `user_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
);

CREATE TABLE `user_information` (
  `user_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `address` varchar(250) NOT NULL
);

CREATE TABLE `sales` (
  `sale_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `sale_price` int NOT NULL,
  `quantity` int NOT NULL,
  `total_cost` int NOT NULL COMMENT 'Quantity*cost'
);

CREATE TABLE `shipping` (
  `shipping_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_cost` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
);

CREATE UNIQUE INDEX `product_name_UNIQUE` ON `products` (`product_name`);

CREATE INDEX `vendor_id` ON `products` (`vendor_id`);

CREATE UNIQUE INDEX `name_UNIQUE` ON `vendor` (`name`);

CREATE UNIQUE INDEX `username_UNIQUE` ON `user` (`username`);

ALTER TABLE `sales` ADD FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

ALTER TABLE `user_information` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`vendor_id`) REFERENCES `products` (`vendor_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

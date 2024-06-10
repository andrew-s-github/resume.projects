use sandberg_business;

CREATE TABLE if not exists `follows` (
  `following_user_id` integer,
  `followed_user_id` integer,
  `created_at` timestamp
);

CREATE TABLE if not exists `user` (
  `user_id` integer PRIMARY KEY,
  `username` varchar(255),
  `role` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `user_information` (
  `user_id` integer,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `age` integer,
  `payment_type` varchar(255),
  `credit_card` integer,
  `address` varchar(250)
);

CREATE TABLE `posts` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `user_id` integer,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `advertisement_click` (
  `ad_id` int,
  `user_id` integer,
  `body` text COMMENT 'Content of the ad',
  `viewed_at` timestamp,
  `clicked` boolean
);

CREATE TABLE `advertisement_info` (
  `ad_id` integer PRIMARY KEY,
  `product_id` integer,
  `type` varchar(50), -- 'short-video/long-video/image/etc' 
  `brand` varchar(50),
  `total_views` integer,
  `total_clicks` integer,
  `start_date` date,
  `end_date` date,
  `time_ran` date COMMENT 'end_date-start_date=time_running'
);

CREATE TABLE `sales` (
  `sale_id` integer PRIMARY KEY,
  `user_id` integer,
  `product_id` integer,
  `sale_price` integer,
  `quantity` integer,
  `total_cost` integer COMMENT 'Quantity*cost',
  `time_of_order` timestamp
);

CREATE TABLE `products` (
  `product_id` integer PRIMARY KEY,
  `product_type` varchar(255) COMMENT 'lamp/stool/chair/table',
  `description` varchar(255),
  `cost` integer,
  `sale_price` integer,
  `profit` integer,
  `vendor_id` integer,
  `body` text COMMENT 'additional context'
);

CREATE TABLE `vendor` (
  `vendor_id` integer PRIMARY KEY,
  `product_id` integer,
  `name` varchar(50),
  `type` varchar(255),
  `description` varchar(255),
  `contact_phone` varchar(50) COMMENT 'phone number',
  `contact_email` varchar(50) COMMENT 'email'
);

CREATE TABLE `orders` (
  `order_id` integer PRIMARY KEY,
  `product_id` integer,
  `store_id` integer,
  `vendor_id` integer,
  `cost` integer,
  `quantity` integer,
  `total_cost` integer COMMENT 'quantity*cost',
  `created_at` timestamp
);

CREATE TABLE `stores` (
  `store_id` integer PRIMARY KEY,
  `region` varchar(50),
  `address` varchar(50),
  `phone` varchar(50),
  `manager` varchar(50)
);

CREATE TABLE `inventory` (
  `store_id` integer,
  `product_id` integer,
  `count` integer
);

CREATE TABLE `employees` (
  `employee_id` integer PRIMARY KEY,
  `store_id` integer,
  `title` varchar(50),
  `first_name` varchar(50),
  `last_name` varchar(50),
  `address` varchar(250),
  `phone_number` varchar(50),
  `emergency_contact` varchar(50)
);

CREATE TABLE `payrate` (
  `employee_id` integer,
  `total_compensation` integer
);

CREATE TABLE `pay_information` (
  `employee_id` integer,
  `insurance_id` integer,
  `title` varchar(50),
  `pay_rate` integer,
  `hours_worked` integer,
  `bi_weekly_pay` integer,
  `insurance_deduction` integer COMMENT 'by-weekly insurance deduciton',
  `tax_withheld` integer,
  `bonuses` integer,
  `total_compensation` integer
);

CREATE TABLE `insurance` (
  `insurance_id` integer PRIMARY KEY,
  `company` varchar(50),
  `type` varchar(50) COMMENT 'full coverage/dental/eye/family',
  `insurance_level` integer COMMENT 'different "levels" within the same tier ',
  `cost_to_company` integer,
  `cost_to_employee` integer
);

CREATE TABLE `shipping` (
  `shipping_id` integer PRIMARY KEY,
  `user_id` integer,
  `address` varchar(250),
  `product_id` integer,
  `quantity` integer,
  `time_of_order` timestamp
);

inventoryALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`following_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `advertisement_click` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`user_id`) REFERENCES `sales` (`user_id`);

ALTER TABLE `user_information` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`sale_price`) REFERENCES `products` (`sale_price`);

ALTER TABLE `employees` ADD FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`time_of_order`) REFERENCES `sales` (`time_of_order`);

ALTER TABLE `advertisement_info` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `advertisement_click` ADD FOREIGN KEY (`ad_id`) REFERENCES `advertisement_info` (`ad_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`cost`) REFERENCES `products` (`cost`);

ALTER TABLE `pay_information` ADD FOREIGN KEY (`insurance_deduction`) REFERENCES `insurance` (`cost_to_employee`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `vendor` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `pay_information` ADD FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

ALTER TABLE `payrate` ADD FOREIGN KEY (`total_compensation`) REFERENCES `pay_information` (`total_compensation`);

ALTER TABLE `payrate` ADD FOREIGN KEY (`employee_id`) REFERENCES `pay_information` (`employee_id`);

ALTER TABLE `pay_information` ADD FOREIGN KEY (`title`) REFERENCES `employees` (`title`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`product_id`) REFERENCES `sales` (`product_id`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`quantity`) REFERENCES `sales` (`quantity`);

ALTER TABLE `shipping` ADD FOREIGN KEY (`address`) REFERENCES `user_information` (`address`);

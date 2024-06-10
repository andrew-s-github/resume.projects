SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `sandberg_business`.`products` 
DROP FOREIGN KEY `products_ibfk_1`;
ALTER TABLE `sandberg_business`.`products` 
CHANGE COLUMN `product_id` `product_id` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `product_type` `product_type` VARCHAR(255) NOT NULL COMMENT 'lamp/stool/chair/table' ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `cost` `cost` INT NOT NULL ,
CHANGE COLUMN `sale_price` `sale_price` INT NOT NULL ,
CHANGE COLUMN `profit` `profit` INT NOT NULL ,
CHANGE COLUMN `vendor_id` `vendor_id` INT NOT NULL ,
ADD UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE;
;
ALTER TABLE `sandberg_business`.`products` 
ADD CONSTRAINT `products_ibfk_1`
  FOREIGN KEY (`vendor_id`)
  REFERENCES `sandberg_business`.`vendor` (`vendor_id`);
  
  SET FOREIGN_KEY_CHECKS = 1;
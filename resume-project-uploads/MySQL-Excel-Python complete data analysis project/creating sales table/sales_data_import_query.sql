SELECT * FROM sandberg_business.sales;


-- deleting files from first failed import 
DELETE FROM sandberg_business.sales;

-- did not create time of order column yet 
ALTER TABLE sandberg_business.sales
DROP COLUMN time_of_order;

alter table sandberg_business.sales
add column store_id int;

alter table sandberg_business.sales
add foreign key (store_id) references sandberg_business.stores(store_id);

alter table sandberg_business.sales
modify store_id int
after product_id;

-- load sales table created in python into sales table
LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating sales table\\sales_table.csv' 
INTO TABLE sandberg_business.sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- deleted secure_file_priv to import sales table
SHOW VARIABLES LIKE "secure_file_priv";






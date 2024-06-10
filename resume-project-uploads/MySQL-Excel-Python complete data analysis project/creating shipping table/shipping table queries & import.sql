select * from sandberg_business.orders;

-- altering table to fit new contents 

-- adding user_id column

alter table sandberg_business.orders
add column user_id int;

-- declaring user_id as a FK from user_information table

alter table sandberg_business.orders
add foreign key (user_id) references sandberg_business.user(user_id); 

-- adding first name column

alter table sandberg_business.orders
add column first_name varchar(50);

-- adding last name column

alter table sandberg_business.orders
add column last_name varchar(50);

-- adding address column

alter table sandberg_business.orders
add column address varchar(50);
-- 
LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating shipping table\\orders_table.csv' 
INTO TABLE sandberg_business.orders
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- deleting files from first failed import 
DELETE FROM sandberg_business.orders;
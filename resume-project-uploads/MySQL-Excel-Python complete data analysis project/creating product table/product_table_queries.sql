SELECT * FROM sandberg_business.products;

-- load product table
LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating product table \\product_table.csv' 
INTO TABLE sandberg_business.sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- view products by vendor id

select sum(cost),sum(sale_price),sum(profit),count(vendor_id),vendor_id
from sandberg_business.products
group by vendor_id;

-- view products by product type

select sum(cost),sum(sale_price),sum(profit),count(product_type), product_type
from sandberg_business.products
group by product_type;
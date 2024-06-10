SELECT * FROM sandberg_business.stores;

-- load stores table
LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating stores table\\stores_table.csv' 
INTO TABLE sandberg_business.sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
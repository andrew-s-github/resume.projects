SELECT * FROM sandberg_business.user;

-- load user table

LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating user table\\user_table_clean.csv' 
INTO TABLE sandberg_business.sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- exploring role

select role, count(role) from sandberg_business.user
group by role;
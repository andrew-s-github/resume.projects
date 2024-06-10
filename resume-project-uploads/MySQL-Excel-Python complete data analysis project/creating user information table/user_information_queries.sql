SELECT * FROM sandberg_business.user_information;

-- load user_information table
LOAD DATA INFILE 'C:\\Users\\drewg\\OneDrive\\Desktop\\sandberg_business_sql_data_creation\\creating user information table\\user_table_clean.csv' 
INTO TABLE sandberg_business.sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- exploring age

select age,count(age) from sandberg_business.user_information
group by age;

-- exploring address

select address,count(address) from sandberg_business.user_information
group by address;
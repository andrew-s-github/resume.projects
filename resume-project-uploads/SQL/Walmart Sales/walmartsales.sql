-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;
USE walmartSales;
-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Data cleaning
SELECT
	*
FROM sales;

SELECT time,
(CASE 
WHEN `time` between "00:00:00" AND "12:00:00" THEN "Morning"
WHEN `time` between "12:01:00" AND "16:00:00" THEN "Afternoon"
ELSE "Evening"
END
)AS time_of_day
 from sales;
 
  ALTER TABLE sales ADD COLUMN time_of_day varchar(25);
  
  UPDATE sales
  SET time_of_day = (CASE
  WHEN `time` between "00:00:00" AND "12:00:00" THEN "Morning"
  WHEN `time` between "12:01:00" AND "16:00:00" THEN "Afternoon"
  ELSE "Evening"
  END
);

-- DAY NAME 

SELECT 
	date,
    DAYNAME(date)
FROM sales;

AlTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


SELECT
	date,
    MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date); 

---------------------------------------------
-- EDA

SELECT 
	DISTINCT city, branch
FROM sales;

-- how many unique product lines?

SELECT
	DISTINCT product_line
FROM sales;

-- most common payment method?
SELECT
	COUNT(PAYMENT) as count,PAYMENT as payment_method
    FROM SALES
    GROUP BY payment_method
    ORDER BY count DESC;
    
-- most selling product line

SELECT
	COUNT(product_line) as count,product_line
    FROM SALES
    GROUP BY product_line
    ORDER BY count DESC;
    
    -- total revenue by month
    SELECT 
		month_name AS month,
        SUM(total) as total_revenue
	FROM sales
    GROUP BY month_name
    ORDER BY total_revenue;
    
    -- which month had the largest cogs 
	SELECT 
		month_name AS month,
        SUM(cogs) as cogs
	FROM sales
    GROUP BY month_name
    ORDER BY cogs DESC;
    
    SELECT 
		product_line,
        SUM(total) as total_revenue
	FROM sales
    GROUP BY product_line
    ORDER BY total_revenue DESC;
    
    -- city with largest revenue
    
    SELECT 
		city, branch,
        SUM(total) as total_revenue
	FROM sales
    GROUP BY city
    ORDER BY total_revenue DESC;
    
    -- what product line had the largest vat
    SELECT 
		product_line, AVG(tax_pct) AS avg_tax
	FROM sales
    GROUP BY product_line
    ORDER BY avg_tax;
    
    -- what branch sold more products than average product sold?
    SELECT 
		branch,
        sum(quantity) as qty
	FROM sales
    GROUP BY branch
    HAVING sum(quantity) > (SELECT AVG(quantity) FROM sales);
    
    -- most common product line by gender?
    SELECT 
		gender,
		product_line,
        COUNT(gender) as total_cnt
	FROM SALES 
    GROUP BY gender, product_line
    ORDER BY total_cnt DESC;
    
    -- average rating of each product line?
    
    SELECT 
		ROUND(AVG(rating), 2) as avg_rating,
        product_line
	FROM SALES
    GROUP BY product_line
    ORDER BY avg_rating DESC;
    
    
    
    ----------------------------
    -- Sales
    
    -- number of sales made in each time of the day per week
    SELECT 
		time_of_day,
        count(*) as total_sales
	FROM sales
    WHERE day_name="Monday"
    GROUP BY time_of_day
    ORDER BY total_sales DESC;
    
    -- which customer type brings most revenue
    
    select 
		customer_type,
        SUM(total) as total
	FROM sales
    GROUP BY CUSTOMER_TYPE;
    
    -- which city has largest tax percet 
    SELECT 
		city, max(tax_pct)
	FROM sales
    ORDER BY tax_pct;
    
    -- Which customer type pays the most in VAT?
    SELECT 
		customer_type, sum(tax_pct)
	FROM sales
    GROUP BY customer_type;
    
    -- How many unique customer types does the data have?
    
    SELECT DISTINCT
		customer_type
	FROM sales ;
    
    -- How many unique payment methods does the data have?
    SELECT DISTINCT
		payment
	FROM sales;    
    
    -- What is the most common customer type?
    SELECT
		count(customer_type), customer_type
	FROM sales
    GROUP BY customer_type;
    
    -- Which customer type buys the most?
    SELECT
		customer_type, sum(quantity)
	FROM sales
    GROUP BY customer_type;
    
    -- What is the gender of most of the customers?
    SELECT 
		gender, count(gender)
	FROM sales
    GROUP BY gender;
    
    -- What is the gender distribution per branch?
    SELECT
		gender, count(gender), branch
	FROM sales
    GROUP BY gender, branch
    ORDER BY branch ASC;
    
    -- Which time of the day do customers give most ratings?
    
    SELECT 
		time_of_day, count(rating) AS rating_count
	FROM sales
    GROUP BY time_of_day;
    
    -- Which time of the day do customers give most ratings per branch?
    SELECT 
		time_of_day, count(rating) AS rating_count, branch
	FROM sales
    GROUP BY time_of_day, branch
    ORDER BY branch ASC;
    
    -- Which day of the week has the best avg ratings?
    SELECT 
		day_name, avg(rating) AS rating_avg
	FROM sales
    GROUP BY day_name
    ORDER BY rating_avg DESC;
    
    -- Which day of the week has the best average ratings per branch?
    
    SELECT 
		day_name, avg(rating) AS rating_avg, branch
	FROM sales
    GROUP BY day_name, branch
    ORDER BY branch ASC;
    
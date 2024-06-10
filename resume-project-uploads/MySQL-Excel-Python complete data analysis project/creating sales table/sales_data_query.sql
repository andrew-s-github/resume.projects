SELECT * FROM sandberg_business.sales;

-- sales table query

-- selecting sum total cost by user

SELECT user_id,sum(total_cost) 
FROM sandberg_business.sales 
GROUP BY user_id 
ORDER BY sum(total_cost) 
DESC LIMIT 20;

-- total quantity of each product

select product_id , sum(quantity)
from sandberg_business.sales
group by product_id
order by sum(quantity)
desc limit 20;

-- total cost of each product

select product_id,sum(total_cost)
from sandberg_business.sales
group by product_id;

-- join examples

-- join name on user to see name of user instead of id. 
-- in the future you could join more information, like an address on user_id for shipping information.

select sum(s.total_cost),u.role
from sandberg_business.sales as s
inner join (SELECT user_id, role FROM sandberg_business.user) as u
on s.user_id = u.user_id
group by u.role
order by sum(s.total_cost) desc
limit 10; 


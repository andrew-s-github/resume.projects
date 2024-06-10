-- joins

-- sales table joins

SELECT * FROM sandberg_business.user_information;

select * from sandberg_business.shipping;

select * from sandberg_business.products;

select * from sandberg_business.sales;

SELECT * FROM sandberg_business.user;

SELECT * FROM sandberg_business.stores;

SELECT * FROM sandberg_business.vendor;

-- example of creating shipping table from sales table 

select sbs.*,sbu.first_name, sbu.last_name, sbu.address
from sandberg_business.sales as sbs
inner join sandberg_business.user_information as sbu 
on sbs.user_id = sbu.user_id;

-- you could add age for visualization purposes

select sbs.*,sbu.first_name, sbu.last_name, sbu.address,sbu.age
from sandberg_business.sales as sbs
inner join sandberg_business.user_information as sbu 
on sbs.user_id = sbu.user_id;

-- adding information to shipping table for the purpose of creating the view here to then use for visualization instead of using excel

create view shipping_product_view as 
select sbv.name as vendor_name,sbs.*, prod.product_name, prod.product_type,prod.cost,prod.sale_price,prod.profit 
from sandberg_business.shipping as sbs
inner join sandberg_business.products as prod on sbs.product_id = prod.product_id
inner join sandberg_business.vendor as sbv on sbs.vendor_id = sbv.vendor_id 
order by sbs.shipping_id asc;

-- total cost of products in shipping by vendor 

select sbs.vendor_id,sum(sbs.total_cost), prod.product_name, prod.product_type,prod.cost,prod.sale_price,prod.profit 
from sandberg_business.shipping as sbs
inner join sandberg_business.products as prod
on sbs.product_id = prod.product_id
group by sbs.vendor_id;

-- total cost of products in shipping by product type

select sbs.vendor_id,sum(sbs.total_cost), prod.product_type 
from sandberg_business.shipping as sbs
inner join sandberg_business.products as prod
on sbs.product_id = prod.product_id
group by prod.product_type;

-- selecting total cost and quantity and grouping by address and product to see the quantity and cost of product to be sent to each address

select sbs.vendor_id,sum(sbs.total_cost),sum(sbs.quantity),sbs.address, prod.product_name, prod.product_type,prod.cost,prod.sale_price,prod.profit 
from sandberg_business.shipping as sbs
inner join sandberg_business.products as prod
on sbs.product_id = prod.product_id
group by sbs.address,prod.product_name;

-- total cost and quantity by product

select sbs.vendor_id,sum(sbs.total_cost),sum(sbs.quantity), prod.product_name, prod.product_type,prod.cost,prod.sale_price,prod.profit 
from sandberg_business.shipping as sbs
inner join sandberg_business.products as prod
on sbs.product_id = prod.product_id
group by prod.product_name;

-- joining role onto user information table

select ui.*,u.role
from sandberg_business.user_information as ui
join sandberg_business.user as u 
on u.user_id = ui.user_id;

-- joining store address to shipping table, if you were to distribute from the storefront

select sbs.*,stores.address
from sandberg_business.shipping as sbs
inner join sandberg_business.stores as stores
on sbs.store_id = stores.store_id;

-- example of to check joins

SELECT COUNT(*)
FROM sandberg_business.shipping as sbs
INNER JOIN sandberg_business.stores as stores
ON sbs.store_id = stores.store_id;


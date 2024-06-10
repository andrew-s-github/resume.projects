select saleDate, Amount, Customers from `awesome chocolates`.sales;

-- Amount in each box 

select SaleDate, Amount, Boxes, Amount / Boxes as 'amount per box' from `awesome chocolates`.sales ;

 --  Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
select * from `awesome chocolates`.sales
where Amount > 2000 and Boxes < 100;

--  How many shipments (sales) each of the sales persons had in the month of January 2022?

SELECT sum(amount) as 'sum',SPID, month(SaleDate) as 'month', year(SaleDate) as 'year' from `awesome chocolates`.sales
where month(saleDate)=1 and year(Saledate)='2022'
GROUP BY SPID
order by sum(amount) desc;

--  Which product sells more boxes? Milk Bars or Eclairs?
-- milk bar p01 ecalirs p06

SELECT PID, sum(boxes) from `awesome chocolates`.sales
where PID = 'P01' or PID = 'P06'
group by PID
order by sum(boxes) desc;

-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

SELECT PID, sum(Boxes) as boxes, year(SaleDate) as year ,month(SaleDate) as month , day(SaleDate) as day FROM `awesome chocolates`.sales
WHERE year(SaleDate)=2022 and month(SaleDate)=2 and day(SaleDate) < 15
GROUP BY PID
HAVING PID = 'P01' or PID = 'P06';


-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

SELECT Customers, Boxes, weekday(SaleDate) from `awesome chocolates`.sales
where weekday(SaleDate) = 2 and customers < 100 and Boxes < 100  
ORDER BY Boxes desc;

-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?
SELECT `awesome chocolates`.people.SPID,`awesome chocolates`.people.Salesperson,`awesome chocolates`.sales.spid,year(`awesome chocolates`.sales.SaleDate) as year, month(`awesome chocolates`.sales.SaleDate) as month , day(`awesome chocolates`.sales.SaleDate) as day
from `awesome chocolates`.people
inner join `awesome chocolates`.sales on `awesome chocolates`.people.SPID = `awesome chocolates`.sales.spid
where year(`awesome chocolates`.sales.SaleDate) = 2022 and month(`awesome chocolates`.sales.SaleDate) = 1 and day(`awesome chocolates`.sales.SaleDate) < 8
group by Salesperson
order by `awesome chocolates`.sales.spid; 
-- Which salespersons did not make any shipments in the first 7 days of January 2022?

-- How many times we shipped more than 1,000 boxes in each month?

select sum(boxes),month(SaleDate) from `awesome chocolates`.sales
group by month(SaleDate);

-- Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?
-- NZ G4
-- P11 after nines

select GeoID, Month(SaleDate) as month,year(SaleDate) as year, PID, boxes from `awesome chocolates`.sales
WHERE GeoID = 'G4' and PID = 'P11'
GROUP BY month(SaleDate), year(SaleDate);

-- India or Australia? Who buys more chocolate boxes on a monthly basis?

select GeoID, PID, month(SaleDate), sum(Boxes) from `awesome chocolates`.sales
Where (GeoId = 'G1' or GeoId='G5')
Group by month(SaleDate),geoID;


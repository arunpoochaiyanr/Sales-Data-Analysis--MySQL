create database if not exists sales_data_analysis;
use sales_data_analysis;
show tables;
select * from sales_data;
describe sales_data;

-- 1.	Retrieve the total number of orders
select count(*) TotalNOofOrders
from sales_data;

-- 2.	Calculate the total sales amount.
select round(sum(sales),2) Total_Sales 
from sales_data;

-- 3.	Find the average quantity ordered per order.
select OrderNumber,round(avg(quantityordered),2) `Average No. of Order`
from sales_data 
group by ordernumber
order by ordernumber;

-- 4.	List the orders with a status of 'Cancelled'.
select * 
from sales_data
where status like 'cancelled'
order by ordernumber;
-- or
select *
from sales_data
where status = 'cancelled'
order by ordernumber;

-- 5.	Identify the month with the highest total sales.
select month_id Month, round(sum(sales)) TotalSales
from sales_data
group by month_id
order by totalsales desc limit 1;
-- or
select month_id, sum(sales) ,
rank() over( order by sum(sales) desc ) as sales_order
from sales_data
group by month_id;

-- 6.	Find the top 5 customers with the highest total sales.
select CustomerName,round(sum(sales),2) TotalSales
from sales_data
group by customername
order by  totalsales desc limit 5;

-- 7.	Calculate the average price for each product line.
select ProductLine,round(avg(sales),2) AvgSales
from sales_data
group by productline
order by productline;

-- 8.	List the orders made in the year 2003.
select *
from sales_data
where year_id = 2003;

-- 9.	Find the total sales amount for each product line.
select ProductLine,round(sum(sales),2) TotalSales
from sales_data
group by productline
order by productline;

-- 10.	Calculate the total sales for each country.
select Country,round(sum(sales),2) TotalSales
from sales_data
group by country
order by country;

-- 11.	Identify the product line with the highest total sales.
select ProductLine, max(sales) MaxSales
from sales_data
group by productline
order by maxsales desc limit 1;
-- or 
select ProductLine, Sales
from sales_data
where sales = (select max(sales) from sales_data);

-- 12.	List the orders with a quantity ordered greater than 50.
select *
from sales_data
where quantityordered >50;

-- 13.	Find the average price each year.
select year_id Year, round(avg(sales),2)  AvgSales
from sales_data
group by year_id;
 
 -- 14.	Calculate the total sales for each territory.
 select territory Territory , round(sum(sales),2) SalesByTerritory
 from sales_data
 group by territory
 order by territory asc;
 
 -- 15.	Identify the ordernumber with the min sales
 select OrderNumber,Sales MinSales
 from sales_data
 where sales = (select round(min(sales),2) from sales_data);
 
 -- 16.	List the orders made by customers in 'NYC'.
 select *
 from sales_data
 where city = 'nyc';
 
 -- 17.	Calculate the total sales for each quarter
 select qtr_id Quater,round(sum(sales),2) Sales
 from sales_data
 group by qtr_id;
 
 -- 18.	Find the total sales amount for each customer.
 select CustomerName,round(sum(sales),2) Sales
 from sales_data
 group by customername
 order by sales desc;
 
 
 -- 19.	Identify the orders with a deal size of 'small' and status 'cancelled' 
 select *
 from sales_data
 where dealsize like 'small' and status like 'cancelled';
 
 -- 20.	List the orders with a status of 'On Hold'.
 select *
 from sales_data
 where status like 'on hold';
 
 -- 21.	Calculate the total sales for each month in the year 2024.
 select year_id Year,month_id Month,round(sum(sales),2) TotalSales
 from sales_data
 where year_id = 2004
 group by month_id
 order by month_id;
 
 -- 22.	Identify the orders with a price each higher than the MSRP.
 select * 
 from sales_data
 where priceeach > msrp;
 
 -- 23.	List the orders with a sales amount greater than $10000.
 select ordernumber OrderNumber,sales Sales
 from sales_data
 where sales >10000
 order by sales desc;
 
 -- 24.	Find the average quantity ordered per customer.
 select customername CustomerName, avg(quantityordered) AverageOrderQuantity
 from sales_data
 group by customername;
 
 -- 25.	Calculate the total sales for each state in USA
 select state State, round(sum(sales),2) Sales
 from sales_data
 where country like 'usa'
 group by state
 order by state;
 
 -- 26.	Identify the product line with the lowest total sales.
 select ordernumber OrderNumber,productline ProductLine,sales
 from sales_data
 where sales = (select min(sales) 
				from sales_data);
                
-- 27.	List the orders made by customers with the last name 'Young'.
select *
from sales_data
where contactlastname like 'young';

-- 28.	Calculate the total sales for each city.
select country Country,city City,round(sum(sales),2) TotalSales
from sales_data
group by city,country
order by country asc , totalsales desc;

-- 29.	Find the orders placed on weekends.
select *
from sales_data
where dayofweek(orderdate) in (1,7)
order by orderdate;

-- 30.	Identify the product line with the highest average sales price.
select productline ProductLine,round(avg(sales),2) HighestAverageSales
from sales_data
group by productline
order by avg(sales) desc
limit 1;

-- 31.	List the orders with a quantity ordered less than 10.
select *
from sales_data
where quantityordered <10;

-- 32.	Calculate the total sales for each postal code.
select postalcode PostalCode, round(sum(sales),2) TotalSales
from sales_data
where postalcode <>''
group by postalcode
order by TotalSales desc;

-- 33.	Find the orders made by customers located in 'New York'.
select *
from sales_data
where state like 'ny';

-- 34.	Identify the orders with a status of 'In Process'
select *
from sales_data
where status like 'in process';

-- 35.	List the orders with a deal size of 'Small'.
select *
from sales_data
where dealsize = 'small';

-- 36.	Calculate the total sales made on 3rd quater and status like shipped
select *
from sales_data
where status like 'shipped' and qtr_id like 3;

-- 37.	Identify the orders with a price each lower than the MSRP.
select *
from sales_data
where priceeach < msrp;

-- 38.	List the orders made by customers located in 'London'.
select *
from sales_data
where city like 'london';

-- 39.	Calculate the total sales for each day of the week.
select dayofweek(orderdate) DayNumberofWeek,round(sum(sales),2) TotalSales
from sales_data
group by daynumberofweek
order by TotalSales desc;

-- 40.	Identify the orders with a status of 'Shipped'.
select *
from sales_data
where status like 'shipped';

-- 41.	List the orders with a quantity ordered between 20 and 30.
select *
from sales_data
where quantityordered between 20 and 30;

-- 42.	Calculate the total sales for each product code.
select productcode ProductCode, round(sum(sales),2) TotalSales
from sales_data
group by productcode;

-- 43.	Find the average price for each product code.
select productcode ProductCode, round(avg(priceeach),2) AvgPrice
from sales_data
group by productcode;

-- 44.	Identify the orders with a deal size of 'Medium'.
select *
from sales_data
where dealsize = 'medium';

-- 45.	List the orders made by customers with the first name 'paul'.
select * 
from sales_data
where contactfirstname = 'paul';

-- 46.	Calculate the total sales for each month of the year.
select year_id Year,month_id Month,round(sum(sales),2) Total_Sales
from sales_data
group by year_id, month_id
order by year_id, month_id asc;

-- 47.	Identify the orders made by customers located in 'Paris'.
select ordernumber OrderNumber, customername CustomerNameAtParis
from sales_data
where city  = 'paris';

-- 48.	List the orders with a quantity ordered equal to 1.
select * 
from sales_data
where quantityordered = 1;

-- 49.	Calculate the total sales for each product line in the year 2004.
select productline ProductLine,round(sum(sales),2) TotalSalesIN2004
from sales_data
where year_id = 2004
group by productline;

-- 50.	Identify the orders with a status of 'Resolved'.
select * 
from sales_data
where status = 'resolved';

-- 51.	List the orders with a deal size of 'Small' and a sales amount less than $500.
select *
from sales_data
where dealsize like 'small' and sales < 5000;

-- 52.	Calculate the total sales for each day of the month.
select day(orderdate) OrderDate,round(sum(sales),2) TotalSales
from sales_data
group by orderdate
order by totalsales desc;

-- 53.	Identify the orders with a price each equal to the MSRP.
select ordernumber OrderNumber, priceeach PriceEach,msrp MSRP
from sales_data
where priceeach = msrp;

-- 54.	List the orders made by customers located in 'Sydney'.
select * 
from sales_data
where city like 'sydney';

-- 55.	Calculate the total sales for each contact's first name.
select contactfirstname FirstName, round(sum(sales),2) TotalSales
from sales_data
group by contactfirstname
order by contactfirstname;

-- 56.	Identify the orders with a status of 'Disputed'.
select *
from sales_data
where status like 'disputed';

-- 57.	List the orders with a quantity ordered between 40 and 50.
select *
from sales_data
where quantityordered between 40 and 50;

-- 58.	Calculate the total sales for each year and month in each territory.
select year_id Year, month_id Month,territory Territory,round(sum(sales),2) SalesInTerritory
from sales_data
group by year_id, month_id, territory
order by year_id;

-- 59.	Identify the orders with a price each higher than $99.
select *
from sales_data
where priceeach > 99;

-- 60.	List the orders made by customers located in 'Tokyo'.
select *
from sales_data
where state like 'tokyo';

-- 61.	Calculate the total sales for each product line in the year 2004.
select year_id Year,productline ProductLine,round(sum(sales),2) TotalSales
from sales_data
group by year_id,productline
order by year_id;

-- 62.	Identify the orders with a status of 'On Hold' 
-- and a sales amount greater than $1000.
select *
from sales_data
where status like 'on hold' and sales >1000;

-- 63.	List the orders with a quantity ordered between 5 and 10.
select *
from sales_data
where quantityordered between 5 and 10;

-- 64.	Calculate the total sales for each product line in each territory.
select territory Territory,productline ProductLine,round(sum(sales),2) TotalSales
from sales_data
group by territory,productline;

-- 65.	Identify the orders with a price each less than $50.
select ordernumber OrderNumber,priceeach PriceEach
from sales_data
where priceeach < 50;

-- 66.	List the orders made by customers located in 'germany'.
select *
from sales_data
where country like 'germany';

-- 67.	Calculate the total sales for each quarter in each territory.
select Territory ,qtr_id Quarter,round(sum(sales),2) Sales_in_Quarter
from sales_data
group by territory,qtr_id
order by territory;

-- 68.	Identify the orders with a status of 'Cancelled' 
-- and a sales amount greater than $5000.
select *
from sales_data
where status like 'cancelled' and sales >5000;

-- 69.	List the orders with a quantity ordered equal to the maximum quantity ordered.
select *
from sales_data
where quantityordered = (select max(quantityordered) from sales_data);

-- 70.	Calculate the total sales for each product line in each country.
select country Country, productline ProductLine, round(sum(sales),2) TotalSales
from sales_data
group by country,productline
order by country;

-- 71.	Identify the orders with a price each higher than $80 but less than 90.
select *
from sales_data
where priceeach > 80 and priceeach <90;

-- 72.	List the orders made by customers located in 'Rome'.
select *
from sales_data
where  city like 'rome';

-- 73.	Calculate the total sales for each year in each country.
select  year_id Year,country Country,round(sum(sales),2) TotalSales
from sales_data
group by year_id,country
order by year_id;

-- 74.	Identify the orders with a status of 'In Process' and a sales amount less than $500.
select *
from sales_data
where status like 'in process' and sales < 500;

-- 75.	List the orders with a quantity ordered equal to the minimum quantity ordered.
select *
from sales_data
where quantityordered = (select min(quantityordered) from sales_data);

-- 76.	Calculate the total sales for each product line in each state.
select State,ProductLine,round(sum(sales),2) TotalSales
from sales_data
where state <> ''
group by state, productline
order by state;

-- 77.	Identify the orders with a price each less than $20.
select *
from sales_data
where priceeach < 20;

-- 78.	List the orders made by customers located in 'Madrid'.
select *
from sales_data
where city like 'madrid';

-- 79.	Calculate the total sales for each year in each state.
select year_id Year, State,round(sum(sales),2) TotalSales
from sales_data
where state <> ''
group by year_id, state
order by year_id;

-- 80.	Identify the orders with a status of 'Shipped' and a sales amount greater than $500.
select *
from sales_data
where status like 'shipped' and sales > 10000;

-- 81.	List the orders with a quantity ordered greater to the average quantity ordered.
select *
from sales_data
where quantityordered > (select avg(quantityordered) from sales_data);

-- 82.	Calculate the total sales for each product line in each city.
select City,ProductLine,round(sum(sales),2) TotalSales
from sales_data
where city <> ''
group by city, productline
order by city;

-- 83.	Identify the orders with a price each equal to $100.\
select *
from sales_data
where priceeach = 100;

-- 84.	List the orders made by customers located in 'Moscow'.
select *
from sales_data
where city like 'moscow';

-- 85.	Calculate the total sales for each year in each city.
select year_id Year, City, round(sum(sales),2) TotalSales
from sales_data
group by year_id,city
order by year_id;

-- 86.	Identify the orders with a status of 'Resolved' and a sales amount greater than $5000 and less than $8000.
select *
from sales_data
where status like 'resolved' and sales between 5000 and 8000;

-- 87.	List the orders with a quantity ordered equal to the average quantity ordered.
select *
from sales_data
where quantityordered = (select round(avg(quantityordered),0) from sales_data);

-- 88.	Calculate the total sales for each product line in each postal code.
select PostalCode,ProductLine, round(sum(sales),2) TotalSales
from sales_data
where postalcode <> ''
group by postalcode,productline
order by postalcode;

-- 89	Identify the orders with a price each is from 60 to 80.
select *
from sales_data
where priceeach  between 60 and 80;

-- 90.	List the orders made by customers located in 'Beijing'.
select *
from sales_data
where city like 'beijing';

-- 91.	Calculate the total sales for each year in each postal code.
select year_id Year,PostalCode, round(sum(sales),2) TotalSales
from sales_data
where postalcode <> ''
group by year_id,postalcode
order by year_id;

-- 92.	Identify the orders with a status of 'Disputed' and a sales amount greater than $5000.
select * 
from sales_data
where status like 'disputed' and sales > 5000;

-- 93.	List the orders with a quantity ordered less than the average of the quantity ordered.
select *
from sales_data
where sales < (select avg(sales) from sales_data);

-- 94.	Calculate the total sales for each product line in each country in the year 2005 and 2004.
select year_id Year,ProductLine,round(sum(sales),2) TotalSales
from sales_data
where year_id in (2004,2005)
group by year_id,productline
order by year_id;

-- 95.	Identify the orders placed between the months april to august in the year 2004
select *
from sales_data
where (month(orderdate) between 4 and 8) and year_id like 2004
order by orderdate;

-- 96.	List the orders made by customers located in 'Japan'.
select *
from sales_data
where Country  like 'japan';

-- 97.	Calculate the total sales for each product line in each state in the year 2004.
select ProductLine,round(sum(sales),2) Total_Sales
from sales_data
where year_id like 2004
group by year_id, productline;

-- 98.	Identify the orders with a status of 'Cancelled' and a sales amount greater than $5000
select OrderNumber,Sales
from sales_data
where status like 'cancelled' and sales >5000;

-- 99.	Find the customer with the highest sales amount and total quantity ordered
select customername Name, sum(quantityordered) TotalQuantityOrdered,round(sum(sales),2) TotalSales
from sales_data
group by customername
order by totalsales desc limit 1;

-- 100.Calculate the total sales for each product line in each city in the year 2024.
select ProductLine,City,round(sum(sales),2) TotalSales
from sales_data
where city <> '' and year_id like 2004
group by  productline, city
order by productline;
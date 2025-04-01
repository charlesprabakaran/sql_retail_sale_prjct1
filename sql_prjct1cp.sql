show databases;
use sql_prjct1;
/*sql retail sales analysis/-- ----------------------------------------------------------------------------------------------
create database sql_prjct1;
/*create table/----------------------------------------------------------------------------------------------------------------

create table retail_sale(
	transactions_id	int primary key,
    sale_date date,
    sale_time time,
	customer_id int,
    gender varchar(30),
	age	int,
    category varchar(20),
	quantiy int,
	price_per_unit float,
    cogs float,
    total_sale float	
);

select * from retail_sale;

select * from retail_sale
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or 
total_sale is null
;
/* data cleaning/--------------------------------------------------------------------------

delete from retail_sale
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or 
total_sale is null
;

/* data exploration/-------------------------------------------------------------------------------------------------------------

/* how many sales we have/???

select count(*) as toatl_sales
 from retail_sale;

/* how many unique customers we have/???

select count(distinct customer_id) as toatl_customers
 from retail_sale;
 
 /* how many unique catigory we have/???
 
 select distinct category as unique_category
 from retail_sale;
 
 /* data analysis & bussiness key problems & answers/--------------------------------------------------------------------------------
 
  /* write a sql query to retrive all the columns for sale made on '22-11-05???????'/
  
  select * from retail_sale
  where sale_date='22-11-05';
  
  /* write a sql query to retrive all the transaction on category clothing 
  and the quantity is sold is more than 4 in the month of nov 22????/
  
  select * from retail_sale
  where 
  category='clothing'
  and
  SALE_DATE='2022-11'
  and 
  quantiy>=4; 
  
/* write a sql query to calculate total sales for each category????/  

select category,sum(total_sale) as totalsalesby_category 
from retail_sale
group by category
  ; 
  
  /* write a sql query to find the average age of custmoers who purchased item for category='beauty'????/  
  
  select category, 
  round(avg(age),2) as customer_age
from retail_sale
where category='beauty'
  ; 
  
  /* write a sql query to find all the transactions where the total sale is greater than 1000????/  
  
  select transactions_id, 
  total_sale
from retail_sale
where total_sale>1000
  ; 
  /* write a sql query to find total num of transactions done by each gender ????/  
  
  select category,gender, 
  count(total_sale) as total_sales
from retail_sale
group by gender,category;

/* write a sql query to calculate average sale of each month in the year ????/ 

select year(sale_date),month(sale_date), 
 round( avg(total_sale),2 )as total_sales
 from retail_sale
group by  month(sale_date),year(sale_date)
order by year(sale_date),month(sale_date);

/* write a sql query to find the top 5 customers based on highest total sales ????/ 

select customer_id , 
  sum(total_sale)
from retail_sale
group by customer_id
order by sum(total_sale) desc
limit 5
;

/* write a sql query to find the number of unique customers who purchaed item for each category ????/ 

select 
category,
count(distinct(customer_id )) as unique_id
from retail_sale
group by category
;

/* write a sql query to find each shifts and number of orders who purchaed item for each category ????/ 

select *,
case
when hour(sale_time)<12 then 'morning_shift'
when hour(sale_time) between 12 and 17   then 'afternoon_shift'
else 'evening_shift'
end as shifts
 from retail_sale;

  




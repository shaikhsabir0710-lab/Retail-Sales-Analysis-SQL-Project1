DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

-- overview of dataset.
select * from retail_sales limit 5;

-- how many record present in the dataset.
select count(*) as total_rows from retail_sales;

--how many unique record present in the dataset.
select count(distinct customer_id) as unique_record from retail_sales;

---checking null values from the columns.
select * from retail_sales
where transactions_id is null 
or sale_date is null 
or sale_time is null
or customer_id is null
or gender is null 
or age is null
or category is null
or quantity is null 
or price_per_unit is null
or cogs is null
or total_sale is null;

--- deleting null values from the columns.
delete from retail_sales
where  transactions_id is null 
or sale_date is null 
or sale_time is null
or customer_id is null
or gender is null 
or age is null
or category is null
or quantity is null 
or price_per_unit is null
or cogs is null
or total_sale is null;

-- Data Exploration
-- how many total_sales we have?.
select count(*) as total_sales from retail_sales

--- how many unique customers we have?.
select count(distinct customer_id) as unique_sales from retail_sales

-- how many unique category we have?.
select count(distinct category) as unique_category from retail_sales;

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Problem solving.
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales where sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
select * from retail_sales
where category='Clothing' 
and quantity>3 and to_char(sale_date,'YYYY-MM')='2022-11'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category,sum(total_sale) as total_sale_per_category,count(*) as total_orders from retail_sales
group by category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select category,Round(avg(age),2) as avg_age from retail_sales
where category='Beauty' group by category

or 

select category,age,
avg(age)over(partition by category) as cat_avg_age 
from  retail_sales where category='Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales where total_sale>1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,gender,count(*) as total_num_trans
from retail_sales 
group by category,gender
order by 1

or

select category,gender,transactions_id,
count(transactions_id)over(partition by category,gender) as total_num_trans
from retail_sales 

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select extract(month from sale_date) as month,
extract(year from sale_date) as year,
avg(total_sale) as avg_sal_month
from retail_sales 
group by month ,year 
order by avg_sal_month desc 
limit 2

or

with mytab as (
select extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sal,
rank()over(partition by extract(year from sale_date) order by avg(total_sale) desc)
as rnk from retail_sales
group by year,month)
select year,month,avg_sal from mytab where rnk=1

or 

select 
   year,
   month,
   avg_sal
from  (
select extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sal,
rank()over(partition by extract(year from sale_date) order by avg(total_sale) desc)
as rnk from retail_sales
group by 1,2) as t1
 where rnk=1


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id,
      sum(total_sale) as total_sal
from retail_sales 
group by customer_id
order by total_sal desc
limit 5


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category,count(distinct customer_id) as purchased_item
from retail_sales group by category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with hourly_data as (select *,
case
  when extract(hour from sale_time)<=12 then 'Morning'
  when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
  else 'Evening'
  end shift_time 
  from retail_sales)
select shift_time,
      count(*) as total_orders
	  from hourly_data 
	  group by shift_time

   





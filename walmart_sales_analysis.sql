select * from walmart_orders
List all unique cities where sales were made.
select DISTINCT(city) from walmart_orders
Find the total number of orders.
select count(order_date) as count_of_orders from walmart_orders
Show total sales for each region.
select region,sum(sales) 
from walmart_orders 
group by region
What is the total profit made in the dataset?
select sum(profit) from walmart_orders
Display distinct ship modes used.
select distinct(ship_mode) from walmart_orders

Find total sales and total profit per category.
select category, sum(sales),sum(profit)
from walmart_orders
group by category
Which sub-category had the highest quantity sold?
select sub_category,sum(quantity) as highest_quantity_sold
from walmart_orders
group by sub_category
order by highest_quantity_sold DESC
limit 1
Get the average discount by region.
select avg(discount) as avg_discount
from walmart_orders
Find monthly sales trends (grouped by year and month).
select extract(month from order_date)as month, extract(year from order_date) as year,sum(sales)
from walmart_orders
group by month,year
order by month,year
Which customer segment is the most profitable?
select segment,sum(profit)
from walmart_orders
group by segment
order by sum(profit) desc
LIMIT 1

Rank product categories by total sales using window functions.
with cte as(
select category,sum(sales) as total_sales
from walmart_orders
group by category)

select category,total_sales,rank() over( order by total_sales desc) as rnk
from cte

Calculate the cumulative sales for each customer over time.
select customer_name,sum(sales) over( partition by customer_name order by order_date) as cumulative_sales
from walmart_orders

Identify orders where profit was negative.
select order_id,profit
from walmart_orders
where profit<0

Show the top 5 customers with the highest total sales.
select customer_name,sum(sales) from walmart_orders
group by customer_name
order by sum(sales) desc
limit 5

How many orders had a discount greater than 0.2?
select order_id,discount from walmart_orders
where discount>0.2


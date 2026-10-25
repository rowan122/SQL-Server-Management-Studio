select * from BikeStore
--1
select SUM(revenue) Total_Revenue,
AVG(revenue) AVG_Revenue,
MAX(revenue) MAX_Revenue,
MIN(revenue) MIN_Revenue
from BikeStore

--2
select SUM(total_units) Total_Quantity,
AVG(total_units) AVG_Quantity,
MAX(total_units) MAX_Quantity,
MIN(total_units) MIN_Quantity
from BikeStore

--3
select count(distinct order_id)
from BikeStore

--4
select count(distinct product_name) Total_Products, count(distinct category_name) Total_Categories
from BikeStore

--5
select count(distinct sales_rep) '#sales_rep'
from BikeStore

--6
select count(distinct store_name) '#stores'
from BikeStore

--7
select top(2) brand_name, SUM(revenue) Total_Revenue
from BikeStore
group by brand_name

--8
select state, SUM(revenue) Total_Revenue
from BikeStore
group by cube(state)

--9
select state, SUM(revenue) Total_Revenue
from BikeStore
group by cube(state)

--10
Select Top 5 customers,state , sum(Revenue) Total 
from Bikestore
Group by  state, customers
order by state , Total

--11
select store_name, SUM(revenue) Total_revenue
from BikeStore
group by cube(store_name)

--12
select distinct category_name, MAX(total_units) Max_Quantity
from BikeStore
group by cube(category_name)

--13
select distinct product_name, MAX(total_units) Max_Quantity
from BikeStore
group by cube(product_name)

--14
select top 10 customers, count(product_name) num_Products, count(distinct order_id) num_Orders
from BikeStore
group by cube(customers)
order by num_Products desc

--15
select top 10 customers, count(product_name) num_Products, count(distinct order_id) num_Orders
from BikeStore
group by cube(customers)
order by num_Products ASC

--16
select top 10 city, MAX(revenue)Total_Revenue, AVG(revenue)AVG_Revenue
from BikeStore
group by cube(city)
order by Total_Revenue DESC

--17
select store_name, count(product_name)num_Products
from BikeStore
group by cube(store_name)

--18
select top 10 product_name, revenue
from BikeStore
group by product_name, revenue
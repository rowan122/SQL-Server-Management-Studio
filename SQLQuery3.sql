USE NTI
Select*from Bikestores
Select Distinct brand_name ,SUM(revenue) Total_revenue
From Bikestores 
Group by brand_name


Select store_name,AVG(revenue) AVG_revenue,
MAX(revenue) Max_revenue ,MIN(revenue) Min_revenue
from Bikestores
Group by store_name


Select sales_rep, category_name,  count(*) '#orders' , sum(revenue) Total 
from Bikestores 
group by  sales_rep, category_name
Order by  sales_rep, category_name

Select sales_rep ,category_name, count(*) '#orders'
from Bikestores 
Group by Rollup(sales_rep ,category_name)

--top 10 products by total units'quantity'
select Top 10 product_name ,sum(total_units) Total_Quantity
From Bikestores
Where product_name is not null
Group by product_name
Order by Total_quantity DESC

--bottom 10 products or add ASC 

select Top 10 product_name ,sum(total_units) Total_Quantity
From Bikestores
Where product_name is not null
Group by product_name
Order by Total_quantity 


--top 10 customers by orders and total revenue 

Select Top 10 customers , count(order_id)'#orders',sum(revenue)Total_revenue
From Bikestores 
Group by customers
Order by '#orders'DESC
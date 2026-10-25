-- Display all the data on tables 
SELECT * FROM production.categories,
production.brands , production.stocks 
,production.products,sales.customers
,sales.orders ,sales.staffs
,sales.stores,sales.order_items



--Questions
--1) Which bike is most expensive? What could be the motive behind pricing this bike at the high price? 
select product_name , MAX(list_price) max_price from production.products
GROUP by product_name
ORDER BY MAX(list_price) DESC

--2
select count( customer_id) Total_customers from sales.customers

--3
 select count(store_id) Total_stores from sales.stores 

 --4
 select order_id ,  sum(list_price*Quantity*(1-discount))
 Total_Price from  sales.order_items
 Group by order_id
 order by order_id

 --5
  select store_id , sum(list_price*Quantity*(1-Discount)) sales_revenue
  from sales.order_items inner join sales.orders
  on sales.order_items.order_id= sales.orders.order_id  and sales.orders.order_status=4
  Group by store_id
  order by sales_revenue desc

  --6
  select category_name , sum(sales.order_items.list_price*Quantity*(1-Discount)) Total_sold
  from production.categories inner join production.products
  on production.categories.category_id=production.products.category_id
  inner join sales.order_items
  on sales.order_items.product_id=production.products.product_id
   inner join sales.orders 
  on sales.order_items.order_id= sales.orders.order_id  and sales.orders.order_status=4
  group by category_name
  order by Total_sold desc

--7
select category_name , count(sales.orders.order_status)rejected_orders from production.categories inner join production.products 
on production.categories.category_id= production.products.category_id 
inner join sales.order_items on production.products.product_id=sales.order_items.product_id
inner join sales.orders on sales.order_items.order_id=sales.orders.order_id and sales.orders.order_status=3
Group by category_name
order by count(sales.orders.order_status) desc

--8
select product_name , sum(sales.order_items.quantity)Total_Quantity
from production.products inner join sales.order_items
on production.products.product_id=sales.order_items.product_id
group by rollup(product_name)
order by sum(sales.order_items.quantity)

--9
select CONCAT(first_name,'  ',last_name) ID_259_Name 
from sales.customers where customer_id=259

--10
select product_name , sales.order_items.product_id , sales.orders.order_id,order_status,order_date
from sales.orders inner join sales.order_items 
on sales.orders.order_id=sales.order_items.order_id
inner join production.products 
on sales.order_items.product_id=production.products.product_id
where customer_id=259

--11
select CONCAT(first_name, ' ' , last_name) name_of_staff
, store_name 
from sales.staffs inner join sales.orders
on sales.staffs.staff_id = sales.orders.staff_id
inner join sales.stores on sales.orders.store_id = sales.stores.store_id
WHere sales.orders.customer_id = 259

--12
select count(staff_id) total_staff from sales.staffs
select CONCAT(first_name, ' ' , last_name) name_of_staff , staff_id from sales.staffs
ORDER BY staff_id

--13
select brand_name ,sum (quantity)Most_liked_brand from production.brands inner join 
production.products on production.products.brand_id = production.brands.brand_id
INNER join sales.order_items 
on sales.order_items.product_id = production.products.product_id
GROUP by brand_name
ORDER BY sum(quantity) DESC

--14
select category_name total_categories from production.categories
select  category_name  , sum (quantity) Quan_of_products from production.categories INNER join 
production.products on production.products.category_id = production.categories.category_id
inner join sales.order_items on production.products.product_id = sales.order_items.product_id
GROUP by  category_name 
ORDER BY sum(quantity) 

--15
create view most_liked_brand 
as 
select top 1 brand_name , sum (sales.order_items.quantity) of_products from production.brands
inner join production.products on production.products.brand_id = production.brands.brand_id
inner join sales.order_items on sales.order_items.product_id = production.products.product_id
GROUP by brand_name
ORDER BY brand_name

select * from most_liked_brand
select store_name , count(quantity)Num_of_items  from sales.stores inner join sales.orders on sales.orders.store_id = sales.stores.store_id
inner join sales.order_items on sales.order_items.order_id = sales.orders.order_id
inner join production.products on production.products.product_id = sales.order_items.product_id
inner join production.brands on production.brands.brand_id = production.products.brand_id
where brand_name = (select brand_name from most_liked_brand) 
 and order_status = 4
GROUP by store_name 
ORDER BY count(store_name) DESC

--16
select state  , sum (sales.order_items.list_price*quantity*(1-discount)) total_sold from sales.customers inner join 
sales.orders on sales.orders.customer_id = sales.customers.customer_id
INNER join sales.order_items on 
sales.order_items.order_id = sales.orders.order_id 
where order_status = 4
group by state
ORDER BY total_sold DESC

--17
 select product_name, sales.order_items.product_id ,sum (sales.order_items.list_price*quantity*(1-discount)) 
 FROM sales.order_items
inner join production.products on sales.order_items.product_id = production.products.product_id
WHERE sales.order_items.product_id = 259
GROUP by product_name , sales.order_items.product_id

--18
select product_name , sum (quantity) Quan_of_products , L.list_price , category_id , model_year , brand_id 
from production.products p
inner join sales.order_items L
on p.product_id = L.product_id
where L.product_id = 44
group by product_name , L.list_price , category_id , model_year , brand_id

--19 
select distinct zip_code from sales.customers
where state = 'CA'

--20 
select state from sales.stores

--21
select sum (quantity) Quan_of_products from production.products
inner join sales.order_items on sales.order_items.product_id = production.products.product_id
inner join sales.orders on sales.orders.order_id = sales.order_items.order_id
where category_id = 1  and order_date between '2017-05-01' and '2017-12-31' 
GROUP by category_id

--22
select sales.customers.first_name,shipped_date from sales.orders
inner join sales.customers on sales.customers.customer_id = sales.orders.customer_id
where sales.customers.customer_id=  523

--23
select count(order_status) 'Num_of_ orders pending' from sales.orders
where order_status = 1

--24
select brand_name , category_name from production.products
INNER join production.brands on production.brands.brand_id = production.products.brand_id
INNER join production.categories on production.categories.category_id = production.products.category_id
where product_name = 'Electra white water 3i - 2018'












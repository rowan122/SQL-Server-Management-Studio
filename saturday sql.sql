 select* from Bikestore
 select order_date 
 from Bikestore
   

   --day /month/monthname / week / quarter 
   select day(order_date) days , month(order_date) months ,year(order_date)years 
   from Bikestore
   where order_date is not null


   --coalesce 
   --total revenue by month 
   select month(order_date) months  ,sum(Revenue) Total_rev
   from Bikestore
   where order_date is not null
   Group by Rollup(month(order_date))
   Order by months

   --rount(word,#decimalplaces)

   select month(order_date) months  ,Round(sum(Revenue),0) Total_rev
   from Bikestore
   where order_date is not null
   Group by Rollup(month(order_date))
   Order by months


   --month name 
   select DATENAME(MONTH,order_date)month_name,sum(revenue)Total
   from Bikestore 
   where order_date is not null
   Group by Rollup (DATENAME(Month,order_date))


   select DATENAME(QUARTER,order_date)Quarters,
     DATENAME(WEEK,order_date)weeks,
	  DATENAME(DAY,order_date)day_name,
      DATENAME(DAYOFYEAR,order_date),
      DATENAME(YEAR,order_date),
	 DATENAME(HOUR,order_date),
	 DATENAME(MINUTE,order_date),
	 DATENAME(SECOND,order_date) 
	 from Bikestore 


	  --datepert>>integr 
	  select DATEPART(MONTH,GETDATE())

	  --DATE DIFF ATRA7 TARIKHIN MN BA3D  get date el tarikh el gdid 
	  SELECT DATEDIFF(DAY, order_date , Getdate())/365
	  from Bikestore
	  select DATEDIFF(YEAR, order_date,getdate())
	  from Bikestore


	  select*from Bikestore
	  where order_id =1


	  create procedure order_num @id  int
      as 
	  select* from Bikestore 
	  where order_id = @id 

	 order_num 20


	 create procedure R1
	 as 
	 select DATENAME(MONTH,order_date)month_name,sum(revenue)Total
   from Bikestore 
   where order_date is not null
   Group by Rollup (DATENAME(Month,order_date))
   R1
   --case like if 
   select revenue,
   case 
   when revenue >=5000 then 'high'
   else 'low'
   End  Rating 
   From Bikestores 
   order by revenue DESC



Select*From Employee
insert into Employee 
values('Rowan','ibrahiem',13579,'2004-07-14','Gleem','F',5555,334455,40)


insert into Employee(Fname,Lname,SSN)
values ('Khaled','Ali',808080)

delete from Employee
where SSN =112233


update Employee
Set Fname='Ali'
where Address='Giza'


update Employee
Set Sex = 'Female'
where Sex='F'


update Employee
Set Sex ='Male'
where Sex='M'


use Company_SD
Select*
From Departments

Select Fname,Lname,Address,Salary
From Employee
Where Sex='Male'and Salary>=1500


Select*
From Employee
Where Dno=20 or Dno=30 or Dno=10 or Dno=50

Select* 
From Employee
Where Dno in(10,20,30,40)


Select*
From Employee
Where Fname like '%m%'


Select* From  Employee
Where Fname like '%f%'

Select* From  Employee
Where Fname like  '__a%'





Select* From  Employee
Where Fname like '_a%'


Select* From  Employee
Where Fname like '%cairo%' and Sex='Male'


Select* From Employee
Where Salary  is null
order by Salary 

Select* From Employee
Where Salary  is not  null
order by Salary 



Select* From Employee
Where Salary  is not  null
order by Salary DESC 


Select* From Employee
Where Salary  is not  null
order by Salary ASC


--Agregate functions 
--sum ,avg, max , min , count


Select sum(Salary)
From Employee


Select sum(Salary) as Total_Salary
From Employee

Select Avg(Salary)  'AVG Salary' ,MAX(Salary) MAX_Salary,MIN(Salary) Min_Salary 
From Employee

--# mean number of 
Select Count(SSN)'#	Employees'
From Employee

--count msh bt3d el null w bt3d el tekrar 
Select Count(Dno)
From Employee

--* tkhly el count t3d kolo hata lw fe nulls 
Select Count(*)
From Employee
-- super ssn el modiren homa kam
Select Count( Superssn)
From Employee
--Distinct btgibly kolo bdon tkrar daimn btt7t abl esm el coloum  
Select  Distinct Dno
From Employee
Where Dno is not null

--3shan agib 3add el aksam bas 
Select Count( Distinct Dno)'#Dno'
From Employee

Select Count( Distinct Superssn)'#	Employees'
From Employee


--works_for 


Select Count(Hours)'# Works_for'
From Works_for


Select sum(Hours) as Total_Hourse
From Works_for



Select Avg(Hours)  'AVG HOURS' ,MAX(Hours) MAX_Hours,MIN(Hours) Min_Hours
From Works_for 


Select Count(ESSn)'# Works_for'
From Works_for

Select Count( Distinct ESSn)'# Works_for'
From Works_for

Select Count(Pno)'# Works_for'
From Works_for

Select Count(Distinct Pno)'# Works_for'
From Works_for

Select Count(Distinct Pno)'# Works_for'
From Works_for
Where Pno is not null

Select Count( Distinct ESSn)'# Works_for'
From Works_for 
Where ESSn is not null


--import excel file 
Use NTI
Select* from [costumers $] 

Select SUM Total_Salary
from [costumers $]
Select Distinct department ,SUM(Salary) Total_Salary
From [costumers $]
Group by department

Select department,AVG(salary) AVG_salary,
MAX(salary) Max_salary ,MIN(salary) Min_salary
from [costumers $]
Group by department

Select Gender, count(*) '#costumers' , SUM(salary) Total_salary
from [costumers $]
Group by Gender 

--lazem kol ely m3 ell selct tt7at m3 ell group by 
Select department, Gender ,  count(*) '#costumers' , sum(salary) Total 
from [costumers $]
group by department, Gender 
Order by department 

--having tostkhdm m3 el group functions w group by bas 
--Total salary by dep (total salary >=5000)
Select department ,sum(salary)
From [costumers $]
Group by department
Having sum(salary)>2500



--rollup -cube -bthot null row 
Select department , sum(salary) Total_salary
from [costumers $]
Group by Rollup(department)


Select department , sum(salary) Total_salary
from [costumers $]
Group by cube(department)
--roll ub bikhls kol department lwaho male w fimal w el total 
--roll ub gably el sub total fe kol gp w el grand total fe el akher 
Select department , Gender, sum(salary) Total_salary
from [costumers $]
Group by Rollup(department,Gender)
-- null null grand total 
-- gab male lwahdo w el total bta3o w female lwahdo w el total bta3 kolo
Select department , Gender, sum(salary) Total_salary
from [costumers $]
Group by cube (department,Gender)
-- cube femal total kol el department w male w grand total 



--string functions
--3shan nnm3 el esm kolo fe coloum nsmy full name 
Use Company_SD
Select* from Employee
Select Fname +' '+ Lname  Full_name
From Employee


Select CONCAT(Fname,'  ',Lname) Fullname
From Employee


 Select UPPER(Fname) , Lower(Lname)
 From Employee

 Select UPPER(Concat(Fname,'  ' , Lname)) Fullname 
 From Employee
 --Trim :remove white spaces 
 select TRIM(Fname)Fullname
 from Employee

 Update Employee
 Set fname=trim(Fname)
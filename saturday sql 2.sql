use Company_SD

select *from Employee
select * from Departments


insert into Departments
Values('DP4',40,223344,'2000-1-1')



select concat(Fname,' ',Lname) Full_name, Dname
from Employee E inner join Departments D
On e.Dno=D.Dnum


use Company_SD
select concat(Fname,' ',Lname) Full_name, Dname
from Employee E Left outer join Departments D
On e.Dno=D.Dnum


use Company_SD
select concat(Fname,' ',Lname) Full_name, Dname
from Employee E RIGHT outer join Departments D
On e.Dno=D.Dnum



use Company_SD
select concat(Fname,' ',Lname) Full_name, Dname
from Employee E full outer join Departments D
On e.Dno=D.Dnum



--display the department id , name and id the name of the manger 

--1
select Dnum ,Dname,concat(Fname,'  ',Lname)
From Departments d inner join Employee e
on d.MGRSSN=E.SSN
   

--2
select Dname , Pname from Departments d inner join Project p 
on d.Dnum=p.Dnum

--3


--4
select Pname , Pnumber, City 
from Project
where City='cairo'or city='alex'


--5
select *from Project
where Pname like'a%'

--6
select*from Employee 
where Dno=30 and Salary between 1000 and 2000


--7
select  e.fname ,e.Lname 
from Employee e inner join Works_for w 
on e.SSN=w.ESSn
inner join Project p 
on p.Pnumber=w.Pno
where e.Dno=10 and p.Pname='AL Rabwah' and Hours>=10

--8
select  e.fname ,e.Lname ,P.Pname 
from Employee e inner join Works_for w 
on e.SSN=w.ESSn
inner join Project p 
on p.Pnumber=w.Pno
order by Pname

--9 
select p.Pname ,d.Dname , e.Fname,e.address,e.bdate
from Project p
inner join Departments d on p.Dnum= d.Dnum 
inner join Employee e on d.MGRSSN =e.SSN

--or for inner join only  
select p.Pname ,d.Dname , e.Fname,e.address,e.bdate
from Project p ,Departments d , Employee e
where p.Dnum=d.Dnum and d.Dnum= e.Dno
and City='cairo'


--10
select e.*
from Employee e  join  Departments d 
on e.SSN=d.MGRSSN


--11
select e.*
from Employee e left join Dependent d 
on e.SSN=d.ESSN
where e.SSN = d.ESSN

--views mab2drsh adkhl 8ir select fe el views lw fe order by minf3sh tb2a mawgoda bnhotaha ma nigy n call
create view ALLData
as
select e.*
from Employee e left join Dependent d 
on e.SSN=d.ESSN
where e.SSN = d.ESSN

create view THISDATA
as
select sum(salary)Total_salary , d.Dname 
from Employee e inner join Departments d 
on e.Dno=d.Dnum
Group by Dname
--TO CALL IT 
select*from THISDATA




create procedure  update_name @Depname varchar(25) ,@DepID int
as 
update Departments
set Dname = @Depname
WHERE Dnum= @DepID
update_name DP20,40
select * from Departments







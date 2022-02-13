use IBMAmityDB

create table Worker
(
	WORKER_ID int primary key,
	FIRST_NAME varchar(30) not null,
	LAST_NAME varchar(30) not null,
	SALARY money not null,
	JOINING_DATE DateTime not null,
	DEPARTMENT varchar(20) not null
)

create table Bonus
(
	WORKER_REF_ID int,
	constraint fk1_workerID foreign key(WORKER_REF_ID) references Worker(WORKER_ID),
	BONUS_DATE DateTime not null,
	BONUS_AMOUNT Money
)

create table Title
(
	WORKER_REF_ID int,
	constraint fk2_workerID foreign key(WORKER_REF_ID) references Worker(WORKER_ID),
	WORKER_TITLE varchar(20) not null,
	AFFECTED_FROM DateTime not null
)


insert into Worker values(1,'Monika','Arora',100000,'2014-02-20 09:00:00','HR')
insert into Worker values(2,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin')
insert into Worker values(3,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR')
insert into Worker values(4,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin')
insert into Worker values(5,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin')
insert into Worker values(6,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account')
insert into Worker values(7,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account')
insert into Worker values(8,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin')

select * from Worker

insert into Bonus values(1,'2016-02-20 00:00:00',5000)
insert into Bonus values(2,'2016-06-11 00:00:00',3000)
insert into Bonus values(3,'2016-02-20 00:00:00',4000)
insert into Bonus values(1,'2016-02-20 00:00:00',4500)
insert into Bonus values(2,'2016-06-11 00:00:00',3500)

select * from Bonus

insert into Title values(1,'Manager','2016-02-20 00:00:00')
insert into Title values(2,'Executive','2016-06-11 00:00:00')
insert into Title values(8,'Executive','2016-06-11 00:00:00')
insert into Title values(5,'Manager','2016-06-11 00:00:00')
insert into Title values(4,'Asst. Manager','2016-06-11 00:00:00')
insert into Title values(7,'Executive','2016-06-11 00:00:00')
insert into Title values(6,'Lead','2016-06-11 00:00:00')
insert into Title values(3,'Lead','2016-06-11 00:00:00')

select * from Title


--Q.1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
select FIRST_NAME as WORKER_NAME from Worker

--Q.2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case
select upper(FIRST_NAME) from Worker

--Q.3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct DEPARTMENT from Worker

--Q.4. Write An SQL Query To Print First Three Characters Of  FIRST_NAME From Worker Table.
select SUBSTRING(FIRST_NAME,1,3) from Worker

--Q.5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
select CHARINDEX('A',FIRST_NAME) from Worker where FIRST_NAME='Amitabh'

--Q.6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
select RTRIM(FIRST_NAME) from Worker

--Q.7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
select LTRIM(FIRST_NAME) from Worker

--Q.8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select distinct DEPARTMENT, LEN(DEPARTMENT) as Length from Worker

--Q.9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘A’ With ‘A’.
select REPLACE(FIRST_NAME,'A','A') from Worker

--Q.10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select CONCAT(FIRST_NAME,SPACE(1),LAST_NAME) as COMPLETE_NAME from Worker

--Q.11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from Worker
order by FIRST_NAME

--Q.12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from Worker
order by FIRST_NAME asc, DEPARTMENT desc

--Q.13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from Worker
where FIRST_NAME in ('Vipul','Satish')

--Q.14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from Worker
where FIRST_NAME not in ('Vipul','Satish')

--Q.15 Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from Worker where DEPARTMENT='Admin'

--Q.16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from Worker where FIRST_NAME like '%A%'

--Q.17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from Worker where FIRST_NAME like '%a'

--Q.18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from Worker where FIRST_NAME like '%H' and LEN(FIRST_NAME)=6

--Q.19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from Worker where SALARY between 100000 and 500000

--Q.20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from Worker where YEAR(JOINING_DATE)=2014 and MONTH(JOINING_DATE)=02
select * from Worker

--Q.21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select COUNT(*) as Employee_count from Worker
where DEPARTMENT='Admin'
group by DEPARTMENT

--Q.22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000
select FIRST_NAME,LAST_NAME,SALARY from Worker
where SALARY between 50000 and 100000

--Q.23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select DEPARTMENT,COUNT(*) from Worker
group by DEPARTMENT
order by DEPARTMENT desc

--Q.24 Write An SQL Query To Print Details Of The Workers Who Are Also Managers
select * from Worker
select * from Title

select w.WORKER_ID,w.FIRST_NAME,w.LAST_NAME,w.SALARY,w.DEPARTMENT from Worker w
inner join
Title t
on w.WORKER_ID = t.WORKER_REF_ID
where WORKER_TITLE='Manager'

select w.WORKER_ID,w.FIRST_NAME,w.LAST_NAME,w.SALARY,w.DEPARTMENT from Worker w,Title t
where w.WORKER_ID = t.WORKER_REF_ID
and t.WORKER_TITLE='Manager'


--Q.25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select * from Worker
select * from Title
select * from Bonus

select WORKER_TITLE, AFFECTED_FROM, COUNT(*) as Repeated_times
from Title
group by WORKER_TITLE, AFFECTED_FROM
having COUNT(*) > 1


--Q.26. Write An SQL Query To Show Only Odd Rows From A Table
select * from Worker
where WORKER_ID%2 !=0

--Q.27. Write An SQL Query To Show Only Even Rows From A Table
select * from Worker
where WORKER_ID%2 =0

--Q.28. Write An SQL Query To Clone A New Table From Another 
select * into WorkerClone from Worker
select * from WorkerClone

--Q.29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from Worker w
inner join 
Bonus b
on w.WORKER_ID=b.WORKER_REF_ID

--Q.30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from Worker
where WORKER_ID not in (select WORKER_REF_ID from Bonus)

--Q.31. Write An SQL Query To Show The Current Date And Time.
select CURRENT_TIMESTAMP as Current_Date_Time

--Q.32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
select top 4 * from Worker

--Q.33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary from the table
select * from Worker
select SALARY from Worker
where SALARY = ( select min(SALARY) from Worker
				where SALARY IN ( select distinct top 5 SALARY from Worker
									order by SALARY desc)
				)

--Q.34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from Worker
go
with result as
(
select SALARY, DENSE_RANK() over (order by SALARY desc) as SAL_RANK
from Worker
)
select SALARY
from result
where result.SAL_RANK = 5


--Q.35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select * From Worker
where SALARY in
(select SALARY from Worker group by SALARY having
count(SALARY) > 1)

/* select * from Worker w1
inner join
Worker w2
on w1.SALARY=w2.SALARY
and w1.WORKER_ID!=w2.WORKER_ID
*/


--Q.36. Write An SQL Query To Show The Second Highest Salary From A Table.
select top 1 SALARY from Worker 
where SALARY < (select max(SALARY) from Worker) 
order by SALARY desc

select max(SALARY) from Worker 
where SALARY not in (select max(SALARY) from Worker);


--Q.37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from worker W 
union all 
select * from Worker W1 


--Q.38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from Worker  
Intersect 
select * from WorkerClone


--Q.39. Write An SQL Query To Fetch The First 50% Records From A Table
select top 50 percent * from Worker


--Q.40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
select DEPARTMENT,COUNT(WORKER_ID) as No_of_People from Worker
group by DEPARTMENT
having COUNT(WORKER_ID)<5


--Q.41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select DEPARTMENT,COUNT(WORKER_ID) as No_of_People from Worker
group by DEPARTMENT


--Q.42. Write An SQL Query To Show The Last Record From A Table.
select top 1 * from Worker
order by Worker_ID desc


--Q.43. Write An SQL Query To Fetch The First Row Of A Table.
select top 1 * from Worker


--Q.44. Write An SQL Query To Fetch The Last Five Records From A Table.
select top 5 * from Worker
order by WORKER_ID desc


--*Q.45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select DEPARTMENT,FIRST_NAME,LAST_NAME,SALARY from Worker w where SALARY in
(
	select max(SALARY)
	from Worker
	group by DEPARTMENT
)


--Q.46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select distinct top 3 SALARY from Worker
order by SALARY desc

select SALARY from Worker order by SALARY desc


--Q.47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select distinct top 3 SALARY from Worker
order by SALARY


--Q.48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
select * from Worker
select SALARY from Worker
where SALARY = ( select min(SALARY) from Worker
				where SALARY IN ( select distinct top 4 SALARY from Worker
									order by SALARY desc)
				)


--Q.49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
select DEPARTMENT,sum(SALARY) from Worker
group by DEPARTMENT


--Q.50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select FIRST_NAME,LAST_NAME,SALARY from Worker
where SALARY = (select max(SALARY) from Worker)





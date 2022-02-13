use IBMAmityDB

create table Manufacturers
(
	Code int primary key identity(1,1),
	Name varchar(255) not null
)

drop table Products
create table Products
(
	Code int primary key identity(1,1),
	Name varchar(255) not null,
	Price decimal(18,0) not null,
	Manufacturer int,
	constraint fk_Manufacturer foreign key(Manufacturer) references Manufacturers(Code)
)

insert into Manufacturers values('Sony')
insert into Manufacturers values('Creative Labs')
insert into Manufacturers values('Hewlett-Packard')
insert into Manufacturers values('Iomega')
insert into Manufacturers values('Fujitsu')
insert into Manufacturers values('Winchester')

select * from Manufacturers

insert into Products values('Hard drive', 240,5)
insert into Products values('Memory', 120,6)
insert into Products values('ZIP drive', 150,4)
insert into Products values('Floppy disk',5,6)
insert into Products values('Monitor',240,1)
insert into Products values('DVD drive',180,2)
insert into Products values('CD drive',90,2)
insert into Products values('Printer',270,3)
insert into Products values('Toner cartridge',66,3)
insert into Products values('DVD burner',180,2)

select * from Products

--1. Select the names of all the products in the store.
select Name from Products

--2. Select the names and the prices of all the products in the store.
select Name, Price from Products

--3. Select the name of the products with a price less than or equal to rs 200.
select Name from Products where price <= 200

--4. Select all the products with a price between rs 60 and rs 120.
select * from Products where Price between 60 and 120

--5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select Name,Price*100 as Price_in_cents from Products

--6. Compute the average price of all the products.
select AVG(Price) as Average_price from Products

--7. Compute the average price of all products with manufacturer code equal to 2.
select AVG(Price) as Average_price from Products where Manufacturer = 2

--8. Compute the number of products with a price larger than or equal to rs 180.
select COUNT(*) as No_Of_Products from Products where Price >= 180

--9. Select the name and price of all products with a price larger than or equal to rs 180, and sort first by price (in descending order), and then by name (in ascending order).
select Name, Price from Products where Price >= 180 order by Price desc, Name asc


--10. Select all the data from the products, including all the data for each product's manufacturer.
select * 
from Products p
full join
Manufacturers m
on p.Manufacturer=m.Code


--11. Select the product name, price, and manufacturer name of all the products.
select * from Manufacturers
select * from Products
select p.Name as Product_name,p.price,m.Name as Manufacturer_name
from Products p
left join 
Manufacturers m
on p.Manufacturer = m.Code



--12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
select * from Manufacturers
select * from Products
--Method 1:
select Manufacturer, cast(AVG(Price) as dec(10,2)) Avg_price from Products
group by Manufacturer
--Method 2:
select m.Code,cast(AVG(Price) as dec(10,2)) Avg_price
from Manufacturers m
left join
Products p
on m.Code=p.Code
group by m.Code


--13. Select the average price of each manufacturer's products, showing the manufacturer's name.
select * from Manufacturers
select * from Products
select m.Code,m.Name,cast(AVG(Price) as dec(10,2)) Avg_price
from Manufacturers m
left join
Products p
on p.Manufacturer = m.Code
group by m.Code,m.Name
order by m.Code

--Select the names of manufacturer whose products have an average price larger than or equal to rs 150.
select m.Code,m.Name,cast(AVG(Price) as dec(10,2)) Avg_price
from Manufacturers m
left join
Products p
on p.Manufacturer = m.Code
group by m.Code,m.Name
having AVG(price)>=150
order by m.Code


--14. Select the name and price of the cheapest product.
select Name,Price from Products
where Price in (select MIN(Price) from Products)


--15. Select the name of each manufacturer along with the name and price of its most expensive product.
select * from Manufacturers
select * from Products
select m.Code,m.Name,cast(MAX(Price) as dec(10,2)) Max_price
from Manufacturers m
left join
Products p
on p.Manufacturer = m.Code
group by m.Code,m.Name
order by m.Code 

--16. Add a new product: Loudspeakers, rs 70, manufacturer 2.
insert into Products values('Loudspeakers',70,2)

--17. Update the name of product 8 to "Laser Printer".
update Products set Name='Laser Printer' where Code=8
select * from Products

--18. Apply a 10% discount to all products.
select Name,Price-(Price*0.1) as Discounted_price from Products

--19. Apply a 10% discount to all products with a price larger than or equal to rs 120.
select * from Products
select Name,Price-(Price*0.1) as Discounted_price from Products
where Price>=120
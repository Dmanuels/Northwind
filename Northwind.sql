Use northwind;

-- task1: Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.

select CategoryName, Description
from categories;

/*task 2: Create a report that shows the ContactName, CompanyName, ContactTitle 
and Phone number from the customers table
sorted by Phone */

select ContactName, CompanyName, ContactTitle, Phone
from customers;

/*task 3: Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from the newest to the oldest employee.*/

select upper(firstName) as Firstname, upper(lastname) as Lastname, year(now()) - year(hiredate) as `Duration`
from employees
order by 3;

/*task 4:  Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, 
Freight from the orders table sorted by Freight in descending order*/

select OrderID, OrderDate, shippedDate, CustomerID, Freight
from orders
order by 5 desc
limit 10;

/* Task 5: Create a report that shows all the CustomerID in lowercase letter
 and renamed as ID from the customers table*/

select lower(customerID) as `ID`
from customers;

/* Task 6: Create a report that shows the CompanyName, Fax, Phone, Country,
 HomePage from the suppliers table sorted by the
Country in descending order then by CompanyName in ascending order*/

select CompanyName, Fax, Phone, Country, HomePage
from suppliers
order by country desc , CompanyName asc;

/* Task 7: Create a report that shows CompanyName,
 ContactName of all customers from ‘Buenos Aires' only.*/
 
select CompanyName, ContactName
from customers
where city like 'Buenos Aires';
 
/* Task 8 : Create a report showing ProductName, UnitPrice, 
 QuantityPerUnit of products that are out of stock.*/
 
select ProductName, UnitPrice, QuantityPerUnit
from products
where not UnitsInstock ;
 
/* Task 9: Create a report showing all the ContactName, 
 Address, City of all customers not from Germany, Mexico, Spain*/
 
select ContactName, Address, City
from customers
where not country in ('Germany', 'Mexico','Spain');
 
/* Task 10 : Create a report showing OrderDate, ShippedDate, CustomerID, 
 Freight of all orders placed on 21 May 1996.*/
 
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where OrderDate = '1996-05-21';
 
/*Task 11: Create a report showing FirstName, LastName, 
 Country from the employees not from United States.*/
 
select FirstName, LastName, Country
from employees
where not country like 'USA';
 
/*Task 12: Create a report that shows the EmployeeID, OrderID, CustomerID, 
 RequiredDate, ShippedDate from all orders shipped later than the required date*/
 
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate, 
		datediff(RequiredDate, ShippedDate) as `Delivery Date`
from orders
where datediff(requireddate, shippeddate) < 0;
 
/* Task 13: Create a report that shows the City, CompanyName,
 ContactName of customers from cities starting with A or B*/
 
select City, CompanyName, ContactName
from customers
where city like 'A%' or city like 'B%';
 
/* Task 14: Create a report showing all the even numbers of OrderID from the orders table. */
select OrderID
from orders
where Mod(orderID,2) = '0';
  
/* Task 15: Create a report that shows all the orders where the freight cost more than $500*/
  
select orderID, CustomerID, EmployeeID, OrderDate, 
		shippedDate, ShipName, ShipCity, ShipCountry
from orders
where Freight > '500';
  
/* Task 16: Create a report that shows the ProductName, UnitsInStock,
  UnitsOnOrder, ReorderLevel of all products that are up for reorder.*/

select ProductName, Unitsinstock, UnitsonOrder, Reorderlevel
from products
where reorderlevel > '0';

/*Task 17: Create a report that shows the CompanyName, ContactName number of all customer that have no fax number*/

select CompanyName, ContactName, Phone, fax
from customers
where isnull(fax);

/* Task 18: Create a report that shows the FirstName,
LastName of all employees that do not report to anybody*/

Select FirstName , LastName
from employees
where isnull(Reportsto); 

/*Task 19: Create a report showing all the odd numbers of OrderID from the orders table.*/

select OrderID
from orders
where mod(orderID,2) = '1';

/*Task 20: Create a report that shows the CompanyName, ContactName, 
Fax of all customers that do not have Fax number and sorted by ContactName*/

Select CompanyName, ContactName, Fax
from customers
where isnull(fax)
order by 2;

/*Task 21: Create a report that shows the City, CompanyName, 
ContactName of customers from cities that has letter L in the name sorted by ContactName.*/

Select City, CompanyName, ContactName
from customers
where city like '%L%'
order by ContactName;

/*Task 22: Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s*/

Select FirstName, LastName, Birthdate
from employees
where birthdate between '1950-01-01' and '1959-12-31';

select firstName, lastName, Birthdate
from employees
where year(birthdate) like '195%';

/*Task 23: Create a report that shows the FirstName, LastName, 
the year of Birthdate as birth year from the employees table.*/

select FirstName, LastName, year(Birthdate) as `Birth year`
from employees;

/*Task 24: Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by
OrderID and sorted by NumberofOrders in descending order*/

select OrderID, count(OrderID) as `Number of Orders`
from `order details`
group by 1
order by 2 desc;

/*Task 25: Create a report that shows the SupplierID, ProductName, 
CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID*/

Select p.SupplierID, p.ProductName, s.CompanyName
from Products p
join suppliers s on p.supplierID = s.supplierID
where CompanyName in  ('Exotic Liquids' , 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by 1;

/*Task 26: Create a report that shows the ShipPostalCode, OrderID, OrderDate, 
RequiredDate, ShippedDate, ShipAddress of all orders
with ShipPostalCode beginning with "98124"*/

Select (ShipPostalCode), OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from Orders
where ShipPostalCode like '98124%';

/*Task 27: Create a report that shows the ContactName, ContactTitle, 
CompanyName of customers that the has no "Sales" in their ContactTitle.*/

Select ContactName, ContactTitle, CompanyName
from customers
where not ContactTitle like '%Sales%';

/*Task 28: Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"*/

Select LastName, FirstName, City
from employees
where not city like 'Seattle';

/*Task 29: Create a report that shows the CompanyName, ContactTitle, City, 
Country of all customers in any city in Mexico or other cities in Spain other than Madrid.*/

Select CompanyName, ContactTitle, City, Country
from customers
where country like 'Mexico' or country like 'spain' and not city like 'Madrid';

/*Task 30: Create the following: */

select concat(firstname,' ' , lastname, ' ' , 'can be reached at', ' ' , 'x', ' ', extension) as fullname
from employees;

/*Task 31: Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their 
Contactname*/

select ContactName
from customers
where not ContactName like '_a%';

/*Task 32: Create a report that shows the average UnitPrice rounded to the next whole number,
 total price of UnitsInStock and  maximum number of orders from the products table.
 All saved as AveragePrice, TotalStock and MaxOrder respectively */
 
 Select round(avg(UnitPrice)) as 'AveragePrice', 
		sum(UnitsInStock) as 'TotalStock',
        max(Unitsonorder) as 'MaxOrder'
from products;

/*Task 33: Create a report that shows the SupplierID, CompanyName, CategoryName, 
ProductName and UnitPrice from the products, suppliers and categories table.*/

Select s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
from categories c 
join products p on c.categoryID = p.categoryID
join suppliers s on p.supplierID = s.supplierID
order by 1;

/*Task 34: Create a report that shows the CustomerID, sum of Freight, 
from the orders table with sum of freight greater $200, grouped by CustomerID*/

Select CustomerID, sum(Freight)
from orders
group by 1
having sum(Freight) > '200';

/*Task 35: Create a report that shows the OrderID ContactName, UnitPrice, 
Quantity, Discount from the order details, orders and customers table with discount given on every purchase*/

Select o.OrderID, c.ContactName, od.UnitPrice, od.Quantity, od.Discount
from `Order details` as od
join orders as o on od.orderID = o.orderID
join customers as c on o.customerID = c.customerID;

/*Task 36: Create a report that shows the EmployeeID, the LastName and FirstName as employee, 
and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee*/

Select e.EmployeeID, e.LastName, e.FirstName, e.Reportsto, m.lastName, m.FirstName
from employees e
inner join employees m on e.employeeID = m.employeeID;

/*Task 37: Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice 
and MaximumPrice respectively.*/

Select avg(unitprice) as `Average Price`,
		min(Unitprice) as `Minimum Price`, 
        Max(Unitprice) as `Maximum Price`
from products;


create view CustomerInfo as 
	select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle,
            c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
	from Customers c
    join Orders o on c.customerId = o.customerID;
    
/*Task 39: Change the name of the view you created from customerinfo to customer details.*/

create view `Customer Details`as 
	select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle,
            c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
	from Customers c
    join Orders o on c.customerId = o.customerID;

/*Task 40: Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, 
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and 
categories tables*/

Create view ProductDetails as 
	select 	ProductID, CompanyName, ProductName, CategoryName, Description,
        QuantityPerUnit, UnitPrice, UnitsInStock, UnitsonOrder, ReorderLevel, Discontinued
	from suppliers s 
    join products p on s.supplierID = p.supplierID
    join categories c on p.categoryID = c.categoryID;
    
/*Task 41: Drop the customer details view*/

Drop view `customer details` ;

/*Task 42: Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo */

select left(categoryname,5) as ShortInfo
from categories;     

/*Task 43: Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create 
a Table, use the LIKE Statement and INSERT INTO statement. */ 

Create table shiper_duplicate (
			Shipper_ID int,
            CompanyName varchar(40) not null,
            Phone varchar(24) not null,
            Email varchar(30) not null,
            
            primary key (Shipper_ID)
		);
        
Insert into shiper_duplicate (shipper_ID, CompanyName, Phone, Email)
		values('1', 'Speedy Express', '(503) 555-9831', 'speedexpress@gmail.com'),
				('2', 'United Package', '(503) 555-3199', 'unitedpackage@gmail.com'),
                ('3', 'Federal shipping','(503) 555-9931', 'federalshipping@gmail.com');
                
/*Task 44: */

Select *
from shiper_duplicate;
                
/*Task 45: Create a report that shows the CompanyName and ProductName from all product in the Seafood category.*/

Select CompanyName, ProductName
from suppliers s
join products p on s.supplierID = p.supplierID
join categories c on p.categoryID = c.categoryID
where categoryName like 'Seafood';

/*Task 46: Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.*/

Select s.CompanyName, p.ProductName
from suppliers s
join products p on s.supplierID = p.supplierID
join categories c on p.categoryID = c.categoryID
where c.categoryID = '5';

/*Task 47: Delete the shippers_duplicate table.*/

Drop table Shiper_duplicate;
Drop table shipper_duplicate;

/*Task 48: */

Select LastName, FirstName, Title, Year(Now()) - year(birthdate) as `Age`
from employees;

/*Task 49: Create a report that shows the CompanyName and total number of orders by customer renamed as number of orders since 
Decemeber 31, 1994. Show number of Orders greater than 10.*/

Select c.CompanyName, count(o.OrderID) as `Number of orders since Dec,1994`
from customers c
join orders o on c.customerID =  o.customerID
where orderdate >= '1994-12-31'
group by 1
having count(o.orderid) >10;

/*Task 50:  */
 select concat_ws(' ' ,ProductName,'weighs', QuantityPerUnit,'and cost',concat('$',round(UnitPrice)))
 from products;

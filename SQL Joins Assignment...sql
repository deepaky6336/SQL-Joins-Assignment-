create Database SQL_Joins;
use SQL_Joins;

create table Customers
(Customer_ID INT,
Customer_Name VARCHAR(50),
City VARCHAR(50));

create table Orders
(Order_ID INT,
Customer_ID INT,
Order_Date DATE,
Amount INT);

CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT);
    
    CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT);
    
Insert into customers
values
(1,"John Smith","New York"),
(2,"Mary Johnson","Chicago"),
(3,"Peter Adams","Los Angeles"),
(4,"Nancy Miller","Houston"),
(5,"Robert White","Miami");

INSERT INTO Orders VALUES
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,3,'2024-10-07',150),
(104,4,'2024-10-10',450),
(105,5,'2024-10-12',400);

INSERT INTO Payments VALUES
('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200);

INSERT INTO Employees VALUES
(1,'Alex Green',NULL),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'Eva Smith',2),
(5,'David Kim',3);

use Sql_joins;
##Question 1. Retrieve all customers who have placed at least one order.

Select * From Customers;
Select * From Orders;

Select distinct * From Customers 
Inner join orders 
on customers.customer_Id = orders.customer_ID;

##Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

SELECT Customer_Name, Order_ID, Amount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

## Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.


select order_ID, Customer_Name, Amount
from orders
Right join customers
on orders.customer_ID = customers.customer_ID;

Select * From Customers;
Select * From Orders;

##Question 4. Display all customers and orders, whether matched or not.

SELECT Customer_Name, Order_ID
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID

UNION

SELECT c.Customer_Name, o.Order_ID
FROM Customers c
RIGHT JOIN Orders o ON c.Customer_ID = o.Customer_ID;

##Question 5. Find customers who have not placed any orders.

select customer_name from customers
left join orders
on customers.customer_ID = orders.customer_ID is NULL;

##Question 6. Retrieve customers who made payments but did not place any orders.

use SQL_Joins;

select distinct customer_name from customers c
inner join payments p
on c.customer_ID = p.customerID
left join orders o
on c.customer_ID = o.customer_ID
Where o.order_ID is null;

##Question 7. Generate a list of all possible combinations between Customers and Orders.

select c.customer_id, customer_Name,city from customers c
cross join orders o
on c.customer_id = o.customer_id;

## Question 8. Show all customers along with order and payment amounts in one table.

select customer_name, order_id, o.amount, p.amount
from customers c
left join orders o
on c.customer_id = o.customer_id
left join payments p
on o.customer_id = p.customerid;

##Question 9. Retrieve all customers who have both placed orders and made payments.

select distinct customer_name, order_id from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join payments p
on o.customer_id = p.customerId;




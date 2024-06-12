/*  Logical Query Processing
    5. 	SELECT		<select list> 
    1. 	FROM		<table source>
    2. 	WHERE		<search condition>
    3.	GROUP BY	<group by list>
    4.	HAVING		<search condition>
    6.	ORDER BY	<order by list>
*/

-- Change database context to the TSQL database (on-premise only)
USE TSQL;
GO

-- CustomerId = 71 will not work since it is not integer
-- 'ISLAT' is at 71
SELECT EmployeeId, YEAR(OrderDate) AS OrderYear
FROM Sales.Orders
WHERE CustomerId = 'ISLAT'
GROUP BY EmployeeId, YEAR(OrderDate)
HAVING COUNT(*) > 1
ORDER BY EmployeeId, OrderYear;
GO

-- Create the dbo.orders table
/* 
	Select and execute the following query to illustrate
	the use of a DDL command.
	Point out the use of GO to delimit the batch.
	Also highlight the different ways to execute SQL, use 
	the !Execute button on the tool bar, and keyboard 
	shortcut F5.
*/

CREATE TABLE dbo.Orders
	( 
		OrderId int, 
		CustId int, 
		OrderDate date,
		Quantity int,
		Amount money
	); 
	GO

-- Inserting values into a table
/*
	Select and execute the following query to illustrate
	a DML command.
	Point out the use of the GETDATE function and the 
	how the row constructors map to the above columns.
*/

INSERT INTO dbo.Orders
VALUES(101,774,GETDATE(),100,99.98)
      ,(102,775,GETDATE(),32,49.99)
	  ,(103,775,GETDATE(),4,9.99);

-- Querying a table
/*
	Select and execute the following query to illustrate 
	the use of a DML command.
	Point out that there are 3 rows returned.
*/

SELECT OrderId, CustId, OrderDate, Quantity, Amount
FROM dbo.Orders;

-- Querying a table	with expressions
/*
	Select and execute the following query to illustrate 
	the use of an expression in the SELECT clause.
	Note that the use of the calculated column TotalOrderValue.
	Aliases will be covered in module 3.
*/

SELECT OrderId, CustId, OrderDate, Quantity, Amount, (Quantity * Amount) AS TotalOrderValue
FROM dbo.Orders;

-- Querying a table	with a WHERE clause
/*
	Select and execute the following query to illustrate 
	the use of a comparison operator in the WHERE clause.
	Note that the use of WHERE clauses
	will be covered in module 5.
*/

SELECT OrderId, CustId, OrderDate, Quantity, Amount
FROM dbo.Orders
WHERE Quantity > 50;

-- Querying a table	with a function in the WHERE clause
/*
	Select and execute the following query to illustrate 
	the use of a date function in the WHERE clause.
	Note that the use of WHERE clauses
	will be covered in module 5 and date functions will
	be covered in module 6.
	Point out that SYSDATETIME() evaluates to the current date and time,
	by executing this SQL - SELECT SYSDATETIME();
	All rows should be selected.
*/

SELECT OrderId, CustId, OrderDate, Quantity, Amount
FROM dbo.Orders
WHERE OrderDate < SYSDATETIME();

-- Querying a table	with a variable parameter 
/*
	Select and execute the following query to illustrate 
	the use of defined in the batch, then used in the WHERE clause.
	Note that the use of WHERE clauses will be covered in module 5.
*/

DECLARE @CustomerId int = 775

SELECT OrderId, CustId, OrderDate, Quantity, Amount
FROM dbo.Orders
WHERE CustId = @CustomerId;

-- Cleanup task if needed.
-- If desired, point out IF statement and use of DDL.
IF OBJECT_ID('dbo.orders') IS NOT NULL DROP TABLE dbo.orders;
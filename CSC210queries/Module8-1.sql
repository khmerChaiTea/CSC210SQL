-- Writing Queries with Built-In Functions
-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO
-- Step 2: Select and execute the following queries to illustrate
SELECT *
FROM Sales.Orders;
-- scalar functions
SELECT orderid, YEAR(orderdate) AS orderyear
FROM Sales.Orders;

SELECT ABS(-1.0), ABS(0.0), ABS(1.0);

SELECT CAST(SYSDATETIME() AS DATE) AS [current_date];

SELECT DB_NAME() AS [Current Database];

-- Step 3: Select and execute the following query to illustrate
SELECT *
FROM Sales.OrderDetails;
-- a simple Aggregate function demo without GROUP BY
-- (GROUP BY will be covered in a later module)
SELECT COUNT(*) AS numorders, SUM(unitprice) AS totalsales
FROM	Sales.OrderDetails;

-- Step 4: Select and execute the following query to illustrate
SELECT *
FROM Production.Products;
-- a simple ranking function
SELECT TOP(5) productid, productname, unitprice,
	RANK() OVER(ORDER BY unitprice DESC) AS rankbyprice
FROM Production.Products
ORDER BY rankbyprice;

--  Querying with Outer Joins

--  Step 1: Open a new query window to the AdventureWorks database
USE AdventureWorks2016;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to show only matching customers and orders
SELECT c.CustomerID, soh.SalesOrderID
FROM Sales.Customer c JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID;
-- (31465 row(s) affected)

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to show all customers and any matching orders
SELECT *
FROM Sales.Customer c LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID;
-- (32166 row(s) affected)

-- Step 4: Join 2 tables
-- Open a new query window to the TSQL database
USE TSQL;
GO
-- Select and execute the following query to show
-- a left outer join
-- custid is not found it should be customerid
SELECT c.customerid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT OUTER JOIN Sales.Orders AS o
ON c.customerid =o.customerid;

-- Step 5: Join 2 tables
-- Select and execute the following query to
-- show customers without orders
-- custid is not found it should be customerid
SELECT c.customerid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT OUTER JOIN Sales.Orders AS o
ON c.customerid =o.customerid
WHERE o.orderid IS NULL;

-- Step 6: Join 2 tables
-- Select and execute the following query to
-- show a right outer join
-- custid is not found it should be customerid
SELECT c.customerid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
RIGHT OUTER JOIN Sales.Orders AS o
ON c.customerid =o.customerid;

-- Step 7: Join 2 tables
-- Select and execute the following query
-- to show orders without customers
-- custid is not found it should be customerid
SELECT c.customerid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
RIGHT OUTER JOIN Sales.Orders AS o
ON c.customerid =o.customerid
WHERE c.customerid IS NULL;

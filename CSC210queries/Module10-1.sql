-- Writing Self-Contained Subqueries

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Scalar subqueres:
-- Select this query and execute it to
-- obtain most recent order
SELECT MAX(orderid) AS lastorder
FROM Sales.Orders;

-- Step 3: Select this query and execute it to
-- find details in Sales.OrderDetails
-- for most recent order
SELECT orderid, productid, unitprice, quantity
FROM Sales.OrderDetails
WHERE orderid = 
	(SELECT MAX(orderid) AS lastorder
	FROM Sales.Orders);

-- Step 4: THIS WILL FAIL, since
SELECT *
FROM Sales.OrderDetails;
SELECT *
FROM Sales.Orders;
-- subquery returns more than 
-- 1 value
SELECT orderid, productid, unitprice, quantity
FROM Sales.OrderDetails
WHERE orderid = 
	(SELECT orderid AS O
	FROM Sales.Orders
	WHERE employeeid =2);

-- Step 5: Multi-valued subqueries 
-- Select this query and execute it to	
-- return order info for customers in Mexico
SELECT customerid, orderid
FROM Sales.orders
WHERE customerid IN (
	SELECT customerid
	FROM Sales.Customers
	WHERE country = N'Mexico');

-- Step 6: Same result expressed as a join:
SELECT c.customerid, o.orderid
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.customerid = o.customerid
WHERE c.country = N'Mexico';

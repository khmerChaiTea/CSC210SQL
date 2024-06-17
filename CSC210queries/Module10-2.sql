--  Writing Correlated Subqueries

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Correlated subqueries
-- Select this query and execute it to show
-- Customers with most recent order info per customer
SELECT *
FROM Sales.Orders;
-- (Note that this query may return more than one row per
-- customer if there are multiple orders placed per customer
-- per date. Be sure to test your own data
-- when adapting this query to other data sources. There is no
-- logic in this example to handle ties.)

SELECT customerid, orderid, orderdate
FROM Sales.Orders AS outerorders
WHERE orderdate =
	(SELECT MAX(orderdate)
	FROM Sales.Orders AS innerorders
	WHERE innerorders.customerid = outerorders.customerid)
ORDER BY customerid;

-- Step 3: Select and execute the following query to 
-- show the use of a correlated subquery that
-- uses the employeeid from Sales.Orders to retrieve
-- orders placed by an employee on the latest order 
-- date for each employee
SELECT orderid, employeeid, orderdate
FROM Sales.Orders AS O1
WHERE orderdate =
	(SELECT MAX(orderdate)
	 FROM Sales.Orders AS O2
	 WHERE O2.employeeid = O1.employeeid)
ORDER BY employeeid, orderdate;

-- Step 4: Select and execute the following query to 
-- show the use of a correlated subquery that
-- uses the custid from Sales.Custorders to retrieve
-- orders placed by a customer with the highest 
-- quantity for each customer

-- will not work due to not having Sales.Custorders
SELECT custid, ordermonth, qty
FROM Sales.Custorders AS outercustorders
WHERE qty =
	(SELECT MAX(qty)
		FROM Sales.CustOrders AS innercustorders
		WHERE innercustorders.custid =outercustorders.custid
	)
ORDER BY custid;
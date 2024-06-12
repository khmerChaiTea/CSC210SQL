/*  Logical Query Processing
    5. 	SELECT		<select list> 
    1. 	FROM		<table source>
    2. 	WHERE		<search condition>
    3.	GROUP BY	<group by list>
    4.	HAVING		<search condition>
    6.	ORDER BY	<order by list>
*/

-- Try to execute the bellow statement
USE AdventureWorksLT2016;
GO

-- When first connecting to an Azure database server you must use the 
-- Available Databases drop down and select ADVENTUREWORKSLT
-- After connecting, a USE statement can be used to switch database contexts.

-- Querying a table	 
-- Select and run the completed query to show results
-- Point out that there are 8 rows returned
SELECT	ProductID
		,UnitPrice
		,SUM(OrderQty) as 'TotalOrdered'
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice > 50
GROUP BY ProductID, UnitPrice
HAVING SUM(OrderQty) > 19
ORDER BY TotalOrdered DESC;

-- Querying a table	 
-- Select and run the partial query to show results
-- Point out the use of the * as a placeholder since FROM can't be run by itself
-- and that there are over 542 rows returned
SELECT *
FROM SalesLT.SalesOrderDetail;

-- Querying a table	 
-- Select and run the partial query to show results
-- Point out that there are 331 rows returned
SELECT * 
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice > 50;

-- Querying a table	with an invalid SELECT statement
-- Select and run the partial query to show results
-- THIS WILL CAUSE AN ERROR DUE TO THE SELECT LIST:
--
-- Column 'SalesLT.SalesOrderDetail.SalesOrderID' is invalid in 
-- the select list because it is not contained in either an 
-- aggregate function or the GROUP BY clause.
SELECT *
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice > 50
GROUP BY ProductID, UnitPrice;

-- Querying a table	 
-- Select and run the partial query to show results
-- Point out that the * in the SELECT list has been 
-- replaced with columns that are either in the GROUP BY expression
-- or are aggregate functions (this will be explained further in Module 9)
-- Point out that there are 107 rows returned
SELECT	ProductID
		,UnitPrice
		,SUM(OrderQty) as 'TotalOrdered', count(*) as cnt
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice > 50
GROUP BY ProductID, UnitPrice;

-- Querying a table	 
-- Select and run the partial query to show results
-- Point out that a HAVING clause further filters the results
-- based on the groups, and also that there are 8 rows returned 
-- and there is no apparent sort order
SELECT	ProductID
		,UnitPrice
		,SUM(OrderQty) as 'TotalOrdered'
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice > 50
GROUP BY ProductID, UnitPrice
HAVING SUM(OrderQty) > 19;

-- Querying a table	 
-- Select and run the completed query to show results
-- Point out that the ORDER BY clause has sorted the results
-- and that there are still 8 rows returned 
SELECT	ProductID
	,UnitPrice
		,SUM(OrderQty) as 'TotalOrdered'
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID, UnitPrice
HAVING SUM(OrderQty) > 19 and UnitPrice > 50
ORDER BY TotalOrdered asc, UnitPrice desc;

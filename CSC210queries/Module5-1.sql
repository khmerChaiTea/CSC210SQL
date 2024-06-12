-- Sorting Data

-- Step 1: Connect to the AdventureWorksLT2016 database
-- Prepare the environment by running the following query (without this, all order dates are the same)
USE AdventureWorksLT2016;
GO

UPDATE SalesLT.SalesOrderHeader 
SET	OrderDate = DATEADD(d,SalesOrderID % 7000, '2008-06-01'),
	ShipDate = DATEADD(d,7 + (SalesOrderID % 7000), '2008-06-08'),
	DueDate = DATEADD(d,14 + (SalesOrderID % 7000), '2008-06-13');

-- Step 2: Use ORDER BY to sort results 
SELECT *
FROM SalesLT.SalesOrderHeader;
-- Sorting by column name
SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate;

-- Step 3: Use ORDER BY to sort results
-- Sorting by column alias name
SELECT SalesOrderID, CustomerID, MONTH(OrderDate) AS ordermonth
FROM SalesLT.SalesOrderHeader
ORDER BY ordermonth DESC;

-- Step 4: Use ORDER BY to sort results
-- Sorting by column name in descending order
SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate DESC;

-- Step 5: Use ORDER BY to sort results
SELECT *
FROM SalesLT.Customer;
-- Changing sort order for multiple columns
SELECT ModifiedDate, CustomerID, CompanyName
FROM SalesLT.Customer
ORDER BY ModifiedDate DESC, CustomerID ASC;

-- Step 6: Revert the changes made to date columns
UPDATE SalesLT.SalesOrderHeader 
SET OrderDate = '2008-06-01', 
	ShipDate = '2008-06-08',
	DueDate = '2008-06-13';

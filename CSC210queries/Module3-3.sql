-- Using Column and Table Aliases

-- Step 1: Connect to the AdventureWorksLT database
-- The USE statement is not currently compatible with SQL Azure databases.
-- Instead, select AdventureWorksLT from the Available Databases list
USE AdventureWorksLT2016;
GO

-- Step 2: Column Aliases
SELECT *
FROM SalesLT.Customer
-- Select and execute the following query to show the use of column aliases
-- in the SELECT clause
SELECT CustomerID AS CustomerNo, Title, FirstName, LastName AS Surname
FROM SalesLT.Customer

-- Step 3: Column Aliases
SELECT *
FROM SalesLT.Product;
-- Select and execute the following query to show the use of column aliases
-- to label calculated columns in the SELECT clause
SELECT ProductID, Name, ListPrice, (ListPrice * 1.1) AS MarkUp
FROM SalesLT.Product;

-- Step 4: Column Aliases
SELECT *
FROM SalesLT.SalesOrderHeader;
-- Select and execute the following query to show the use of column aliases
-- to label calculated columns in the SELECT clause
SELECT SalesOrderNumber, PurchaseOrderNumber, CustomerID, YEAR(OrderDate) AS YearPurchased 
FROM SalesLT.SalesOrderHeader;

-- Step 5: Table Aliases
-- Select and execute the following query to show the use of table aliases
SELECT P.ProductNumber, P.Name, P.Color
FROM SalesLT.Product AS P;
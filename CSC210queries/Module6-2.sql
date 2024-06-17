-- Working with Character Data

-- Step 1:
-- Switch the query window to use your copy of the AdventureWorksLT database
USE AdventureWorksLT2016;
GO

SELECT *
FROM SalesLT.Customer;
-- Step 2: Use collation in a query
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_CS_AS = N'Miller';

-- Step 3a: Use a case sensitive collation in a query
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_BIN = N'miller';
-- NOTE: this will return no results

-- Step 3b:
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_BIN = N'Miller';
-- NOTE: the change in this query from the previous query is the case of the search term

-- Step 4: Using the CONCAT function to join strings
SELECT CustomerId, FirstName, MiddleName, LastName, 
CONCAT(LastName, N', ' + FirstName, N' ', MiddleName) AS FullName
FROM SalesLT.Customer;

-- Step 5: Use concatenation with + (plus) in a query
SELECT CustomerId, FirstName, MiddleName, LastName, 
FirstName + N' ' + LastName AS FullName
FROM SalesLT.Customer;

-- Step 6: Use string functions in a query
-- FORMAT
DECLARE @m money = 120.595
SELECT @m AS unformatted_value, 
FORMAT(@m,'C','zh-cn') AS zh_cn_currency,
FORMAT(@m,'C','en-us') AS en_us_currency,
FORMAT(@m,'C','de-de') AS de_de_currency;
-- end FORMAT example

-- Output the string/chars at position 11 for 3 chars
SELECT SUBSTRING('Microsoft SQL Server',11,3) AS Result;
-- LEFT take the first 9 from left; RIGHT take the first 6 from right;
SELECT LEFT('Microsoft SQL Server',9) AS left_example, RIGHT('Microsoft SQL Server',6) as right_example;

-- output 20 counting  M....r, not any space after
SELECT LEN('Microsoft SQL Server     ') AS [LEN];
-- output 25 counting any space after
SELECT DATALENGTH('Microsoft SQL Server     ') AS [DATALENGTH];

-- Show where the word 'SQL' started
SELECT CHARINDEX('SQL','Microsoft SQL Server') AS Result;

-- replaced 'T-SQL' for 'Transact-SQL'
SELECT REPLACE('Learning about T-SQL string functions','T-SQL','Transact-SQL') AS Result;

-- UPPER use for upper cases; LOWER use for lower cases
SELECT UPPER('Microsoft SQL Server') AS UP, LOWER('Microsoft SQL Server') AS LOW;

SELECT *
FROM SalesLT.Address;
-- Step 7: Use the LIKE predicate in a query - the % (percent) character
SELECT AddressID, CountryRegion
FROM SalesLT.Address
WHERE CountryRegion LIKE N'United%'
-- Could use the NOT LIKE

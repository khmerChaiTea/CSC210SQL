--  Querying with Cross Joins and Self Joins

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to display all employees with managers
-- and the manager's ID and name.
-- empid is not found it should be employeeid
-- mgrid is not found it should be reportsto
 SELECT e.employeeid ,e.lastname as empname,e.title,e.reportsto, m.lastname as mgrname
  FROM HR.Employees AS e
  JOIN HR.Employees AS m
  ON e.reportsto=m.employeeid;

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to display all employees 
-- and the manager's ID and name.
-- empid is not found it should be employeeid
-- mgrid is not found it should be reportsto
  SELECT e.employeeid ,e.lastname as empname,e.title,e.reportsto, m.lastname as mgrname
  FROM HR.Employees AS e
  LEFT OUTER JOIN HR.Employees AS m
  ON e.reportsto=m.employeeid;
  
-- Step 4: Cross Join 2 tables
-- Select and execute the following query
-- to generate all combinations of first and last
-- names from the HR.Employees table
SELECT e1.firstname, e2.lastname
FROM HR.Employees AS e1 CROSS JOIN HR.Employees AS e2;

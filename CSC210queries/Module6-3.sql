-- Working with Date and Time Data

-- Step 1:
-- Switch the query window to use your copy of the AdventureWorksLT database
USE AdventureWorksLT2016;
GO

-- Step 2: Display various current date and time functions

SELECT
	GETDATE()			AS [GetDate],
	CURRENT_TIMESTAMP	AS [Current_Timestamp], --for ANSI SQL compatibility
	GETUTCDATE()		AS [GetUTCDate],
	SYSDATETIME()		AS [SYSDateTime],
	SYSUTCDATETIME()	AS [SYSUTCDateTime],
	SYSDATETIMEOFFSET()	AS [SYSDateTimeOffset];
	
-- Step 3: Display various functions which return a portion of a date or time
-- output Tuesday
SELECT DATENAME(weekday,'20150113');
-- output day, month, year
SELECT DAY('20150113') AS [Day], MONTH('20150113') AS [Month],YEAR('20150113') AS [Year];
-- output 3 (Sunday is one, Monday is two. so Tueday is three)
SELECT DATEPART(WEEKDAY,'20150113');

-- Step 4: Display various functions which return a date or time from parts
-- output "2012-02-12 08:30:00.000"
SELECT DATETIMEFROMPARTS(2012,2,12,8,30,0,0) AS Result; --7 arguments
-- output "2012-02-12 08:30:00"
SELECT DATETIME2FROMPARTS(2012,2,12,8,30,00,0,0) AS Result; -- 8 arguments
-- output "2012-02-12"
SELECT DATEFROMPARTS(2012,2,12) AS Result; -- 3 arguments
-- output "2012-02-12 08:30:00 -07:00"
SELECT DATETIMEOFFSETFROMPARTS(2012,2,12,8,30,0,0,-7,0,0) AS Result;


-- Step 5: Demonstrate DATEDIFF with  this to show difference in precision:
-- output 0
SELECT DATEDIFF(millisecond, GETDATE(), SYSDATETIME()); 

-- Step 6: Modify datetime with EOMONTH and DATEADD:
-- output "2015-01-15 00:00:00.000" added 2 days
SELECT DATEADD(day,2,'20150113');
-- output "2015-01-31"
SELECT EOMONTH('20150113'); --return the end of the month in which this date occurs
-- output "2015-03-31"
SELECT EOMONTH('20150113',2); --return the end of the month two months ahead of the this date

-- Step 7: Use ISDATE to check validity of inputs:
-- the date existed, 13 is in January which has 31 days
SELECT ISDATE('20150113'); --is valid
-- the date does not existed, 30 is not in February which has 28 days sometime 29
SELECT ISDATE('20120230'); --February doesn't have 30 days

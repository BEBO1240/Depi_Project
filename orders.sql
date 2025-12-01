/*
  --How many orders were placed per years
  SELECT 
    YEAR([Order_Date]) AS OrderYear,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY YEAR([Order_Date])
ORDER BY OrderYear

--Identify peak order days top 10
SELECT top 10
    CAST([Order_Date] AS DATE) AS OrderDay,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY CAST([Order_Date] AS DATE)
ORDER BY OrdersCount DESC;

--How to measure order processing speed
SELECT top 10
    [Order_ID],
    DATEDIFF(DAY, [Order_Date], [Ship_Date]) AS ProcessingDays
FROM [Depi_Project].[dbo].[all]
--How do order frequencies vary by segment
SELECT 
    Segment,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Segment
ORDER BY OrdersCount DESC;

--Calculate number of orders per year
SELECT 
    YEAR([Order_Date]) AS OrderYear,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY YEAR([Order_Date])
ORDER BY OrderYear;
--Identify cities with the fastest-growing order volume
WITH CityYear AS (
    SELECT
        City,
        YEAR([Order_Date]) AS OrderYear,
        COUNT([Order_ID]) AS OrdersCount
    FROM [Depi_Project].[dbo].[all]
    GROUP BY City, YEAR([Order_Date])
)
, CityGrowth AS (
    SELECT
        c1.City,
        c1.OrderYear AS CurrentYear,
        c1.OrdersCount AS CurrentYearOrders,
        ISNULL(c2.OrdersCount, 0) AS PreviousYearOrders,
        c1.OrdersCount - ISNULL(c2.OrdersCount, 0) AS Growth
    FROM CityYear c1
    LEFT JOIN CityYear c2
        ON c1.City = c2.City AND c1.OrderYear = c2.OrderYear + 1
)
SELECT TOP 10
    City,
    CurrentYear,
    CurrentYearOrders,
    PreviousYearOrders,
    Growth
FROM CityGrowth
ORDER BY Growth DESC;

--Rank cities by average number of orders per customer
SELECT top 10
    City,
    COUNT([Order_ID]) * 1.0 / COUNT(DISTINCT [Customer_ID]) AS AvgOrdersPerCustomer
FROM [Depi_Project].[dbo].[all]
GROUP BY City
ORDER BY AvgOrdersPerCustomer DESC;
--Identify the average number of orders per customer
SELECT 
    COUNT([Order_ID]) * 1.0 / COUNT(DISTINCT [Customer_ID]) AS AvgOrdersPerCustomer
FROM [Depi_Project].[dbo].[all];
--Identify seasonal patterns in order placement (by month)
SELECT 
    DATENAME(MONTH, [Order_Date]) AS MonthName,
    MONTH([Order_Date]) AS MonthNumber,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY DATENAME(MONTH, [Order_Date]), MONTH([Order_Date])
ORDER BY MonthNumber;
--Which quarters have the highest order volume
SELECT 
    'Q' + CAST(DATEPART(QUARTER, [Order_Date]) AS VARCHAR(1)) AS Quarter,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY DATEPART(QUARTER, [Order_Date])
ORDER BY OrdersCount DESC;

--Which regions place orders more frequently
SELECT 
    Region,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Region
ORDER BY OrdersCount DESC;
--Compare order frequency across customer segments
SELECT 
    Segment,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Segment
ORDER BY OrdersCount DESC;

--Query to count orders per month 
SELECT  TOP 10
    FORMAT([Order_Date], 'yyyy-MM') AS YearMonth,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY FORMAT([Order_Date], 'yyyy-MM')S
ORDER BY YearMonth;*/

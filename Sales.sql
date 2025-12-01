
--sales
--What is the total sales value of all orders?
/*SELECT SUM(Sales) AS TotalSales
FROM [Depi_Project].[dbo].[all];
--How do you calculate average sales per orders?
SELECT AVG(sales) AS "Avg Sales"
FROM [Depi_Project].[dbo].[all];
--Which month has the highest total sales?
SELECT 
    DATENAME(MONTH, Order_Date) AS MonthName,
    MONTH(Order_Date) AS MonthNumber,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY DATENAME(MONTH, Order_Date), MONTH(Order_Date)
ORDER BY TotalSales DESC;
--Which region contributes the most to total sales?
SELECT 
    Region,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Region
ORDER BY TotalSales DESC;
--Top 10 orders with the highest sales
SELECT TOP 10
Order_ID,Customer_ID,Customer_Name
FROM [Depi_Project].[dbo].[all]
ORDER BY sales DESC;*/
/*
--Yearly sales growth rate
WITH yearly AS (
    SELECT 
        YEAR([Order_Date]) AS Year,
        SUM(sales) AS TotalSales
    FROM [Depi_Project].[dbo].[all]
    GROUP BY YEAR([Order_Date])
)
SELECT 
    y1.Year,
    y1.TotalSales,
    ((y1.TotalSales - y0.TotalSales) / NULLIF(y0.TotalSales,0.0)) * 100 AS GrowthRate
FROM yearly y1
LEFT JOIN yearly y0 ON y1.Year = y0.Year + 1
ORDER BY y1.Year;*/

/*
--Top 10 orders with the highest sales
SELECT TOP 10
Order_ID,Customer_ID,Customer_Name,Sales as totalsales
FROM [Depi_Project].[dbo].[all]
ORDER BY sales DESC;
*/
/*-- there any seasonal patterns in sales?
SELECT 
    CASE DATEPART(QUARTER, [Order_Date])
        WHEN 1 THEN 'Winter'
        WHEN 2 THEN 'Spring'
        WHEN 3 THEN 'Summer'
        WHEN 4 THEN 'Fall'
    END AS Season,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY DATEPART(QUARTER, [Order_Date])
ORDER BY DATEPART(QUARTER, [Order_Date]);
--calculate total sales per category
SELECT 
    Category,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Category
ORDER BY TotalSales DESC;
--Identify outliers in sales (Top 10)
WITH Stats AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY sales) 
            OVER () AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY sales) 
            OVER () AS Q3
    FROM [Depi_Project].[dbo].[all]
)

SELECT top 10 d.Customer_Name , d.Sales
FROM [Depi_Project].[dbo].[all] d
CROSS JOIN Stats s
WHERE d.sales < s.Q1 - 1.5 * (s.Q3 - s.Q1)
   OR d.sales > s.Q3 + 1.5 * (s.Q3 - s.Q1);
   --Products contributing the most to total sales top 10

   SELECT top 10
   Product_ID, Product_Name,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Product_Name,Product_ID
ORDER BY TotalSales DESC
*/
--top sub category
SELECT top 10
    Sub_Category,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Sub_Category



/*--Determine top-selling product categories
SELECT 
    Category,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Category
ORDER BY TotalSales DESC;

--Identify underperforming sub-categories
SELECT 
    Sub_Category,
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY Sub_Category
ORDER BY TotalSales ASC;
--Identify products sold across all regions
SELECT TOP 10
    [Product_Name],
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY [Product_Name]
HAVING COUNT(DISTINCT Region) = (SELECT COUNT(DISTINCT Region) FROM [Depi_Project].[dbo].[all])
ORDER BY TotalSales DESC;
--Top 10 products by sales
SELECT TOP 10
    [Product_Name],
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY [Product_Name]
ORDER BY TotalSales DESC;
--Group sales by category
SELECT 
    Category,
    SUM(sales) AS TotalSales,
    COUNT([Order_ID]) AS TotalOrders
FROM [Depi_Project].[dbo].[all]
GROUP BY Category
ORDER BY TotalSales DESC;
--Count number of products in each sub-category
SELECT 
    Sub_Category,
    COUNT(DISTINCT [Product_Name]) AS ProductCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Sub_Category
ORDER BY ProductCount DESC;*/
--Identify low-selling products
SELECT distinct top 10
    [Product_Name],
    SUM(sales) AS TotalSales
FROM [Depi_Project].[dbo].[all]
GROUP BY [Product_Name]
HAVING SUM(sales) < 500  
ORDER BY TotalSales ASC;




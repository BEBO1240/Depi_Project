/*--Calculate delivery duration for each order
SELECT top 10
    [Order_ID],
    [Order_Date],
    [Ship_Date],
    DATEDIFF(DAY, [Order_Date], [Ship_Date]) AS DeliveryDays
FROM [Depi_Project].[dbo].[all];

--Extract fastest-shipped orders (top 10 shortest duration)
SELECT TOP 10
    [Order_ID],
    [Order_Date],
    [Ship_Date],
    DATEDIFF(DAY, [Order_Date], [Ship_Date]) AS DeliveryDays
FROM [Depi_Project].[dbo].[all]
ORDER BY DeliveryDays ASC;

--Group orders by Ship Mode
SELECT 
    [Ship_Mode],
    COUNT([Order_ID]) AS OrdersCount,
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays
FROM [Depi_Project].[dbo].[all]
GROUP BY [Ship_Mode]
ORDER BY AvgDeliveryDays ASC;
--Find late deliveries by region
SELECT 
    Region,
    COUNT([Order_ID]) AS LateOrders
FROM [Depi_Project].[dbo].[all]
WHERE DATEDIFF(DAY, [Order_Date], [Ship_Date]) > 5
GROUP BY Region
ORDER BY LateOrders DESC;
--Customers complain about late delivery — what to check
SELECT 
    Region,
    [Ship_Mode],
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS TotalOrders
FROM [Depi_Project].[dbo].[all]
GROUP BY Region, [Ship_Mode]
ORDER BY AvgDeliveryDays DESC;
--Which shipping mode causes highest delays
SELECT 
    [Ship_Mode],
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY [Ship_Mode]
ORDER BY AvgDeliveryDays DESC;
--Which regions experience highest shipping delays
SELECT 
    Region,
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Region
ORDER BY AvgDeliveryDays DESC;
--Compare delivery durations across segments
SELECT 
    Segment,
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Segment
ORDER BY AvgDeliveryDays DESC;
--How different product categories affect shipping time
SELECT 
    Category,
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY Category
ORDER BY AvgDeliveryDays DESC;
--How to optimize shipping mode per state
SELECT top 10   State,
    [Ship_Mode],
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY State, [Ship_Mode]
ORDER BY State, AvgDeliveryDays ASC;

--How different product  sub categories affect shipping time
SELECT 
   sub_Category,
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,
    COUNT([Order_ID]) AS OrdersCount
FROM [Depi_Project].[dbo].[all]
GROUP BY sub_Category
ORDER BY AvgDeliveryDays DESC;*/


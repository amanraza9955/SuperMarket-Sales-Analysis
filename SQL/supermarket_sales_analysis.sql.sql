CREATE DATABASE supermarket_analysis;
USE supermarket_analysis;
SELECT * FROM supermarket_sales
SELECT COUNT(*) AS Total_Records FROM supermarket_sales;
SELECT COUNT(*) AS Total_Transactions FROM supermarket_sales;
SELECT * FROM supermarket_sales LIMIT 10;
SELECT ROUND(SUM(Sales),2) AS Total_Sales FROM supermarket_sales;
SELECT ROUND(AVG(Sales),2) AS Average_Sale FROM supermarket_sales;
SELECT MAX(Sales) AS Highest_Sale FROM supermarket_sales;
SELECT MIN(Sales) AS Lowest_Sale FROM supermarket_sales;
SELECT City,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY City
ORDER BY Total_Sales DESC;
SELECT Branch,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY Branch
ORDER BY Total_Sales DESC;
SELECT `Product line`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY Total_Sales DESC;
SELECT Payment,
       COUNT(*) AS Total_Transactions
FROM supermarket_sales
GROUP BY Payment
ORDER BY Total_Transactions DESC;
SELECT Branch,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM supermarket_sales
GROUP BY Branch
ORDER BY Avg_Rating DESC;
SELECT Gender,
       ROUND(AVG(Rating),2) AS Avg_Rating
FROM supermarket_sales
GROUP BY Gender
ORDER BY Avg_Rating DESC;
SELECT Gender,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY Gender
ORDER BY Total_Sales DESC;
SELECT 'Customer type',
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY 'Customer type'
ORDER BY Total_Sales DESC;
SELECT * FROM supermarket_sales WHERE Gender = 'Female';
SELECT ROUND(SUM(Sales),2) AS Female_Sales
FROM supermarket_sales
WHERE Gender = 'Female';
SELECT ROUND(SUM(Sales),2) AS Yangon_Sales
FROM supermarket_sales
WHERE City = 'Yangon';
SELECT *
FROM supermarket_sales
WHERE Payment = 'Ewallet';
SELECT *
FROM supermarket_sales
WHERE Rating > 9;
SELECT City,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM supermarket_sales
GROUP BY City
HAVING SUM(Sales) > 100000;
SELECT ï»¿Invoice_Id,Sales,
       CASE
            WHEN Sales >= 500 THEN 'High'
            WHEN Sales >= 200 THEN 'Medium'
            ELSE 'Low'
       END AS Sales_Category
FROM supermarket_sales;
SELECT * 
FROM supermarket_sales
 WHERE Gender = 'Male' AND Rating > 8;
 SELECT ï»¿Invoice_Id,Rating,
       CASE
            WHEN Rating >= 8 THEN 'Excellent'
            WHEN Rating >= 6 THEN 'Good'
            ELSE 'Average'
       END AS Customer_Category
FROM supermarket_sales;
SELECT
CASE
WHEN Rating>=8 THEN 'Excellent'
WHEN Rating>=6 THEN 'Good'
ELSE 'Average'
END AS Customer_Category,

COUNT(*) AS Total_Customers

FROM supermarket_sales

GROUP BY Customer_Category;
SELECT Invoice_Id,
       City,
       Sales
FROM supermarket_sales
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM supermarket_sales
);
SELECT City,
SUM(Sales)
FROM supermarket_sales
GROUP BY City;
 WITH CitySales AS
(
SELECT City,
SUM(Sales) AS TotalSales
FROM supermarket_sales
GROUP BY City
)

SELECT *
FROM CitySales;
SELECT Invoice_Id,
Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS RowNum
FROM supermarket_sales;
SELECT Invoice_Id,
Sales,

RANK() OVER
(
ORDER BY Sales DESC
) AS SalesRank

FROM supermarket_sales;
SELECT Invoice_Id,
Sales,

DENSE_RANK() OVER
(
ORDER BY Sales DESC
) AS SalesRank

FROM supermarket_sales;

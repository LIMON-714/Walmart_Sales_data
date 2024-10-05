

CREATE DATABASE WalmartSales;

USE WalmartSales;

 SELECT @@SERVERNAME;


CREATE TABLE WalMartSales (
    [Invoice ID] VARCHAR(50),
    [Branch] VARCHAR(50),
    [City] VARCHAR(50),
    [Customer type] VARCHAR(50),
    [Gender] VARCHAR(10),
    [Product line] VARCHAR(50),
    [Unit price] DECIMAL(10, 2),
    [Quantity] INT,
    [Tax 5%] DECIMAL(10, 2),
    [Total] DECIMAL(10, 2),
    [Date] DATE,
    [Time] TIME,
    [Payment] VARCHAR(50),
    [cogs] DECIMAL(10, 2),
    [gross margin percentage] DECIMAL(5, 2),
    [gross income] DECIMAL(10, 2),
    [Rating] DECIMAL(3, 1)
);

-- Data cleaning
 SELECT * FROM WalMartSales;


 -- Add the time_of_day column
 SELECT [TIME],(CASE WHEN [Time] BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN [Time] BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM WalmartSales;

-- ADD NEW COLUM IN THE TABLE
ALTER TABLE WalMartSales
ADD time_of_day VARCHAR(20);

 SELECT * FROM WalmartSales;

 --UPDATE ALL 
UPDATE WalMartSales
SET [time_of_day] = (
    CASE
        WHEN [Time] >= '00:00:00' AND [Time] < '12:00:00' THEN 'Morning'
        WHEN [Time] >= '12:00:00' AND [Time] < '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

 SELECT * FROM WalmartSales;


 -- Add day_name column
 SELECT [Date],
    DATENAME(WEEKDAY, [Date]) AS Day_Name
FROM WalMartSales;

ALTER TABLE WalMartSales 
ADD [day_name] VARCHAR(10);



UPDATE WalMartSales
SET day_name = DATENAME(WEEKDAY, [Date]);

SELECT * FROM WalmartSales;


---- Add month_name column
SELECT  [Date],
    DATENAME(MONTH, [Date]) AS MonthName
FROM WalMartSales;

ALTER TABLE WalMartSales
ADD month_name VARCHAR(10);


UPDATE WalMartSales
SET month_name = DATENAME(MONTH, [Date]);


SELECT * FROM WalmartSales;

-- How many unique cities does the data have?
SELECT DISTINCT city
FROM WalmartSales;

-- In which city is each branch?
SELECT DISTINCT city,branch
FROM WalmartSales;

-- How many unique product lines does the data have?
SELECT DISTINCT [Product line]
FROM WalmartSales;

-- What is the most selling product line
SELECT SUM(Quantity) AS qty,[Product line]
FROM WalMartSales
GROUP BY [Product line]
ORDER BY qty DESC;


-- What is the total revenue by month

SELECT month_name AS month,SUM(Total) AS total_revenue
FROM WalMartSales
GROUP BY month_name
ORDER BY total_revenue;

-- What month had the largest COGS?
SELECT month_name AS month,SUM(cogs) AS total_cogs
FROM WalMartSales
GROUP BY month_name 
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?
SELECT [product line],SUM(total) AS total_revenue
FROM WalMartSales
GROUP BY [product line]
ORDER BY total_revenue DESC;
-- What is the city with the largest revenue?
SELECT branch, city, SUM(total) AS total_revenue
FROM WalMartSales 
GROUP BY city, branch 
ORDER BY total_revenue;

-- What product line had the largest VAT?
SELECT TOP 1 [Product line],SUM([Tax 5%]) AS total_vat
FROM WalMartSales
GROUP BY [Product line]
ORDER BY total_vat DESC;


-- line showing "Good", "Bad". Good if its greater than average sales
SELECT AVG(Quantity) AS avg_qnty
FROM WalMartSales;

SELECT [Product line],CASE WHEN AVG(Quantity) > 5 THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM WalMartSales
GROUP BY [Product line];


-- Which branch sold more products than average product sold?
SELECT [Branch], SUM(Quantity) AS qnty
FROM WalMartSales
GROUP BY [Branch]
HAVING SUM(Quantity) > (SELECT AVG(Quantity) 
FROM WalMartSales);

-- What is the most common product line by gender 192
SELECT [Gender],[Product line],COUNT([Gender]) AS total_cnt
FROM WalMartSales
GROUP BY [Gender], [Product line]
ORDER BY total_cnt DESC;

-- What is the average rating of each product line
SELECT ROUND(AVG([Rating]), 2) AS avg_rating,[Product line]
FROM WalMartSales
GROUP BY [Product line]
ORDER BY avg_rating DESC;

-- How many unique customer types does the data have?
SELECT DISTINCT [Customer type]
FROM WalMartSales;

-- How many unique payment methods does the data have?
SELECT DISTINCT [Payment]
FROM WalMartSales;

-- What is the most common customer type?
SELECT [Customer type] AS customer_type,COUNT(*) AS count
FROM WalMartSales
GROUP BY [Customer type]
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT [Customer type] AS customer_type,COUNT(*)
FROM WalMartSales
GROUP BY [Customer type];


-- What is the gender of most of the customers?
SELECT gender,COUNT(*) AS gender_cnt
FROM WalMartSales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT gender,COUNT(*) AS gender_cnt
FROM WalMartSales
WHERE branch = 'C'
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS avg_rating 
FROM WalMartSales 
GROUP BY time_of_day 
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day, AVG(rating) AS avg_rating 
FROM WalMartSales 
WHERE branch = 'A' 
GROUP BY time_of_day 
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?
SELECT day_name, AVG(rating) AS avg_rating 
FROM WalMartSales 
GROUP BY day_name 
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT day_name, COUNT(day_name) AS total_sales 
FROM WalMartSales 
WHERE branch = 'C' 
GROUP BY day_name 
ORDER BY total_sales DESC;

-- Number of sales made in each time of the day per weekday 
SELECT time_of_day, COUNT(*) AS total_sales 
FROM WalMartSales 
WHERE day_name = 'Sunday' 
GROUP BY time_of_day 
ORDER BY total_sales DESC;

-- filled during the evening hours
SELECT [customer type], SUM(total) AS total_revenue 
FROM WalMartSales 
GROUP BY [customer type] 
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT City, ROUND(AVG([Tax 5%]), 2) AS avg_tax_pct 
FROM WalMartSales 
GROUP BY City 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT [Customer type], AVG([Tax 5%]) AS total_tax 
FROM WalMartSales 
GROUP BY [Customer type] 
ORDER BY total_tax;


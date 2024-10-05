# Walmart_Sales_data

# Overview
This project focuses on analyzing Walmart’s sales data to identify the best-performing branches and products, study sales trends, and understand customer behavior. The main goal is to examine how sales strategies can be enhanced. The dataset comes from the Kaggle Walmart Sales Forecasting Competition.

# Project Objectives
The primary objective is to analyze Walmart’s sales data to uncover factors influencing sales across different branches and departments.

# Data Information
The dataset is sourced from Kaggle’s Walmart Sales Forecasting Competition and contains sales data from three Walmart branches in Mandalay, Yangon, and Naypyitaw. The dataset includes 17 columns and 1,000 rows, covering the following:
| Column                     | Description                              | Data Type          |
|----------------------------|------------------------------------------|---------------------|
| invoice_id                 | Invoice ID of the sale                   | VARCHAR(30)         |
| branch                     | Branch where the sale occurred           | VARCHAR(5)          |
| city                       | Location of the branch                   | VARCHAR(30)         |
| customer_type              | Type of customer                         | VARCHAR(30)         |
| gender                     | Gender of the purchasing customer        | VARCHAR(10)         |
| product_line               | Category of the product sold             | VARCHAR(100)        |
| unit_price                 | Price per unit of the product            | DECIMAL(10, 2)      |
| quantity                   | Quantity of the product sold             | INT                 |
| VAT                        | Tax amount applied to the purchase       | FLOAT(6, 4)         |
| total                      | Total cost of the purchase               | DECIMAL(10, 2)      |
| date                       | Date of the transaction                  | DATE                |
| time                       | Time of the transaction                  | TIMESTAMP           |
| payment_method             | Payment method used                      | DECIMAL(10, 2)      |
| cogs                       | Cost of Goods Sold                       | DECIMAL(10, 2)      |
| gross_margin_percentage     | Profit margin as a percentage            | FLOAT(11, 9)        |
| gross_income               | Gross income                             | DECIMAL(10, 2)      |
| rating                     | Customer rating                          | FLOAT(2, 1)         |


# Analysis Breakdown
Product Analysis:
Understand which product lines are performing well and identify areas for improvement.

Sales Analysis:
Analyze sales trends to measure the success of different sales strategies and make recommendations for optimization.

Customer Analysis:
Identify key customer segments, their purchasing behaviors, and profitability.

# Approach
Data Wrangling:
Perform data cleaning to handle any missing or null values by replacing them with appropriate methods.

Database Setup:
Create and populate a database. Filter out null values by setting fields as NOT NULL.

Feature Engineering:

Add a time_of_day column to categorize sales into Morning, Afternoon, and Evening, offering insights into peak sales times.
Add a day_name column to extract the days of the week and determine which day has the highest sales for each branch.
Add a month_name column to identify the months with the highest sales and profit margins.

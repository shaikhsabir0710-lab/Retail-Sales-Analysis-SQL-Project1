🛒 Retail Sales Analysis using SQL

This is my first SQL data analysis project, where I performed end-to-end data exploration, data cleaning, and business analysis on a retail sales dataset using SQL.

The project demonstrates my ability to write clean SQL queries, solve real-world business problems, and use advanced SQL features such as CTEs and window functions.

📂 Dataset Description

The dataset contains retail transaction-level data with the following columns:

transaction_id

sale_date, sale_time

customer_id

gender, age

category

quantity

price_per_unit

cogs

total_sale

🧹 Data Cleaning & Validation

Checked total number of records

Identified unique customers

Detected NULL values across all columns

Removed rows containing NULL values to ensure data quality

🔍 Data Exploration

Total number of sales transactions

Total number of unique customers

Total number of product categories

📊 Business Problems & SQL Analysis

-- The following real-world business questions were solved using SQL:

1.Retrieve all sales made on a specific date

2.Filter category-specific transactions with quantity conditions for a given month

3.Calculate total sales and total orders per category

4.Find average age of customers for the Beauty category

5.Identify high-value transactions (total_sale > 1000)

6.Analyze gender-wise transactions across categories

7.Determine the best-selling month for each year using ranking

8.Identify top 5 customers based on total sales

9.Count unique customers per category

10.Classify sales into Morning, Afternoon, and Evening shifts and count orders

--- 🛠 SQL Concepts & Techniques Used---

SELECT, WHERE, ORDER BY, LIMIT

Aggregate functions (SUM, AVG, COUNT)

GROUP BY

Date & Time functions (EXTRACT, TO_CHAR)

CASE statements

Common Table Expressions (CTE)

Window Functions (RANK() OVER, AVG() OVER)

Subqueries

🎯 Key Learnings

How to perform data cleaning in SQL

Writing business-driven analytical queries

Using window functions for ranking & comparisons

Translating business questions into efficient SQL logic

🚀 Future Enhancements

Add JOIN-based analysis using multiple tables

Create a Power BI dashboard on top of this dataset

Optimize queries for performance

🧑‍💻 Tools Used

PostgreSQL / SQL

GitHub for version control

⭐ This project helped me build a strong foundation in SQL for Data Analyst roles.
Feel free to explore, fork, or suggest improvements!

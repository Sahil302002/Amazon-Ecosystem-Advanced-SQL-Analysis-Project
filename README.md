# Amazon-Ecosystem-Advanced-SQL-Analysis-Project

![Amazon-logo ](https://github.com/user-attachments/assets/52ee4b6f-66cb-46d1-9976-bc0d584eadc0)


This project analyzes a dataset of 21,000+ records across 9 interrelated tables, simulating real-world business challenges within the Amazon ecosystem. It covers key domains like sales, customers, products, returns, payments, shipping, and inventory management.

**Key Highlights:**

- **Data Handling**: Managed large-scale datasets (21,000+ records, 9 tables) typical of e-commerce platforms.
- **SQL Techniques**: Used CTEs, Window Functions (LAG, DENSE_RANK), and subqueries for optimized querying.
- **Business Insights**: Solved problems like sales trends, profit margins, best-sellers, and customer retention.
- **Actionable Reporting**: Provided insights for inventory management, sales optimization, and customer retention strategies.

This project showcases advanced SQL skills and the ability to extract valuable business insights from complex e-commerce data, making it ideal for data analytics and business intelligence roles.

## **Dataset Overview and Dataset File Link**

- **Customers Table:** 898 records, 4 columns,  <a href = "customers.csv"> Customer Csv File</a>
    - Captures customer demographics.
    - Columns: `customer_id`, `first_name`, `last_name`, `state`
      
- **Products Table:** 766 records, 5 columns  <a href = "products.csv"> Products  Csv File Link</a>
    - Contains product details like pricing and category.
    - Columns: `product_id`, `product_name`, `price`, `Cogs`, `category_id`

- **Category Table:** 6 records, 2 columns  <a href = "customers.csv"> Category Csv File Link </a>
    - Classifies products into categories.
    - Columns: `category_id`, `category_name`
      
- **Sellers Table:** 55 records, 3 columns    <a href = "customers.csv"> Seller Csv File Link </a>
    - Information on sellers and their origin countries.
    - Columns: `seller_id`, `seller_name`, `origin`
      
- **Orders Table:** 21,629 records, 5 columns  <a href = "customers.csv"> Orders Csv File Link </a>
    - Contains order details such as customer, seller, and order status.
    - Columns: `order_id`, `order_date`, `customer_id`, `seller_id`, `order_status`

- **Order Items Table:** 21,629 records, 5 columns <a href = "customers.csv"> Order Items file Link </a>
    - Provides details on purchased items, including quantity and price.  
    - Columns: `order_item`, `order_id`, `product_id`, `quantity`, `price`
      
- **Shipping Table:** 21,141 records, 6 columns <a href = "customers.csv"> Shipping csv file Link </a>
    - Tracks shipping and return statuses.
    - Columns: `shipping_id`, `order_id`, `shipping_date`, `return_date`, `shipping_provider`, `delivery_status`
    
- **Payment Table:** 21,629 records, 4 columns <a href = "customers.csv"> Payment Csv File Link </a>
    - Records payment status and transaction details.
    - Columns: `payment_id`, `order_id`, `payment_date`, `payment_status`

- **Inventory Table:** 765 records, 5 columns     <a href = "customers.csv"> Inventory Csv File Link</a>
    - Monitors stock levels and warehouse information.
    - Columns: `inventory_id`, `product_id`, `stock`, `warehouse_id`, `last_stock`

## **Learning Objectives:**

- Analyze sales performance, customer behavior, and product trends.
- Monitor inventory to identify products below stock thresholds.
- Evaluate customer return behavior and seller performance.

## **Tools Used:**

- Microsoft SQL SERVER database management system.
- SQL SERVER MANAGEMENT STUDIO (SSMS) for database setup, management, and query execution.

## Database Design:

The database architecture is modeled after Amazon’s workflow, with parent-child table relationships:

- **Parent Tables:** Customers, Categories, and Sellers.
- **Child Tables:** Products, Orders, Order Items, Payments, Shipping, and Inventory.

Each table is interlinked to provide a comprehensive view of operations, enabling detailed analysis of sales, inventory, and customer behaviors.

# **Initial Setup & Data Import Process:**

**Data Import:**

- A total of **9 CSV files** were imported directly into the `Amazon_Db` database.
- This method was preferred as it simplifies the import process by directly mapping the CSV data to tables without manually creating each table beforehand.
- **Primary Key Setup:** During the import, special attention was given to ensure that the **primary key columns** were correctly identified for each dataset.
- **Column Data Types:** The correct **data types** were assigned to each column to ensure data integrity and consistency.

**Foreign Key Constraints:**
After importing the data, **foreign key constraints** were added to establish relationships between the tables and ensure referential integrity. Below are the foreign key constraints added to the respective tables:

- **Products ↔ Category**
    - Products are linked to their respective categories by the `category_id`.
- **Orders ↔ Customers**
    - Orders are associated with customers using the `customer_id`.
- **Orders ↔ Sellers**
    - Orders are associated with sellers via the `seller_id`.
- **Order_items ↔ Orders**
    - Order items are connected to orders using the `order_id`.
- **Order_items ↔ Products**
    - Order items are linked to products via the `product_id`.
- **Payments ↔ Orders**
    - Payments are associated with orders using the `order_id`.
- **Shipping ↔ Orders**
    - Shipping records are linked to orders using the `order_id`.
- **Inventory ↔ Products**
    - Inventory records are connected to products via the `product_id`.

![Amazon ER diagram](https://github.com/user-attachments/assets/a9be4a6e-9736-49c9-b025-fc610429d9c9)

What makes this project unique is that while the instructor from the YouTube channel used **PostgreSQL** and **pgAdmin 4** for this project, I implemented the entire project using **SQL Server** and **SQL Server Management Studio (SSMS)**. This allowed me to adapt the workflow and techniques to a different SQL environment, offering a fresh perspective on how to approach the analysis in SQL Server.

# Skills Demonstrated in this Project

### **Database Design & Data Integrity Management**

- **Schema Modification:** Used `ALTER TABLE` to modify table structures (adding/removing constraints, changing data types).
- **Primary & Foreign Keys:** Ensured referential integrity between different tables (Orders, Customers, Sellers, etc.).
- **Data Type Optimization:** Changed the `MONEY` data type to `INT`, improving data consistency and performance.

### **Data Cleaning & Filtering Techniques**

- Used **WHERE filters** to remove unwanted order statuses (`'Inprogress'`, `'returned'`) before calculating insights.
- Applied **NULLIF()** to prevent **division by zero errors** in percentage calculations.
- Used **COALESCE()** to handle missing values in sales analysis.

### **Advanced Querying & Business Intelligence**

- **Aggregations & Business Metrics Calculation:**
    - Used `SUM()`, `COUNT()`, `AVG()`, and `ROUND()` for revenue, order count, and profit calculations.
    - `CASE WHEN` statements for conditional business logic (e.g., classifying customers as new vs. returning).
- **Window Functions for Trend Analysis:**
    - Used `LAG()` for **month-over-month & year-over-year** sales comparisons.
    - `DENSE_RANK()` & `ROW_NUMBER()` for ranking best-selling products and top-performing sellers.
- **Common Table Expressions (CTEs) for Modular Queries:**
    - Used `WITH` clauses to break down complex queries into readable steps.
    - Example: CTEs for **Top Sellers**, **Monthly Sales Trends**, and **Customer Order Frequency**.

### **Advanced Joins & Data Retrieval Techniques**

- **Optimized Joins:** Used **INNER JOIN**, **LEFT JOIN**, and subqueries to merge datasets efficiently.
- **Filtering Techniques:**
    - Used `HAVING` and `WHERE` clauses for precise data extraction.
    - Example: Filtering out `Inprogress` and `Returned` orders to get **accurate revenue** calculations.

### **Customer & Seller Performance Analysis**

- **Customer Behavior Analysis:** Identified **high-value customers** (those with more than 5 orders) using `HAVING COUNT() > 5`.
- **Inactive Customer Detection:** Used `LEFT JOIN` and `WHERE order_id IS NULL` to find customers who haven’t placed orders recently.
- **Seller Performance Evaluation:**
    - Joined `Orders`, `Order_Items`, `Sellers`, and `Products` tables to track **top-performing sellers**.
    - Used `DENSE_RANK()` to rank sellers based on total revenue.

### **Sales & Revenue Insights**

- **Product Performance:** Ranked **top 10 selling products** using `ORDER BY total_sales DESC`.
- **Category-Wise Contribution:** Used **subqueries** and `SUM()` to calculate **each category’s contribution** to total revenue.
- **Return Rate & Profit Margins:**
    - Identified products with high return rates using `COUNT()` and `CASE WHEN`.
    - Analyzed profit margins by computing revenue minus cost price.

# Business Problem Solved in this Task

### Task 1: Update Order ID Column Data Type in Orders Table

In the Orders table, the order_id column was mistakenly defined as a primary key with the
MONEY data type instead of INT. Update the order_id column to use the INT data type.

### Task 2 : Top Selling Products by Total Sales

Query the Top 10 Products by Total sales value.
Challenge: Include Product name, total quantity sold, and total sales value

### Task 3 Revenue Breakdown by Product Category

Calculate total revenue generated by each product category.
Challenge: Include the percentage contribution of each category to total revenue

### Task 4 : Average Order Value for Customers with More Than 5 Orders

Compute the average Order value for each customer
Challenge: Include Only the Customers with more than 5 Orders

### Task 5:  Monthly Sales Trend for the Past Year

Query Monthly Total Sales Over the Past year.
Challenge: Display the sales trend, grouping by month, return current_month_sales, Last
Month Sales

### Task 6:  Customers Registered but Never Made a Purchase

Find the Customer registered but never placed an order
Challenge: List customer details and the time since their registration.

### Task 7 : Best Selling Category by State

Identify the best-selling product for each state
Challenge: Include the Total Sales for that category within each State.

### Task 8 : Least Selling Products by State

Identify the least-selling product for each state
Challenge: Include the Total Sales for that category within each State.

### Task 9  Customer Lifetime Value (CLV) Ranking

Calculate the total value of orders placed by each customer over their lifetime.
Challenge: Rank customers based on their Customer Lifetime Sales

### Task 10 : Inventory Stock Alert for Low Stock Products

Query Products with stock levels below a certain threshold(e., less than 10 units)
Challenge: Include last restock date and warehouse information

### Task 11 : Identify Orders with Shipping Delays

Identify orders where the shipping date is later than 4 days after the order date.
Challenge: Include customer, Order details, and delivery provider.

### Task 12 : Payment Success Rate Analysis

Calculate the Percentage of successful payments, access all orders.
Challenge: Include breakdown by Payment status (eg., Failed,pending)

### Task 13 : Top Performing Sellers Based on Sales,

Find the Top 5 sellers based on total Sales value.
Challenge: Include both successful and failed Orders, and Display their percentage of
successful Orders

### Task 14 :  Product Profit Margin Calculation

Calculate the profit margin for much product (difference between price and cost of goods sold)
Challenge: Rank products by their profit margin, showing highest to lowest

### Task 15 Most Returned Products and Return Rate

Query the top 10 products by the number of return.
Challenge: Display the return rate as a percentage of total unitssold for each product

Extra task -- Product Order Status and Sales Performance Summary

### Task 16  : Inactive Sellers in the Last 6 Months

Identify Seller who haven't made any sales in the Last 6 months
Challenge : Show the last sale date and total sales from those sellers

### Task 17:  **Classify Customers as Returning or New Based on Returns**

if the customer has done more than 5 return categorize them as returning otherwise new
challenge: List customers id, name, total orders, total returns

### Task 18 :  Top 5 Customers by Orders in Each State

Identify the Top 5 Customers with the Highest number of Orders for Each State.
Challenge: Include the Number of Orders and total Sales for each Customer.

### Task 20 :  Revenue by Shipping Provider Analysis

Calculate the Total Revenue handled by each shipping provider.
Challenge: Include the Total Number of Orders handled and the Average delivery time for each provider

### Task 21  : Top 10 Products with Highest Revenue Decline from 2022 to 2023

Top 10 Product with Highest decreasing revenue ratio compare to last year(2022) and current year(2023)
Challenge: Return product_id, Product_name, category_name,2022 revenue and 2023 Revenue decrease ratio at end Round the result

### Task 22: Store Procedure to Update Inventory on Product Sale

Create a function as soon as the product is sold the same quantity should reduced from
Inventory table

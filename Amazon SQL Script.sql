-- Amazon Advance SQL Project

/*
Task 1:
In the Orders table, the order_id column was mistakenly defined as a primary key with the 
MONEY data type instead of INT. Update the order_id column to use the INT data type. 
*/

-- Step 1: Drop the primary key constraint
ALTER TABLE Orders DROP CONSTRAINT PK_orders;

-- Step 2: Change the data type of the column
ALTER TABLE Orders ALTER COLUMN order_id INT NOT NULL;

-- Step 3: Re-add the primary key constraint
ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);
/*
-- Adding Foreign Key constraint to Tables

ALTER TABLE Products
ADD CONSTRAINT fk_category_id 
FOREIGN KEY (category_id) 
REFERENCES Category (category_id);

ALTER TABLE Orders
ADD CONSTRAINT fk_customer_id 
FOREIGN KEY (customer_id) 
REFERENCES Customers (Customer_id);

ALTER TABLE Orders
ADD CONSTRAINT fk_seller_id 
FOREIGN KEY (seller_id) 
REFERENCES Sellers (seller_id);

ALTER TABLE Order_items
ADD CONSTRAINT fk_order_id 
FOREIGN KEY (order_id) 
REFERENCES Orders (order_id);

ALTER TABLE Order_items
ADD CONSTRAINT fk_Product_id 
FOREIGN KEY (product_id) 
REFERENCES Products (product_id);

ALTER TABLE Payments
ADD CONSTRAINT fk_order_id_payment
FOREIGN KEY (order_id) 
REFERENCES Orders (order_id);

ALTER TABLE Shipping
ADD CONSTRAINT fk_order_id_shipping
FOREIGN KEY (order_id) 
REFERENCES Orders (order_id);

ALTER TABLE Inventory
ADD CONSTRAINT fk_product_Inventory
FOREIGN KEY (product_id) 
REFERENCES Products (product_id);
*/

-- EXPLORATORY DATA ANALYSIS 

SELECT * FROM category;

SELECT * FROM Orders;

SELECT * FROM Order_items;

SELECT * FROM Customers;

SELECT * FROM Payments

SELECT DISTINCT payment_status FROM  Payments

SELECT DISTINCT order_status FROM  Orders

SELECT * FROM Inventory

SELECT * FROM Shipping

SELECT  DISTINCT delivery_status FROM Shipping;

SELECT * FROM Shipping
WHERE return_date IS NOT NULL

-- This means 2,840 products were returned
SELECT * FROM Orders
WHERE order_id= 6747

--Here you can see that Order_id with 6747 which has return date in shipping table 
-- also has Returned status in Orders table

-- This is how we have verified that data follows the Integrity

SELECT
	COUNT(*) Nr_of_Delivered_and_Retained_Orders 
FROM Shipping
WHERE return_date IS NULL
AND delivery_status = 'delivered';

/* Task 2 : Top Selling Products
Query the Top 10 Products by Total sales value.
Challenge: Include Product name, total quantity sold, and total sales value
*/
-- To solve this Task first I added Sales column by doing following steps and then 
-- solve the Question
ALTER TABLE Order_items
ADD Sales FLOAT;

UPDATE Order_items
SET Sales = quantity * price_per_unit;

SELECT * FROM Order_items;


WITH Top_Product_by_Sales2
AS
(
SELECT
	oi.product_id,
	p.product_name, 
	SUM(oi.quantity) Total_Quantity_Sold,
	CAST(SUM(Sales) as decimal(10,2)) Total_Sales
FROM Orders o
LEFT JOIN Order_items oi 
	ON o.order_id= oi.order_id
LEFT JOIN Products p
	ON oi.product_id = p.product_id
GROUP BY
	oi.product_id,
	p.product_name
)
SELECT TOP 10 * FROM Top_Product_by_Sales2
ORDER BY Total_Sales DESC;

/*
Task 3 Revenue by Category
Calculate total revenue generated by each product category.
Challenge: Include the percentage contribution of each category to total revenue
*/

SELECT
	p.category_id,
	c.category_name,  
	CAST(SUM(oi.Sales) as decimal(10,2)) as Total_Sales_by_Category,
	CAST(SUM(oi.Sales)/(SELECT SUM(Sales) FROM Order_items) * 100 as decimal(10,2)) Percent_Contribution
FROM Order_items oi
LEFT JOIN Products p 
	ON oi.product_id = p.product_id
LEFT JOIN Category c
	ON c.category_id = p.category_id
Group by 
	p.category_id,
	c.category_name
ORDER BY 
	CAST(SUM(oi.Sales) as decimal(10,2)) DESC

/* Task 4 : Average Order Value (AOV)
Compute the average Order value for each customer
Challenge: Include Only the Customers with more than 5 Orders
*/

SELECT
	c.Customer_Id, 
	CONCAT(c.first_name,' ', c.last_name) Customer_Name, 
	ROUND(SUM(oi.Sales)/COUNT(o.order_id),2) Avg_Order_Value,
	COUNT(o.order_id) Nr_of_Orders
FROM Orders o 
LEFT JOIN Order_items oi 
	ON oi.order_id = o.order_id
LEFT JOIN Customers c
	ON o.customer_id = c.Customer_Id
GROUP BY 
	c.Customer_Id, 
	c.first_name, 
	c.last_name
HAVING COUNT(o.order_id) > 5
ORDER BY SUM(oi.Sales)/COUNT(o.order_id) DESC

/* Task 5 Monthly Sales Trend
Query Monthly Total Sales Over the Past year.
Challenge: Display the sales trend, grouping by month, return current_month_sales, Last 
Month Sales
*/
WITH Monthly_Trend_2023
AS
(
	SELECT 
		YEAR(order_date) Year, 
		MONTH(order_date) Month_Num,
		DATENAME(MONTH, o.order_date) Month_Name,
		ROUND(SUM(Sales),2) Current_Month_Sales,
		ROUND(LAG(SUM(Sales)) OVER(ORDER BY  MONTH(order_date)),2) Prev_Month_Sales
	FROM Orders o
	JOIN Order_items oi 
		ON o.order_id = oi.order_id
	WHERE YEAR(order_date) = 2023
	GROUP BY 
		YEAR(order_date),
		MONTH(order_date) ,
		DATENAME(MONTH, o.order_date)
)
SELECT
Year,
Month_Name, 
Current_Month_Sales, 
Prev_Month_Sales,   
ROUND((Current_Month_Sales - Prev_Month_Sales)/Prev_Month_Sales * 100,2) Pecent_Growth_Rate
FROM Monthly_Trend_2023
ORDER BY Year, Month_Num

-- Here I have gone One step further and applied Monthly trend for all four years
WITH Monthly_Trend AS
(
    SELECT 
        YEAR(order_date) AS Year, 
        MONTH(order_date) AS Month_Num,
        DATENAME(MONTH, order_date) AS Month_Name, 
        ROUND(SUM(Sales), 2) AS Current_Month_Sales,
		LAG(SUM(Sales)) OVER (ORDER BY YEAR(order_date), MONTH(order_date)) AS Prev_Month_Sales
    FROM Orders o
    JOIN Order_items oi 
        ON o.order_id = oi.order_id
    GROUP BY 
        YEAR(order_date),
        MONTH(order_date),
        DATENAME(MONTH, order_date)
)
SELECT
    Year,
    Month_Name, 
    Current_Month_Sales, 
    Prev_Month_Sales,   
    ROUND((Current_Month_Sales - Prev_Month_Sales) / NULLIF(Prev_Month_Sales, 0) * 100, 2) AS Percent_Growth_Rate
FROM Monthly_Trend
ORDER BY Year, Month_Num;


-- Year Over Year Analysis

WITH Yearly_Trend_Analysis
AS
(
	SELECT 
		DISTINCT YEAR(order_date) Years,
		ROUND(SUM(Sales),2) Current_Year_Sales,
		ROUND(LAG(SUM(Sales)) OVER (ORDER BY YEAR(order_date)),2) AS Prev_Year_Sales
	FROM Orders o
	JOIN Order_items oi
		ON o.order_id = oi.order_id
	GROUP BY 
		YEAR(order_date)
)
SELECT
	Years, 
	Current_Year_Sales, 
	Prev_Year_Sales,
	ROUND((Current_Year_Sales - Prev_Year_Sales)/Prev_Year_Sales * 100,2) Percent_Growth_Rate
FROM Yearly_Trend_Analysis
ORDER BY Years

/*Task 6: Customers with No purchases
Find the Customer registered but never placed an order
Challenge: List customer details and the time since their registration.

Solution: To demonstrate my understanding of SQL queries and showcase multiple ways to solve the 
problem effectively, I have utilized three different approaches. Each approach achieves the
same goal but employs distinct techniques to illustrate versatility in SQL
*/

SELECT * FROM Customers 
WHERE customer_id IN 
(
	SELECT
		DISTINCT c.Customer_Id
	FROM Customers c
	LEFT JOIN Orders o
		ON o.customer_id = c.Customer_Id
	WHERE order_id IS NULL
	GROUP BY c.Customer_Id
)
ORDER BY Customer_Id

-- APPROACH 2
SELECT * FROM Customers 
WHERE customer_id IN 
(
	SELECT
		DISTINCT c.Customer_Id  
	FROM Customers c
	LEFT JOIN Orders o
		ON o.customer_id = c.Customer_Id
	GROUP BY c.Customer_Id
	HAVING COUNT(o.order_id) = 0
)
ORDER BY Customer_Id

-- SMART Approach 
SELECT * FROM Customers
WHERE Customer_Id NOT IN 
	(SELECT DISTINCT Customer_Id 
	FROM Orders)
ORDER BY Customer_Id;

/* Task 7 : Best Selling Category by State 
Identify the best-selling product for each state
Challenge: Include the Total Sales for that category within each State.

I have identified the Top 3 categories for each state to provide a focused analysis of the 
most significant contributors. Notably, the Electronics category accounts for approximately 
89% of total sales, which highlights its dominant impact. This analysis allows stakeholders
to make informed decisions based on the Top 3 categories, or expand the scope to the Top 5 
or Top 10 categories if needed, depending on their strategic preferences
*/

WITH Sales_of_Category_by_State
AS
(
SELECT 
c.state as State, 
ct.category_name  Category, 
ROUND(SUM(oi.Sales),2) Total_Sales_by_Category, 
RANK() OVER(PARTITION BY c.state ORDER BY SUM(Sales) DESC) Rank
FROM Orders o
LEFT JOIN Customers c
	ON c.Customer_Id = o.customer_id
LEFT JOIN Order_items oi
	ON oi.order_id = o.order_id
LEFT JOIN Products p
	ON p.product_id = oi.product_id
LEFT JOIN Category ct
	ON ct.category_id = p.category_id
GROUP BY 
	c.state, 
	ct.category_name
)
SELECT State,Category,Total_Sales_by_Category, Rank
FROM Sales_of_Category_by_State
WHERE Rank <= 3
ORDER BY 
	State,
	Total_Sales_by_Category DESC

/* Task 8 : Least Selling Category by State 
Identify the least-selling product for each state
Challenge: Include the Total Sales for that category within each State.
*/

WITH Sales_Category_by_State
AS
(
SELECT 
c.state as State, 
ct.category_name  Category, 
ROUND(SUM(oi.Sales),2) Total_Sales_by_Category, 
RANK() OVER(PARTITION BY c.state ORDER BY SUM(Sales) ASC) Rank
FROM Orders o
LEFT JOIN Customers c
	ON c.Customer_Id = o.customer_id
LEFT JOIN Order_items oi
	ON oi.order_id = o.order_id
LEFT JOIN Products p
	ON p.product_id = oi.product_id
LEFT JOIN Category ct
	ON ct.category_id = p.category_id
GROUP BY 
	c.state, 
	ct.category_name
)
SELECT State,Category,Total_Sales_by_Category, Rank
FROM Sales_Category_by_State
WHERE Rank = 1
ORDER BY 
	State,
	Total_Sales_by_Category 

/* Task 9 Customer Lifetime Value
Calculate the total value of orders placed by each customer over their lifetime.
Challenge: Rank customers based on their Customer Lifetime Sales
*/

SELECT 
	c.customer_id,
	Concat(c.first_name,' ' ,c.last_name) Customer_Name, 
	FORMAT(ROUND(SUM(oi.Sales),2),'N') Customer_Lifetime_Sales,
	DENSE_RANK() OVER(ORDER BY ROUND(SUM(oi.Sales),2) DESC) Rank
FROM Orders o
LEFT JOIN Customers c
	ON c.Customer_Id = o.customer_id
LEFT JOIN Order_items oi
	ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY SUM(oi.Sales) DESC

/*
Task 10 Inventory Stock Alerts
Query Products with stock levels below a certain threshold(e., less than 10 units)
Challenge: Include last restock date and warehouse information
*/
SELECT 
	i.product_id,
	p.product_name,
	stock,
	i.warehouse_id ,
	last_stock_date
FROM Inventory i
JOIN Products p
	ON i.product_id = p.product_id
WHERE stock < 10

/* Task 11 Shipping Delays
Identify orders where the shipping date is later than 4 days after the order date.
Challenge: Include customer, Order details, and delivery provider.
*/

SELECT 
	c.Customer_Id,
	CONCAT(c.first_name,' ' ,c.last_name) Customer_Name,
	o.*, 
	shipping_providers,
	DATEDIFF(DAY,o.order_date, sh.shipping_date)  Days_took_to_ship
FROM Orders o
LEFT JOIN Shipping sh
	ON sh.order_id = o.order_id
LEFT JOIN Customers c
	ON c.Customer_Id = o.customer_id
WHERE DATEDIFF(DAY,o.order_date, sh.shipping_date) > 4

/* Task 12 Payment Success Rate
Calculate the Percentage of successful payments, access all orders.
Challenge: Include breakdown by Payment status (eg., Failed,pending)
*/

SELECT
	p.payment_status Payment_Status,
	COUNT(p.payment_id)  Nr_of_payments,
	ROUND(CAST(COUNT(p.payment_id) AS FLOAT)/
	(SELECT COUNT(payment_id) FROM Payments) * 100, 2) AS Percent_Breakdown
FROM Orders o
LEFT JOIN Payments p
	ON p.order_id = o.order_id
GROUP BY p.payment_status
ORDER BY Percent_Breakdown DESC

/* Task 13 Top Performing Sellers
Find the Top 5 sellers based on total Sales value.
Challenge: Include both successful and failed Orders, and Display their percentage of
successful Orders
*/

/*
Here I have solved Solved this question in three phases, and In each phase of Query I have
given insights at different level, so that Stakeholders can Get Insight at different 
Granularity
*/
--Top 5 seller with Highest Sales
SELECT TOP 5
	s.seller_id, 
	s.seller_name, 
	FORMAT(ROUND(SUM(oi.Sales),2),'N') Total_Sales_by_Sellers
FROM Orders o
JOIN Order_items oi
	ON oi.order_id = o.order_id
JOIN Sellers s
	ON s.seller_id = o.seller_id
GROUP BY 
	s.seller_id,
	s.seller_name
ORDER BY 
	ROUND(SUM(oi.Sales),2) DESC
----------------------------------------------------------------------
-- Top 5 Best Sellers by Total Sales and Percentage Order Distribution based On Order_Status
WITH Top_Sellers 
AS
(
	SELECT TOP 5
		s.seller_id, 
		s.seller_name, 
		ROUND(SUM(oi.Sales),2) Total_Sales
	FROM Orders o
	JOIN Order_items oi
		ON oi.order_id = o.order_id
	JOIN Sellers s
		ON s.seller_id = o.seller_id
	GROUP BY 
			s.seller_id,
			s.seller_name
	ORDER BY 
		Total_Sales DESC
), 
Seller_Orders_Statuses
as
(
SELECT 
	seller_id, 
	order_status, 
	CAST(COUNT(*) as float) Nr_Orders_By_Seller 
FROM Orders 
GROUP BY seller_id, order_status
),
Total_Orders
AS
(SELECT Seller_id, COUNT(order_status) Total_Orders_by_Each_Seller 
FROM Orders
GROUP BY Seller_id
)
SELECT 
	ts.seller_id,
	ts.seller_name,
	ts.Total_Sales,
	sos.order_status,
	Nr_Orders_By_Seller,
--	Total_Orders_by_Each_Seller,
ROUND((Nr_Orders_By_Seller/Total_Orders_by_Each_Seller) * 100,2) Percent_of_Orders
FROM Top_Sellers ts
LEFT JOIN Seller_Orders_Statuses sos
	ON sos.seller_id = ts.seller_id
LEFT JOIN Total_Orders ot
ON ot.seller_id = ts.seller_id
ORDER BY 
		ts.Total_Sales DESC;

----------------------------------------------------------
/*Final Solution of Task 13
Top 5 Sellers by Total Revenue and Percentage distributio of Cancelled Orders and Completed 
orders
*/

WITH Top_Sellers 
AS
(
	SELECT TOP 5
		s.seller_id, 
		s.seller_name, 
		ROUND(SUM(oi.Sales),2) Total_Sales
	FROM Orders o
	JOIN Order_items oi
		ON oi.order_id = o.order_id
	JOIN Sellers s
		ON s.seller_id = o.seller_id
	GROUP BY 
			s.seller_id,
			s.seller_name
	ORDER BY 
		Total_Sales DESC
), 
Seller_Orders_Statuses
as
(
SELECT 
	seller_id, 
	order_status, 
	CAST(COUNT(*) as float) Nr_Orders_By_Seller 
FROM Orders 
GROUP BY seller_id, order_status
),
Total_Orders
AS
(SELECT Seller_id, COUNT(order_status) Total_Orders_by_Each_Seller 
FROM Orders
WHERE
	order_status != 'Inprogress'
	AND 
	order_status != 'returned'
GROUP BY Seller_id
)
SELECT 
	ts.seller_id,
	ts.seller_name,
	ts.Total_Sales,
	sos.order_status,
	Nr_Orders_By_Seller,
	Total_Orders_by_Each_Seller,
ROUND((Nr_Orders_By_Seller/Total_Orders_by_Each_Seller) * 100,2) Percent_of_Orders
FROM Top_Sellers ts
LEFT JOIN Seller_Orders_Statuses sos
	ON sos.seller_id = ts.seller_id
LEFT JOIN Total_Orders ot
ON ot.seller_id = ts.seller_id
WHERE
	order_status != 'Inprogress'
	AND 
	order_status != 'returned'
ORDER BY 
		ts.Total_Sales DESC ;

/*
Task 14 Product Profit Margin
Calculate the profit margin for much product (difference between price and cost of goods sold)
Challenge: Rank products by their profit margin, showing highest to lowest
*/

-- Here I have gone one step ahead and calculated Profit Margin Percentage
WITH Profit_Margin
AS
(
	SELECT 
		p.product_id,
		p.product_name,
		ROUND(SUM(oi.Sales - (p.cogs * oi.quantity)),2) Profit,
		ROUND(SUM(oi.Sales),2) Total_Sales
	FROM Orders o
	LEFT JOIN Order_items oi
		ON oi.order_id = o.order_id
	LEFT JOIN Products p
	ON oi.product_id = p.product_id
	GROUP BY 
		p.product_id,
		p.product_name
)
SELECT 
product_id,
product_name,
Profit,
ROUND((Profit/Total_Sales),4) * 100 Profit_Margin_Percentage ,
DENSE_RANK() OVER(ORDER BY Profit DESC) Rank_by_Margin
FROM Profit_Margin;

/*  Task 15 Most Returned Products
Query the top 10 products by the number of return.
Challenge: Display the return rate as a percentage of total unitssold for each product
*/

WITH Top_Returned_Products AS (
    SELECT 
        p.product_id, 
        p.product_name,
        SUM(CASE WHEN o.order_status = 'returned' THEN oi.quantity ELSE 0 END) AS Nr_of_return_Units,
        SUM(oi.quantity) AS Total_Unit_Sold
    FROM Orders o
    INNER JOIN Order_items oi ON oi.order_id = o.order_id
    INNER JOIN Products p ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT TOP 10
    product_id,
    product_name, 
    Nr_of_return_Units, 
    Total_Unit_Sold,
    ROUND((CAST(Nr_of_return_Units AS FLOAT) / NULLIF(Total_Unit_Sold, 0)) * 100, 2) AS Percent_Return
FROM Top_Returned_Products
ORDER BY Nr_of_return_Units DESC;

-- Product Order Status and Sales Performance Summary

WITH Total_Orders_of_Products_by_Order_Status AS (
    SELECT 
        p.product_id, 
        p.product_name,
        o.order_status,
        SUM(oi.quantity) AS Nr_of_Units  
    FROM Orders o
    LEFT JOIN Order_items oi 
		ON oi.order_id = o.order_id
    LEFT JOIN Products p 
		ON p.product_id = oi.product_id
--WHERE p.category_id = 1 -- You can filter Products by Category Id
--AND
--YEAR(order_date) = 2024 --  You can filter by Year
	GROUP BY p.product_id, p.product_name, o.order_status
),
Total_Orders_of_Each_Products AS (
    SELECT 
        p.product_id,
        SUM(oi.quantity) AS Total_Units_by_Product 
    FROM Orders o
    LEFT JOIN Order_items oi 
		ON oi.order_id = o.order_id
    LEFT JOIN Products p
		ON p.product_id = oi.product_id
-- Where YEAR(order_date) = 2024 --  You can filer by Year
-- AND
-- p.category_id = 1 -- You can filter Products by Category Id
    GROUP BY p.product_id
), 
Product_Order_Summary AS (
    SELECT 
        tobos.product_id,
        tobos.product_name, 
        tobos.order_status,
        tobos.Nr_of_Units,
        tooep.Total_Units_by_Product 
    FROM Total_Orders_of_Products_by_Order_Status tobos
    JOIN Total_Orders_of_Each_Products tooep
		ON tobos.product_id = tooep.product_id
)
SELECT 
    product_id,
    product_name, 
    order_status,
    Nr_of_Units,
    Total_Units_by_Product,
    ROUND((CAST(Nr_of_Units AS FLOAT) / NULLIF(Total_Units_by_Product, 0)) * 100, 2) AS Percentage  -- FIX: Prevent division by zero
--WHERE Nr_of_Units > 100 -- You can filter by Nr of units
--WHERE order_status = 'Completed' -- You can filer by Order_statuses like Completed, Inprogress, Complete, Returned
FROM Product_Order_Summary
ORDER BY Total_Units_by_Product DESC, product_id;

/*
This query provides key insights into product sales and order status:

Order Distribution: Track product performance across different order statuses 
(Completed, In Progress, Returned).
Product Performance: Identify top-selling and underperforming products by comparing units sold to 
total units.
Percentage Breakdown: View the percentage of units sold in each status to spot trends 
(e.g., returns or unfulfilled orders).

Filters You Can Apply:
Product Category: p.category_id = 1 to analyze specific product categories.
Year: YEAR(order_date) = 2024 to focus on a particular year's data.
Order Status: order_status = 'Completed' (or other statuses) to focus on specific order types.
Units Sold: Nr_of_Units > 100 to filter products with significant sales.
These filters will help you get focused insights on sales, product performance, and order trends.
*/


SELECT * FROM Category
SELECT DISTINCT YEAR(order_date) FROM Orders

/*
Task 16  Inactive Sellers
Identify Seller who haven't made any sales in the Last 6 months
Challenge : Show the last sale date and total sales from those sellers
*/

SELECT MAX(order_date) Last_Order_Date FROM Orders
-- Since this dataset is 1 year old as I am doing this project at Jan 2025

-- So I will consider '2024-08-01' as My Today's date
SELECT DATEADD(MONTH,-6, '2024-08-01') Date_before_6_Months; 

-- order_date before 6 months that is '2024-02-01' 
WITH Seller_cte
AS
(
	SELECT 
		seller_id,
		seller_name,
		origin
	FROM Sellers
	WHERE Seller_id  NOT IN
	(
	SELECT DISTINCT seller_id FROM Orders
	WHERE order_date > DATEADD(MONTH,-6, '2024-08-01'))
),
Seller_cte2
AS
(
	SELECT
		s.seller_id, 
		MAX(order_date) Last_date_Sale,
		SUM(oi.Sales) Total_Sales 
	FROM Orders o
	JOIN Sellers s
		ON o.seller_id = s.seller_id
	JOIN Order_items oi
		ON oi.order_id = o.order_id
	WHERE 
		o.seller_id IN (SELECT seller_id FROM Seller_cte) 
	GROUP BY s.seller_id
)
SELECT 
	sc1.seller_id,
	sc1.seller_name,
	sc1.origin,
	sc2.Last_date_Sale,
	COALESCE(sc2.Total_Sales,0) Total_Sales
FROM Seller_cte sc1
LEFT JOIN Seller_cte2 sc2
	ON sc1.seller_id =sc2.seller_id

/* Task 17 Identify customers into returning or new
if the customer has done more than 5 return categorize them as returning otherwise new 
challenge: List customers id, name, total orders, total returns
*/

WITH Customers_Orders_Summary
AS
(
SELECT
c.Customer_Id,
CONCAT(c.first_name,' ' ,c.last_name) Customer_Full_Name,
COUNT( DISTINCT o.order_id) Total_Orders,
COALESCE(SUM(CASE WHEN 
		O.order_status = 'Returned' 
	 THEN 1 ELSE 0 END ),0) Nr_of_Returns
FROM Customers c
JOIN Orders o
	ON c.Customer_Id = o.customer_id
GROUP BY 
	c.Customer_Id,
	c.first_name,
	c.last_name
)
SELECT * , 
CASE 
	WHEN Nr_of_Returns > 5  THEN 'Returning_Customer'
	ELSE 'New_Customer' 
END New_Category
FROM Customers_Orders_Summary
ORDER BY Total_Orders DESC

/*
Task 18: Top 5 Customers by Orders in Each State
Identify the Top 5 Customers with the Highest number of Orders for Each State.
Challenge: Include the Number of Orders and total Sales for each Customer.
*/
SELECT * FROM 
(
SELECT
	c.state,
	c.Customer_Id,
	CONCAT(c.first_name,' ' ,c.last_name) Customer_Full_Name, 
	COUNT(o.order_id) Total_Orders,
	ROUND(SUM(oi.Sales),2) Total_Sales,
	DENSE_RANK() OVER(PARTITION BY c.state  ORDER BY COUNT(o.order_id) DESC) Rank_by_Orders
FROM Orders o
JOIN Customers c
	ON o.customer_id = c.Customer_Id
JOIN Order_items oi
	ON oi.order_id = o.order_id
GROUP BY 
	c.state,
	c.Customer_Id,
	c.first_name,
	c.last_name
) t1
WHERE Rank_by_Orders <= 5
ORDER BY state

/* Task 20: Revenue by Shipping Provider
Calculate the Total Revenue handled by each shipping provider.
Challenge: Include the Total Number of Orders handled and the Average delivery time for each provider
*/

SELECT 
	sh.shipping_providers, 
	ROUND(SUM(oi.Sales),2) Total_Sales, 
	COUNT(o.order_id) Nr_of_Orders,
	ROUND(AVG(DATEDIFF(DAY,o.order_date,sh.shipping_date)* 1.00)  ,2) Time_taken_to_Deliver
FROM Orders o
JOIN Shipping sh
	ON sh.order_id = o.order_id
JOIN Order_items oi
	ON oi.order_id = o.order_id
GROUP BY
		sh.shipping_providers;

/* Task 21 Top 10 Product with Highest decreasing revenue ratio compare to last year(2022) and current 
year(2023)
Challenge: Return product_id, Product_name, category_name,2022 revenue and 2023 Revenue decrease ratio
at end Round the result 
*/

WITH Product_2023
AS
(
SELECT 
	p.product_id,
	p.product_name,
	c.category_name, 
	ROUND(SUM(oi.Sales),2) Total_Sales_2023
FROM Orders o
JOIN Order_items oi
	ON o.order_id = oi.order_id
JOIN Products p
	ON p.product_id = oi.product_id
JOIN Category c
	ON c.category_id = p.category_id
WHERE YEAR(o.order_date) = 2023
GROUP BY 
	p.product_id,
	p.product_name,
	c.category_name
), Product_2022
AS
(
SELECT 
	p.product_id,
	p.product_name,
	c.category_name, 
	ROUND(SUM(oi.Sales),2) Total_Sales_2022
FROM Orders o
JOIN Order_items oi
	ON o.order_id = oi.order_id
JOIN Products p
	ON p.product_id = oi.product_id
JOIN Category c
	ON c.category_id = p.category_id
WHERE YEAR(o.order_date) = 2022
GROUP BY 
	p.product_id,
	p.product_name,
	c.category_name)
, Product_Sales_Comparison_2022_2023
AS
(
SELECT
	pr23.product_id as Product_Id, 
	pr23.product_name as Product_Name, 
	pr23.category_name as Category_Name,
	pr22.Total_Sales_2022,
	pr23.Total_Sales_2023 
FROM Product_2023 pr23
LEFT JOIN Product_2022 pr22
	ON pr23.product_id = pr22.product_id
)
SELECT  TOP 10
	Product_Id, 
	Product_Name, 
	Category_Name,
	Total_Sales_2022,
	Total_Sales_2023,
ROUND(CASE WHEN Total_Sales_2022 > 0 THEN (Total_Sales_2023 - Total_Sales_2022)
			/ Total_Sales_2022 * 100 ELSE NULL END, 2) AS Percent_Change
FROM Product_Sales_Comparison_2022_2023
WHERE Total_Sales_2022 > Total_Sales_2023 
ORDER BY Percent_Change

/*
Task 22: Store Procedure
Create a function as soon as the product is sold the same quantity should reduced from
Inventory table
*/

-- Apple Air pode 3rd gen Product_id 1--> Stock -->45
-- Apple Airpods Max Product_id 2---> Stock---> 39

CREATE PROCEDURE Update_Sales
@order_id INT,
@customer_id INT,
@seller_id INT,
@order_item_id INT,
@product_id INT,
@quantity INT
AS
BEGIN 
    -- Declaring Variables
    DECLARE  
        @v_count INT,
        @v_price FLOAT,
        @v_product VARCHAR(100)

    -- Checking Stock and Product Availability in Inventory
    SELECT 
        @v_price = price,
        @v_product = product_name
    FROM Products
    WHERE product_id = @product_id

    SELECT @v_count = COUNT(*)  
    FROM Inventory
    WHERE product_id = @product_id AND stock >= @quantity

    IF @v_count > 0  
    BEGIN
        -- Adding into Orders Table 
        INSERT INTO Orders(order_id, order_date, customer_id, seller_id, order_status)
        VALUES (@order_id, CAST(GETDATE() AS DATE), @customer_id, @seller_id, 'Inprogress')

        -- Adding into Order_items Table
        INSERT INTO Order_items(order_item_id, order_id, product_id, quantity, price_per_unit, Sales)
        VALUES (@order_item_id, @order_id, @product_id, @quantity, @v_price, @v_price * @quantity)

        -- Updating Inventory table
        UPDATE Inventory
        SET stock = stock - @quantity
        WHERE product_id = @product_id

        PRINT 'Thank you. Product Sale: ' + @v_product + ' has been added. Inventory stock updated.'
    END
    ELSE
    BEGIN
        PRINT 'Thank you for the info. The product ' + @v_product + ' is not available.'
    END
END

-------------------------------------------------------------------------------
-- Scenario before Execution was this

-- Apple Air pode 3rd gen Product_id 1--> Stock -->45

SELECT * FROM Orders-- Nr_of_Records--> 21629
SELECT * FROM Order_items;-- Nr_of_Records-->21629

--TEST 1
EXEC Update_Sales
	@order_id = 21630,
    @customer_id = 2, 
    @seller_id = 8, 
    @order_item_id = 21630, 
    @product_id = 1, 
    @quantity = 10;

-- Now after updating 
SELECT * FROM Orders
-- Nr_of_Records were 21629

SELECT * FROM Order_items;
-- Nr_of_Records were 21629

SELECT * FROM Inventory

-- Apple Air pode 3rd gen Product_id 1--> Stock --> 35


--TEST 2
-- Before execution
-- Apple Airpods Max Product_id 2---> Stock---> 39
-- Nr_of_Records were 21630
-- Nr_of_Records were 21630

EXEC Update_Sales
	@order_id = 21631,
    @customer_id = 10, 
    @seller_id = 4, 
    @order_item_id = 21631, 
    @product_id = 2, 
    @quantity = 9;

-- Apple Airpods Max Product_id 2---> Stock---> 39

SELECT * FROM Orders

SELECT * FROM Order_items

SELECT * FROM Inventory
-- AS you can observe Apple Airpods Max Product_id 2
--  Stock changed from  39  to 30 as it was sold to customer_id = 10

-- Hence my second test was also successful and Store Procedure is working perfectly.

--Test 3

SELECT * FROM Inventory

-- For product_id = 280, stocks before test 3 are 26,Now if user want to retrieve 30 quantity
-- then what will happen

EXEC Update_Sales
	@order_id = 21632,
    @customer_id = 11, 
    @seller_id = 7, 
    @order_item_id = 21632, 
    @product_id = 280, 
    @quantity = 30;

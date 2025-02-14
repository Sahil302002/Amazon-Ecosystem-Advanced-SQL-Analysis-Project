# Amazon-Ecosystem-Advanced-SQL-Analysis-Project

![Amazon-logo ](https://github.com/user-attachments/assets/52ee4b6f-66cb-46d1-9976-bc0d584eadc0)

# About this Project

This project analyzes a dataset of 21,000+ records across 9 interrelated tables, simulating real-world business challenges within the Amazon ecosystem. It covers key domains like sales, customers, products, returns, payments, shipping, and inventory management.

### **Key Highlights:**

- **Data Handling**: Managed large-scale datasets (21,000+ records, 9 tables) typical of e-commerce platforms.
- **SQL Techniques**: Used CTEs, Window Functions (LAG, DENSE_RANK), and subqueries for optimized querying.
- **Business Insights**: Solved problems like sales trends, profit margins, best-sellers, and customer retention.
- **Actionable Reporting**: Provided insights for inventory management, sales optimization, and customer retention strategies.

This project showcases advanced SQL skills and the ability to extract valuable business insights from complex e-commerce data, making it ideal for data analytics and business intelligence roles.

# **Objective of Amazon Ecosystem Analysis  Project**

Amazon’s clients—**whether sellers, logistics partners, or internal teams**—are looking for data-driven insights to optimize operations, improve customer experience, and maximize profits.

The objective of this project is to analyze and extract key business insights from Amazon’s ecosystem to assist the company’s leadership in making data-driven decisions. By identifying  

- Increase Sales
- Improve Inventory Management
- Enhance Customer Satisfaction
- Optimize Shipping & Logistics
- Reduce Fraud & Returns
  
# Business Problem Assigned to Me in This Project

- **Question 1**: In the Orders table, the order_id column was mistakenly defined as a primary key with the MONEY data type instead of INT. Update the order_id column to use the INT data type.

- **Question: 2**  Query the Top 10 Products by Total sales value. Include Product name, total quantity sold, and total sales value

- **Question 3** : Calculate total revenue generated by each product category. Include the percentage contribution of each category to total revenue

- **Question 4**: Compute the average Order value for each customer, Include Only the Customers with more than 5 Orders

- **Question 5**: Query Monthly Total Sales Over the Past year. Display the sales trend, grouping by month, return current_month_sales, Last Month Sales

- **Question 6**: Find the Customer registered but never placed an order, List customer details and the time since their registration.

- **Question 7** : Identify the best-selling product for each state, Include the Total Sales for that category within each State.

- **Question 8** : Identify the least-selling product for each state. Include the Total Sales for that category within each State.

- **Question 9** : Calculate the total value of orders placed by each customer over their lifetime. Rank customers based on their Customer Lifetime Sales

- **Question 10** : Query Products with stock levels below a certain threshold(e., less than 10 units), Include last restock date and warehouse information

- **Question 11** : Identify orders where the shipping date is later than 4 days after the order date. Include customer, Order details, and delivery provider.

- **Question 12** : Calculate the Percentage of successful payments, access all orders., Include breakdown by Payment status (eg., Failed,pending)

- **Question 13** : Find the Top 5 sellers based on total Sales value., Include both successful and failed Orders, and Display their percentage of successful Orders

- **Question 14** : Calculate the profit margin for much product (difference between price and cost of goods sold), Rank products by their profit margin, showing highest to lowest

- **Question 15**: Query the top 10 products by the number of return. Display the return rate as a percentage of total unitssold for each product

- **Question 16**: Identify Seller who haven't made any sales in the Last 6 month, Show the last sale date and total sales from those sellers

- **Question 17**: if the customer has done more than 5 return categorize them as returning otherwise new,.List customers id, name, total orders, total returns

- **Question 18**: Identify the Top 5 Customers with the Highest number of Orders for Each State. Include the Number of Orders and total Sales for each Customer.

- **Question 19**: Calculate the Total Revenue handled by each shipping provider. Include the Total Number of Orders handled and the Average delivery time for each provider

- **Question 20**: Top 10 Product with Highest decreasing revenue ratio compare to last year(2022) and current year(2023),  Return product_id, Product_name, category_name,2022 revenue and 2023 Revenue decrease ratio at end Round the result

- **Question 21**: Create a function as soon as the product is sold the same quantity should reduced from
Inventory table

# **Tools Used:**

- Microsoft SQL SERVER database management system.
- SQL SERVER MANAGEMENT STUDIO (SSMS) for database setup, management, and query execution.

# Project Overview: SQL-Driven Business Analysis for an E-Commerce Platform

This project involved building a comprehensive SQL database for an e-commerce platform similar to Amazon, aimed at analyzing sales, customer behavior, product trends, and monitoring inventory. The dataset includes multiple tables, each serving different aspects of the business:

**Dataset Overview:**

- The project uses 9 tables: **Customers**, **Products**, **Categories**, **Sellers**, **Orders**, **Order Items**, **Shipping**, **Payments**, and **Inventory**.
- Relationships were established through **primary** and **foreign keys** to ensure data integrity and enable complex queries.

**Key Analytical Goals**

- Evaluate **sales trends, customer purchasing behavior, and product performance**.
- Monitor **inventory levels** to prevent stock shortages and optimize supply chain management.
- Analyze **customer returns and seller performance** to enhance operational efficiency.

**Database Design:**

- The database mirrors **Amazon's workflow** with parent-child relationships, linking key tables like Customers, Sellers, and Orders.
- The design allows for thorough analysis of operations across various departments.

**Initial Setup & Data Import Process:**

- Data was imported from **9 CSV files** into the **Amazon_Db** database, followed by adding **primary keys** and **foreign key constraints**.
- Attention was given to the integrity of the relationships between the tables, such as linking **Products ↔ Categories** and **Orders ↔ Customers**.

**Skills Demonstrated:**

- **Database Design & Integrity Management:** Ensured proper schema design, data integrity, and optimization of table structures.
- **Data Cleaning & Filtering:** Employed techniques like **NULLIF()** and **COALESCE()** for data cleaning and error handling.
- **Advanced Querying & Business Intelligence:** Used **aggregations**, **window functions**, and **CTEs** for complex analysis of sales, revenue, and customer trends.
- **Customer & Seller Performance Analysis:** Identified high-value customers and evaluated seller performance with rankings.
- **Sales & Revenue Insights:** Analyzed product sales, category contributions, return rates, and profit margins.

# Data-Driven Business Insights for Amazon Ecosystem Optimization
- The analysis focused on optimizing **sales performance, customer behavior, inventory management, logistics, and operational efficiency** within the Amazon ecosystem.

### **1. Sales & Revenue Optimization**

- Identified **top-selling products** and **least-selling products by state**, enabling strategic inventory allocation and targeted marketing efforts.
- Analyzed **monthly sales trends** over the past year to uncover seasonal demand patterns for better forecasting.
- Evaluated **revenue breakdown by product category**, allowing category managers to prioritize high-revenue segments.
- Assessed **product profit margins**, ensuring optimal pricing strategies for maximizing profitability.
- Tracked the **top 10 products with the highest revenue decline (2022–2023)** to identify areas needing immediate intervention.

### **2. Customer Behavior & Retention**

- Segmented customers based on **returning vs. new customers**, aiding personalized engagement strategies.
- Ranked **Customer Lifetime Value (CLV)** to help the Amazon team focus on high-value customers.
- Highlighted **customers registered but never made a purchase**, enabling targeted re-engagement campaigns.
- Analyzed the **top 5 customers by orders in each state**, helping tailor regional sales strategies.
- Assessed **Average Order Value (AOV) for customers with more than five orders**, identifying loyal customers for upselling and rewards programs.

### **3. Inventory & Supply Chain Optimization**

- Provided **inventory stock alerts for low-stock products**, preventing stockouts and improving fulfillment efficiency.
- Implemented **automated inventory updates on product sales** using SQL-stored procedures, ensuring real-time stock accuracy.

### **4. Operational Efficiency & Logistics**

- Identified **orders with shipping delays**, allowing proactive measures to enhance delivery performance.
- Analyzed **revenue by shipping provider**, helping Amazon optimize partnerships with logistics providers.

### **5. Marketplace & Seller Performance**

- Ranked **top-performing sellers based on sales**, enabling Amazon to set performance benchmarks.
- Identified **inactive sellers in the last six months**, facilitating re-engagement or removal strategies.

### **6. Returns & Payment Analysis**

- Analyzed **most returned products and return rates**, identifying areas for quality improvement.
- Conducted a **payment success rate analysis**, ensuring seamless transaction processing for customers.

### **7. Data Quality & Maintenance**

- Ensured data integrity by updating the **Order ID column data type in the Orders table**, preventing inconsistencies in order tracking.

- This **Advanced SQL-driven analysis** provided Amazon’s team with actionable insights to improve **sales strategy, customer engagement, inventory planning, logistics, and operational efficiency**, driving overall business growth.

- **Solution  Link of the Business Problems with Screenshot and Query** <a href= "Amazon Advance SQL Data Analysis Project.pdf">Link</a>
- **SQL Script Prepared to solve these business Problem** <a href = "Amazon SQL Script.sql"> Link</a>
- **Document file created in this Project**  <a href = "Amazon Advance SQL Data Analysis Project.docx">Link</a>

# **Key Insights and Recommendations**
Amazon's clients (including customers, sellers, and business stakeholders) seek different types of insights to optimize their operations, improve customer satisfaction, and maximize revenue. Below are the key insights they might be interested in and the reasons behind them:

### **Best-Selling & Least-Selling Products**
- These are Top 10 Products with Highest Sales
- Apple iMac Pro with 0.62 Miilion Sales , Apple iMac 27-Inch Retina with 0.23 Million Sales, Canon EOS R5 Mirrorless Camera with 0.22 Million Sales, Apple iMac 24-Inch 0.18 Million, 

- These are Top 10 least selling Product By Lowest Sales: 
- Pet Travel Water Bottle with 38.97 Total Sales , Kid’s Yoga Mat with 75.96 sales, Dog Toothpaste with 79.92 sales, Cat Tunnels with 79.96 sales, Cat Wand Toy with 104.93 sales
Hot Wheels Cars, Sports Water Bottle, Dog Bone, Bird Toy, Vegetable Peeler

### **Revenue Distribution Across Categories**

- Electronics is the Highest Revenue Generating Category with Sales of  11.3 Miilion and 89.74 Percent of Total Revenue
- Sports & Outdoors with 3.62% of Total Revenue
- Toys & Games: 2.80 % of Total Revenu
- Pet Supplies: 2.08% of Total Revenue
- clothing: 1.06% of Total Reveneu
- home & kitchen with 0.71% of Total Revenue

### **High-Value Customers & Average Order Value**

- Customer Naem Avg Order Value
- Yvonne Turner	1792.83
- Samuel Reed	1524.27
- Quinn Green	1366.81
- Xavier Green	1299.98
- Emma Scott	1276.42

### **Monthly Sales Trends & Forecasting**

Month_name    % Growth Rate
January         NULL
February        3.74
March           42.48
April          5.64
May            2.75
June           -17.83
July           2.98
August        26.42
September     -8.05
October       -32.23
November      -16.78
December      -2.14

---

### **Registered but Inactive Customers**

Insight: Customers who signed up but never placed an order.
**Reason**:
- Helps in re-engagement strategies like personalized offers or email campaigns.
- Identifies potential issues with user experience preventing purchases.

Insights: There were 210 customers who are registered but never placed an order

---

### **Best & Worst-Selling Categories by State**

Task: Best and worst-performing categories in each state.
**Reason:**
- Helps sellers optimize their stock based on regional demand.
- Allows Amazon to plan state-specific ad campaigns and discounts.

Insights: 
- Electronics, Sports and Outdoors, and toys and Games these three are Best selling categories in most of the States where electronics stoods 1st most and then sport & Outerdoors, and then Toys and Games

- Home and Kictchen, and sports Outdoors and Clothing  are Worst selling categories by most of the State

---

### **Customer Lifetime Value (CLV) & High-Spending Customers**

Task: Ranking customers by total lifetime purchases.
**Reason**:
- Helps Amazon prioritize high-value customers for premium services.
- Assists sellers in targeting their most profitable customers.

Insights:  Here are Top 10 
Customer_Name    CLT Sales        Rank
Yvonne Reed      89,029.09        1
Mia Reed    	      82,350.18 	  2
Fred Davis	      82,179.17	      3
Quinn Davis        79,205.23      4
Nathan Lee	      77,136.98	      5
Henry Reed	      75,825.21	      6
Wendy Reed	      75,738.73       7
Jack Johnson	    75,017.15      	8
Zackary Davis	   74,862.01	      9
Olivia Barnes	   74,692.81	      10

---

### **Low Stock Alerts for Inventory Management**
Task: Products with less than 10 units in stock.
**Reason**:
- Helps prevent stockouts and lost sales.
- Enables Amazon to ensure better warehouse management.

---

### **Shipping Performance & Delays**
Task: Orders delayed beyond 4 days with details of delivery provider.
**Reason:**
- Identifies logistics bottlenecks and improves delivery efficiency.
- Helps in negotiating better terms with third-party shipping providers.

---

### **Payment Success Rate & Issues**
Task: Breakdown of successful, failed, and pending payments.
**Reason:**
- Helps identify technical issues causing failed payments.
- Improves customer experience by reducing transaction failures.

Insights: 
Payment Status     Nr of payments     Percent_Breakdown
Payment Successed   	18301	                84.61
Refunded 	             2840         	       13.13
Payment Failed	        488                 	2.26
NULL	                    0                    	0

---

### **Top Performing Sellers & Seller Inactivity**

Task: Best-performing sellers and those inactive for 6 months.
**Reason:**
- Helps Amazon reward high-performing sellers with better visibility.
- Encourages inactive sellers to resume business by offering incentives.

Insights: Inactive sellers : Clorox, Lysol

---

### **Product Profit Margins & Pricing Strategy**
Task: Most profitable products ranked by margin.
**Reason:**
- Helps sellers focus on high-margin items to maximize profits.
- Allows Amazon to set better commission rates and pricing models.

---

### **Most Returned Products & Return Rates**
Task: Products with the highest return percentages.
**Reason:**
- Helps sellers identify quality issues or misleading product descriptions.
- Allows Amazon to refine return policies and improve customer trust.

---

### **Customer Classification (New vs. Returning Based on Returns)**
Task: Customers with more than 5 returns are classified as “Returning” customers.
**Reason:**
- Helps Amazon handle frequent returners differently (e.g., stricter return policies).
- Improves fraud detection for excessive returns.

---

### **Top Customers by State**
Task: Top 5 customers per state based on order count.
**Reason:**
- Helps sellers and Amazon understand regional shopping behavior.
- Enables targeted offers based on customer location.

---

### **Shipping Provider Performance & Revenue Analysis**
Task: Revenue, number of orders, and average delivery time by provider.
**Reason:**
- Helps Amazon track which shipping companies perform best.
- Allows for better logistics and cost optimization.

---

### **Declining Revenue Products (2022 vs. 2023)**
Task: Products with the highest revenue decline.
**Reason:**
- Identifies outdated or less popular products for potential removal.
- Helps adjust marketing or pricing strategies to boost sales.

---

### **Automated Inventory Updates**
Task: Function to reduce inventory automatically after a sale.
**Reason:**
- Ensures accurate stock levels in real time.
- Reduces the risk of overselling and improves fulfillment efficiency.

# Amazon-Ecosystem-Advanced-SQL-Analysis-Project

![Amazon-logo ](https://github.com/user-attachments/assets/52ee4b6f-66cb-46d1-9976-bc0d584eadc0)

# About this Project

This project analyzes a dataset of 21,000+ records across 9 interrelated tables, simulating real-world business challenges within the Amazon ecosystem. It covers key domains like sales, customers, products, returns, payments, shipping, and inventory management.

**Key Highlights:**

- **Data Handling**: Managed large-scale datasets (21,000+ records, 9 tables) typical of e-commerce platforms.
- **SQL Techniques**: Used CTEs, Window Functions (LAG, DENSE_RANK), and subqueries for optimized querying.
- **Business Insights**: Solved problems like sales trends, profit margins, best-sellers, and customer retention.
- **Actionable Reporting**: Provided insights for inventory management, sales optimization, and customer retention strategies.

This project showcases advanced SQL skills and the ability to extract valuable business insights from complex e-commerce data, making it ideal for data analytics and business intelligence roles.

## **Objective of Amazon Ecosystem Project as a Data Analyst**

Amazon’s clients—**whether sellers, logistics partners, or internal teams**—are looking for data-driven insights to optimize operations, improve customer experience, and maximize profits.

The objective of this project is to analyze and extract key business insights from Amazon’s ecosystem to assist the company’s leadership in making data-driven decisions. By identifying  

- Increase Sales
- Improve Inventory Management
- Enhance Customer Satisfaction
- Optimize Shipping & Logistics
- Reduce Fraud & Returns

## **Tools Used:**

- Microsoft SQL SERVER database management system.
- SQL SERVER MANAGEMENT STUDIO (SSMS) for database setup, management, and query execution.

## **Task Done in This Project**

This project involved building a comprehensive SQL database for an e-commerce platform similar to Amazon, aimed at analyzing sales, customer behavior, product trends, and monitoring inventory. The dataset includes multiple tables, each serving different aspects of the business:

**Dataset Overview:**

- The project uses 9 tables: **Customers**, **Products**, **Categories**, **Sellers**, **Orders**, **Order Items**, **Shipping**, **Payments**, and **Inventory**.
- Relationships were established through **primary** and **foreign keys** to ensure data integrity and enable complex queries.

**Learning Objectives:**

- Analyze **sales performance**, **customer behavior**, and **product trends**.
- Monitor **inventory levels** and identify stock shortages.
- Evaluate **customer returns** and **seller performance**.

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

## **Insights Amazon’s Clients Want & Possible Reasons Behind Them**

Amazon's clients (including customers, sellers, and business stakeholders) seek different types of insights to optimize their operations, improve customer satisfaction, and maximize revenue. Below are the key insights they might be interested in and the reasons behind them:

### **Best-Selling & Least-Selling Products**

Task: Top 10 selling products and least-selling products by state.

*Reason:*

- Helps sellers optimize inventory by restocking high-demand products.
- Allows Amazon to promote slow-moving items through discounts or targeted ads.

**Insights:** 

These are Top 10 Products with Highest Sales

Apple iMac Pro with 0.62 Miilion Sales , Apple iMac 27-Inch Retina with 0.23 Million Sales, Canon EOS R5 Mirrorless Camera with 0.22 Million Sales, Apple iMac 24-Inch 0.18 Million, 

These are Top 10 least selling Product By Lowest Sales: 

Pet Travel Water Bottle with 38.97 Total Sales , Kid’s Yoga Mat with 75.96 sales, Dog Toothpaste with 79.92 sales, Cat Tunnels with 79.96 sales, Cat Wand Toy with 104.93 sales
Hot Wheels Cars, Sports Water Bottle, Dog Bone, Bird Toy, Vegetable Peeler

### **Revenue Distribution Across Categories**

Task: Contribution of each category to total revenue.

**Reason:**

- Helps Amazon identify high-performing categories to focus on.
- Allows sellers to make data-driven decisions about what to stock.

**Insights:**

Electronics is the Highest Revenue Generating Category with Sales of  11.3 Miilion and 89.74 Percent of Total Revenue
Sports & Outdoors with 3.62% of Total Revenue
Toys & Games: 2.80 % of Total Revenu
Pet Supplies: 2.08% of Total Revenue
clothing: 1.06% of Total Reveneu
home & kitchen with 0.71% of Total Revenue

### **High-Value Customers & Average Order Value**

Task: Customers with more than 5 orders and their average spending.

Reason:

- Identifies loyal customers for retention programs and exclusive offers.
- Helps in segmenting customers for personalized marketing.

Insights: As you can observe these are top 5 highest Order value customer

Yvonne Turner	1792.83
Samuel Reed	1524.27
Quinn Green	1366.81
Xavier Green	1299.98
Emma Scott	1276.42

---

### **Monthly Sales Trends & Forecasting**

Task: Monthly sales comparison to identify trends of Previous year.

Reason:

- Helps Amazon adjust marketing campaigns and promotional events.
- Enables sellers to anticipate demand fluctuations.

Insights

Month_name      % Growth Rate

January          NULL
February        3.74
March             42.48
April                5.64
May                 2.75
June                -17.83
July                   2.98
August            26.42
September    -8.05
October         -32.23
November      -16.78
December      -2.14

---

### **Registered but Inactive Customers**

Insight: Customers who signed up but never placed an order.

Reason:

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

Electronics, Sports and Outdoors, and toys and Games these three are Best selling categories in most of the States where electronics stoods 1st most and then sport & Outerdoors, and then Toys and Games

Home and Kictchen, and sports Outdoors and Clothing  are Worst selling categories by most of the State

---

### **Customer Lifetime Value (CLV) & High-Spending Customers**

Task: Ranking customers by total lifetime purchases.

Reason:

- Helps Amazon prioritize high-value customers for premium services.
- Assists sellers in targeting their most profitable customers.

Insights:  Here are Top 10 

Customer_Name CLT Sales  Rank

Yvonne Reed      89,029.09       1
Mia Reed    	      82,350.18 	2
Fred Davis	      82,179.17	        3
Quinn Davis        79,205.23       4
Nathan Lee	      77,136.98	       5
Henry Reed	      75,825.21	       6
Wendy Reed	      75,738.73       7
Jack Johnson	75,017.15	8
Zackary Davis	74,862.01	9
Olivia Barnes	74,692.81	10

---

### **Low Stock Alerts for Inventory Management**

Task: Products with less than 10 units in stock.

Reason:

- Helps prevent stockouts and lost sales.
- Enables Amazon to ensure better warehouse management.

---

### **Shipping Performance & Delays**

Task: Orders delayed beyond 4 days with details of delivery provider.

Reason:

- Identifies logistics bottlenecks and improves delivery efficiency.
- Helps in negotiating better terms with third-party shipping providers.

---

### **Payment Success Rate & Issues**

Task: Breakdown of successful, failed, and pending payments.

Reason:

- Helps identify technical issues causing failed payments.
- Improves customer experience by reducing transaction failures.

Insights: 

Payment Status     Nr of payments     Percent_Breakdown

Payment Successed	18301	                84.61
Refunded 	                2840           	       13.13
Payment Failed	        488                 	2.26
NULL	                           0                          	0

---

### **Top Performing Sellers & Seller Inactivity**

Task: Best-performing sellers and those inactive for 6 months.

Reason:

- Helps Amazon reward high-performing sellers with better visibility.
- Encourages inactive sellers to resume business by offering incentives.

Insights: Inactive sellers : Clorox, Lysol

---

### **Product Profit Margins & Pricing Strategy**

Task: Most profitable products ranked by margin.

Reason:

- Helps sellers focus on high-margin items to maximize profits.
- Allows Amazon to set better commission rates and pricing models.

---

### **Most Returned Products & Return Rates**

Task: Products with the highest return percentages.

Reason:

- Helps sellers identify quality issues or misleading product descriptions.
- Allows Amazon to refine return policies and improve customer trust.

---

### **Customer Classification (New vs. Returning Based on Returns)**

Task: Customers with more than 5 returns are classified as “Returning” customers.

Reason:

- Helps Amazon handle frequent returners differently (e.g., stricter return policies).
- Improves fraud detection for excessive returns.

---

### **Top Customers by State**

Task: Top 5 customers per state based on order count.

Reason:

- Helps sellers and Amazon understand regional shopping behavior.
- Enables targeted offers based on customer location.

---

### **Shipping Provider Performance & Revenue Analysis**

Task: Revenue, number of orders, and average delivery time by provider.

Reason:

- Helps Amazon track which shipping companies perform best.
- Allows for better logistics and cost optimization.

---

### **Declining Revenue Products (2022 vs. 2023)**

Task: Products with the highest revenue decline.

Reason:

- Identifies outdated or less popular products for potential removal.
- Helps adjust marketing or pricing strategies to boost sales.

---

### **Automated Inventory Updates**

Task: Function to reduce inventory automatically after a sale.

Reason:

- Ensures accurate stock levels in real time.
- Reduces the risk of overselling and improves fulfillment efficiency.

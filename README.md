# 🍕 Pizza Sales Analysis using PostgreSQL

## 📌 Project Overview

This project analyzes one year of Pizza Hut sales data using PostgreSQL. The objective is to answer real-world business questions related to sales performance, customer ordering behavior, product popularity, revenue contribution, and business trends.

The analysis uses SQL concepts ranging from basic queries to advanced analytical functions such as Common Table Expressions (CTEs), Window Functions, Aggregate Functions, Joins, and Subqueries.

---

## 📂 Dataset

The database contains four relational tables:

| Table             | Description                                |
| ----------------- | ------------------------------------------ |
| **orders**        | Customer order information (date and time) |
| **order_details** | Individual pizzas ordered in each order    |
| **pizzas**        | Pizza size and price information           |
| **pizza_types**   | Pizza names, categories, and ingredients   |

---

## 🛠️ SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* Aggregate Functions
* INNER JOIN
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions

  * RANK()
  * SUM() OVER()
* Date & Time Functions
* Revenue Calculations

---

## 📊 Business Questions Solved

* Total number of orders
* Total revenue generated
* Highest and lowest priced pizza
* Most ordered pizza size
* Top selling pizzas by quantity
* Category-wise sales
* Hourly order distribution
* Daily average pizzas sold
* Revenue contribution by category
* Top revenue-generating pizzas
* Cumulative revenue trend
* Ranking pizzas within each category

---

# 📈 Key Business Insights

### 💰 Revenue Performance

* Total revenue exceeded **$817K** during the year.
* Revenue increased steadily throughout the year, indicating consistent customer demand.
* No major long-term decline in sales was observed.

---

### 🍕 Best Performing Category

**Classic pizzas generated the highest revenue contribution (26.91%)**, making them the strongest-performing category.

Revenue contribution:

* Classic → **26.91%**
* Supreme → **25.46%**
* Chicken → **23.96%**
* Veggie → **23.68%**

**Business Recommendation**

* Promote Classic pizzas as flagship products.
* Introduce combo meals centered around Classic pizzas.
* Feature Classic pizzas prominently in marketing campaigns.

---

### 🏆 Highest Revenue-Generating Pizzas

Top performers include:

* The Thai Chicken Pizza
* The Barbecue Chicken Pizza
* The Classic Deluxe Pizza
* The Spicy Italian Pizza
* The Four Cheese Pizza

These pizzas consistently generated the highest revenue within their categories.

**Business Recommendation**

* Ensure sufficient inventory for ingredients.
* Prioritize these pizzas during promotional campaigns.
* Bundle them with beverages or desserts to increase average order value.

---

### 📦 Customer Ordering Behavior

Most ordered pizzas by quantity:

1. Classic Deluxe Pizza
2. Barbecue Chicken Pizza
3. Hawaiian Pizza
4. Pepperoni Pizza
5. Thai Chicken Pizza

These pizzas represent customer favorites.

---

### 📏 Preferred Pizza Size

One pizza size clearly dominated customer orders.

**Business Recommendation**

* Maintain higher stock levels for the most popular size.
* Offer limited-time discounts on less popular sizes to balance inventory.

---

### ⏰ Peak Ordering Hours

The busiest hours were:

* **12 PM**
* **1 PM**
* **5 PM**
* **6 PM**
* **7 PM**

These correspond to lunch and dinner periods.

**Business Recommendation**

* Schedule more staff during peak hours.
* Increase kitchen capacity during meal times.
* Launch flash promotions during slower periods.

---

### 📅 Daily Sales Trend

Average pizzas sold per day:

**138.47 pizzas**

Sales remained relatively consistent throughout the year.

**Business Recommendation**

* Use this value for inventory forecasting.
* Plan staffing requirements based on average daily demand.

---

### 🥗 Category Demand

Order volume by category:

* Classic
* Supreme
* Veggie
* Chicken

Classic pizzas were ordered most frequently, indicating strong customer preference.

---

### 💵 Product Pricing

Highest-priced pizza:

* The Greek Pizza ($35.95)

Lowest-priced pizza:

* The Pepperoni Pizza ($9.75)

This pricing strategy offers products across multiple customer spending levels.

---

### 📈 Revenue Growth

Using cumulative revenue analysis, the business demonstrated continuous revenue growth throughout the year without prolonged periods of decline.

This indicates:

* Stable customer demand
* Healthy sales performance
* Effective product mix

---

# 🎯 Business Recommendations

* Continue investing in the Classic pizza category.
* Increase marketing for high-performing pizzas.
* Introduce bundle offers using top-selling pizzas.
* Optimize staffing during lunch and dinner peaks.
* Improve promotions for lower-performing pizzas.
* Use historical sales trends for inventory planning.
* Expand premium offerings while maintaining affordable options.

---

## 🚀 Skills Demonstrated

* PostgreSQL
* Relational Database Design
* Data Cleaning
* Business Analytics
* SQL Problem Solving
* Revenue Analysis
* Customer Behavior Analysis
* Window Functions
* CTEs
* Business Insight Generation

---

## 👨‍💻 Author

**Syed Auliya Mohiddin**

Aspiring Data Analyst passionate about transforming raw data into actionable business insights using SQL, Power BI, Python, and Excel.

CREATE DATABASE pizza_hut_db;

CREATE TABLE order_details(
		order_details_id INT PRIMARY KEY,
		order_id INT,
		pizza_id VARCHAR(20),
		quantity INT
		);

CREATE TABLE orders(
		order_id INT PRIMARY KEY,
		date DATE,
		time TIME
		);

CREATE TABLE pizza_types(
		pizza_type_id VARCHAR(40),
		name VARCHAR(60),
		category VARCHAR(40),
		ingredients VARCHAR(110)
		);
CREATE TABLE pizzas(
		pizza_id VARCHAR(30),
		pizza_type_id VARCHAR(30),
		size CHAR(5),
		price NUMERIC(10,2)
		);

/*****************************************************
					VERIFYING DATA
******************************************************/
SELECT * FROM order_details LIMIT 5;
SELECT * FROM orderS LIMIT 5;
SELECT * FROM pizza_types LIMIT 5;
SELECT * FROM pizzas LIMIT 5;

SELECT COUNT(*) FROM order_details;--48620 ROWS
SELECT COUNT(*) FROM orders;--21350 rows
SELECT COUNT(*) FROM pizza_types;--32 rows
SELECT COUNT(*) FROM pizzas;--96 rows

/*****************************************************
					DATA EXPLORATION
******************************************************/
-- 1.Retrieve the total number of orders placed.
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2.Calculate the total revenue generated from pizza sales.
SELECT SUM(od.quantity * p.price)AS revenue
FROM order_details od
JOIN pizzas p
USING (pizza_id);

--3.Identify the highest-priced pizza.
SELECT pt.name,
		p.price
FROM pizza_types pt
	JOIN pizzas p
	ON pt.pizza_type_id=p.pizza_type_id
	WHERE p.price =(
					SELECT MAX(price)AS highest_price
					FROM pizzas);
		--(OR)--
SELECT pt.name,
		p.price
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id=p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

--4.Identify the lowest-priced pizza.
SELECT pt.name,
		p.price
FROM pizza_types pt
	JOIN pizzas p
	ON pt.pizza_type_id=p.pizza_type_id
	WHERE p.price =(
					SELECT MIN(price)AS highest_price
					FROM pizzas);
		--(OR)--
SELECT pt.name,
		p.price
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id=p.pizza_type_id
ORDER BY p.price ASC
LIMIT 1;

--5.Identify the most common pizza size ordered.
SELECT p.size,COUNT(od.quantity) AS tot_quantity
FROM order_details od
JOIN pizzas p
USING (pizza_id)
GROUP BY p.size
ORDER BY tot_quantity DESC
LIMIT 1;

--6.List the top 5 most ordered pizza types by quantity.
SELECT pt.name,
	   SUM(od.quantity)AS tot_quantity
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
	GROUP BY pt.name
	ORDER BY tot_quantity DESC
	LIMIT 5;

--7.Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pt.category,
		SUM(od.quantity)
FROM pizzas p
JOIN order_details od
USING (pizza_id)
JOIN pizza_types pt
USING(pizza_type_id)
	GROUP BY pt.category;

--8.Determine the distribution of orders by hour of the day.
SELECT EXTRACT(HOUR FROM o.time)AS hour,COUNT(order_id) AS orders
FROM orders o
JOIN order_details od
USING(order_id)
GROUP BY hour
ORDER BY orders ASC;

--9. Join relevant tables to find the category-wise distribution of pizzas.
SELECT category,COUNT(name)
FROM pizza_types
GROUP BY category;

 
SELECT pt.category,COUNT(od.order_id) AS orders
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
GROUP BY pt.category
ORDER BY orders ASC;

--10.Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT ROUND(AVG(quantity),2)AS avg_ord_perday
FROM (
		SELECT o.date,SUM(od.quantity)as quantity
		FROM orders o
		JOIN order_details od
		USING (order_id)
		GROUP BY o.date)t;

--11.Determine the top 3 most ordered pizza types based on revenue.
SELECT pt.name,
	SUM(p.price * od.quantity)AS revenue
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
GROUP BY pt.name
ORDER BY revenue
LIMIT 3;

--12.Calculate the percentage contribution of each pizza type to total revenue.
SELECT pt.category,
	ROUND(SUM(p.price * od.quantity)*100/(SELECT SUM(p.price * od.quantity)
			FROM pizzas p
			JOIN order_details od USING (pizza_id)),2) as revenue		
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
GROUP BY pt.category
ORDER BY revenue;

--13.Analyze the cumulative revenue generated over time.
SELECT date,SUM(revenue) OVER(ORDER BY date)as cum_revenue
FROM(
SELECT o.date,SUM(od.quantity * p.price)AS revenue
FROM orders o
JOIN order_details od
USING (order_id)
JOIN pizzas p
USING (pizza_id)
GROUP BY o.date)AS sales;

--14.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category,name,revenue FROM(
SELECT category,name,revenue,
RANK()OVER(PARTITION BY category ORDER BY revenue DESC)AS rnk
FROM(
SELECT pt.name,pt.category,SUM(od.quantity * p.price)AS revenue
FROM pizza_types pt
JOIN pizzas p
USING (pizza_type_id)
JOIN order_details od
USING (pizza_id)
GROUP BY pt.name,pt.category)AS t)
WHERE rnk<=3;

SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM pizza_types;
SELECT * FROM pizzas;
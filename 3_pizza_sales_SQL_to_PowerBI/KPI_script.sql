-- Total revenue

SELECT SUM(total_price) AS total_revenue
FROM dbo.pizza_sales

-- Average order value

SELECT SUM(total_price) / COUNT (DISTINCT order_id) AS average_order_value
FROM dbo.pizza_sales

-- Total # pizza sold

SELECT SUM(quantity) AS total_pizza_sold
FROM dbo.pizza_sales

-- Total # order placed

SELECT COUNT(DISTINCT order_id) AS total_order_placed
FROM dbo.pizza_sales

-- Average # pizza per order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS average_pizza_per_order
FROM dbo.pizza_sales

-- Daily trend for total order

SELECT
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS total_order
FROM dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)

-- Monthly trend for total order

SELECT
	DATENAME(MONTH, order_date) AS month_name,
	COUNT(DISTINCT order_id) AS total_order
FROM dbo.pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_order DESC

-- Percentage of sales by pizza category

SELECT
	pizza_category,
	ROUND(SUM(total_price), 2) AS total_sales,
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM dbo.pizza_sales WHERE MONTH(order_date) = 1), 2) AS percentage_of_sales
FROM dbo.pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

-- Percentage of sales by pizza size

SELECT
	pizza_size,
	ROUND(SUM(total_price), 2) AS total_sales,
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM dbo.pizza_sales WHERE DATEPART(quarter, order_date) = 1), 2) AS percentage_of_sales
FROM dbo.pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size

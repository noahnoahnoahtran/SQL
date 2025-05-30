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



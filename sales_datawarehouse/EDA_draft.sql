-- Explore All Objects in the Database

SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Explore All Columns in the Database

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

-- Explore All Countries our customers come from

SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories "The major Divisions"

SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1, 2, 3

-- Find the date of the first and last order
-- How many years of sales are available

SELECT
	MIN(order_date) first_order_date,
	MAX(order_date) last_order_date,
	DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales

-- Find the youngest and oldest customer

SELECT
	MIN(birthdate) AS oldest_birthdate,
	DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
	MAX(birthdate) AS youngest_birthdate,
	DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
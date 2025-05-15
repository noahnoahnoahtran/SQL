IF NOT EXISTS (
	SELECT name
	FROM sys.databases
	WHERE name = N'salesDataWalmart'
)
BEGIN
	CREATE DATABASE salesDataWalmart;
END

IF OBJECT_ID('sales', 'U') IS NULL
BEGIN
	CREATE TABLE sales (
		invoice_id NVARCHAR(50) NOT NULL PRIMARY KEY,
		branch NVARCHAR(5) NOT NULL,
		city NVARCHAR(50) NOT NULL,
		customer_type NVARCHAR(50) NOT NULL,
		gender NVARCHAR(10) NOT NULL,
		product_line NVARCHAR(100) NOT NULL,
		unit_price DECIMAL(10, 2) NOT NULL,
		quantity INT NOT NULL,
		VAT DECIMAL(6, 4) NOT NULL,
		total DECIMAL(12, 4) NOT NULL,
		date DATETIME NOT NULL,
		time TIME NOT NULL,
		payment_method NVARCHAR(15) NOT NULL,
		cogs DECIMAL(10, 2) NOT NULL,
		gross_margin_pct DECIMAL(11, 9),
		gross_income DECIMAL(12, 4) NOT NULL,
		rating DECIMAL(2, 1)
	);
END
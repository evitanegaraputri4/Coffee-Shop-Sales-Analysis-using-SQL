
--- What are all the unique products available on the coffee shop menu?
--- What are all the unique products available on the coffee shop menu?
SELECT DISTINCT product_detail FROM dbo.cofFe_sales;

--- How do total sales quantities and revenues change month-over-month?
SELECT FORMAT(transaction_date, 'yyyy-MM') AS month, 
       SUM(transaction_qty) AS total_quantity,
       SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.coffe_sales
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY month;

--  How do sales volumes of products category evolve over time? 
SELECT product_category, 
       FORMAT(transaction_date, 'yyyy-MM') AS month, 
       SUM(transaction_qty) AS monthly_quantity
FROM dbo.coffe_sales
GROUP BY product_category, FORMAT(transaction_date, 'yyyy-MM')
ORDER BY product_category, month;


--- What are the cheapest and most expensive products sold by the coffee shop?
SELECT DISTINCT product_detail, unit_price
FROM dbo.cofFe_sales
WHERE unit_price = (SELECT MIN(unit_price) FROM dbo.coffe_sales)
   OR unit_price = (SELECT MAX(unit_price) FROM dbo.coffe_sales)
ORDER BY unit_price DESC;

 --- Which transaction generated the highest total revenue?
 SELECT TOP 1 transaction_id,
 SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.coffe_sales
GROUP BY transaction_id
ORDER BY total_revenue DESC;

--- How much revenue does each product category generate?
SELECT product_category, 
       SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.coffe_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- How are sales distributed across the different store locations?
SELECT store_location, SUM(transaction_qty) AS total_items_sold
FROM dbo.coffe_sales
GROUP BY store_location
ORDER BY total_items_sold DESC;

--- What are the top 5 transactions with the highest number of items purchased?
SELECT TOP 5 transaction_id, SUM(transaction_qty) AS total_items
FROM dbo.coffe_sales
GROUP BY transaction_id
ORDER BY total_items DESC;




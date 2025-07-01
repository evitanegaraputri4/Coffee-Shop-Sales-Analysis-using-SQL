# Coffee Shop Sales Analysis using SQL

## Project Background

This SQL based project analyzes transactional sales data from a coffee shop, covering diverse product categories including coffee, tea, bakery items, syrups, and branded merchandise. The dataset captures detailed sales transactions, product details, and store locations. The analysis aims to provide stakeholders with actionable insights on product performance, sales trends, revenue distribution, and customer purchasing behaviors. These insights enable data-driven decisions to optimize product offerings, marketing strategies, inventory management, and customer engagement efforts.

## Dataset Overview

The dataset consists of transactional sales records with relevant product and store information:

| **Table Name**  | **Columns**                                                                                     |
| --------------- | ----------------------------------------------------------------------------------------------- |
| `coffe_sales`   | transaction_id, product_detail, product_category, transaction_date, transaction_qty, unit_price, store_location |

## Executive Summary

This analysis explores coffee shop sales from January to June 2023, revealing key trends across product categories and store locations. Coffee and tea lead both sales volume and revenue, showing steady growth with coffee more than doubling sales volume by June. The shop offers a broad product range with various sizes and merchandise, providing opportunities for upselling and customization. Monthly sales and revenues grew consistently, with June recording the highest volume and revenue. The data highlights effective marketing and customer retention, with potential to further optimize inventory and promotional strategies across product lines and store locations.

## Insights Deep-Dive

### 1. Unique Product Offerings

- Wide variety of beverages, bakery items, syrups, and branded merchandise offered.  
- Multiple size options (Large, Regular, Small) indicate product customization and diverse customer preferences.  
- Presence of syrups and flavorings presents upselling opportunities to enhance average transaction value.

```sql syntax
SELECT DISTINCT product_detail FROM dbo.cofFe_sales;
```
### 2. Month-over-Month Sales Quantities and Revenues
- January recorded the lowest sales volume (24,870 items) and revenue (81,678 units).
- February dipped slightly, likely due to seasonality or shorter month length.
- Sales steadily increased from March to June, with June peaking at 50,942 items and 166,486 units revenue
- Revenue growth outpaced volume, suggesting increased sales of premium or upsold items.

```sql syntax
SELECT FORMAT(transaction_date, 'yyyy-MM') AS month, 
       SUM(transaction_qty) AS total_quantity,
       SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.cofFe_sales
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY month;
```
### 3. Sales Volume Evolution by Product Category
- Coffee leads sales volume, doubling from 10,355 units in January to 21,444 units in June.
- Tea shows similar steady growth, reaching 16,401 units by June.
- Bakery products also experienced strong growth, more than doubling volume in six months.
- Smaller categories like Drinking Chocolate and Flavours demonstrate steady but smaller gains.
  
``` sql syntax
SELECT product_category, 
       FORMAT(transaction_date, 'yyyy-MM') AS month, 
       SUM(transaction_qty) AS monthly_quantity
FROM dbo.coffe_sales
GROUP BY product_category, FORMAT(transaction_date, 'yyyy-MM')
ORDER BY product_category, month;
```

### 4. Pricing Range: Cheapest and Most Expensive Products
- The highest-priced item is Civet Cat at 45 units, likely a premium specialty coffee.
- Cheapest items are syrups priced around 0.80 units, serving as add-ons to main products.
- This wide price spread caters to both premium and budget customers, allowing for diversified marketing and upselling.

``` sql syntax
SELECT DISTINCT product_detail, unit_price
FROM dbo.cofFe_sales
WHERE unit_price = (SELECT MIN(unit_price) FROM dbo.cofFe_sales)
   OR unit_price = (SELECT MAX(unit_price) FROM dbo.cofFe_sales)
ORDER BY unit_price DESC;
```

### 5. Highest Revenue-Generating Transaction
- Transaction ID 133674 generated the highest revenue (360 units), likely involving premium items or bulk purchases.
- Demonstrates the significant impact of product mix and order size on revenue.
``` sql syntax
SELECT TOP 1 transaction_id,
 SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.cofFe_sales
GROUP BY transaction_id
ORDER BY total_revenue DESC;
```
### 6. Revenue by Product Category
- The Coffee category leads revenue generation with approximately 269,952 units.
- Tea follows as the second highest, generating around 196,406 units.
- Categories like Bakery and Drinking Chocolate contribute moderate revenue levels, approximately 82,316 and 72,416 respectively.
- Lower revenue categories such as Packaged Chocolate and Flavours indicate potential opportunities for growth or focused marketing efforts.

```sql syntax
SELECT product_category, 
       SUM(unit_price * transaction_qty) AS total_revenue
FROM dbo.cofFe_sales
GROUP BY product_category
ORDER BY total_revenue DESC;
```

### 7. Sales Distribution by Store Location
- Lower Manhattan, Hell’s Kitchen, and Astoria show nearly equal sales volumes (~71,000 items each).
- The three locations demonstrate nearly equal sales volume, indicating a balanced demand across these key stores. Optimizing inventory and promotional efforts across these locations could maximize overall sales effectiveness.
``` sql syntax
SELECT store_location, SUM(transaction_qty) AS total_items_sold
FROM dbo.cofFe_sales
GROUP BY store_location
ORDER BY total_items_sold DESC;
```
### 8. Top Transactions by Quantity
- Maximum items purchased per transaction is 8, observed in multiple transactions.
- Indicates a purchasing ceiling for bulk orders within the dataset.
  
```sql syntax
SELECT TOP 5 transaction_id, SUM(transaction_qty) AS total_items
FROM dbo.cofFe_sales
GROUP BY transaction_id
ORDER BY total_items DESC;
```
## Recommendations

### Product Strategy
- Prioritize inventory and promotions on Coffee and Tea products, the primary revenue drivers.
- Develop upselling campaigns leveraging popular syrups and flavorings to increase average order value.
- Explore marketing initiatives for lower-volume categories like Flavours and Packaged Chocolate to diversify revenue.
  
### Market Strategy
- Maintain balanced stock and promotional efforts across top-performing store locations.
- Develop targeted campaigns in stores with slightly lower sales to boost overall performance.

### Customer Strategy
- Encourage bulk purchases by offering discounts or bundled deals close to the 8-item transaction cap.
- Leverage premium product lines (e.g., Civet Cat) in loyalty or exclusive offers to enhance margins.
- Promote merchandise alongside consumables to increase cross-sell opportunities.

## Contact

For questions or collaboration:  
📧 **evitanegara@gmail.com**



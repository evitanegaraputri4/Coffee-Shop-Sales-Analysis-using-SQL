# "Coffee Shop Sales Analysis using SQL"

# Project Background

This SQL-based project analyzes transactional sales data from a coffee shop, covering diverse product categories including coffee, tea, bakery items, syrups, and branded merchandise. The dataset captures detailed sales transactions, product details, and store locations. The analysis aims to provide stakeholders with actionable insights on product performance, sales trends, revenue distribution, and customer purchasing behaviors. These insights enable data-driven decisions to optimize product offerings, marketing strategies, inventory management, and customer engagement efforts.

# Dataset Overview

The dataset consists of transactional sales records with relevant product and store information:

| **Table Name**  | **Columns**                                                                                     |
| --------------- | ----------------------------------------------------------------------------------------------- |
| `coffe_sales`   | transaction_id, product_detail, product_category, transaction_date, transaction_qty, unit_price, store_location |

# Executive Summary

This analysis explores coffee shop sales from January to June 2023, revealing key trends across product categories and store locations. Coffee and tea lead both sales volume and revenue, showing steady growth with coffee more than doubling sales volume by June. The shop offers a broad product range with various sizes and merchandise, providing opportunities for upselling and customization. Monthly sales and revenues grew consistently, with June recording the highest volume and revenue. The data highlights effective marketing and customer retention, with potential to further optimize inventory and promotional strategies across product lines and store locations.

# Insights Deep-Dive

## 1. Unique Product Offerings

- Wide variety of beverages, bakery items, syrups, and branded merchandise offered.  
- Multiple size options (Large, Regular, Small) indicate product customization and diverse customer preferences.  
- Presence of syrups and flavorings presents upselling opportunities to enhance average transaction value.

```sql
SELECT DISTINCT product_detail FROM dbo.cofFe_sales;

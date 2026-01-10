# E-Commerce SQL Analytics Project

This project demonstrates an end-to-end SQL analytics workflow on an e-commerce dataset.  
It covers data cleaning, modeling, and business analysis using PostgreSQL.

# Project Goals
- Analyze business growth over time
- Identify top-performing product categories and SKUs
- Understand customer behavior and retention
- Measure the impact of delivery performance on customer satisfaction

## Dataset
The dataset simulates a real e-commerce system and includes:
- Customers
- Orders
- Order items
- Products
- Payments
- Reviews

## Data Modeling
I structured the data into:
- **Raw tables** (`raw_*`) for original data
- **Clean views** (`clean_*`) to fix data quality issues
- **Fact table** (`fact_orders`) with one row per order and calculated revenue
- Dimension-style tables for products and customers

## Key Techniques
- Data cleaning with views
- Aggregations and GROUP BY
- CTEs for multi-step transformations
- Window functions for growth analysis
- Correct grain handling (order vs order-item level)

## Business Insights
- Revenue trends and month-over-month growth
- Category and product performance
- Customer retention and repeat behavior
- Relationship between delivery time and customer ratings

## How to Run
1. Create tables using `sql/01_create_tables.sql`
2. Load CSV files from the `data/` folder
3. Run cleaning views: `sql/02_clean_views.sql`
4. Build the fact table: `sql/03_fact_table.sql`
5. Execute analysis queries in `sql/04_*.sql`

## Tools
- PostgreSQL
- pgAdmin
- SQL

## Author
Sakshi Dubey

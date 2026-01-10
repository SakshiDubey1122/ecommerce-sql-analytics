CREATE TABLE dim_dates AS
SELECT DISTINCT
  DATE_TRUNC('day', order_date)::date AS date_day,
  DATE_TRUNC('month', order_date)::date AS month_start,
  EXTRACT(YEAR FROM order_date)::int AS year,
  EXTRACT(MONTH FROM order_date)::int AS month
FROM clean_orders
WHERE order_date IS NOT NULL;

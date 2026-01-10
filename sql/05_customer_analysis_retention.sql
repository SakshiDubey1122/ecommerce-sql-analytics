WITH orders_m AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', order_date)::date AS order_month
  FROM fact_orders
  WHERE status = 'delivered'
),
cohort AS (
  SELECT
    customer_id,
    MIN(order_month) AS cohort_month
  FROM orders_m
  GROUP BY customer_id
),
activity AS (
  SELECT
    o.customer_id,
    c.cohort_month,
    o.order_month,
    (EXTRACT(YEAR FROM o.order_month) * 12 + EXTRACT(MONTH FROM o.order_month))
    - (EXTRACT(YEAR FROM c.cohort_month) * 12 + EXTRACT(MONTH FROM c.cohort_month)) AS month_number
  FROM orders_m o
  JOIN cohort c ON o.customer_id = c.customer_id
)
SELECT
  cohort_month,
  COUNT(DISTINCT CASE WHEN month_number = 0 THEN customer_id END) AS m0,
  COUNT(DISTINCT CASE WHEN month_number = 1 THEN customer_id END) AS m1,
  COUNT(DISTINCT CASE WHEN month_number = 3 THEN customer_id END) AS m3,
  COUNT(DISTINCT CASE WHEN month_number = 6 THEN customer_id END) AS m6
FROM activity
GROUP BY cohort_month
ORDER BY cohort_month;

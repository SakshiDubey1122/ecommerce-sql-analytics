WITH monthly AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS orders,
    SUM(order_revenue) AS revenue
  FROM fact_orders
  WHERE status = 'delivered'
  GROUP BY 1
)
SELECT
  month,
  orders,
  revenue,
  orders - LAG(orders) OVER (ORDER BY month) AS mom_orders_change,
  ROUND(
    100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
    / NULLIF(LAG(revenue) OVER (ORDER BY month), 0)
  , 2) AS mom_revenue_growth_pct
FROM monthly
ORDER BY month;

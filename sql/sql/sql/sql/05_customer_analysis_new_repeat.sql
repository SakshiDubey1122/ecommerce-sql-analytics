WITH customer_first AS (
  SELECT
    customer_id,
    MIN(order_date) AS first_order_date
  FROM fact_orders
  WHERE status = 'delivered'
  GROUP BY customer_id
)
SELECT
  DATE_TRUNC('month', fo.order_date)::date AS month,
  COUNT(DISTINCT fo.customer_id) AS customers,
  COUNT(DISTINCT CASE WHEN fo.order_date = cf.first_order_date THEN fo.customer_id END) AS new_customers,
  COUNT(DISTINCT CASE WHEN fo.order_date > cf.first_order_date THEN fo.customer_id END) AS repeat_customers
FROM fact_orders fo
JOIN customer_first cf ON fo.customer_id = cf.customer_id
WHERE fo.status = 'delivered'
GROUP BY 1
ORDER BY 1;

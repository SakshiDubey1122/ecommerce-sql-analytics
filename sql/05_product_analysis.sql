SELECT
  p.product_id,
  p.product_name,
  p.category,
  COUNT(DISTINCT f.order_id) AS orders,
  SUM(f.order_revenue) AS revenue
FROM fact_orders f
JOIN dim_products p
  ON f.product_id = p.product_id
WHERE f.status = 'delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;

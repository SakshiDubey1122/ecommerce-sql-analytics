CREATE VIEW clean_orders AS
SELECT
  order_id,
  customer_id,
  order_date,
  approved_date,
  shipped_date,
  delivered_date,
  estimated_delivery_date,
  LOWER(status) AS status
FROM raw_orders
WHERE order_date IS NOT NULL
  AND (delivered_date IS NULL OR delivered_date >= order_date)
  AND (EXTRACT(YEAR FROM order_date) BETWEEN 2000 AND 2100);

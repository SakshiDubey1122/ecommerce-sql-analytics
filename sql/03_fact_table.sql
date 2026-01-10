CREATE TABLE fact_orders AS
WITH order_value AS (
  SELECT
    oi.order_id,
    SUM(oi.price * oi.quantity) AS items_revenue,
    SUM(COALESCE(oi.freight_value, 0)) AS freight_revenue
  FROM clean_order_items oi
  GROUP BY oi.order_id
),
payments AS (
  SELECT
    order_id,
    SUM(payment_value) AS total_payment
  FROM raw_payments
  GROUP BY order_id
)
SELECT
  o.order_id,
  o.customer_id,
  o.order_date::date AS order_date,
  o.delivered_date::date AS delivered_date,
  o.estimated_delivery_date::date AS estimated_delivery_date,
  o.status,
  COALESCE(v.items_revenue, 0) AS items_revenue,
  COALESCE(v.freight_revenue, 0) AS freight_revenue,
  COALESCE(v.items_revenue, 0) + COALESCE(v.freight_revenue, 0) AS order_revenue,
  p.total_payment
FROM clean_orders o
LEFT JOIN order_value v ON o.order_id = v.order_id
LEFT JOIN payments p ON o.order_id = p.order_id;

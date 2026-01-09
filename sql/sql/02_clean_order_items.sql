CREATE VIEW clean_order_items AS
SELECT
  order_id,
  product_id,
  COALESCE(quantity, 1) AS quantity,
  price,
  freight_value
FROM raw_order_items
WHERE price IS NOT NULL
  AND price >= 0
  AND (freight_value IS NULL OR freight_value >= 0);

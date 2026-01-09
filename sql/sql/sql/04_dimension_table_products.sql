CREATE TABLE dim_products AS
SELECT DISTINCT
  product_id,
  category,
  product_name
FROM raw_products;

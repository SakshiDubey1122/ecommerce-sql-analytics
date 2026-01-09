CREATE TABLE dim_customers AS
SELECT DISTINCT
  customer_id,
  customer_city,
  customer_state,
  signup_date
FROM raw_customers;

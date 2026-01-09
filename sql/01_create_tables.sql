CREATE TABLE raw_customers (
  customer_id TEXT PRIMARY KEY,
  customer_city TEXT,
  customer_state TEXT,
  signup_date TIMESTAMP
);

CREATE TABLE raw_orders (
  order_id TEXT PRIMARY KEY,
  customer_id TEXT,
  order_date TIMESTAMP,
  approved_date TIMESTAMP,
  shipped_date TIMESTAMP,
  delivered_date TIMESTAMP,
  estimated_delivery_date TIMESTAMP,
  status TEXT
);
 
CREATE TABLE raw_order_items (
  order_id TEXT,
  product_id TEXT,
  quantity INT,
  price NUMERIC(12,2),
  freight_value NUMERIC(12,2)
);

CREATE TABLE raw_products (
  product_id TEXT PRIMARY KEY,
  category TEXT,
  product_name TEXT
);

CREATE TABLE raw_payments (
  order_id TEXT,
  payment_type TEXT,
  payment_value NUMERIC(12,2)
);

CREATE TABLE raw_reviews (
  order_id TEXT,
  score INT,
  review_date TIMESTAMP,
  review_comment_title TEXT,
  review_comment_message TEXT
);

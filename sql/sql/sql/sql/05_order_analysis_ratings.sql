WITH delivery AS (
  SELECT
    o.order_id,
    (o.delivered_date - o.approved_date) AS delivery_days
  FROM raw_orders o
  WHERE o.delivered_date IS NOT NULL
    AND o.approved_date IS NOT NULL
    AND o.delivered_date >= o.approved_date
),
bucketed AS (
  SELECT
    order_id,
    CASE
      WHEN delivery_days <= 2 THEN '0-2 days'
      WHEN delivery_days <= 5 THEN '3-5 days'
      ELSE '6+ days'
    END AS delivery_bucket
  FROM delivery
)
SELECT
  b.delivery_bucket,
  COUNT(*) AS reviewed_orders,
  AVG(r.score::numeric) AS avg_rating
FROM bucketed b
JOIN clean_reviews r ON r.order_id = b.order_id
GROUP BY 1
ORDER BY 1;

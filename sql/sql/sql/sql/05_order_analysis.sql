WITH delivery AS (
  SELECT
    fo.order_id,
    fo.delivered_date,
    fo.approved_date,
    (fo.delivered_date - fo.approved_date) AS delivery_days
  FROM (
    SELECT
      order_id,
      delivered_date,
      approved_date
    FROM raw_orders
  ) fo
  WHERE delivered_date IS NOT NULL
    AND approved_date IS NOT NULL
    AND delivered_date >= approved_date
)
SELECT
  CASE
    WHEN delivery_days <= 2 THEN '0-2 days'
    WHEN delivery_days <= 5 THEN '3-5 days'
    ELSE '6+ days'
  END AS delivery_bucket,
  COUNT(*) AS orders
FROM delivery
GROUP BY 1
ORDER BY 1;

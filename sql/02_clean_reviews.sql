CREATE VIEW clean_reviews AS
SELECT
  order_id,
  score,
  review_date,
  review_comment_title,
  review_comment_message
FROM raw_reviews
WHERE score BETWEEN 1 AND 5;

CREATE OR REPLACE VIEW marts.payment_summary AS
SELECT
  payment_type,
  COUNT(*) AS trips,
  ROUND(AVG(total_amount),2) AS avg_total
FROM stg.trips
GROUP BY payment_type
ORDER BY trips DESC;

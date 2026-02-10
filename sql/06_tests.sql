WITH tests AS (
  SELECT 'dropoff_before_pickup' AS test_name, COUNT(*) AS failed
  FROM stg.trips WHERE dropoff_ts < pickup_ts

  UNION ALL
  SELECT 'duration_le_zero', COUNT(*) FROM stg.trips WHERE trip_duration_min <= 0

  UNION ALL
  SELECT 'negative_distance', COUNT(*) FROM stg.trips WHERE trip_distance < 0

  UNION ALL
  SELECT 'negative_amounts', COUNT(*) FROM stg.trips
  WHERE fare_amount < 0 OR tip_amount < 0 OR total_amount < 0

  UNION ALL
  SELECT 'bad_total_amount', COUNT(*) FROM stg.trips
  WHERE total_amount IS NOT NULL AND fare_amount IS NOT NULL
    AND ABS(total_amount - (fare_amount + COALESCE(tip_amount,0))) > 5

  UNION ALL
  SELECT 'missing_payment_type', COUNT(*) FROM stg.trips
  WHERE payment_type IS NULL OR payment_type = ''
)
SELECT *
FROM tests
ORDER BY failed DESC, test_name;

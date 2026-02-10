CREATE OR REPLACE VIEW marts.hourly_demand AS
SELECT
  date_trunc('hour', pickup_ts) AS hour,
  COUNT(*) AS trips,
  ROUND(AVG(trip_distance),2) AS avg_distance,
  ROUND(AVG(total_amount),2) AS avg_total_amount,
  ROUND(AVG(trip_duration_min),2) AS avg_duration_min
FROM stg.trips
GROUP BY 1
ORDER BY 1;

CREATE OR REPLACE VIEW stg.trips AS
SELECT
  NULLIF(vendor_id,'')::int AS vendor_id,
  pickup_datetime::timestamp AS pickup_ts,
  dropoff_datetime::timestamp AS dropoff_ts,
  NULLIF(passenger_count,'')::int AS passenger_count,
  NULLIF(trip_distance,'')::numeric AS trip_distance,
  NULLIF(fare_amount,'')::numeric AS fare_amount,
  NULLIF(tip_amount,'')::numeric AS tip_amount,
  NULLIF(total_amount,'')::numeric AS total_amount,
  NULLIF(payment_type,'') AS payment_type,
  EXTRACT(EPOCH FROM (dropoff_datetime::timestamp - pickup_datetime::timestamp))/60.0 AS trip_duration_min
FROM raw.trips
WHERE pickup_datetime IS NOT NULL
  AND dropoff_datetime IS NOT NULL;

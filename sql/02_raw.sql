CREATE TABLE IF NOT EXISTS raw.trips (
  vendor_id        TEXT,
  pickup_datetime  TEXT,
  dropoff_datetime TEXT,
  passenger_count  TEXT,
  trip_distance    TEXT,
  fare_amount      TEXT,
  tip_amount       TEXT,
  total_amount     TEXT,
  payment_type     TEXT
);

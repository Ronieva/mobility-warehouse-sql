TRUNCATE raw.trips;

INSERT INTO raw.trips (
  vendor_id, pickup_datetime, dropoff_datetime, passenger_count,
  trip_distance, fare_amount, tip_amount, total_amount, payment_type
) VALUES
('1','2025-01-10 08:15:00','2025-01-10 08:33:00','1','4.2','18.5','3.0','23.0','CARD'),
('2','2025-01-10 09:05:00','2025-01-10 09:12:00','2','1.1','8.0','0.0','9.0','CASH'),
('1','2025-01-11 22:40:00','2025-01-11 23:05:00','1','6.7','26.0','5.0','32.0','CARD'),
('2','2025-01-12 18:10:00','2025-01-12 18:18:00','3','0.9','7.5','1.0','9.2','CARD');

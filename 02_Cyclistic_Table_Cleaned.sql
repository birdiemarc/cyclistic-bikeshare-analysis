-- Create a brand new, permanently cleaned table
CREATE OR REPLACE TABLE `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned` AS
SELECT 
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  
  -- 1. Calculate ride length in minutes
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
  
  -- 2. Extract day of the week (1 = Sunday, 7 = Saturday)
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
  
  -- 3. Extract the month and year for seasonal trends
  EXTRACT(MONTH FROM started_at) AS trip_month,
  
  start_station_name,
  end_station_name,
  member_casual
FROM 
  `cyclistic_data.combined_trips_raw`
WHERE 
  -- 4. Filter out data noise
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1 
  AND TIMESTAMP_DIFF(ended_at, started_at, HOUR) < 24
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL;
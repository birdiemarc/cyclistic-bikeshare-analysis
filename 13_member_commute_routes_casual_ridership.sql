WITH member_commute_routes AS (
  SELECT 
    start_station_name,
    end_station_name,
    COUNT(*) AS member_commute_trips
  FROM `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
  WHERE 
    member_casual = 'member'
    AND start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL
    -- Filter 1: Workdays Only
    AND day_of_week IN (2, 3, 4, 5, 6) 
    -- Filter 2: Commute Windows Only (7-9 AM, 4-6 PM)
    AND (EXTRACT(HOUR FROM started_at) IN (7, 8, 9) OR EXTRACT(HOUR FROM started_at) IN (16, 17, 18))
  GROUP BY start_station_name, end_station_name
),

casual_commute_routes AS (
  SELECT 
    start_station_name,
    end_station_name,
    COUNT(*) AS casual_commute_trips
  FROM `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
  WHERE 
    member_casual = 'casual'
    AND start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL
    -- Filter 1: Workdays Only
    AND day_of_week IN (2, 3, 4, 5, 6) 
    -- Filter 2: Commute Windows Only
    AND (EXTRACT(HOUR FROM started_at) IN (7, 8, 9) OR EXTRACT(HOUR FROM started_at) IN (16, 17, 18))
  GROUP BY start_station_name, end_station_name
)

SELECT 
  c.start_station_name,
  c.end_station_name,
  m.member_commute_trips,
  c.casual_commute_trips,
  (m.member_commute_trips + c.casual_commute_trips) AS total_combined_commute_volume
FROM 
  casual_commute_routes c
-- An INNER JOIN ensures the route MUST exist in the member network too (proving it's a utility corridor)
INNER JOIN 
  member_commute_routes m 
  ON c.start_station_name = m.start_station_name 
  AND c.end_station_name = m.end_station_name
-- CRITICAL CHANGE: Order by the casual volume to find your biggest conversion pockets
ORDER BY 
  c.casual_commute_trips DESC
LIMIT 20;
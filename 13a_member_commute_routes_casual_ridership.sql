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
    AND day_of_week IN (2, 3, 4, 5, 6) 
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
    AND day_of_week IN (2, 3, 4, 5, 6) 
    AND (EXTRACT(HOUR FROM started_at) IN (7, 8, 9) OR EXTRACT(HOUR FROM started_at) IN (16, 17, 18))
  GROUP BY start_station_name, end_station_name
)

-- >>> START OF REPLACEMENT ZONE <<<
SELECT 
  c.start_station_name,
  c.end_station_name,
  m.member_commute_trips,
  c.casual_commute_trips,
  
  -- 1. Evaluates the physical path shape
  CASE 
    WHEN c.start_station_name = c.end_station_name THEN 'Pure Round-Trip (Leisure)'
    ELSE 'One-Way Corridor (Utility)'
  END AS route_geometry_type,

  -- 2. Calculates the percentage of total traffic that is casual
  ROUND(SAFE_DIVIDE(c.casual_commute_trips, (m.member_commute_trips + c.casual_commute_trips)) * 100, 1) AS casual_volume_share_pct

FROM 
  casual_commute_routes c
INNER JOIN 
  member_commute_routes m 
  ON c.start_station_name = m.start_station_name 
  AND c.end_station_name = m.end_station_name
ORDER BY 
  c.casual_commute_trips DESC
LIMIT 30;
-- >>> END OF REPLACEMENT ZONE <<<
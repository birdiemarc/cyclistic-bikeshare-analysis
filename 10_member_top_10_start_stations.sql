-- Top Start Stations for Casual Riders
SELECT 
  start_station_name,
  COUNT(*) AS total_trips
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
WHERE 
  member_casual = 'member'
GROUP BY 
  start_station_name
ORDER BY 
  total_trips DESC
LIMIT 10;
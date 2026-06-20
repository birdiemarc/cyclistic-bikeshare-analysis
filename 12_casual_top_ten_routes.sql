SELECT 
  start_station_name,
  end_station_name,
  COUNT(*) AS total_trips
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
WHERE 
  member_casual = 'casual'
GROUP BY 
  start_station_name, 
  end_station_name
ORDER BY 
  total_trips DESC
LIMIT 10;
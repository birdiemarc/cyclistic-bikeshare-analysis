SELECT 
  day_of_week,
  -- Member Metrics
  COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_trip_count,
  ROUND(AVG(CASE WHEN member_casual = 'member' THEN ride_length_minutes END), 1) AS member_avg_minutes,
  -- Casual Metrics
  COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_trip_count,
  ROUND(AVG(CASE WHEN member_casual = 'casual' THEN ride_length_minutes END), 1) AS casual_avg_minutes
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
GROUP BY 
  day_of_week
ORDER BY 
  day_of_week;
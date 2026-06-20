SELECT 
  trip_month,
  COUNT(*) AS total_trips
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
WHERE 
  member_casual = 'member'
GROUP BY 
  trip_month
ORDER BY 
  trip_month;
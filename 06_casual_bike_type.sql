SELECT 
  rideable_type,
  COUNT(*) AS total_trips
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
WHERE 
  member_casual = 'casual'
GROUP BY 
  rideable_type
ORDER BY 
  total_trips DESC;
SELECT 
  day_of_week, -- This will display your 1-7 integers for now
  COUNT(*) AS total_trips,
  ROUND(AVG(ride_length_minutes), 1) AS average_ride_length_minutes
FROM 
  `cyclistic-capstone-analysis.cyclistic_data.combined_trips_cleaned`
WHERE 
  member_casual = 'member'
GROUP BY 
  day_of_week
ORDER BY 
  day_of_week; -- Keeps Sunday (1) through Saturday (7) in chronological order
--Creating a master table from the Cyclistic individual month table trip data
CREATE OR REPLACE TABLE `cyclistic-capstone-analysis.cyclistic_data.combined_trips_raw` AS SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_05`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_06`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_07`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_08`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_09`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_10`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_11`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2025_12`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2026_01`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2026_02`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2026_03`
UNION ALL
SELECT * FROM `cyclistic-capstone-analysis.cyclistic_data.tripdata_2026_04`
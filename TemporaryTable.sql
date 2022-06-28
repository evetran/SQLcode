-- Use new_york_citibike dataset from Google public dataset on BigQuery

-- Problems
-- 1. Count how many trips are 60+ minutes long

WITH trips_over_60mins_long AS (
	SELECT * 
  	FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  	WHERE tripduration>= 60
)

SELECT 
	COUNT(*) AS number_of_trips
FROM 
	trips_over_60mins_long;


-- 2. What are the TOP 3 most favorite stations for biker?
WITH most_favorite_stations AS (
	SELECT 
    		start_station_id,
    		COUNT(start_station_id) AS number_of_trips
  	FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  	GROUP BY start_station_id
)

SELECT 
  	start_station_id AS station_id,
  	name AS station_name,
  	number_of_trips
FROM 
  	most_favorite_stations
LEFT OUTER JOIN
  	`bigquery-public-data.new_york_citibike.citibike_stations` AS stations_info  
ON 
  	most_favorite_stations.start_station_id = stations_info.station_id
ORDER BY
  	number_of_trips DESC
LIMIT 3;
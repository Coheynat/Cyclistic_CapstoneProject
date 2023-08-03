

# 1.List all distinct rideable types available in the dataset.
SELECT DISTINCT rideable_type
FROM `data-analysis-389112.ecommerce.Case Study` ; 

# 2.Retrieve the count of total rides in the dataset.
SELECT COUNT(ride_id) AS total_rides FROM `data-analysis-389112.ecommerce.Case Study` ;


# 3.Find the total number of rides taken by each rideable type.
SELECT COUNT(*), rideable_type
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY rideable_type ; 


# 4.Calculate the average ride duration in minutes for each rideable type.
SELECT (AVG(timestamp_diff(ended_at,started_at,SECOND)) / 60) AS avg_ride_duration_min
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY rideable_type ; 


# 5.List the top 5 starting stations with the highest number of rides.
SELECT 	start_station_name, COUNT(*) AS ride_count
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY start_station_name
ORDER BY number_of_rides DESC
LIMIT 5 ; 


# 6.Identify rides that have the same start and end stations.
SELECT ride_id, start_station_name, end_station_name
FROM `data-analysis-389112.ecommerce.Case Study` 
WHERE start_station_name = end_station_name ; 
    #counting how many: 
SELECT COUNT(ride_id)
FROM `data-analysis-389112.ecommerce.Case Study` 
WHERE start_station_name = end_station_name ; 


# 7.Calculate the percentage of casual riders for each rideable type.
SELECT rideable_type, 
((COUNT(CASE WHEN member_casual = "casual" THEN 1 END) / COUNT(*)) * 100) AS casual_percentage
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY rideable_type ; 


# 8.Find the hour of the day with the highest number of rides.
SELECT EXTRACT(HOUR FROM started_at) AS hour , COUNT(*) AS ride_count
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY hour
ORDER BY ride_count DESC
LIMIT 1 ; 


# 9.What is the total number of rides for each day of the week? 
SELECT EXTRACT(DAYOFWEEK FROM started_at) as day_of_week, COUNT(*) AS ride_count
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY day_of_week ; 




# 9.Calculate the percentage of casual riders for each rideable type.
SELECT rideable_type, 
(COUNT(CASE WHEN member_casual = "casual" THEN 1 END)/ COUNT(*)) * 100 AS casual_percentage
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY rideable_type ; 



# 10.Calculate the percentage of casual riders for each month.
SELECT EXTRACT(MONTH FROM started_at) AS month, (COUNT(CASE WHEN member_casual = "casual" THEN 1 END)/ COUNT(*)) * 100 AS monthly_precentage_of_casual_riders
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY month ; 








# 11. Find the top 100 starting and ending stations combinations (most popular) 
SELECT 	start_station_name, end_station_name, COUNT(*) AS most_common_combination
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY start_station_name, end_station_name
ORDER BY most_common_combination DESC
LIMIT 100 ;


# 12. Top 10% stations with the highest number of rides.
#defining a temporary dataset using the WITH function:
WITH  station_rides AS (SELECT start_station_name, COUNT(*) AS  ride_count, (RANK() OVER(ORDER BY ride_count DESC) AS station_rank
FROM `data-analysis-389112.ecommerce.Case Study` 
GROUP BY start_station_name )
SELECT 








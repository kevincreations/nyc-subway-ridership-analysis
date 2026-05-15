/*finds 10 busiest/top performer stations in 2023 and how they changed since 2018.ridership was never the same like it was befroe covid.*/

SELECT 
			station,
			borough,
			rank_2023 AS '2023_rank',
			year2023 AS '2023_weekly_riders',
			year2018 AS '2018_weekly_riders',
			year2023 - year2018 AS 'ridership_change'	   
FROM 
			nyc_weekly_subway_riders
ORDER BY
			year2023 DESC
			
LIMIT 10;

/*compares 2023 station average in each boro with 2023 city station average*/

SELECT
		borough,
		round(avg(year2023),2) AS 'boro_average_2023',
		(SELECT
				round(avg(year2023),2)
		FROM
				nyc_weekly_subway_riders) AS 'city_average_2023' -- subquery finds average riders in each station citywide
FROM
			nyc_weekly_subway_riders
GROUP BY
		borough;

/*categorizes stations in both 2018 and 2023 in tiers*/		
SELECT
		station,
		borough,
		temporary_closing,
		year2018, 
		CASE
				WHEN year2018 >= 70000 THEN 'Elite Traffic'
				WHEN year2018 BETWEEN 30000 AND 69999 THEN 'High Traffic'
				WHEN year2018 BETWEEN 10000 AND 29999 THEN 'Medium Traffic'
				ELSE 'Low Traffic'
				END AS traffic_2018_tier,
		year2023,
		CASE
				WHEN year2023 >= 70000 THEN 'Elite Traffic'
				WHEN year2023 BETWEEN 30000 AND 69999 THEN 'High Traffic'
				WHEN year2023 BETWEEN 10000 AND 29999 THEN 'Medium Traffic'
				ELSE 'Low Traffic'
				END AS  'traffic_2023_tier'
FROM 
		nyc_weekly_subway_riders
ORDER BY
		year2018 DESC;
		
/*counts amount of stations in 2018 tier*/		
SELECT
		traffic_2018_tier,
		COUNT(*) AS 'station2018_count'
FROM 
		(SELECT
				CASE
						WHEN year2018 >= 70000 THEN 'Elite Traffic'
						WHEN year2018 BETWEEN 30000 AND 69999 THEN 'High Traffic'
						WHEN year2018 BETWEEN 10000 AND 29999 THEN 'Medium Traffic'
						ELSE 'Low Traffic'
						END AS traffic_2018_tier
		FROM 
				nyc_weekly_subway_riders)
GROUP BY traffic_2018_tier;

/*counts amount of stations in 2023 tier*/		
SELECT
		traffic_2023_tier,
		count(*) AS 'station2023_count'
FROM
		(SELECT
			CASE
				WHEN year2023 >= 70000 THEN 'Elite Traffic'
				WHEN year2023 BETWEEN 30000 AND 69999 THEN 'High Traffic'
				WHEN year2023 BETWEEN 10000 AND 29999 THEN 'Medium Traffic'
				ELSE 'Low Traffic'
				END AS traffic_2023_tier
		FROM
				nyc_weekly_subway_riders)
GROUP BY
		traffic_2023_tier;

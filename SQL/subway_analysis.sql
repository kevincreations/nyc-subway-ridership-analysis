/*
CREATED BY: Kev O
CREATED ON: May 14, 2026
DESCRIPTION: Analysis of NYC MTA data. Created tables, imported and cleaned the data. Used aggregate functions, subqueries, and CASE statements to analzye data.  
*/

/*creates table*/
CREATE TABLE nyc_subway (
station TEXT,
temporary_closing TEXT,
borough TEXT,
year2018 INT,
year2019 INT,
year2020 INT,
year2021 INT,
year2022 INT,
year2023 INT,
changeyear INT,
change_percentage REAL,
rank_2023 INT
);
/*ETL/data cleaning where i repaced text from old table into integers in new table, and got rid of commas*/
CREATE TABLE nyc_weekly_subway_riders AS
SELECT
		station,
		temporary_closing,
		borough,
		CAST(REPLACE(year2018, ',', '') AS INTEGER) AS year2018,
		CAST(REPLACE(year2019, ',', '') AS INTEGER) AS year2019,
		CAST(REPLACE(year2020, ',', '') AS INTEGER) AS year2020,
		CAST(REPLACE(year2021, ',', '') AS INTEGER) AS year2021,
		CAST(REPLACE(year2022, ',', '') AS INTEGER) AS year2022,
		CAST(REPLACE(year2023, ',', '') AS INTEGER) AS year2023,
		CAST(REPLACE(changeyear, ',', '') AS INTEGER) AS year_2022to2023_change,
		change_percentage AS change_percentage,
		CAST(REPLACE(rank_2023, ',', '') AS INTEGER) AS rank_2023
FROM 
		nyc_subway;

/*NYC subway stations that had the greatest drop in ridership from 2018 to 2023*/	
SELECT 
			station,
			borough,
			rank_2023,
			year2023 - year2018 AS rider_change
FROM 
			nyc_weekly_subway_riders
ORDER BY 
			rider_change ASC;
/*Average riders per station*/
SELECT
			borough,
			ROUND(AVG(year2018),2) AS '2018 average riders',
			ROUND(AVG(year2019),2) AS '2019 average riders',
			ROUND(AVG(year2020),2) AS '2020 average riders',
			ROUND(AVG(year2021),2) AS '2021 average riders',
			ROUND(AVG(year2022),2) AS '2022 average riders',
			ROUND(AVG(year2023),2) AS '2023 average riders'
FROM
			nyc_weekly_subway_riders
GROUP BY
			borough;
			
/*finds the total riders of one weekday citywide*/
SELECT
		SUM(year2018) AS 'total_weekday_riders_2018',
		SUM(year2019) AS 'total_weekday_riders_2019',
		SUM(year2020) AS 'total_weekday_riders_2020',
		SUM(year2021) AS 'total_weekday_riders_2021',
		SUM(year2022) AS 'total_weekday_riders_2022',
		SUM(year2023) AS 'total_weekday_riders_2023'
FROM
		nyc_weekly_subway_riders;
		
/*Finds the growth and decline of riders in each year*/
SELECT
		borough,
		SUM(year2019) - SUM(year2018) AS '2019_Change',
		SUM(year2020) - SUM(year2019) AS '2020_Change',
		SUM(year2021) - SUM(year2020) AS '2021_Change',
		SUM(year2022) - SUM(year2021) AS '2022_Change',
		SUM(year2023) - SUM(year2022) AS '2023_Change'
FROM 
		nyc_weekly_subway_riders
GROUP BY
		borough;

/*finds the total average riders in each borough*/
SELECT
		borough,
		SUM(year2018) AS 'total_boro_weekday_riders_2018',
		SUM(year2019) AS 'total_boro_weekday_riders_2019',
		SUM(year2020) AS 'total_boro_weekday_riders_2020',
		SUM(year2021) AS 'total_boro_weekday_riders_2021',
		SUM(year2022) AS 'total_boro_weekday_riders_2022',
		SUM(year2023) AS 'total_boro_weekday_riders_2023'
FROM
		nyc_weekly_subway_riders
GROUP BY
		borough;
		

# nyc-subway-ridership-analysis
Analyzing the NYC MTA weekday data from 2018 - 2023 to enhance the knowledge and understanding of subway ridership before, during, and after the covid pandemic. 

## Project Background
The purpose of this project is to investigate the effects of the covid pandemic on the MTA Subway. The data from Data.gov includes only weekday data (M-F) from 2018 – 2023. NYC has 472 stations, but transfer stations are counted as one stop, thus making it 423 stations in total across 4 boroughs: Brookyln, The Bronx, Queens, and Manhattan. The data included a weekday average from each station from every year from 2018 to 2023 along with station ranks.

## Tools Used
- SQLite
- Tableau
- Excel

- <img width="450" height="350" alt="Dashboard Screenshot" src="https://github.com/user-attachments/assets/bcab2939-7bda-4268-ae5c-d34d08b078f6" />
## Dashboard Background
This dashboard illustrates the citywide average, borough average, and the changes from year to year. Each bar in both city and borough averages represents the average amount of riders in one weekday. The line graph tracks the changes that is happening in the bar graphs. For example, during 2020 there was a steep drop in riders, and the line graph illustrates roughly how many riders were lost as it accurately mirrors each graph. 

## Key Takeaways
- Manhattan stations drive the highest ridership levels.
- Ridership in 2023 remained below pre-pandemic levels.
- Remote work trends likely contributed to reduced commuter traffic.
- Even though there was growth in 2023, it slowed down compared to 2022.

## Additional SQL Analysis

Additional SQL queries were created to explore:

- station traffic tier classification
- Top 10 Subway Stations: 2018 vs. 2023 Comparison 
- borough-level ridership comparisons
- station count distributions by traffic level

Some analyses were exploratory and were not ultimately visualized in Tableau.
  
## SQL Skills Used
- CASE statements
- Aggregate functions
- GROUP BY
- COUNT()
- ORDER BY
- Subqueries

## Data Cleaning / ETL
- Converted Excel files to CSV
- Renamed fields
- Removed unnecessary columns
- Cleaned formatting inconsistencies

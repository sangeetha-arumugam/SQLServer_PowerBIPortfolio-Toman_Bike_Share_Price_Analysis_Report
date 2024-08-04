CREATE DATABASE Toman_Bike_Share;

USE Toman_Bike_Share;

SELECT * FROM bike_share_yr_0;

SELECT * FROM bike_share_yr_1;

SELECT * FROM cost_table;

SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1;
--Row count = 34758

--Checking for duplicates
SELECT * FROM bike_share_yr_0
UNION ALL
SELECT * FROM bike_share_yr_1;
--Row count = 34758

WITH BikeDataset1 AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)
SELECT dteday,Season,a.yr,hr,weekday,rider_type,riders, riders*price AS Revenue, riders*price-COGS*riders AS Profit FROM BikeDataset1 AS a
LEFT JOIN cost_table AS B
ON a.yr = b.yr


WITH BikeDataset AS (
SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_0
UNION
SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_1)
SELECT Date,Season,a.yr,hr,weekday,rider_type,riders,price,COGS,  riders*price AS Revenue, riders*price-COGS*riders AS Profit FROM BikeDataset AS a
LEFT JOIN cost_table AS B
ON a.yr = b.yr

SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_0
UNION
SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_1)
SELECT Date,Season,a.yr,hr,weekday,rider_type,riders, riders*price AS Revenue, riders*price-COGS*riders AS Profit FROM BikeDataset AS a
LEFT JOIN cost_table AS B
ON a.yr = b.yr

Drop view view_BikeData;
CREATE VIEW view_BikeData AS 
WITH BikeDataset AS (
SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_0
UNION
SELECT dteday as Date,Season,yr,hr,weekday,rider_type,riders FROM bike_share_yr_1)
SELECT Date,Season,a.yr,hr,weekday,rider_type,riders,price,COGS, riders*price AS Revenue, riders*price-COGS*riders AS Profit FROM BikeDataset AS a
LEFT JOIN cost_table AS B
ON a.yr = b.yr

SELECT *
FROM view_BikeData;

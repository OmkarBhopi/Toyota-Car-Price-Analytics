-- Dataset Overview
SELECT COUNT(*) AS total_cars
FROM toyota_cars;

SELECT
AVG(price) average_price,
AVG(age) average_age,
AVG(km) average_km
FROM toyota_cars;

SELECT
MIN(price),
MAX(price)
FROM toyota_cars;

-- Fuel Analysis

SELECT fueltype,
COUNT(*) total_cars
FROM toyota_cars
GROUP BY fueltype
ORDER BY total_cars DESC;

SELECT fueltype,
ROUND(AVG(price),2) avg_price
FROM toyota_cars
GROUP BY fueltype
ORDER BY avg_price DESC;

SELECT fueltype,
AVG(km)
FROM toyota_cars
GROUP BY fueltype;

-- Transmission Analysis

SELECT automatic,
AVG(price)
FROM toyota_cars
GROUP BY automatic;

-- Vehicle Performance

SELECT
AVG(hp),
AVG(cc),
AVG(weight)
FROM toyota_cars;

SELECT *
FROM toyota_cars
ORDER BY hp DESC
LIMIT 10;

SELECT *
FROM toyota_cars
ORDER BY price DESC
LIMIT 10;

SELECT *
FROM toyota_cars
ORDER BY price
LIMIT 10;

-- Age Analysis

SELECT
CASE
WHEN age<24 THEN '0-2 Years'
WHEN age<48 THEN '2-4 Years'
WHEN age<72 THEN '4-6 Years'
ELSE '6+ Years'
END age_group,
COUNT(*) cars
FROM toyota_cars
GROUP BY age_group;

-- Price Segment

SELECT
CASE
WHEN price<8000 THEN 'Budget'
WHEN price<12000 THEN 'Mid Range'
ELSE 'Premium'
END segment,
COUNT(*)
FROM toyota_cars
GROUP BY segment;

-- Mileage Analysis

SELECT *
FROM toyota_cars
WHERE km<50000;

SELECT *
FROM toyota_cars
WHERE km>150000;
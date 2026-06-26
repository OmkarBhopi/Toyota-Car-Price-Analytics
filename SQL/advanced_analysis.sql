/*----------------------------------------------------------
1. Rank Cars by Selling Price
Purpose:
Assign a rank to each car based on selling price.
----------------------------------------------------------*/
SELECT
price,
RANK() OVER(
ORDER BY price DESC
)
FROM toyota_cars;

/*----------------------------------------------------------
2. Dense Ranking Based on Price
Purpose:
Assign consecutive rankings without skipping numbers.
----------------------------------------------------------*/
SELECT
price,
DENSE_RANK() OVER(
ORDER BY price DESC
)
FROM toyota_cars;

/*----------------------------------------------------------
3. Average Selling Price by Fuel Type
Purpose:
Use Common Table Expression (CTE) to calculate
average price for each fuel category.
----------------------------------------------------------*/
WITH AvgPrice AS
(
SELECT fueltype, AVG(price) avg_price
FROM toyota_cars
GROUP BY fueltype
)
SELECT *
FROM AvgPrice
ORDER BY avg_price DESC;

/*----------------------------------------------------------
4. Top 5 Highest Priced Cars
Purpose:
Identify premium vehicles in the dataset.
----------------------------------------------------------*/
WITH RankedCars AS
(
SELECT *,
RANK() OVER(
ORDER BY price DESC
)
AS ranking
FROM toyota_cars
)
SELECT *
FROM RankedCars
WHERE ranking<=5;

/*----------------------------------------------------------
5. Cars Selling Above Average Price
Purpose:
Retrieve vehicles whose selling price is
greater than the overall average.
----------------------------------------------------------*/
SELECT *
FROM toyota_cars
WHERE price>
(
SELECT AVG(price)
FROM toyota_cars
);

/*----------------------------------------------------------
8. Cars with Higher Than Average Horsepower
Purpose:
Identify high-performance vehicles.
----------------------------------------------------------*/
SELECT *
FROM toyota_cars
WHERE hp>
(
SELECT AVG(hp)
FROM toyota_cars
);

/*----------------------------------------------------------
9. Difference Between Selling Price and Overall Average
Purpose:
Calculate how much each car differs
from the average selling price.
----------------------------------------------------------*/
SELECT Car_ID, price, price-AVG(price) 
OVER() 
AS difference
FROM toyota_cars;

/*----------------------------------------------------------
10. Price Quartile Classification
Purpose:
Divide vehicles into four groups based
on selling price using NTILE().
----------------------------------------------------------*/
SELECT Car_ID, price, NTILE(4)
OVER(
ORDER BY price DESC
)
AS quartile
FROM toyota_cars;

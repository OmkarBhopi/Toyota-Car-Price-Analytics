COPY toyota_cars
(
Car_ID,
price,
age,
km,
fueltype,
hp,
metcolor,
automatic,
cc,
doors,
weight
)

FROM 'C:\Toyota_Cleaned.csv'
DELIMITER ','
CSV HEADER;
DROP TABLE IF EXISTS toyota_cars;

CREATE TABLE toyota_cars (

    Car_ID SERIAL PRIMARY KEY,
    price INTEGER,
    age NUMERIC(10,2),
    km NUMERIC(10,2),
    fueltype VARCHAR(20),
    hp NUMERIC(10,2),
    metcolor NUMERIC(10,2),
    automatic INTEGER,
    cc INTEGER,
    doors INTEGER,
    weight INTEGER
);

select * from toyota_cars;
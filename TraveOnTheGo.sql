-- Create Database
CREATE DATABASE if not exists `TravelOnTheGo`;

-- Use Database
USE `TravelOnTheGo`;

-- Q1) Create Table
	-- Table Passenger    
    CREATE TABLE if not exists `PASSENGER`
    (
		Passenger_name VARCHAR(50),
		Category VARCHAR(50),
		Gender VARCHAR(20),
		Boarding_City VARCHAR(50),
		Destination_City VARCHAR(50),
		Distance int,
		Bus_Type VARCHAR(50)
	);
    
    -- Table Price    
    CREATE TABLE if not exists `PRICE`
	(
		Bus_Type VARCHAR(50),
		Distance int,
		Price int
	);

-- Q2) Insert the data in the tables
	-- Insert into Passenger
    
    INSERT INTO PASSENGER 
    VALUES
		('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
		('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
		('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
		('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
		('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper'),
		('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
		('Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper'),
		('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
		('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
        
	-- Insert into Prices
    INSERT INTO PRICE 
    VALUES
		('Sleeper',350,770),
        ('Sleeper',500,1100),
        ('Sleeper',600,1320),
        ('Sleeper',700,1540),
        ('Sleeper',1000,2200),
        ('Sleeper',1200,2640),
        ('Sleeper',350,434),
        ('Sitting',500,620),
        ('Sitting',500,620),
        ('Sitting',600,744),
        ('Sitting',700,868),
        ('Sitting',1000,1240),
        ('Sitting',1200,1488),
        ('Sitting',1500,1860);
        
-- Q3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
	SELECT 
		CASE Gender
			WHEN 'M' THEN 'Male'
			WHEN 'F' THEN 'Female'
		END AS Gender, 
		COUNT(*) AS 'Number Of Passengers'
	FROM PASSENGER 
	WHERE DISTANCE >= 600
	GROUP BY Gender;

-- Q4) Find the minimum ticket price for Sleeper Bus.
	SELECT Bus_Type,MIN(Price) as 'Minimum Price'
	FROM PRICE 
	WHERE BUS_TYPE = 'Sleeper';

-- Q5) Select passenger names whose names start with character 'S'
	SELECT Passenger_name 
	FROM PASSENGER 
	WHERE Passenger_name LIKE 'S%';

-- Q6) Calculate price charged for each passenger displaying 
	-- Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
	SELECT 	
		PASSENGER.Passenger_name,
        PASSENGER.Boarding_City,
        PASSENGER.Destination_City,
        PASSENGER.Bus_Type,
        Price
	FROM PASSENGER 
	LEFT JOIN PRICE ON 
			(PASSENGER.Distance = PRICE.Distance AND PASSENGER.Bus_Type = PRICE.Bus_Type);
    
-- Q7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s
	SELECT 
		Passenger_name,
        PASSENGER.Distance,
        Price
    FROM PASSENGER 
	JOIN PRICE ON 
		(PASSENGER.Bus_Type = PRICE.Bus_Type AND PASSENGER.Distance = PRICE.Distance)
	WHERE PASSENGER.Distance = 1000
	AND PRICE.Bus_Type = 'Sitting';
    

-- Q8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
	SELECT 
		PASSENGER.Destination_City AS 'Boarding City', 
		PASSENGER.Boarding_City AS 'Destination City', 
		PRICE.Bus_Type as 'Bus Type', 
		Price
	FROM PASSENGER 
		LEFT JOIN PRICE ON (PASSENGER.Distance = PRICE.Distance)
	WHERE PASSENGER.Passenger_name = 'Pallavi';

-- Q9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
	SELECT Distance
	FROM PASSENGER
	GROUP BY Distance
	HAVING COUNT(Distance) = 1
	ORDER BY Distance DESC;

-- Q10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables
	SELECT 
		Passenger_name as Passenger,
		(Distance * 100)/SUM(Distance) OVER() AS 'Percentage Distance Travelled'
	FROM PASSENGER
	GROUP BY Passenger_name;

-- Q11) Display the distance, price in three categories in table Price
	-- a) Expensive if the cost is more than 1000
	-- b) Average Cost if the cost is less than 1000 and greater than 500
	-- c) Cheap otherwise
	SELECT Distance, Price,
		CASE
			WHEN Price >= 1000 THEN 'Expensive'
			WHEN Price < 1000 AND Price >= 500 THEN 'Average Cost'
			WHEN Price < 500 THEN 'Cheap'
		END AS Category
	FROM Price;





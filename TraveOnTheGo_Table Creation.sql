-- Create Database
CREATE DATABASE IF NOT EXISTS `TravelOnTheGo`;

-- Use Database
USE `TravelOnTheGo`;

-- Q1) Create Table
	-- Table Passenger    
    CREATE TABLE IF NOT EXISTS `PASSENGER`
    (
		Passenger_Id INT NOT NULL AUTO_INCREMENT,
		Passenger_Name VARCHAR(50),
		Category VARCHAR(50),
		Gender VARCHAR(20),
		Boarding_City VARCHAR(50),
		Destination_City VARCHAR(50),
		Distance INT NOT NULL,
		Bus_Type VARCHAR(50),
        PRIMARY KEY (Passenger_id)
	);
    
    -- Table Price    
    CREATE TABLE IF NOT EXISTS `PRICE`
	(
		Bus_Type VARCHAR(50),
		Distance INT NOT NULL,
		Price INT NOT NULL,
        PRIMARY KEY (Bus_Type,Distance,Price)
	);

-- Q2) Insert the data in the tables
	-- Insert into Passenger
    
    INSERT IGNORE INTO PASSENGER (Passenger_Name,Category,Gender,Boarding_City,Destination_City ,Distance,Bus_Type)
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
    INSERT IGNORE INTO PRICE (Bus_Type, Distance ,Price)
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
        
/* Adding Entry to Price table , as Price in Query 6 for Khusboo is blank and 
	comments provided in Assignment suggestes that it is deliberatley blank.*/
INSERT IGNORE INTO PRICE (Bus_Type, Distance ,Price) VALUES ('Sleeper',1500,3000);

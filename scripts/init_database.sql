
-- Drop and recreate the 'Ola' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Ola')
	BEGIN
		ALTER DATABASE Ola SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE Ola;
	END;
	GO

-- Create the 'Ola' database
CREATE DATABASE Ola;

-- Use Database
USE Ola;

IF OBJECT_ID('dbo.Bookings', 'U') IS NOT NULL
    DROP TABLE dbo.Bookings;
GO

-- Create the 'Bookings' table
CREATE TABLE Bookings (
    Date NVARCHAR(50),
    Time NVARCHAR(50),
    Booking_ID NVARCHAR(50),
    Booking_Status NVARCHAR(50),
    Customer_ID NVARCHAR(50),
    Vehicle_Type NVARCHAR(50),
    Pickup_Location NVARCHAR(255),
    Drop_Location NVARCHAR(255),
    V_TAT NVARCHAR(50),   -- keep as text for now
    C_TAT NVARCHAR(50),   -- keep as text for now
    Canceled_Rides_by_Customer NVARCHAR(255),
    Canceled_Rides_by_Driver NVARCHAR(255),
    Incomplete_Rides NVARCHAR(50),
    Incomplete_Rides_Reason NVARCHAR(255),
    Booking_Value NVARCHAR(50),
    Payment_Method NVARCHAR(50),
    Ride_Distance NVARCHAR(50),
    Driver_Ratings NVARCHAR(50),
    Customer_Rating NVARCHAR(50),
    Vehicle_Images NVARCHAR(500)
);
GO

BULK INSERT Bookings
FROM 'C:\Users\SADIQ\Documents\GitHub\Ola_Ride-_Bookings\datasets\Bookings.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);
GO

SELECT COUNT(*) AS rows_loaded FROM Bookings;
SELECT * FROM Bookings; 



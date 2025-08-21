
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

SELECT COUNT(*) AS rows_loaded FROM Bookings;
SELECT * FROM Bookings; 



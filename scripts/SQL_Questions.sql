--1.Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT 
	*
FROM Bookings
WHERE Booking_Status = 'Success';

--2.Find the average ride distance for each vehicle type:
CREATE VIEW avg_ride_distance_for_each_vehicle AS
SELECT
	Vehicle_Type,
	AVG(Ride_Distance) AS avg_ride_distance
FROM Bookings
GROUP BY Vehicle_Type;

--3.Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT
	COUNT(*) AS cancelled_rides_by_customers
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';

--4.List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT 
	TOP 5
	Customer_ID,
	COUNT(Booking_ID) AS total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC;

--5.Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers_due_to_P_C_Issue AS
SELECT
	COUNT(*) AS Canceled_Rides_by_Driver
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

--6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Ratings AS
SELECT
	MAX(Driver_Ratings) AS max_rating,
	MIN(Driver_Ratings) AS min_rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';

--7.Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT
	*
FROM Bookings
WHERE Payment_Method = 'UPI';

--8.Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating_per_vehicle AS
SELECT 
	Vehicle_Type,
	AVG(Customer_Rating) AS avg_cus_rating
FROM Bookings
GROUP BY Vehicle_Type;

--9.Calculate the total booking value of rides completed successfully:
CREATE VIEW successful_ride_value AS
SELECT
	SUM(Booking_Value) AS total_booking
FROM Bookings
WHERE Booking_Status = 'Success';

--10.List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT
	Booking_ID,
	Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 1;

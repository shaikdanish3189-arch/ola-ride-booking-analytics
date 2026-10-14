use ola_data;

#Retrive all the successful bookings
create view successfull_bookings as
select * from bookings_july
 where Booking_Status = 'Success';
 
 select * from successfull_bookings;
 
 #2. Find the average distane for each vehicle type
 create view Avg_ride_distance_for_vehicle as
 select Vehicle_Type, avg(Ride_Distance)
 as avg_distance from bookings_july
 group by Vehicle_Type;
 
 select * from Avg_ride_distance_for_vehicle ;
 
 #3 get the total rides cancelled by the customer
 create view Rides_cancelled_by_customer as
 select count(*) from bookings_july
 where Booking_Status = 'Canceled by Customer';
 
 select * from RIdes_cancelled_by_customer;
 
 #4 list the top 5 customers who booked the highest number of rides
 create view Top_customers as
 select Customer_ID, Count(Booking_ID) as total_rides
 from bookings_july
 group by Customer_ID
 order by total_rides DESC LIMIT 5;
 
 select * from Top_customers;
 
 
 #5	get the number of rides cancellled by drivers due to personal or car related issues
create view rides_cancellled_by_drivers_due_to_personal_nd_car_related as
 select count(*) from bookings_july
 where Canceled_Rides_by_Driver = 'Personal & Car related issue';
 
 select * from rides_cancellled_by_drivers_due_to_personal_nd_car_related;
 
 #6 find the maximum and minimun ratings for prime sedan boogings
 create view maximum_and_minimun_ratings_for_prime_sedan_bookings as
 select max(Driver_Ratings) as max_rating, 
 min(Driver_ratings) as min_ratings
 from bookings_july where Vehicle_Type = 'Prime Sedan';
 
 select * from maximum_and_minimun_ratings_for_prime_sedan_bookings;
 
 
 #7 retrive all the rides where the payments was made using upi
 create view Payments_using_UPI as
 select * from bookings_july
 where Payment_Method = 'UPI';
 
 select * from Payments_using_UPI;
 
 #8 find the average customer ratings for each vehicle type
 create view Average_rating_per_vehicle as
 select Vehicle_Type, avg(Customer_Rating) as avg_rating
 from bookings_july
 group by Vehicle_Type;
 
 select * from Average_rating_per_vehicle;
 
 
 #9 calculate the total booking value of rides successfully completed
 create view Money_made as
 select sum(Booking_Value) as Total_sum
 from bookings_july
 where Booking_Status = 'Success';
 
 select * from Money_made;
 

 #10 list all the incompletd rides along with the reason
 create view Incompleted_rides as
 select Booking_ID, Incomplete_Rides_Reason from bookings_july
 where Incomplete_Rides = 'Yes';
 
 select * from Incompleted_rides;
 
 
 #10 
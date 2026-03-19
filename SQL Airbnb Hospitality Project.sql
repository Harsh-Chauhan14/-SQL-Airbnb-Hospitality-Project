select * from bookings_table;
select *from listings_table;



#1.	Import Data from both the .CSV files to create tables, Listings and Booking Details.
#2. Write a query to show names from Listings table
select * from listings_table;

#3.	Write a query to fetch total listings from the listings table
select COUNT(id) from listings_table ;

#4.	Write a query to fetch total listing_id from the booking_details table
select COUNT(listing_id) from bookings_table;

#5.	Write a query to fetch host ids from listings table
select host_id from listings_table;

#6.	Write a query to fetch all unique host name from listings table
select distinct host_name from listings_table;

#7.	Write a query to show all unique neighbourhood_group from listings table
select distinct neighbourhood_group from listings_table;

#8.	Write a query to show all unique neighbourhood from listings table
select distinct neighbourhood from listings_table;

#9.	Write a query to fetch unique room_type from listings tables
select distinct room_type from listings_table ;

#10.	Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listings_table 
where neighbourhood_group in ('Brooklyn','Manhattan');

#11.	Write a query to show maximum price from booking_details table
select max(price) from bookings_table;

#12.	Write a query to show minimum price fron booking_details table
select MIN(price) from bookings_table;

#13.	Write a query to show average price from booking_details table
select AVG(price) from bookings_table;

#14.	Write a query to show minimum value of minimum_nights from booking_details table
select MIN(minimum_nights) from bookings_table; 

#15.	Write a query to show maximum value of minimum_nights from booking_details table
select MAX(minimum_nights) from bookings_table;

#16.	Write a query to show average availability_365 
select AVG(availability_365) from bookings_table;

#17.	Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from bookings_table
where availability_365  >300;

#18.	Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from bookings_table
where price between 300 and 400;

#19.	Write a query to show count of id where minimum_nights spend is less than 5
select COUNT(listing_id) from bookings_table 
where minimum_nights < 5;

#20.	Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from bookings_table 
where minimum_nights >100;

#21.	Write a query to show all data of listings & booking_details
select * from listings_table 
inner join bookings_table 
on listings_table.id =bookings_table.listing_id ;

#22.	Write a query to show host name and price 
select listings_table.host_name ,bookings_table.price  from listings_table
inner join bookings_table
on listings_table.id=bookings_table.listing_id 

#23.	Write a query to show room_type and price
select listings_table.room_type,bookings_table.price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id ;

#24.	Write a query to show neighbourhood_group & minimum_nights spend
select listings_table.neighbourhood_group ,bookings_table.minimum_nights  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id ;


#25.	Write a query to show neighbourhood & availability_365
select listings_table.neighbourhood,bookings_table.availability_365   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id ;


#26.	Write a query to show total price by neighbourhood_group
select listings_table.neighbourhood_group ,sum(bookings_table.price) as total_price   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.neighbourhood_group;



#27.	Write a query to show maximum price by neighbourhood_group
select listings_table.neighbourhood_group ,max(bookings_table.price) as max_price  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.neighbourhood_group;

#28.	Write a query to show maximum night spend by neighbourhood_group
select listings_table.neighbourhood_group ,max(bookings_table.minimum_nights) as maximum_night   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.neighbourhood_group;

#29.	Write a query to show maximum reviews_per_month spend by neighbourhood
select listings_table.neighbourhood ,max(bookings_table.reviews_per_month )   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.neighbourhood;

#30.	Write a query to show maximum price by room type
select listings_table.room_type  ,max(bookings_table.price) as maximum_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.room_type ;

#31.	Write a query to show average number_of_reviews by room_
select listings_table.room_type ,avg(bookings_table.number_of_reviews )  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.room_type ;


#32.	Write a query to show average price by room type
select listings_table.room_type  ,avg(bookings_table.price) as avg_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.room_type ;


#33.	Write a query to show average night spend by room type
select listings_table.room_type  ,avg(bookings_table.minimum_nights ) as avg_night_spend from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.room_type ;


#34.	Write a query to show average price by room type but average price is less than 100
select listings_table.room_type  ,avg(bookings_table.price) as avg_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id 
group by listings_table.room_type 
having  avg_price < 100;

#35.	Write a query to show average night by neighbourhood and average_nights is greater than 5.	
select listings_table.neighbourhood  ,avg(bookings_table.minimum_nights ) as avg_night_spend from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
group by listings_table.neighbourhood 
having avg_night_spend > 5;

#36Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listings_table 
where id in (select listing_id from bookings_table where price >200 );


#37.	Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from bookings_table
where listing_id  in (select id from listings_table where host_id =314941);


#38.	Find all pairs of id having the same host id, each pair coming once only.
select distinct l1.id , l1.host_id from listings_table l1, listings_table l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;

#39.	Write an sql query to show fetch all records that have the term cozy in name
select * from listings_table 
where name = 'cozy';

#40.	Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select listings_table.host_id,bookings_table.price ,listings_table.neighbourhood_group  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where listings_table.neighbourhood_group = 'manhattan';


#41.	Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select listings_table.id,bookings_table.price ,listings_table.neighbourhood,listings_table.host_name   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where listings_table.neighbourhood in('Upper West Side','Williamsburg')
having price > 100;

#42.	Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select listings_table.id,bookings_table.price ,listings_table.neighbourhood,listings_table.host_name   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where listings_table.neighbourhood ='Bedford-Stuyvesant' and host_name = 'Elise';


#43.	Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select listings_table.host_name,bookings_table.availability_365 , bookings_table.minimum_nights  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where bookings_table.availability_365 >100 and bookings_table.minimum_nights >100;

#44.	Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select listings_table.id,bookings_table.number_of_reviews  ,listings_table.host_name ,bookings_table.reviews_per_month   from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where bookings_table.number_of_reviews >500 and reviews_per_month >5;

#45.	Write a query to show neighbourhood_group which have most total number of review 
select  listings_table.neighbourhood_group,sum(bookings_table.number_of_reviews ) as total_number_review from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
group by neighbourhood_group 
order by total_number_review desc;

#46.	Write a query to show host name which have most cheaper total price
select listings_table.host_name ,sum(bookings_table.price )as total_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
group by host_name
order by total_price limit 1;
#47.	Write a query to show host name which have most costly total price 
select listings_table.host_name ,sum(bookings_table.price )as total_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
group by host_name
order by total_price desc
limit 1;
#48.	Write a query to show host name which have max price using sub-query
select listings_table.host_name ,bookings_table.price  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where price =(select MAX(price) from bookings_table );

#49.	Write a query to show neighbourhood_group where price is less than 100
select listings_table.neighbourhood_group ,bookings_table.price  from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
where price<100;

#50.	Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price
select listings_table.room_type,avg(bookings_table.availability_365) as avg_availbility_365,max(bookings_table.price )as maximum_price from listings_table
inner join bookings_table 
on listings_table.id =bookings_table.listing_id
group by listings_table.room_type  
order by maximum_price asc;
-- /////Who is the senior most employee on job title ?

-- select * from employee
-- order by levels desc
-- limit 1

-- //////Which Country has the most invoice

-- select billing_country, count(*) as total_invoice
-- from invoice
-- group by billing_country
-- order by total_invoice desc
-- limit 1

-- ////What are top 3 values of total invoice

-- select billing_country,total from invoice
-- order by total desc
-- limit 3

-- ////Which city has the best customers? we would like to throw a 
-- ////promotional music festival in the city we made the most money
-- ////Write a query that returns one city that has the highset sum
-- ////of invoice total return both city name and all invoice total

-- select billing_city , sum(total) as total_invoice
-- from invoice
-- group by billing_city
-- order by total_invoice desc
-- limit 1

-- ////Who is the best customer? The customer who has spend the most 
-- ////money will be declared the best customer. write a query that
-- ////returns the person who spend the most money

-- select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
-- from customer 
-- join invoice on customer.customer_id = invoice.customer_id
-- group by customer.customer_id, customer.first_name, customer.last_name
-- order by total desc
-- limit 1

-- ///// Write a query to return the email, first name, last name, and 
-- ////Genre of all rock music listners. Return your list ordered alphabatically
-- //// by email start with A 

-- select distinct email,first_name,last_name
-- from customer
-- join invoice on customer.customer_id = invoice.customer_id
-- join invoice_line on invoice.invoice_id = invoice_line.invoice_id
-- where track_id in(
-- select track_id from track 
-- join genre on track.genre_id = genre.genre_id
-- where genre.name like 'Rock'
-- )
-- order by email like 'A%' desc;


-- select distinct email,first_name,last_name, genre.name as GenreName
-- from customer
-- join invoice on customer.customer_id = invoice.customer_id
-- join invoice_line on invoice.invoice_id = invoice_line.invoice_id
-- join track on invoice_line.track_id = track.track_id
-- join genre on track.genre_id = genre.genre_id
-- where genre.name like 'Rock'
-- order by email;

-- ///// Let's invite the artist who have written the most rock music
-- ////// in our dataset. Write a query that returns the artist name 
-- ///// and total track count of the top 10 rock bands

-- SELECT artist.artist_id,artist.name, COUNT(artist.artist_id) AS no_of_songs
-- FROM track
-- JOIN album ON album.album_id = track.album_id
-- JOIN artist ON artist.artist_id = album.artist_id
-- JOIN genre ON genre.genre_id = track.genre_id
-- WHERE genre.name LIKE 'Rock'
-- GROUP BY artist.artist_id, artist.name
-- ORDER BY no_of_songs DESC
-- LIMIT 10;

-- ///// Return all the track names that have a song length longer than the 
-- //// average song length. Return the name and millisecond for each track
-- //// Order by the song length with the longest song listed first.

-- select name,milliseconds
-- from track
-- where milliseconds > (
-- select avg(milliseconds) as avg_track_length
-- from track
-- )
-- order by milliseconds desc;

-- //// find how much amount spend by each customer on artist? write a query to return
-- //// customer name, artist name and total spent

-- select customer.customer_id, artist.name,sum(invoice_line.unit_price*invoice_line.quantity) as total_spend
-- from invoice_line
-- join track on track.track_id = invoice_line.track_id
-- join album on album.album_id = track.album_id
-- join artist on artist.artist_id = album.artist_id
-- join invoice on invoice.invoice_id = invoice_line.invoice_id
-- join customer on customer.customer_id = invoice.customer_id
-- group by customer.customer_id,artist.name
-- order by total_spend desc


#1.1
SELECT MAX(rental_duration)
 AS max_duration, MIN(rental_duration)
 AS min_duration
FROM film;
SELECT MAX(rental_duration) AS max_duration, MIN(rental_duration) AS min_duration
FROM film;

#1.2. Express the average movie duration in hours and minutes. 
SELECT CONCAT(
    FLOOR(AVG(rental_duration) / 60), ' hours ',
    AVG(rental_duration) % 60, ' minutes'
) AS avg_duration
FROM film;
#2.1 Calculate the number of days that the company has been operating.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental
SELECT rental_id, rental_date, DATE_FORMAT(rental_date, '%M') 
AS rental_month, DATE_FORMAT(rental_date, '%W') 
AS rental_weekday
FROM rental
LIMIT 20;

#2.3
SELECT rental_id, rental_date,
    CASE
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental;

#3
SELECT title, IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title;

#challenge 2
#1.1
SELECT COUNT(*) AS total_films
FROM film;

#1.2
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;
#1.3
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;
#challenge 3
#2.1
SELECT rating, ROUND(AVG(rental_duration), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

#2.2
SELECT rating, ROUND(AVG(rental_duration), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120; -- 120 minutes is equivalent to 2 hours









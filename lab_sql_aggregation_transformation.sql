-- Challenge 1
SELECT MIN(length) AS mix_duration, MAX(length) AS max_duration FROM film;
SELECT FLOOR(AVG(length)) FROM film;

SELECT MAX(DATEDIFF('2024-03-13', DATE_FORMAT(CONVERT(rental_date,DATE),'%Y-%m-%d'))) FROM rental;

SELECT *, DATE_FORMAT(CONVERT(rental_date,DATE),'%M') AS month, DATE_FORMAT(CONVERT(rental_date,DATE),'%a') AS day FROM rental
LIMIT 20;

SELECT *, DATE_FORMAT(CONVERT(rental_date,DATE),'%M') AS month, DATE_FORMAT(CONVERT(rental_date,DATE),'%a') AS day,
CASE 
    WHEN DATE_FORMAT(CONVERT(rental_date,DATE),'%a') = 'Sat' THEN 'weekend'
    WHEN DATE_FORMAT(CONVERT(rental_date,DATE),'%a') = 'Sun' THEN 'weekend'
    ELSE 'workday'
END AS Day_type
FROM rental;

-- null values
SELECT sum(ISNULL(title)), SUM(ISNULL(rental_duration)) FROM film; -- no null values

SELECT IFNULL(title,'Not avaliable'), IFNULL(rental_duration,'Not avaliable') FROM film
ORDER BY title ASC; 

-- Challenge 2
SELECT * FROM film;

SELECT COUNT(title) FROM film;
SELECT rating, COUNT(title) FROM film
GROUP BY rating;
SELECT rating, COUNT(title) FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

SELECT rating, ROUND(AVG(length),2) FROM film
GROUP BY rating
ORDER BY ROUND(AVG(length),2) DESC;

SELECT rating, ROUND(AVG(length),2) FROM film
GROUP BY rating
HAVING ROUND(AVG(length),2) > '120.00';

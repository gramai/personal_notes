/*
A database for a series reviewing website. 
*/
-----------------------------------------------------------------------

-- CREATE TABLE reviewers (
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
-- 	first_name VARCHAR(100),
-- 	last_name VARCHAR(100)
-- );

-- CREATE TABLE series(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
-- 	title VARCHAR(100),
-- 	released_year YEAR(4),
-- 	genre VARCHAR(100)
-- );

-- CREATE TABLE reviews(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
-- 	rating DECIMAL (2,1),
-- 	series_id INT,
-- 	reviewer_id INT,
-- 	FOREIGN KEY (series_id) REFERENCES series(id),
-- 	FOREIGN KEY (reviewer_id) REFERENCES reviewers(id) 
-- );

-----------------------------------------------------------------------

-----------------------------------------------------------------------

/*
1. Print for each serie all the existent ratings.
*/
SELECT title, rating FROM series  
JOIN reviews
ON series.id = reviews.series_id;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
2. Print in ascending order the title and average rating for each series. 
*/
SELECT title, 
	   AVG(rating) AS avg_rating 
FROM series  
JOIN reviews
ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
3. Print for each existent review, the the rating and the first and 
last name of the reviewer. 
*/

SELECT
	first_name,
	last_name,
	rating
	FROM reviewers
JOIN reviews
ON reviewers.id = reviews.reviewer_id;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
4. Identify and print the unreviewed series.
*/

SELECT 
	title
	FROM series
LEFT JOIN reviews
ON reviews.series_id = series.id
WHERE rating IS NULL;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
5. For each existent genre, print the average rating
*/
SELECT genre,
	   CAST(AVG (rating) AS DECIMAL(2,1))
   FROM series
JOIN reviews
	ON 	reviews.series_id = series.id
GROUP BY series.genre;	

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
6. For each existent user, print the first name, the last name
the number of reviews, the minimum and maximum and the average rating
given by him and his status (status = "ACTIVE" if he has provided
one or more reviews, "INACTIVE" if he has provided no reviews )
*/

SELECT 
first_name,
last_name,
IFNULL(COUNT(rating),0) AS "COUNT",
IFNULL(MIN(rating),0.0) AS "MIN",
IFNULL(MAX(rating),0.0) AS "MAX",
IFNULL(AVG(rating),0.00000) AS "AVG",
CASE
	WHEN COUNT(rating)=0 THEN "INACTIVE"
	ELSE "ACTIVE"
END AS "STATUS"
FROM reviewers
LEFT JOIN reviews 
	ON reviews.reviewer_id = reviewers.id
GROUP BY reviewers.id; 

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
7. For each review given, print the title of the reviewed series,
the rating and the name of the reviewer. (double join)
*/

SELECT 
title,
rating,
CONCAT(first_name," ",last_name) AS "reviewer"
 FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series
	ON series.id = reviews.series_id
ORDER BY title;
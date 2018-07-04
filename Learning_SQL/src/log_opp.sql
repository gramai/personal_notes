
/*
Simplified Library Database
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
*/
-----------------------------------------------------------------------

-- 1. Select All Books Written Before 1980 (non inclusive)
SELECT title, released_year FROM books 
	WHERE released_year < 1980;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 2.Select All Books Written By Eggers Or Chabon
SELECT title FROM books 
	WHERE author_lname = "Eggers" || author_lname = "Chabon";

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 3.Select All Books Written By Lahiri, Published after 2000
SELECT title FROM books 
	WHERE author_lname = "Lahiri" && released_year> 2000;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 4.Select All books with page counts between 100 and 200
SELECT title, pages FROM books 
	WHERE pages BETWEEN 100 AND 200;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 5.Select all books where author_lname  starts with a 'C' or an 'S''
SELECT title, author_lname FROM books 
	WHERE author_lname LIKE "C%" OR author_lname LIKE "S%";

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
 6. Create another column called "TYPE" which holds:
- If title contains 'stories'   -> Short Stories
- If title = "Just Kids" or "A Heartbreaking Work%"  -> Memoir
- Everything Else -> Novel
*/
SELECT title, author_lname,  
CASE
	 WHEN title LIKE "%stories%" 
	 	THEN "Short Stories"
	 WHEN title = "Just Kids" OR title LIKE "A Heartbreaking Work%" 
	 	THEN "Memoir" 
	 ELSE "Novel" 
END AS "TYPE"
FROM books;

/*
7. Print the title, the last name of the author and how many books
each author has written (e.g. "1 book", "2 books")
*/
SELECT  title,author_lname,
	CASE 
		WHEN COUNT(*) = 1 THEN "1 book"
		ELSE CONCAT (COUNT(*), " books")
	END AS COUNT
FROM books GROUP BY author_lname ;


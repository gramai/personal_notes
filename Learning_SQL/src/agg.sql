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

/*
1.Print the number of books in the database.
*/
SELECT COUNT(*) AS "Number of books" FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
2.Print out how many books were released in each year
*/
SELECT released_year AS "Release Year", COUNT(*) AS "Number of books" FROM books 
      GROUP BY released_year;
      
-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
3.Print out the total number of books in stock
*/
SELECT SUM(stock_quantity) AS "Total books in stock" FROM books; 

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
4.Find the average released_year for each author
*/
SELECT CONCAT (author_fname," ", author_lname) AS "Author name",
      AVG(released_year) AS "Average year of release" FROM books 
      GROUP BY author_fname, author_lname;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
5.Find the full name of the author who wrote the longest book
*/       
SELECT 
    CONCAT(
            author_fname,
            " ",
            author_lname
            ) FROM books
            ORDER BY pages LIMIT 1;
            
-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
6.Print out for each year, the number of released books and the 
average number of pages
*/            
SELECT released_year AS 'year', COUNT(*) AS ' # books', AVG(pages) AS 'avg pages'
            FROM books
            GROUP BY released_year;

-----------------------------------------------------------------------

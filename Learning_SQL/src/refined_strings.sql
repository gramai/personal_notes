-----------------------------------------------------------------------
/*
1.Select All Story Collections 
 Titles  That contain 'stories'
*/

SELECT title FROM books WHERE title LIKE '%stories%';

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
2.Find The Longest Book
Print Out the Title and Page Count
*/
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
3.Print a summary containing the title and year, for the 3 most recent books
with the format "<Title> - <release_year>"
*/
SELECT 
    CONCAT (
            title,
            " - ",
            released_year
            ) AS 'summary'
    FROM books
    ORDER BY released_year DESC LIMIT 3
    ;
    
-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
4.Find all books with an author_lname
that contains a space(" ")
*/        
SELECT title,author_lname FROM books
    WHERE author_lname LIKE "% %";
        
-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
5.Find The 3 Books With The Lowest Stock
Select title, year, and stock
*/  
SELECT title, released_year, stock_quantity FROM books
    ORDER BY stock_quantity LIMIT 3;
        
-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
6.Print title and author_lname, sorted first by author_lname and then by title
*/    
SELECT title, author_lname FROM books
    ORDER BY author_lname, title;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
7.Print your favorite books Sorted Alphabetically By Last Name of the author
with the format "MY FAVORITE AUTHOR IS <author_full_name> !"
*/    
SELECT 
    UPPER(
        CONCAT (
                "My favorie author is ",
                author_fname,
                " ",
                author_lname,
                "!"
                ) 
        )  AS 'yell' FROM books 
    ORDER BY author_lname;

-----------------------------------------------------------------------
    

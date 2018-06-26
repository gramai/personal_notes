
-----------------------------------------------------------------------

/*
1.Reverse and Uppercase the following sentence
"Why does my cat look at me with such hatred?"
*/

SELECT UPPER(REVERSE ("Why does my cat look at me with such hatred?"));

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
2.Replace spaces in titles with '->'
*/
SELECT REPLACE (title, " ", "->") AS 'title' FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
3. Print the last name and the last name reversed
*/
SELECT author_lname AS 'forwards',REVERSE(author_lname) AS 'backwards' FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
4. Print the full name (first name + last name) in CAPS 
*/
SELECT UPPER(CONCAT (author_fname, " ", author_lname)) AS "full name in caps" FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
4. Print the title and the release date in the format:
"<TITLE> was released in <RELEASE_DATE>"
*/
SELECT CONCAT (title, " was released in ", released_year) AS 'blurb' FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
5.Print book titles and the length of each title
*/
SELECT title AS 'title', CHAR_LENGTH(title) AS 'character count' FROM books;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
/*
6. Print the short title (first 10 characters of the title), 
the author in the format "<LAST_NAME, FIRST_NAME>" and 
the quantity in the format "<QUANTITY> in stock"
*/
SELECT
  CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
  CONCAT(author_lname, ",", author_fname) AS 'author',
  CONCAT(stock_quantity, " in stock") AS 'quantity'
FROM books;

-----------------------------------------------------------------------

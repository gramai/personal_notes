
-----------------------------------------------------------------------
-- 1 Create a new database called shirts_db
CREATE DATABASE shirts_db;
USE shirts_db;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 2 Create a new table called shirts that contains id, article_name, color, size and last worn
CREATE TABLE shirts(
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR (255),
    color VARCHAR (50), 
    shirt_size VARCHAR(5),
    last_worn INT
    );

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 3 Insert data into table
INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUES 
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15)
    ;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
        
-- 4 Add a new shirt which is a purple polo shirt, sized M, last worn 50 days ago
INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUES
    ('polo shirt', 'Purple', 'M', 50)
    ;

-----------------------------------------------------------------------


-----------------------------------------------------------------------
    
-- 5 SELECT all shirts (But Only Print Out Article and Color)
SELECT article, color FROM shirts;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 6 SELECT all medium shirts (Print Out Everything But shirt_id)
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = "M";

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 7 Update all polo shirts (Change their size to L)
UPDATE shirts SET shirt_size = "L" WHERE article = "polo shirt";

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 8 Update the shirt last worn 15 days ago (Change last_worn to 0)
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 9 Update all white shirts (Change size to 'XS' and color to 'off white')        
UPDATE shirts SET shirt_size = "XS", color = "off white" WHERE color = "white";

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 10 Delete all old shirts (Last worn 200 days ago)
DELETE  FROM shirts WHERE last_worn = 200;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 11 Delete all tank tops (Your tastes have changed...)
DELETE  FROM shirts WHERE article = "tank top";

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 12 Delete all shirts !!! Catastrophe !!!
DELETE  FROM shirts;

-----------------------------------------------------------------------

/*
This database simulates some of the basic instagram functionalities

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(190) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(190) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
*/

-----------------------------------------------------------------------

-- 1. Find the 5 oldest users.
SELECT 
username,
created_at
FROM users
ORDER BY created_at  
LIMIT 5;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 2. What day of the week do most users register on?
SELECT 
DATE_FORMAT(created_at, '%W') AS "Day",
COUNT(DATE_FORMAT(created_at, '%W')) AS "Registers"
FROM users
GROUP BY DATE_FORMAT(created_at, '%W')
ORDER BY COUNT(DATE_FORMAT(created_at, '%W')) DESC
LIMIT 1;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 3. Find the users who have never posted a photo.

SELECT 
username
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id IS NULL;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 4. Which user posted the photo with the most likes?
SELECT 
username,
image_url,
COUNT(likes.photo_id) AS number_of_likes
FROM photos
INNER JOIN users
	ON users.id = photos.user_id
INNER JOIN likes
	ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY number_of_likes DESC
LIMIT 1;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 5. What is the average number of user posts?
SELECT 
(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

-- 6. What are the 5 most commonly used hashtags?
SELECT 
tag_name,
COUNT(tag_name)
FROM tags
INNER JOIN photo_tags
ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY COUNT(tag_name) DESC
LIMIT 5;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

--7. Find the users who have liked every single photo on the website
SELECT username,
COUNT(likes.photo_id) AS photos_liked
FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP BY users.id
HAVING photos_liked = (SELECT COUNT(id) FROM photos)
; 

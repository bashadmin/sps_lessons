-- One to Many Relationships
-- Suppose you are tasked with keeping track of a database that contain the best “how-to” videos on Power BI.
-- In a single SQL script, with comments, follow these steps:

-- 1) Create a new database (schema) called "Video_Reviews". 
CREATE SCHEMA 
    CREATE TABLE video_reviews.video_content (
        video_id INT NOT NULL,
        video_title VARCHAR (500) NOT NULL,
        video_length(mins) FLOAT NOT NULL
        constraint video_content_pk PRIMARY KEY ( video_id )
    )
    create table video_reviews.user_reviews (
        video_id INT NOT NULL,
        user_name VARCHAR (125) NOT NULL,
        user_rating INT check (user_rating between 1 and 5) NULL,
        user_review VARCHAR (240) NOT NULL,
        constraint user_reviews_pk
            PRIMARY KEY ( video_id, user_name ),
        constraint video_content_fk
            foreign key ( video_id )
            REFERENCES video_content ( video_id)
    );

-- 2) On the newly created schema, create one table to keep track of the videos.

DROP TABLE IF EXISTS
    `video_reviews`.`videos`;
 
Create table `video_reviews`.`videos`
(video_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
video_title VARCHAR (200) NOT NULL,
video_length FLOAT NULL DEFAULT (NULL),
video_url VARCHAR (500));

-- 3) This table should include a unique ID, the title of the video, the length in minutes,
-- and the URL. Populate the table with at least three related videos from YouTube, the
-- Microsoft Power BI site, or other publicly available resources.
INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Introduction to Power BI (0-1)',120.05,'https://www.youtube.com/watch?v=1c01r_pAZdk&list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP');
INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Hands-On Power BI Tutorial Beginner to Pro [Full Course]',185.73,'https://www.youtube.com/watch?v=5X5LWcLtkzg');
INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Power BI Tutorial From Beginner to Pro Desktop to Dashboard in 60 Minutes', 63.50, 'https://www.youtube.com/watch?v=AGrl-H87pRU')
-- verify if the last command worked
SELECT * FROM video_reviews.videos;


-- 4) Create a second table that provides at least two user reviews for each of at least 
-- two of the videos. These should be imaginary reviews that include columns for the
-- user’s name (“Luis”, “Sonya”, etc.), the rating (which could be NULL, or a number 
-- between 0 and 5), and a short text review (“Loved it!”). There should be a column 
-- that links back to the ID column in the table of videos.

DROP TABLE IF EXISTS
    reviews;

Create table reviews
(review_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
users_name VARCHAR (500) NOT NULL,
users_rating INT check (users_rating between 1 and 5) NULL,
users_review VARCHAR (200) NULL DEFAULT (NULL),
ref_ID INT NOT NULL
REFERENCES `video_reivews`.`videos` (video_ID));

INSERT INTO `video_reviews`.`reviews`(users_name, users_rating, users_review)
    VALUES('Bobby', 3, 'Found this somewhat helpful.');
INSERT INTO `video_reviews`.`reviews`(users_name, users_rating, users_review)
    VALUES('Sarah', 4, 'That was great!');

-- verify if the last command worked
SELECT * FROM reviews;

-- 5) Write a JOIN statement that shows information from both tables.





-- Please note that creating the table and inserting records on each table must be 
-- done in SQL.   
-- Do not insert records using the MySQL interface, or from a CSV file 
-- (or any other file).  All work must be performed as a SQL script.
-- 001
-- Introduction to Power BI (0-1)
-- 2mins3secs
-- first video https://www.youtube.com/watch?v=1c01r_pAZdk&list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP

-- 002
-- Hands-On Power BI Tutorial Beginner to Pro [Full Course]
-- 185mins44secs
-- https://www.youtube.com/watch?v=5X5LWcLtkzg

-- 003
-- Power BI Tutorial From Beginner to Pro Deskto to Dashboard in 60 Minutes
-- 63mins30secs
-- https://www.youtube.com/watch?v=AGrl-H87pRU


INSERT INTO `video_reviews`.`reviews`(users_name, users_rating, users_review)
    VALUES('Bobby', 3, 'Found this somewhat helpful.');
INSERT INTO `video_reviews`.`reviews`(users_name, users_rating, users_review)
    VALUES('Sarah', 4, 'That was great!');


INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Introduction to Power BI (0-1)',120.05,'https://www.youtube.com/watch?v=1c01r_pAZdk&list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP');
INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Hands-On Power BI Tutorial Beginner to Pro [Full Course]',185.73,'https://www.youtube.com/watch?v=5X5LWcLtkzg');
INSERT INTO `video_reviews`.`videos`(video_title, video_length, video_url)
    VALUES('Power BI Tutorial From Beginner to Pro Desktop to Dashboard in 60 Minutes', 63.50, 'https://www.youtube.com/watch?v=AGrl-H87pRU')

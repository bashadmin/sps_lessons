-- 1) Create a new database (schema) called "Video_Reviews". 
-- 2) On the newly created schema, create one table to keep track of the videos.
-- 3) This table should include a unique ID, the title of the video, the length in minutes,
-- and the URL. Populate the table with at least three related videos from YouTube, the
-- Microsoft Power BI site, or other publicly available resources.


CREATE SCHEMA video_reviews;

    CREATE TABLE IF NOT EXISTS video_reviews.video_content (
        video_id INT AUTO_INCREMENT NOT NULL,
        video_title VARCHAR (500) NOT NULL,
        video_length FLOAT NOT NULL,
        video_url VARCHAR (1000) NOT NULL,
        PRIMARY KEY (video_id)
    );
    create table IF NOT EXISTS video_reviews.user_reviews (
        video_id INT NOT NULL,
        user_name VARCHAR (125) NOT NULL,
        user_rating INT check (user_rating between 1 and 5) NULL,
        user_review VARCHAR (240) NOT NULL,
        constraint user_reviews_pk
            PRIMARY KEY ( video_id, user_name ),
        constraint video_content_fk
            foreign key ( video_id )
            REFERENCES video_reviews.video_content ( video_id)
    );
    

-- 4) Create a second table that provides at least two user reviews for each of at least 
-- two of the videos. These should be imaginary reviews that include columns for the
-- user’s name (“Luis”, “Sonya”, etc.), the rating (which could be NULL, or a number 
-- between 0 and 5), and a short text review (“Loved it!”). There should be a column 
-- that links back to the ID column in the table of videos.

INSERT INTO `video_reviews`.`video_content` (video_title, video_length, video_url)
    VALUES('Introduction to Power BI (0-1)',120.05,'https://www.youtube.com/watch?v=1c01r_pAZdk&list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP');
INSERT INTO `video_reviews`.`video_content`(video_title, video_length, video_url)
    VALUES('Hands-On Power BI Tutorial Beginner to Pro [Full Course]',185.73,'https://www.youtube.com/watch?v=5X5LWcLtkzg');
INSERT INTO `video_reviews`.`video_content`(video_title, video_length, video_url)
    VALUES('Power BI Tutorial From Beginner to Pro Desktop to Dashboard in 60 Minutes', 63.50, 'https://www.youtube.com/watch?v=AGrl-H87pRU');

INSERT INTO `video_reviews`.`user_reviews` (video_id, user_name, user_rating, user_review)
    VALUES(1, 'Bobby', 3, 'Found this somewhat helpful.');
INSERT INTO `video_reviews`.`user_reviews`(video_id, user_name, user_rating, user_review)
    VALUES(2, 'Sarah', 4, 'That was great!');

INSERT INTO `video_reviews`.`user_reviews` (video_id, user_name, user_rating, user_review)
    VALUES(1, 'Jenny', 1, 'Useless');
INSERT INTO `video_reviews`.`user_reviews`(video_id, user_name, user_rating, user_review)
    VALUES(2, 'Mark', 4, 'I would watch this again and again!');
    
-- verify if previous inserts worked

select * from video_reviews.user_reviews;
select * from video_reviews.video_content;

-- 5) Write a JOIN statement that shows information from both tables.

select *
from video_reviews.user_reviews
INNER JOIN video_reviews.video_content;


-- Homework 2
-- Q1. Create one table to keep track of the videos.  
-- This table should include a unique ID, the title of the video, the length in minutes, and the URL.  
-- Populate the table with at least three related videos from YouTube or other publicly available resources.

-- Solution
-- Create a Video schema then create Video Table and Reviewers Table within the schema
Drop Table IF EXISTs Videos;
Create Table Videos(
VideoID Int Auto_Increment Primary Key,
Title varchar(50) Not NULL,
Length varchar(180) Not NULL,
URL varchar(200) Not NULL
);

INSERT INTO Videos (VideoID, Title, Length, URL) Values (1, 'Devil Winds', 90, 'https://www.youtube.com/watch?v=pOIQSwB38NM');
INSERT INTO Videos (VideoID, Title, Length, URL) Values (2, 'The Biggest of Oklahoma Tornadoes', 50, 'https://www.youtube.com/watch?v=aULlfbjmKuQ');
INSERT INTO Videos (VideoID, Title, Length, URL) Values (3, 'Tornado Video Classics - Volume Three', 60, 'https://www.youtube.com/watch?v=3Y3MbsorN7M');
INSERT INTO Videos (VideoID, Title, Length, URL) Values (4, 'El Reno Oklahoma Tornado Full Storm Chase', 65, 'https://www.youtube.com/watch?v=3SP5VSwUNDQ');
INSERT INTO Videos (VideoID, Title, Length, URL) Values (5, 'Tornado Video Classics - Volume Two', 70, 'https://www.youtube.com/watch?v=qTPsoDs-rcM');
-- Viewing the Table with contents
Select *
From Videos; 

-- Q2. Create a second table that provides at least two user reviews for each of at least two of the videos.  
-- These should be imaginary reviews that include columns for the user’s name (“Asher”, “Cyd”, etc.), 
-- the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”).  
-- There should be a column that links back to the ID column in the table of videos.

Drop Table IF EXISTS Reviewers;
Create Table Reviewers(
ReviewerID Int Primary Key,
VideoID Int Not NULL References Videos,
ReviewerName varchar(50) Not NULL,
Rating int Not NULL,
ReviewerComment text
);

INSERT INTO Reviewers (ReviewerID, VideoID, ReviewerName, Rating, ReviewerComment) VALUES (21, 1, 'Amos', 3, 'Weak Action');
INSERT INTO Reviewers (ReviewerID, VideoID, ReviewerName, Rating, ReviewerComment) VALUES (22, 2, 'Alfred', 5, 'Nice﻿ One');
INSERT INTO Reviewers (ReviewerID, VideoID, ReviewerName, Rating, ReviewerComment) VALUES (23, 3,'Gina', 2, 'Joke﻿﻿r');
INSERT INTO Reviewers (ReviewerID, VideoID, ReviewerName, Rating, ReviewerComment) VALUES (24, 1, 'Santos', 3, 'This is Poor﻿');
INSERT INTO Reviewers (ReviewerID, VideoID, ReviewerName, Rating, ReviewerComment) VALUES (25, 2, 'McKezie', 5, 'The Best Ever');
Select *
From Reviewers;

-- Q3. Write a JOIN statement that shows information from both tables.
Select 
VideoID, ReviewerName, Title, ReviewerComment
From Videos
INNER JOIN Reviewers USING (VideoID)
GROUP By VideoID
;

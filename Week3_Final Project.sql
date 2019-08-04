-- This project presents the following 
-- (1) translate a business requirement into a database design, 
-- (2) design a database using one-to-many and many-to-many relationships, and 
-- (3) know when to use LEFT and/or RIGHT JOINs to build result sets for reporting.

-- Solution
-- Q1. All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
Drop Table IF EXISTs Groups;
Create Table Groups(
GroupID Int Auto_Increment Primary Key,
GroupName varchar(50) Not NULL)
;

INSERT INTO Groups (GroupID, GroupName) Values (1, 'IT');
INSERT INTO Groups (GroupID, GroupName) Values (2, 'Sales');
INSERT INTO Groups (GroupID, GroupName) Values (3, 'Administration');
INSERT INTO Groups (GroupID, GroupName) Values (4, 'OPerations');
-- Viewing the Table with contents
Select *
From Groups;

-- Q2. All rooms, and the groups assigned to each room. 
-- The rooms should appear even if no groups have been assigned to them..  
-- There should be a column that links back to the ID column in the table of videos.

Drop Table IF EXISTS Rooms;
Create Table Rooms(
RoomID Int Primary Key,
RoomName varchar(50) Not NULL)
;

INSERT INTO Rooms (RoomID, RoomName) Values (201, '101');
INSERT INTO Rooms (RoomID, RoomName) Values (202, '102');
INSERT INTO Rooms (RoomID, RoomName) Values (203, 'Auditorium A');
INSERT INTO Rooms (RoomID, RoomName) Values (204, 'Auditorium B');
Select *
From Rooms;

-- Q3. A list of users, the groups that they belong to, and the rooms to which they are assigned. 
-- This should be sorted alphabetically by user, then by group, then by room.

Drop Table IF EXISTS Users;
Create Table Users(
UserID Int Primary Key,
GroupID Int References Groups,
UserName varchar(50) Not NULL
)
;

INSERT INTO Users (UserID, GroupID, UserName) Values (301, 1, "Modesto");
INSERT INTO Users (UserID, GroupID, UserName) Values (302, 1, "Ayine");
INSERT INTO Users (UserID, GroupID, UserName) Values (303, 2, "Christopher");
INSERT INTO Users (UserID, GroupID, UserName) Values (304, 2, "Cheong Woo");
INSERT INTO Users (UserID, GroupID, UserName) Values (305, 3, "Saulat");
INSERT INTO Users (UserID, GroupID, UserName) Values (306, null, "Heidy");
Select *
From Users;

-- Task 1. All group and Users
-- Using Left Join shows all group and users with Operations having "No User".
Select 
GroupID, UserID, UserName, GroupName
From Groups
LEFT JOIN Users USING (GroupID)
GROUP By UserName
;

-- Task 2. All rooms, and the groups assigned to each room
Create Table Group_RM(
GroupName varchar(50) References Groups,
RoomName varchar(50)  References Rooms
);
INSERT INTO Group_RM (GroupName, RoomName) Values ('IT', '101');
INSERT INTO Group_RM (GroupName, RoomName) Values ('IT', '102');
INSERT INTO Group_RM (GroupName, RoomName) Values ('Sales','102');
INSERT INTO Group_RM (GroupName, RoomName) Values ('Sales', 'Auditorium A');
INSERT INTO Group_RM (GroupName, RoomName) Values ('Administration', null);
INSERT INTO Group_RM (GroupName, RoomName) Values ('Operation', null);
Select*
From Group_RM
;

-- Task 3. A list of users, the groups that they belong to, and the rooms to which they are assigned.
Select UserID, UserName, GroupName, RoomName
From Users
JOIN Rooms
JOIN Groups ON Users.GroupID = Groups.GroupID
Order By UserName, GroupName, RoomName
;

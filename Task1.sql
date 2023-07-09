-- CREATE movie DB;
 use movie;
 --CREATE a TABLE for  Movie_Table and create require tables
  create table Movie_table(id int primary key,
    -> Title varchar(255),
    -> Director varchar(255),
    -> Year int
    -> );
    
desc Movie_table;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int          | NO   | PRI | NULL    |       |
| Title    | varchar(255) | YES  |     | NULL    |       |
| Director | varchar(255) | YES  |     | NULL    |       |
| Year     | int          | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

 insert into Movie_table(id,Title,Director,Year)
    -> values
    -> (1,'Ratatouille','John Lasseter',2005),
    -> (2,'Cars','John Lasseter',2007),
    -> (3,'Cars 2','John Lasseter',2009),
    -> (4,'Toy','Lee Unkrich',2007),
    -> (5,'Toy 2','Lee Unkrich',2010),
    -> (6,'Brave','Brenda Chapman',2000),
    -> (7,'Monster University','Dan Scanlon',2015)
    -> ,(8,'Brave 2','Brenda Chapman',2010),
    -> (9,'Up','Pete Doctor',2013),
    -> (10,'Monster University 2','Dan Scanlon',2018);

     SELECT * FROM Movie_table;
+----+----------------------+----------------+------+
| id | Title                | Director       | Year |
+----+----------------------+----------------+------+
|  1 | Ratatouille          | John Lasseter  | 2005 |
|  2 | Cars                 | John Lasseter  | 2007 |
|  3 | Cars 2               | John Lasseter  | 2009 |
|  4 | Toy                  | Lee Unkrich    | 2007 |
|  5 | Toy 2                | Lee Unkrich    | 2010 |
|  6 | Brave                | Brenda Chapman | 2000 |
|  7 | Monster University   | Dan Scanlon    | 2015 |
|  8 | Brave 2              | Brenda Chapman | 2010 |
|  9 | Up                   | Pete Doctor    | 2013 |
| 10 | Monster University 2 | Dan Scanlon    | 2018 |
+----+----------------------+----------------+------+

--------------------------------------
------- CREATED TABLE LISTS-----------
--------------------------------------

mysql> SHOW TABLES;
+-----------------+
| Tables_in_movie |
+-----------------+
| artist          |
| genres          |
| movie_genre     |
| movie_review    |
| movie_role      |
| movie_skill     |
| movie_table     |
| review          |
| role            |
| skill           |
+-----------------+
----------------------------------------------------
-- SOME OPERATION ON movie_table--------------------
---------------------------------------------------

 SELECT Title,Year FROM movie_table;
+----------------------+------+
| Title                | Year |
+----------------------+------+
| Ratatouille          | 2005 |
| Cars                 | 2007 |
| Cars 2               | 2009 |
| Toy                  | 2007 |
| Toy 2                | 2010 |
| Brave                | 2000 |
| Monster University   | 2015 |
| Brave 2              | 2010 |
| Up                   | 2013 |
| Monster University 2 | 2018 |
+----------------------+------+

 SELECT * FROM movie_table ORDER BY Year ASC;
+----+----------------------+----------------+------+
| id | Title                | Person_Name    | Year |
+----+----------------------+----------------+------+
|  6 | Brave                | Brenda Chapman | 2000 |
|  1 | Ratatouille          | John Lasseter  | 2005 |
|  2 | Cars                 | John Lasseter  | 2007 |
|  4 | Toy                  | Lee Unkrich    | 2007 |
|  3 | Cars 2               | John Lasseter  | 2009 |
|  5 | Toy 2                | Lee Unkrich    | 2010 |
|  8 | Brave 2              | Brenda Chapman | 2010 |
|  9 | Up                   | Pete Doctor    | 2013 |
|  7 | Monster University   | Dan Scanlon    | 2015 |
| 10 | Monster University 2 | Dan Scanlon    | 2018 |
+----+----------------------+----------------+------+

SELECT * FROM movie_table WHERE id=4;
+----+-------+-------------+------+
| id | Title | Person_Name | Year |
+----+-------+-------------+------+
|  4 | Toy   | Lee Unkrich | 2007 |
+----+-------+-------------+------+

 SELECT DISTINCT Person_Name FROM movie_table;
+----------------+
| Person_Name    |
+----------------+
| John Lasseter  |
| Lee Unkrich    |
| Brenda Chapman |
| Dan Scanlon    |
| Pete Doctor    |
+----------------+


---------------------------------------------------------------------
----------- Artist can perform multiple role in a single film -------
---------------------------------------------------------------------
 CREATE TABLE Role(
    -> IDNO INT PRIMARY KEY,
    -> RoleType varchar(255));

 insert into Role(IDNO, RoleType) Values
    -> (1,'mainRole'),
    -> (2,'Neagative Role'),
    -> (3,'Positive Role'),
    -> (4,'Comedy Role');

 SELECT * FROM role;
+------+----------------+
| IDNO | RoleType       |
+------+----------------+
|    1 | mainRole       |
|    2 | Neagative Role |
|    3 | Positive Role  |
|    4 | Comedy Role    |
+------+----------------+

 CREATE TABLE movie_role(
    -> id int,
    -> IDNO INT,
    -> PRIMARY KEY(id,IDNO),
    -> FOREIGN KEY(id) REFERENCES movie_table(id),
    -> FOREIGN KEY(IDNO) REFERENCES role(IDNO) );

 INSERT INTO movie_role(id,IDNO) VALUES
    -> (1,3),
    -> (1,1),
    -> (2,1),
    -> (2,4),
    -> (3,2),
    -> (4,2),
    -> (5,1),
    -> (6,4),
    -> (7,2),
    -> (9,1),
    -> (9,4),
    -> (10,2);

SELECT * FROM movie_role;
+----+------+
| id | IDNO |
+----+------+
|  1 |    1 |
|  2 |    1 |
|  5 |    1 |
|  9 |    1 |
|  3 |    2 |
|  4 |    2 |
|  7 |    2 |
| 10 |    2 |
|  1 |    3 |
|  2 |    4 |
|  6 |    4 |
|  9 |    4 |
+----+------+   

 SELECT * FROM movie_table;
+----+----------------------+----------------+------+
| id | Title                | Person_Name    | Year |
+----+----------------------+----------------+------+
|  1 | Ratatouille          | John Lasseter  | 2005 |
|  2 | Cars                 | John Lasseter  | 2007 |
|  3 | Cars 2               | John Lasseter  | 2009 |
|  4 | Toy                  | Lee Unkrich    | 2007 |
|  5 | Toy 2                | Lee Unkrich    | 2010 |
|  6 | Brave                | Brenda Chapman | 2000 |
|  7 | Monster University   | Dan Scanlon    | 2015 |
|  8 | Brave 2              | Brenda Chapman | 2010 |
|  9 | Up                   | Pete Doctor    | 2013 |
| 10 | Monster University 2 | Dan Scanlon    | 2018 |
+----+----------------------+----------------+------+

SELECT Title,Person_Name,RoleType 
FROM movie_table 
INNER JOIN  movie_role 
ON  movie_table.id= movie_role.id
INNER JOIN role ON movie_role.IDNO=role.IDNO;
+----------------------+----------------+----------------+
| Title                | Person_Name    | RoleType       |
+----------------------+----------------+----------------+
| Ratatouille          | John Lasseter  | mainRole       |
| Cars                 | John Lasseter  | mainRole       |
| Toy 2                | Lee Unkrich    | mainRole       |
| Up                   | Pete Doctor    | mainRole       |
| Cars 2               | John Lasseter  | Neagative Role |
| Toy                  | Lee Unkrich    | Neagative Role |
| Monster University   | Dan Scanlon    | Neagative Role |
| Monster University 2 | Dan Scanlon    | Neagative Role |
| Ratatouille          | John Lasseter  | Positive Role  |
| Cars                 | John Lasseter  | Comedy Role    |
| Brave                | Brenda Chapman | Comedy Role    |
| Up                   | Pete Doctor    | Comedy Role    |
+----------------------+----------------+----------------+

SELECT Title,Person_Name,RoleType 
FROM movie_table 
INNER JOIN  movie_role 
ON  movie_table.id= movie_role.id 
INNER JOIN role ON movie_role.IDNO=role.IDNO 
WHERE RoleType="mainrole";
+-------------+---------------+----------+
| Title       | Person_Name   | RoleType |
+-------------+---------------+----------+
| Ratatouille | John Lasseter | mainRole |
| Cars        | John Lasseter | mainRole |
| Toy 2       | Lee Unkrich   | mainRole |
| Up          | Pete Doctor   | mainRole |
+-------------+---------------+----------+


SELECT Title,Person_Name,RoleType 
FROM movie_table 
INNER JOIN  movie_role 
ON  movie_table.id= movie_role.id 
INNER JOIN role ON movie_role.IDNO=role.IDNO 
WHERE RoleType="Positive Role" OR RoleType="Comedy Role";
+-------------+----------------+---------------+
| Title       | Person_Name    | RoleType      |
+-------------+----------------+---------------+
| Ratatouille | John Lasseter  | Positive Role |
| Cars        | John Lasseter  | Comedy Role   |
| Brave       | Brenda Chapman | Comedy Role   |
| Up          | Pete Doctor    | Comedy Role   |
+-------------+----------------+---------------+

SELECT Title,Person_Name,RoleType 
FROM movie_table 
INNER JOIN  movie_role 
ON  movie_table.id= movie_role.id 
INNER JOIN role ON movie_role.IDNO=role.IDNO 
WHERE Title="Ratatouille";
+-------------+---------------+---------------+
| Title       | Person_Name   | RoleType      |
+-------------+---------------+---------------+
| Ratatouille | John Lasseter | mainRole      |
| Ratatouille | John Lasseter | Positive Role |
+-------------+---------------+---------------+


mysql> SELECT Title,Person_Name,RoleType
       FROM movie_table
       INNER JOIN  movie_role
       ON  movie_table.id= movie_role.id 
       INNER JOIN role ON movie_role.IDNO=role.IDNO 
       WHERE Person_Name="John Lasseter";
+-------------+---------------+----------------+
| Title       | Person_Name   | RoleType       |
+-------------+---------------+----------------+
| Ratatouille | John Lasseter | mainRole       |
| Ratatouille | John Lasseter | Positive Role  |
| Cars        | John Lasseter | mainRole       |
| Cars        | John Lasseter | Comedy Role    |
| Cars 2      | John Lasseter | Neagative Role |
+-------------+---------------+----------------+

---------------------------------------------------------------
----------------Movie can belongs to multiple Genre ---------------
----------------------------------------------------------------
 

mysql> select * from genres;
+-----+-----------+
| gID | gName     |
+-----+-----------+
|   1 | Comedy    |
|   2 | Action    |
|   3 | Thriller  |
|   4 | Animation |
|   5 | Horror    |
+-----+-----------+

mysql> select * from movie_genre;
+---------+---------+
| movieID | genreID |
+---------+---------+
|       2 |       1 |
|       4 |       1 |
|       5 |       1 |
|       9 |       1 |
|       1 |       2 |
|       3 |       2 |
|       4 |       2 |
|       8 |       2 |
|       2 |       3 |
|       6 |       3 |
|       1 |       4 |
|       3 |       4 |
|       5 |       4 |
|       7 |       5 |
|      10 |       5 |
+---------+---------+

mysql> select * from movie_table;
+----+----------------------+----------------+------+
| id | Title                | Person_Name    | Year |
+----+----------------------+----------------+------+
|  1 | Ratatouille          | John Lasseter  | 2005 |
|  2 | Cars                 | John Lasseter  | 2007 |
|  3 | Cars 2               | John Lasseter  | 2009 |
|  4 | Toy                  | Lee Unkrich    | 2007 |
|  5 | Toy 2                | Lee Unkrich    | 2010 |
|  6 | Brave                | Brenda Chapman | 2000 |
|  7 | Monster University   | Dan Scanlon    | 2015 |
|  8 | Brave 2              | Brenda Chapman | 2010 |
|  9 | Up                   | Pete Doctor    | 2013 |
| 10 | Monster University 2 | Dan Scanlon    | 2018 |
+----+----------------------+----------------+------+

mysql>  SELECT Title,Person_Name,gName
    -> FROM movie_table
    -> INNER JOIN movie_genre
    -> ON  movie_table.id=movie_genre.movieID
    -> INNER JOIN  genres
    -> ON movie_genre.genreID=genres.gID;
+----------------------+----------------+-----------+
| Title                | Person_Name    | gName     |
+----------------------+----------------+-----------+
| Cars                 | John Lasseter  | Comedy    |
| Toy                  | Lee Unkrich    | Comedy    |
| Toy 2                | Lee Unkrich    | Comedy    |
| Up                   | Pete Doctor    | Comedy    |
| Ratatouille          | John Lasseter  | Action    |
| Cars 2               | John Lasseter  | Action    |
| Toy                  | Lee Unkrich    | Action    |
| Brave 2              | Brenda Chapman | Action    |
| Cars                 | John Lasseter  | Thriller  |
| Brave                | Brenda Chapman | Thriller  |
| Ratatouille          | John Lasseter  | Animation |
| Cars 2               | John Lasseter  | Animation |
| Toy 2                | Lee Unkrich    | Animation |
| Monster University   | Dan Scanlon    | Horror    |
| Monster University 2 | Dan Scanlon    | Horror    |
+----------------------+----------------+-----------+


mysql>  SELECT Title,Person_Name,gName
    -> FROM movie_table
    -> INNER JOIN movie_genre
    -> ON  movie_table.id=movie_genre.movieID
    -> INNER JOIN  genres
    -> ON movie_genre.genreID=genres.gID
    -> WHERE Title="Toy 2";

+-------+-------------+-----------+
| Title | Person_Name | gName     |
+-------+-------------+-----------+
| Toy 2 | Lee Unkrich | Comedy    |
| Toy 2 | Lee Unkrich | Animation |
+-------+-------------+-----------+


mysql>  SELECT Title,Person_Name,gName
    -> FROM movie_table
    -> INNER JOIN movie_genre
    -> ON  movie_table.id=movie_genre.movieID
    -> INNER JOIN  genres
    -> ON movie_genre.genreID=genres.gID
    -> WHERE Title="Ratatouille";

+-------------+---------------+-----------+
| Title       | Person_Name   | gName     |
+-------------+---------------+-----------+
| Ratatouille | John Lasseter | Action    |
| Ratatouille | John Lasseter | Animation |
+-------------+---------------+-----------+


 SELECT Title,Person_Name,gName
    -> FROM movie_table
    -> INNER JOIN movie_genre
    -> ON  movie_table.id=movie_genre.movieID
    -> INNER JOIN  genres
    -> ON movie_genre.genreID=genres.gID
    -> WHERE gName="Action";
+-------------+----------------+--------+
| Title       | Person_Name    | gName  |
+-------------+----------------+--------+
| Ratatouille | John Lasseter  | Action |
| Cars 2      | John Lasseter  | Action |
| Toy         | Lee Unkrich    | Action |
| Brave 2     | Brenda Chapman | Action |
+-------------+----------------+--------+

----------------------------------------------------------------
------------------Artist can have multiple skills---------------
----------------------------------------------------------------

select * from skill;
+-------+-----------+
| id_no | skillType |
+-------+-----------+
|     1 | Acting    |
|     2 | Singing   |
|     3 | Comedy    |
|     4 | stunt     |
|     5 | Dance     |
+-------+-----------+

SELECT * FROM movie_skill;
+----+------+
| id | IDNO |
+----+------+
|  4 |    1 |
|  6 |    1 |
|  8 |    1 |
| 10 |    1 |
|  5 |    2 |
| 10 |    2 |
|  4 |    3 |
|  2 |    4 |
|  3 |    4 |
|  7 |    4 |
|  9 |    4 |
|  1 |    5 |
|  3 |    5 |
|  8 |    5 |
+----+------+

 select * from movie_table;
+----+----------------------+----------------+------+
| id | Title                | Person_Name    | Year |
+----+----------------------+----------------+------+
|  1 | Ratatouille          | John Lasseter  | 2005 |
|  2 | Cars                 | John Lasseter  | 2007 |
|  3 | Cars 2               | John Lasseter  | 2009 |
|  4 | Toy                  | Lee Unkrich    | 2007 |
|  5 | Toy 2                | Lee Unkrich    | 2010 |
|  6 | Brave                | Brenda Chapman | 2000 |
|  7 | Monster University   | Dan Scanlon    | 2015 |
|  8 | Brave 2              | Brenda Chapman | 2010 |
|  9 | Up                   | Pete Doctor    | 2013 |
| 10 | Monster University 2 | Dan Scanlon    | 2018 |
+----+----------------------+----------------+------+

mysql> SELECT Title,Person_Name,skillType
    -> FROM movie_table
    -> INNER JOIN movie_skill
    -> ON  movie_table.id=movie_skill.id
    -> INNER JOIN  skill
    -> ON movie_skill.IDNO=skill.id_no;
+----------------------+----------------+-----------+
| Title                | Person_Name    | skillType |
+----------------------+----------------+-----------+
| Toy                  | Lee Unkrich    | Acting    |
| Brave                | Brenda Chapman | Acting    |
| Brave 2              | Brenda Chapman | Acting    |
| Monster University 2 | Dan Scanlon    | Acting    |
| Toy 2                | Lee Unkrich    | Singing   |
| Monster University 2 | Dan Scanlon    | Singing   |
| Toy                  | Lee Unkrich    | Comedy    |
| Cars                 | John Lasseter  | stunt     |
| Cars 2               | John Lasseter  | stunt     |
| Monster University   | Dan Scanlon    | stunt     |
| Up                   | Pete Doctor    | stunt     |
| Ratatouille          | John Lasseter  | Dance     |
| Cars 2               | John Lasseter  | Dance     |
| Brave 2              | Brenda Chapman | Dance     |
+----------------------+----------------+-----------+

mysql> SELECT Title,Person_Name,skillType
    -> FROM movie_table
    -> INNER JOIN movie_skill
    ->  ON  movie_table.id=movie_skill.id
    -> INNER JOIN  skill
    -> ON movie_skill.IDNO=skill.id_no
    -> WHERE Person_Name="Lee Unkrich";

+-------+-------------+-----------+
| Title | Person_Name | skillType |
+-------+-------------+-----------+
| Toy   | Lee Unkrich | Acting    |
| Toy   | Lee Unkrich | Comedy    |
| Toy 2 | Lee Unkrich | Singing   |
+-------+-------------+-----------+


mysql> SELECT Title,Person_Name,skillType
    -> FROM movie_table
    -> INNER JOIN movie_skill
    ->  ON  movie_table.id=movie_skill.id
    -> INNER JOIN  skill
    -> ON movie_skill.IDNO=skill.id_no
    -> WHERE Person_Name="Brenda Chapman";

+---------+----------------+-----------+
| Title   | Person_Name    | skillType |
+---------+----------------+-----------+
| Brave   | Brenda Chapman | Acting    |
| Brave 2 | Brenda Chapman | Acting    |
| Brave 2 | Brenda Chapman | Dance     |
+---------+----------------+-----------+


 SELECT Title,Person_Name,skillType
    -> FROM movie_table
    -> INNER JOIN movie_skill
    -> ON  movie_table.id=movie_skill.id
    -> INNER JOIN  skill
    -> ON movie_skill.IDNO=skill.id_no
    -> WHERE skillType="stunt";
+--------------------+---------------+-----------+
| Title              | Person_Name   | skillType |
+--------------------+---------------+-----------+
| Cars               | John Lasseter | stunt     |
| Cars 2             | John Lasseter | stunt     |
| Monster University | Dan Scanlon   | stunt     |
| Up                 | Pete Doctor   | stunt     |
+--------------------+---------------+-----------+


mysql> SELECT Title,Person_Name,skillType
    -> FROM movie_table
    -> INNER JOIN movie_skill
    -> ON  movie_table.id=movie_skill.id
    -> INNER JOIN  skill
    -> ON movie_skill.IDNO=skill.id_no
    -> WHERE skillType="Singing" OR "Dance";
+----------------------+-------------+-----------+
| Title                | Person_Name | skillType |
+----------------------+-------------+-----------+
| Toy 2                | Lee Unkrich | Singing   |
| Monster University 2 | Dan Scanlon | Singing   |
+----------------------+-------------+-----------+

----------------------------------------------------------------------------
------ Movies can have multiple reviews and Review can belongs to a user----
-----------------------------------------------------------------------------
create table Review(
    -> rID INT PRIMARY KEY,
    -> Rating FLOAT,
    -> Review FLOAT
    -> user_name varchar(255));

mysql> INSERT INTO Review(rID,Rating,Review,user_name) VALUES
    -> (1,9.3,4.8,'user1'),
    -> (2,8.1,4,'user2'),
    -> (3,8,3.2,'user3'),
    -> (4,7.9,4.7,'user4'),
    -> (5,9.5,3.8,'user5');
    
mysql> select *  from review;
+-----+--------+--------+-----------+
| rID | Rating | Review | user_name |
+-----+--------+--------+-----------+
|   1 |    9.3 |    4.8 | user1     |
|   2 |    8.1 |      4 | user2     |
|   3 |      8 |    3.2 | user3     |
|   4 |    7.9 |    4.7 | user4     |
|   5 |    9.5 |    3.8 | user5     |
+-----+--------+--------+-----------+


mysql> CREATE TABLE movie_review(
    -> id int,
    -> IDNO INT,
    -> PRIMARY KEY (id,IDNO),
    -> FOREIGN KEY(id) REFERENCES movie_table(id),
    -> FOREIGN KEY(IDNO) REFERENCES review(rID) );

mysql> INSERT INTO movie_review(id,IDNO) VALUES
    -> (1,2),(1,3),(1,1),
    -> (2,3),(2,5),(2,1),
    -> (3,1),
    -> (4,2),(4,5),
    -> (5,3),
    -> (6,3),(6,2),
    -> (7,1),(7,2),(7,3),
    -> (8,4),(10,4),(10,2);

mysql> SELECT * FROM movie_review;
+----+------+
| id | IDNO |
+----+------+
|  1 |    1 |
|  2 |    1 |
|  3 |    1 |
|  7 |    1 |
|  1 |    2 |
|  4 |    2 |
|  6 |    2 |
|  7 |    2 |
| 10 |    2 |
|  1 |    3 |
|  2 |    3 |
|  5 |    3 |
|  6 |    3 |
|  7 |    3 |
|  8 |    4 |
| 10 |    4 |
|  2 |    5 |
|  4 |    5 |
+----+------+

mysql> SELECT Title,Person_Name,Rating,Review,user_name
    -> FROM movie_table
    -> INNER JOIN movie_review
    -> ON movie_table.id=movie_review.id
    -> INNER JOIN review ON movie_review.IDNO=review.rID;
+----------------------+----------------+--------+--------+-----------+
| Title                | Person_Name    | Rating | Review | user_name |
+----------------------+----------------+--------+--------+-----------+
| Ratatouille          | John Lasseter  |    9.3 |    4.8 | user1     |
| Cars                 | John Lasseter  |    9.3 |    4.8 | user1     |
| Cars 2               | John Lasseter  |    9.3 |    4.8 | user1     |
| Monster University   | Dan Scanlon    |    9.3 |    4.8 | user1     |
| Ratatouille          | John Lasseter  |    8.1 |      4 | user2     |
| Toy                  | Lee Unkrich    |    8.1 |      4 | user2     |
| Brave                | Brenda Chapman |    8.1 |      4 | user2     |
| Monster University   | Dan Scanlon    |    8.1 |      4 | user2     |
| Monster University 2 | Dan Scanlon    |    8.1 |      4 | user2     |
| Ratatouille          | John Lasseter  |      8 |    3.2 | user3     |
| Cars                 | John Lasseter  |      8 |    3.2 | user3     |
| Toy 2                | Lee Unkrich    |      8 |    3.2 | user3     |
| Brave                | Brenda Chapman |      8 |    3.2 | user3     |
| Monster University   | Dan Scanlon    |      8 |    3.2 | user3     |
| Brave 2              | Brenda Chapman |    7.9 |    4.7 | user4     |
| Monster University 2 | Dan Scanlon    |    7.9 |    4.7 | user4     |
| Cars                 | John Lasseter  |    9.5 |    3.8 | user5     |
| Toy                  | Lee Unkrich    |    9.5 |    3.8 | user5     |
+----------------------+----------------+--------+--------+-----------+

mysql> SELECT Title,Person_Name,Rating,Review,user_name
    -> FROM movie_table
    -> INNER JOIN movie_review
    -> ON movie_table.id=movie_review.id
    -> INNER JOIN review ON movie_review.IDNO=review.rID
    -> WHERE Title="Ratatouille";

+-------------+---------------+--------+--------+-----------+
| Title       | Person_Name   | Rating | Review | user_name |
+-------------+---------------+--------+--------+-----------+
| Ratatouille | John Lasseter |    9.3 |    4.8 | user1     |
| Ratatouille | John Lasseter |    8.1 |      4 | user2     |
| Ratatouille | John Lasseter |      8 |    3.2 | user3     |
+-------------+---------------+--------+--------+-----------+


mysql> SELECT AVG(Rating)
    -> FROM movie_table
    -> INNER JOIN movie_review
    -> ON movie_table.id=movie_review.id
    -> INNER JOIN review ON movie_review.IDNO=review.rID
    -> WHERE Title="Ratatouille";
+------------------+
| AVG(Rating)      |
+------------------+
| 8.46666685740153 |
+------------------+


mysql> SELECT SUM(Rating)
    -> FROM movie_table
    -> INNER JOIN movie_review
    -> ON movie_table.id=movie_review.id
    -> INNER JOIN review ON movie_review.IDNO=review.rID
    -> WHERE Title="Ratatouille";
+-------------------+
| SUM(Rating)       |
+-------------------+
| 25.40000057220459 |
+-------------------+


mysql> SELECT COUNT(Rating)
    -> FROM movie_table
    -> INNER JOIN movie_review
    -> ON movie_table.id=movie_review.id
    -> INNER JOIN review ON movie_review.IDNO=review.rID
    -> WHERE Title="Ratatouille";
+---------------+
| COUNT(Rating) |
+---------------+
|             3 |
+---------------+

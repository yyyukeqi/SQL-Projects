-- APAN 5310: SQL & RELATIONAL DATABASES

   -------------------------------------------------------------------------
   --                                                                     --
   --                            HONOR CODE                               --
   --                                                                     --
   --  I affirm that I will not plagiarize, use unauthorized materials,   --
   --  or give or receive illegitimate help on assignments, papers, or    --
   --  examinations. I will also uphold equity and honesty in the         --
   --  evaluation of my work and the work of others. I do so to sustain   --
   --  a community built around this Code of Honor.                       --
   --                                                                     --
   -------------------------------------------------------------------------

/*
 *    You are responsible for submitting your own, original work. We are
 *    obligated to report incidents of academic dishonesty as per the
 *    Student Conduct and Community Standards.
 */


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-- HOMEWORK ASSIGNMENT-2 

/*
 *  NOTES:
 *
 *    - Type your SQL statements between the START and END tags for each
 *      question, as shown in the example. Do not alter this template .sql file
 *      in any other way other than adding your answers. Do not delete the
 *      START/END tags. The .sql file you submit will be validated before
 *      grading and will not be graded if it fails validation due to any
 *      alteration of the commented sections.
 *
 *    - Our course is using PostgreSQL. We grade your assignments in PostgreSQL. You risk losing points
 *      if you prepare your SQL queries for a different database system
 *      (MySQL, MS SQL Server, Oracle, etc).
 *
 *    - It is highly recommended that you insert additional, appropriate data
 *      to test the results of your queries. You do not need to include your
 *      sample data in your answers.
 *
 *    - Make sure you test each one of your answers. If a query returns an
 *      error it will earn no points.
 *
 */


/*
 * EXAMPLE
 * -------
 *
 * Provide the SQL statement that returns all attributes and tuples from
 * a relation named "table1".
 *
 */

-- START EXAMPLE --

SELECT * FROM table1;

-- END EXAMPLE --

-------------------------------------------------------------------------------

/*
 * QUESTION 1 (1 point)
 * --------------------
 *
 * Provide the SQL statement that creates a table named "films" with the
 * following attributes:
 *
 *   - "film_id" : variable length character string of length 10
 *   - "title" : variable length character string of length 250
 *   - "release_year" : integer
 *   - "rental_rate" : fixed point number with 4 digits, 2 decimals
 *   - "length" : integer small
 *   - "replacement_cost" : fixed point number with 5 digits, 2 decimal
 *   - "last_updated" : timestamp without time zone
 *
 * Do not implement integrity constraints.
 *
 */

-- START ANSWER 1 --

CREATE TABLE films (
	film_id  		 varchar(10),
	title            varchar(250),
	release_year     integer,
	rental_rate      numeric(4, 2),
	length           smallint,
	replacement_cost numeric(5, 2),
	last_updated 	 timestamp without time zone
);

SELECT * FROM films

-- END ANSWER 1 --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (1 point)
 * --------------------
 *
 * Provide SQL statements that populates the "films" table with values as
 * shown in the following table. 
 *
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * | film id   | title                                   | release year              | rental rate | length                                  | replacement cost | last update         |
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * |           |                                         |                           |             | 195                                     | 14.90            | 2020-01-12 15:23:00 |
 * |           |                                         |                           |             |                                         |                  |                     | 
 * | A12345678 | Back to the Future                      | 1984                      | 9.99        |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * |           |                                         |                           |             | 207                                     | 5.75             | 2004-12-01 07:34:50 |
 * |           |                                         |                           |             |                                         |                  |                     | 
 * | B32165415 | The Fire Breathing Dragon               | 1999                      | 4.99        |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+---+
 * | C75215645 | Melanie and the Home Recipes            | 2010                      | 3.99        |  36                                     | 2.22             | 2021-04-15 15:05:23 |
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 *
 */

-- START ANSWER 2 --

INSERT INTO films 
VALUES ('A12345678', 'Back to the Future', 1984, 9.99, 195, 14.90, '2020-01-12 15:23:00');
INSERT INTO films 	
VALUES ('B32165415', 'The Fire Breathing Dragon', 1999, 4.99, 207, 5.75, '2004-12-01 07:34:50');
INSERT INTO films 
VALUES ('C75215645', 'Melanie and the Home Recipes', 2010, 3.99, 36, 2.22, '2021-04-15 15:05:23');


-- END ANSWER 2 --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns all columns and rows from table `films`.
 *
 */

-- START ANSWER 3 --

SELECT * FROM films;


-- END ANSWER 3 --

-------------------------------------------------------------------------------

/*
 * QUESTION 4 (1 point)
 * --------------------
 *
 * Assume that the `length` attribute in the `films` table is the duration of a film in minutes. Provide the
 * SQL statement that returns the `film_id`, `title` and `release_year` columns as well as the
 * `length` in integer hours. Rename the length in hours column to `len_hr`.
 *
 */

-- START ANSWER 4 --

SELECT film_id, title, release_year, length/60 AS len_hr
FROM films;


-- END ANSWER 4 --

-------------------------------------------------------------------------------

/*
 * QUESTION 5 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the title of movies with a rental rate of 9.99 and duration less than
 * 208 minutes (table `films` as defined in Question 1).
 *
 */

-- START ANSWER 5 --

SELECT title
FROM films
WHERE rental_rate = 9.99 AND length < 208;


-- END ANSWER 5 --

-------------------------------------------------------------------------------

/*
 * QUESTION 6 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the title and length of movies whose name starts with ‘The’ (table
 * `films` as defined in Question 1).

 *
 */

-- START ANSWER 6 --

SELECT title, length
FROM films
WHERE title LIKE 'The%';

-- END ANSWER 6 --

-------------------------------------------------------------------------------

/*
 * QUESTION 7 (1 point)
 * --------------------
 *
 * Provide the SQL statement that creates a table named `category` with columns `category_id`
 * (integer), `name` (variable length character string of length 25), and `last_updated` (timestamp). Do not
 * implement primary key and foreign key integrity constraints.
 *
 */

-- START ANSWER 7 --

CREATE TABLE category (
	category_id  integer,
	name   		 varchar(25),
	last_updated timestamp
);


-- END ANSWER 7 --

-------------------------------------------------------------------------------

/*
 * QUESTION 8 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the maximum replacement cost of movie items with rental rate of
 * 3.99 (table `film` as defined in Question 1).
 *
 */

-- START ANSWER 8 --

SELECT max(replacement_cost)
FROM films
WHERE rental_rate = 3.99;

-- END ANSWER 8 --

-------------------------------------------------------------------------------

/*
 * QUESTION 9 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the total number of movies for each rental rate (table `films` as
 * defined in Question 1, hint: use GROUP BY).
 *
 *
 */

-- START ANSWER 9 --

SELECT COUNT(*) AS number_of_movies
FROM films
GROUP BY rental_rate
 
-- END ANSWER 9 --

-------------------------------------------------------------------------------

/*
 * QUESTION 10 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that alters table `films` and adds an attribute called `category_name`
 * (variable length character string of length 25) (table `films` as defined in Question 1).
 *
 */

-- START ANSWER 10 --

ALTER TABLE films
	add category_name varchar(25);

SELECT * FROM films;

-- END ANSWER 10 --

-------------------------------------------------------------------------------

/*
 * QUESTION 11 (6 point)
 * ---------------------
 *
 * Provide the SQL statements to 
 * 1) Insert three records into category table with different values.
 * 2) Update three records in the films table with the category name values for three differernt films.
 * 3) Return the film titles, release years, category name and category IDs. 
 * (Hint: we are not implementing joins yet, link in the WHERE clause).
 *
 */

-- START ANSWER 11 --

INSERT INTO category (category_id, name, last_updated) 
VALUES ('100', 'Sci-fi', '2020-01-12 15:23:00');
INSERT INTO category (category_id, name, last_updated) 	
VALUES ('101', 'Action', '2004-12-01 07:34:50');
INSERT INTO category (category_id, name, last_updated) 
VALUES ('102', 'Cooking', '2021-04-15 15:05:23');

SELECT * FROM category;

UPDATE films
SET category_name = (SELECT name
					 FROM category
					 WHERE last_updated = films.last_updated);

SELECT * FROM films;
SELECT * FROM category;

SELECT f.title, f.release_year, f.category_name, c.category_id
FROM films f, category c
WHERE f.category_name = c.name;


-- END ANSWER 11 --

-------------------------------------------------------------------------------

/*
 * QUESTION 12 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that returns the film titles, release years, rental rates and length. Order the
 * results by descending release year and ascending rental rate.
 *
 */

-- START ANSWER 12 --

SELECT title, release_year, rental_rate, length
FROM films
ORDER BY release_year DESC, rental_rate

-- END ANSWER 12 --

-------------------------------------------------------------------------------

/*
 * QUESTION 13 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that deletes all entries from the `films` table where the replacement cost is
 * larger than $4.99.

 *
 */


-- START ANSWER 13 --

DELETE FROM films
WHERE replacement_cost > 4.99;

SELECT * FROM films;

-- END ANSWER 13 --

-------------------------------------------------------------------------------

/*
 * QUESTION 14 (1 point)
 * ---------------------
 *
 * Provide the SQL statements that deletes all rows (tuples) from both the tables that you created.
 *
 */

-- START ANSWER 14 --

SELECT * FROM films;
SELECT * FROM category;

DELETE FROM films;
DELETE FROM category;

-- END ANSWER 14 --

-------------------------------------------------------------------------------

/*
 * QUESTION 15 (1 point)
 * ---------------------
 *
 * Provide the SQL statements that removes both the tables that you created from the database
 *
 */

-- START ANSWER 15 --

DROP TABLE films;
DROP TABLE category;

-- END ANSWER 15 --

-------------------------------------------------------------------------------
-- APAN 5310: SQL & RELATIONAL DATABASES

   -------------------------------------------------------------------------
   --                                                                     --
   --                            HONOR CODE                               --
   --                                                                     --
   --  I affirm that I will not plagiarize, use unauthorized materials,   --
   --  or give or receive illegitimate help on assignments, papers, or    --
   --  examinations. I will also uphold equity and honesty in the         --
   --  evaluation of my work and the work of others. I do so to sustain   --
   --  a community built around this Code of Honor.                       --
   --                                                                     --
   -------------------------------------------------------------------------

/*
 *    You are responsible for submitting your own, original work. We are
 *    obligated to report incidents of academic dishonesty as per the
 *    Student Conduct and Community Standards.
 */


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-- HOMEWORK ASSIGNMENT-2 

/*
 *  NOTES:
 *
 *    - Type your SQL statements between the START and END tags for each
 *      question, as shown in the example. Do not alter this template .sql file
 *      in any other way other than adding your answers. Do not delete the
 *      START/END tags. The .sql file you submit will be validated before
 *      grading and will not be graded if it fails validation due to any
 *      alteration of the commented sections.
 *
 *    - Our course is using PostgreSQL. We grade your assignments in PostgreSQL. You risk losing points
 *      if you prepare your SQL queries for a different database system
 *      (MySQL, MS SQL Server, Oracle, etc).
 *
 *    - It is highly recommended that you insert additional, appropriate data
 *      to test the results of your queries. You do not need to include your
 *      sample data in your answers.
 *
 *    - Make sure you test each one of your answers. If a query returns an
 *      error it will earn no points.
 *
 */


/*
 * EXAMPLE
 * -------
 *
 * Provide the SQL statement that returns all attributes and tuples from
 * a relation named "table1".
 *
 */

-- START EXAMPLE --

SELECT * FROM table1;

-- END EXAMPLE --

-------------------------------------------------------------------------------

/*
 * QUESTION 1 (1 point)
 * --------------------
 *
 * Provide the SQL statement that creates a table named "films" with the
 * following attributes:
 *
 *   - "film_id" : variable length character string of length 10
 *   - "title" : variable length character string of length 250
 *   - "release_year" : integer
 *   - "rental_rate" : fixed point number with 4 digits, 2 decimals
 *   - "length" : integer small
 *   - "replacement_cost" : fixed point number with 5 digits, 2 decimal
 *   - "last_updated" : timestamp without time zone
 *
 * Do not implement integrity constraints.
 *
 */

-- START ANSWER 1 --

CREATE TABLE films (
	film_id  		 varchar(10),
	title            varchar(250),
	release_year     integer,
	rental_rate      numeric(4, 2),
	length           smallint,
	replacement_cost numeric(5, 2),
	last_updated 	 timestamp without time zone
);

SELECT * FROM films

-- END ANSWER 1 --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (1 point)
 * --------------------
 *
 * Provide SQL statements that populates the "films" table with values as
 * shown in the following table. 
 *
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * | film id   | title                                   | release year              | rental rate | length                                  | replacement cost | last update         |
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * |           |                                         |                           |             | 195                                     | 14.90            | 2020-01-12 15:23:00 |
 * |           |                                         |                           |             |                                         |                  |                     | 
 * | A12345678 | Back to the Future                      | 1984                      | 9.99        |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 * |           |                                         |                           |             | 207                                     | 5.75             | 2004-12-01 07:34:50 |
 * |           |                                         |                           |             |                                         |                  |                     | 
 * | B32165415 | The Fire Breathing Dragon               | 1999                      | 4.99        |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * |           |                                         |                           |             |                                         |                  |                     | 
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+---+
 * | C75215645 | Melanie and the Home Recipes            | 2010                      | 3.99        |  36                                     | 2.22             | 2021-04-15 15:05:23 |
 * +-----------+-----------------------------------------+---------------------------+-------+-----------------------------------------------+-------------+---------------------+----+
 *
 */

-- START ANSWER 2 --

INSERT INTO films 
VALUES ('A12345678', 'Back to the Future', 1984, 9.99, 195, 14.90, '2020-01-12 15:23:00');
INSERT INTO films 	
VALUES ('B32165415', 'The Fire Breathing Dragon', 1999, 4.99, 207, 5.75, '2004-12-01 07:34:50');
INSERT INTO films 
VALUES ('C75215645', 'Melanie and the Home Recipes', 2010, 3.99, 36, 2.22, '2021-04-15 15:05:23');


-- END ANSWER 2 --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns all columns and rows from table `films`.
 *
 */

-- START ANSWER 3 --

SELECT * FROM films;


-- END ANSWER 3 --

-------------------------------------------------------------------------------

/*
 * QUESTION 4 (1 point)
 * --------------------
 *
 * Assume that the `length` attribute in the `films` table is the duration of a film in minutes. Provide the
 * SQL statement that returns the `film_id`, `title` and `release_year` columns as well as the
 * `length` in integer hours. Rename the length in hours column to `len_hr`.
 *
 */

-- START ANSWER 4 --

SELECT film_id, title, release_year, length/60 AS len_hr
FROM films;


-- END ANSWER 4 --

-------------------------------------------------------------------------------

/*
 * QUESTION 5 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the title of movies with a rental rate of 9.99 and duration less than
 * 208 minutes (table `films` as defined in Question 1).
 *
 */

-- START ANSWER 5 --

SELECT title
FROM films
WHERE rental_rate = 9.99 AND length < 208;


-- END ANSWER 5 --

-------------------------------------------------------------------------------

/*
 * QUESTION 6 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the title and length of movies whose name starts with ‘The’ (table
 * `films` as defined in Question 1).

 *
 */

-- START ANSWER 6 --

SELECT title, length
FROM films
WHERE title LIKE 'The%';

-- END ANSWER 6 --

-------------------------------------------------------------------------------

/*
 * QUESTION 7 (1 point)
 * --------------------
 *
 * Provide the SQL statement that creates a table named `category` with columns `category_id`
 * (integer), `name` (variable length character string of length 25), and `last_updated` (timestamp). Do not
 * implement primary key and foreign key integrity constraints.
 *
 */

-- START ANSWER 7 --

CREATE TABLE category (
	category_id  integer,
	name   		 varchar(25),
	last_updated timestamp
);


-- END ANSWER 7 --

-------------------------------------------------------------------------------

/*
 * QUESTION 8 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the maximum replacement cost of movie items with rental rate of
 * 3.99 (table `film` as defined in Question 1).
 *
 */

-- START ANSWER 8 --

SELECT max(replacement_cost)
FROM films
WHERE rental_rate = 3.99;

-- END ANSWER 8 --

-------------------------------------------------------------------------------

/*
 * QUESTION 9 (1 point)
 * --------------------
 *
 * Provide the SQL statement that returns the total number of movies for each rental rate (table `films` as
 * defined in Question 1, hint: use GROUP BY).
 *
 *
 */

-- START ANSWER 9 --

SELECT COUNT(*) AS number_of_movies
FROM films
GROUP BY rental_rate
 
-- END ANSWER 9 --

-------------------------------------------------------------------------------

/*
 * QUESTION 10 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that alters table `films` and adds an attribute called `category_name`
 * (variable length character string of length 25) (table `films` as defined in Question 1).
 *
 */

-- START ANSWER 10 --

ALTER TABLE films
	add category_name varchar(25);

SELECT * FROM films;

-- END ANSWER 10 --

-------------------------------------------------------------------------------

/*
 * QUESTION 11 (6 point)
 * ---------------------
 *
 * Provide the SQL statements to 
 * 1) Insert three records into category table with different values.
 * 2) Update three records in the films table with the category name values for three differernt films.
 * 3) Return the film titles, release years, category name and category IDs. 
 * (Hint: we are not implementing joins yet, link in the WHERE clause).
 *
 */

-- START ANSWER 11 --

INSERT INTO category (category_id, name, last_updated) 
VALUES ('100', 'Sci-fi', '2020-01-12 15:23:00');
INSERT INTO category (category_id, name, last_updated) 	
VALUES ('101', 'Action', '2004-12-01 07:34:50');
INSERT INTO category (category_id, name, last_updated) 
VALUES ('102', 'Cooking', '2021-04-15 15:05:23');

SELECT * FROM category;

UPDATE films
SET category_name = (SELECT name
					 FROM category
					 WHERE last_updated = films.last_updated);

SELECT * FROM films;
SELECT * FROM category;

SELECT f.title, f.release_year, f.category_name, c.category_id
FROM films f, category c
WHERE f.category_name = c.name;


-- END ANSWER 11 --

-------------------------------------------------------------------------------

/*
 * QUESTION 12 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that returns the film titles, release years, rental rates and length. Order the
 * results by descending release year and ascending rental rate.
 *
 */

-- START ANSWER 12 --

SELECT title, release_year, rental_rate, length
FROM films
ORDER BY release_year DESC, rental_rate

-- END ANSWER 12 --

-------------------------------------------------------------------------------

/*
 * QUESTION 13 (1 point)
 * ---------------------
 *
 * Provide the SQL statement that deletes all entries from the `films` table where the replacement cost is
 * larger than $4.99.

 *
 */


-- START ANSWER 13 --

DELETE FROM films
WHERE replacement_cost > 4.99;

SELECT * FROM films;

-- END ANSWER 13 --

-------------------------------------------------------------------------------

/*
 * QUESTION 14 (1 point)
 * ---------------------
 *
 * Provide the SQL statements that deletes all rows (tuples) from both the tables that you created.
 *
 */

-- START ANSWER 14 --

SELECT * FROM films;
SELECT * FROM category;

DELETE FROM films;
DELETE FROM category;

-- END ANSWER 14 --

-------------------------------------------------------------------------------

/*
 * QUESTION 15 (1 point)
 * ---------------------
 *
 * Provide the SQL statements that removes both the tables that you created from the database
 *
 */

-- START ANSWER 15 --

DROP TABLE films;
DROP TABLE category;

-- END ANSWER 15 --

-------------------------------------------------------------------------------

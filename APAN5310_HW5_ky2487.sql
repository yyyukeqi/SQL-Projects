
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


-- HOMEWORK ASSIGNMENT 5 

/*
 *  NOTES:
 *
 *    - Type your SQL statements between the START and END tags for each
 *      question. Do not alter this template .sql file in any way other than
 *      adding your answers. Do not delete the START/END tags. The .sql file
 *      you submit will be validated before grading and will not be graded if
 *      it fails validation due to any alteration of the commented sections.
 *
 *    - Our course is using PostgreSQL which has been preinstalled for you in
 *      Codio. We grade your assignments in Codio and PostgreSQL. You risk
 *      losing points if you prepare your SQL queries for a different database
 *      system (MySQL, MS SQL Server, Oracle, etc).
 *
 *    - It is highly recommended that you insert additional, appropriate data
 *      to test the results of your queries. You do not need to include your
 *      sample data in your answers.
 *
 *    - Make sure you test each one of your answers in pgAdmin. If a query
 *      returns an error it will earn no points.
 *
 *    - In your CREATE TABLE statements you must provide data types AND
 *      primary/foreign keys (if applicable).
 *
 *    - You may expand your answers in as many lines as you find appropriate
 *      between the START/END tags.
 *
 */


-------------------------------------------------------------------------------


/*
*
* NOTE: For Questions 1 through 4, you have to use the following relation:
*
*      materials(zone,merchandise,date,beginning,peak,bottom,final,capacity)
*
*      The original data has been modified for this assignment, the original came from the following       *      source: 
*      Dow Jones Index Data Set
*      Dr. Michael Brown, michael.brown@umuc.edu, 
*          University of Maryland University College
*      http://archive.ics.uci.edu/ml/datasets/Dow+Jones+Index
*     
*      The CREATE TABLE and INSERT INTO statements for this schema are
*      provided as a separate file in the same announcement.
*
*/
/*
*
* QUESTION 1 (3 points)
* ---------------------
* Provide the SQL statement that returns the merchandise, date, capacity
* and rank of capacity. Display the results in proper rank order.
* The highest capacity across all merchandises should be ranked first and the * lowest should be last. * Apply normal ranking (not dense).
*
* Hint:
* Ranking can be done using the RANK function.
* Example: “Find the rank of students in the school.”
* 
* SELECT ID, Student_Name,
*     RANK() OVER (ORDER BY GPA DESC) AS total_rank
* FROM student_grades
* ORDER BY GPA DESC;
* 
*/

-- START ANSWER 1 --

SELECT merchandise, exchange_date, capacity, 
	RANK() OVER (ORDER BY capacity DESC) AS rank_of_capacity
FROM materials
ORDER BY rank_of_capacity DESC

-- END ANSWER 1 --

-------------------------------------------------------------------------------

/*
* QUESTION 2 (3 points)
* ---------------------
* Provide the SQL statement that returns the merchandise, date, capacity
* and dense rank of capacity for each merchandise. Display the results in
* proper rank order. The highest capacity for each merchandise be ranked     * first and the lowest last. Sort by merchandise and rank.
* 
* 
* Hint:
* Ranking can be done within partition of the data.
* Example: “Find the rank of students within each department.”
* 
* SELECT ID, dept_name,
*     RANK() OVER (PARTITION BY dept_name ORDER BY GPA DESC) AS dept_rank
* FROM dept_grades
* ORDER BY dept_name, dept_rank;
* 
*
*/

-- START ANSWER 2 --

SELECT merchandise, exchange_date, capacity, 
	DENSE_RANK() OVER (PARTITION BY merchandise ORDER BY capacity DESC) AS rank_of_capacity
FROM materials
ORDER BY merchandise, rank_of_capacity DESC;

-- END ANSWER 2 --

-------------------------------------------------------------------------------

/*
* QUESTION 3 (3 points)
* ---------------------
* Provide the SQL statement that returns the merchandise, date, and moving
* average of final price on a 5 day window. Calculation must be per
* merchandise.
*
* Hint:
* Moving average can be done using PostgreSQL Windows function. 
* Check the following link for example: 
*     https://www.compose.com/articles/metrics-maven-calculating-a-moving-average-in-postgresql/
* 
*   SELECT ad.date,  
*       AVG(ad.downloads)
*           OVER(ORDER BY ad.date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS avg_downloads
*   FROM app_downloads_by_date ad  
* 
*/

-- START ANSWER 3 --

SELECT merchandise, exchange_date, 
	AVG(final) OVER 
	(PARTITION BY merchandise ORDER BY exchange_date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS avg_finalprice
FROM materials;  

-- END ANSWER 3 --

-------------------------------------------------------------------------------

/*
* QUESTION 4 (2 point)
* --------------------
* Provide the SQL statement that returns the merchandise, zone and
* zone average capacity per merchandise. Order results by merchandise and zone.
*
*/

-- START ANSWER 4 --

SELECT merchandise, zone, 
	AVG(capacity) OVER 
	(PARTITION BY zone, merchandise) AS avg_capacity
FROM materials
ORDER BY merchandise, zone;

SELECT merchandise, zone, AVG(capacity) AS zone_avg_capacity
FROM materials
GROUP BY merchandise, zone
ORDER BY merchandise, zone;

-- END ANSWER 4 --

-------------------------------------------------------------------------------

/*
* QUESTION 5 (4 points)
* ---------------------
* 
* Sassy’s Gym provides sports activities during the day to kids ages 8-12 in the summer. 
* They offer activities (soccer, softball, baseball) in different days of 
* week (Mon, Tue, etc). Children register in an activity for a given day of the week. 
* Each child can only register one day for a given activity. But each child 
* can register in multiple activities. 
* 
* Sassy’s Gym currently tracks all the information regarding activity and child’s
* registration on a spreadsheet but they would like to move the data into a 
* relational database. The spreadsheet looks like this:

===========================================================================================================
Activity Number  |Activity Name    |Activity Date |Child Number |Child Name |Guardian Number |Guardian Name
-----------------------------------------------------------------------------------------------------------
1            		Soccer          Mon          1            Sam          1           Bob
                             		 Wed          2            Lexie        2           Alaina
-----------------------------------------------------------------------------------------------------
2            		Softball        Mon          3            Bart         1           Bob
                             		 Tue          1            Sam          1           Bob
-----------------------------------------------------------------------------------------------------
3            		Baseball        Thu          2            Lexie        2           Alaina
-----------------------------------------------------------------------------------------------------
1            		Soccer          Wed          4            Piper        3           Meagan
-----------------------------------------------------------------------------------------------------

* Please use normalization process to make the spreadsheet into 1NF, 2NF, and 3NF compliant 
* relations step by step. For each NF, write down the resulting tables' structure and data 
* based on the data above. For example, if you create a table called Parent, you should have
* such a table in your answer for 3NF:

==============================
Guardian Number |Guardian Name
------------------------------
1              	 	Bob
2               	Alaina
3               	Meagan
------------------------------

*
*/

-- START ANSWER 5 --

/*
1NF:
===========================================================================================================
Activity Number  |Activity Name    |Activity Date |Child Number |Child Name |Guardian Number |Guardian Name
-----------------------------------------------------------------------------------------------------------
1            		Soccer          Mon          1            Sam          1           Bob
-----------------------------------------------------------------------------------------------------
1            		Soccer          Wed          2            Lexie        2           Alaina
-----------------------------------------------------------------------------------------------------
1            		Soccer          Wed          4            Piper        3           Meagan
-----------------------------------------------------------------------------------------------------
2            		Softball        Mon          3            Bart         1           Bob
------------------------------------------------------------------------------------------------------
2            		Softball		 Tue          1            Sam          1           Bob
-----------------------------------------------------------------------------------------------------
3            		Baseball        Thu          2            Lexie        2           Alaina
-----------------------------------------------------------------------------------------------------

2NF

'Activity'
==================================
Activity Number  |Activity Name   
-----------------------------------
1            		Soccer                                     		
2            		Softball                                   		
3            		Baseball       
------------------------------------



'ActivityDate-Child'
==============================================
Activity Number |Activity Date |Child Number
----------------------------------------------
1            		Mon            1
1            		Wed            2
1            		Wed            4
2            		Mon            3
2            		Tue            1
3            		Thu            2
----------------------------------------------


'Child-Guardian'
=======================================================
Child Number |Child Name |Guardian Number |Guardian Name
--------------------------------------------------------
1            Sam               1              	Bob
2            Lexie             2               	Alaina
3            Bart              1              	Bob
4            Piper             3               	Meaga
--------------------------------------------------------

3NF

'Activity'
==================================
Activity Number  |Activity Name   
-----------------------------------
1            		Soccer                                     		
2            		Softball                                   		
3            		Baseball       
------------------------------------

'Child'
=========================
Child Number |Child Name 
-------------------------
1                Sam     
2                Lexie    
3                Bart        
4                Piper     
-------------------------

'Guardian'
==============================
Guardian Number |Guardian Name
------------------------------
1              	 	Bob
2               	Alaina
3               	Meagan
------------------------------

'Child-Guardian'
=============================
Child Number |Guardian Number
-----------------------------
1                 1
2                 2
3                 1
4                 3
------------------------------


'Activity Date'
=============================================
Activity Number |Activity Date |Child Number 
---------------------------------------------
1            	      Mon            1       
1               	  Wed            2       
1            		  Wed            4       
2            		  Mon            3       
2                     Tue            1       
3            		  Thu            2       
---------------------------------------------
*/
-- END ANSWER 5 --


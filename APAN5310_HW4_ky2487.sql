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


-- HOMEWORK ASSIGNMENT 4

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
 *      Codio. We grade your assignments in PostgreSQL. You risk losing points
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
 *    - In your CREATE TABLE statements you must provide data types,
 *      primary/foreign keys and integrity constraints (if applicable).
 *
 *    - You may expand your answers in as many lines as you need between the
 *      START/END tags.
 *
 */



-------------------------------------------------------------------------------



/*
 * QUESTION 1 (7 points)
 * ----------------------------------------------------------------------------
 *
 * Assume a schema for a company that matches employees with skills with projects.
 * Provide the SQL statements that create the five (5) tables with data types
 * of your design. Implement integrity constraints (primary/foreign keys,
 * NOT NULL, UNIQUE, etc.). 

 You are to create a database diagram showing the tables and relationships between employees, skills and projects. 
 The following information needs to be maintained:

Employee -  employee full name,  date of birth, social security number,  full address, job title. 

Projects - project name,  description

Skills -  skill name, description

The following is known:

1) Employees can work on many projects and projects can have many employees
2) Employees can work on more than one project at a time
3) Employees may be pulled off projects and then put back on at a later date (hint: composite key in bridge table needs a date to be unique)
4) Employees can have many skills and skills can have many employees associated with it


Please submit a PDF document with picture of your completed diagram.

 *
 *
 * Type the CREATE TABLE statements in the order they have to be executed so
 * that there is no error in PostgreSQL. Keep in mind that integrity
 * constraints can be executed after the CREATE TABLE statements using the
 * ALTER statement. Expand the space between the START/END tags to fit all of
 * your CREATE TABLE statements.
 */
 
-- START ANSWER 1 --

CREATE database test;

CREATE TABLE employee (
	id 			varchar(5),
	full_name   varchar(20) NOT NULL,
	dob         date,
	ssn         varchar(12),
	address     varchar(20),
	job_title   varchar(20),
	PRIMARY KEY (id)
);


CREATE TABLE projects (
	id 				varchar(5),
	project_name    varchar(20) NOT NULL,
	description     varchar(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE skills (
	id 				varchar(5),
	skill_name      varchar(20) NOT NULL,
	description     varchar(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE emp_project (
	e_id 			     varchar(5),
	p_id 			     varchar(5),
	project_startdate    date,
	project_enddate      date,
	PRIMARY KEY (e_id, p_id, project_startdate),
	UNIQUE(project_enddate),
	FOREIGN KEY (e_id) REFERENCES employee(id),
	FOREIGN KEY (p_id) REFERENCES projects(id)
);

CREATE TABLE emp_skill (
	e_id varchar(5),
	s_id varchar(5),
	PRIMARY KEY (e_id, s_id),
	FOREIGN KEY (e_id) REFERENCES employee(id),
	FOREIGN KEY (s_id) REFERENCES skills(id)
);


-- END ANSWER 1 --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (3 points)
 * ---------------------
 *
 * Provide brief reasoning on your selection of each one of the data types
 * above as well as your implementation of integrity constraints. Include any
 * additional assumptions you made beyond the provided schema description. Type
 * your answers (plain text) within the START/END tags. Expand your answers in
 * as many lines as you need.
 *
 */

-- START ANSWER 2 --
/*
 * - Id's variables could conceivably be varchar or integer 
 * - NOT NULL constraints may vary according to your assumptions but you must 
 *   have included them in your design 
 * - Any numeric value (i.e. phone, social security) should be char or varchar because
 *   the rule is that if it can't be used in calculations it needs to be text.
 *   Rows from parent tables cannot be deleted unless the child rows are deleted first
 *   Date of Birth from employee table should be date format.
 *   For every table, I assign id's variables to be primary key, since they uniquely 
 *   identify rows in tables.
 *   Also, for the table emp_project and emp_skill, e_id, p_id, and s_id are foreign keys from
 *   table employee, projects, and skills.
 *   Then, for table emp_project, project_startdate is primary key as well and project_enddate is unique 
 *   since composite key in bridge table needs a date to be unique.
 *   
 */
-- END ANSWER 2 --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (2 points)
 * ---------------------
 *
 * Draw the ER diagram for the schema detailed in Question 1 using Engineering
 * notation. Pay close attention to properly defining relationship and
 * cardinalities. You may draw the ER diagram in any software you prefer,
 * Lucidchart is recommended. Hand drawn diagrams will not be accepted. Upload
 * the ER diagram as a separate file.
 *
 */

 -- No START/END tags here. Your answer is a separate PDF submitted along with
 -- this SQL file and the PDF file for the diagram in Question 3.

-------------------------------------------------------------------------------

/*
 * QUESTION 4 (2 points)
 * ---------------------
 *
 * Provide the SQL statement that returns the projectid, projectname, employeename 
 * and effective and term dates of employees on the project named "HIPPA Update"  
 *
 *
 * IMPORTANT NOTE: This question must be answered with a single SQL query. If
 *                 your answer involves more that one query, it will be marked
 *                 incorrect even if the output is correct.
 *
 */

-- START ANSWER 4 --

SELECT p.id, p.project_name, e.full_name, emp_project.project_startdate, emp_project.project_enddate
FROM projects p
JOIN emp_project ON p.id = emp_project.p_id
JOIN employee e ON e.id = emp_project.e_id
WHERE p.project_name = 'HIPPA Update' ;


-- END ANSWER 4 --

-------------------------------------------------------------------------------

/*
 * QUESTION 5 (2 points)
 * ---------------------
 *
 * Provide the SQL statement that creates a view called v_NY_Employees. This
 * view, when called, must return the EmployeeID, Title, any projects assigned
 * to that employee and effective and term dates for employees located in new york. 
 *
 * Demonstrate how the view may be used to further limit results to projects
 * employees are currently working on  (hint: term date will be null)
 *
 * IMPORTANT NOTE: There are two parts to this question. First, you must write
 *                 the query that creates the view and then you must write the
 *                 query that uses this view to limit results to projects 
 *                 currently being worked on.
 *
 */

-- START ANSWER 5 --

CREATE VIEW v_NY_Employees AS
	SELECT e.id, e.job_title, e.address, p.project_name, emp_project.project_startdate, emp_project.project_enddate
	FROM projects p
	JOIN emp_project ON p.id = emp_project.p_id
    JOIN employee e ON e.id = emp_project.e_id
    WHERE e.address = 'New York';


SELECT ID, job_title, address, project_name, project_startdate, project_enddate
FROM v_NY_Employees
WHERE project_enddate IS NULL;
	

-- END ANSWER 5 --

-------------------------------------------------------------------------------

/*
 * QUESTION 6 (2 points)
 * ---------------------
 *
 * Provide the SQL statement that returns the empolyee title that has the 
 * most employees with that title. (Hint: Order descending limt rows to 1)
 *
 * IMPORTANT NOTE: This question must be answered with a single SQL query. If
 *                 your answer involves more that one query, it will be marked
 *                 incorrect even if the output is correct.
 *
 */

-- START ANSWER 6 --

SELECT job_title, COUNT(*) AS number
FROM employee
GROUP BY job_title
ORDER BY number DESC
LIMIT 1;

-- END ANSWER 6 --

-------------------------------------------------------------------------------

/*
 * QUESTION 7 (3 points)
 * ---------------------
 *
 * Provide the SQL statement that returns the names and number of projects of all employee(s) with 
 * the most number of projects
 *
 * IMPORTANT NOTE: This question must be answered with a single SQL query. If
 *                 your answer involves more that one query, it will be marked
 *                 incorrect even if the output is correct.
 */

-- START ANSWER 7 --

SELECT e.full_name, count(DISTINCT emp_project.p_id) AS number
FROM employee e
LEFT OUTER JOIN emp_project ON e.id = emp_project.e_id
GROUP BY e.full_name
ORDER BY number DESC
LIMIT 1;



-- END ANSWER 7 --

-------------------------------------------------------------------------------

/*
 * QUESTION 8 (2 points)
 * ---------------------
 *
 * Provide the SQL statement that returns names, title and skills of all employees who are
 * experienced in skills named "R" or "Python" (You may use the "IN" Operator) and 
 * are not on any projects (You may use the "NOT IN" Operator). 
 *
 * IMPORTANT NOTE: This question must be answered with a single SQL query. If
 *                 your answer involves more that one query, it will be marked
 *                 incorrect even if the output is correct.
 *
 */

-- START ANSWER 8 --

SELECT e.full_name, e.job_title, s.skill_name
FROM skills s
JOIN emp_skill ON s.id = emp_skill.s_id
JOIN employee e ON e.id = emp_skill.e_id
WHERE skill_name = 'R' OR skill_name = 'Python'
AND e.id NOT IN (SELECT e_id FROM emp_project WHERE project_enddate IS NULL);

-- END ANSWER 8 --

-------------------------------------------------------------------------------

/*
 * QUESTION 9 (3 points)
 * ---------------------
 *
 * Provide the SQL statement that lists employees, their age, and their skill that are not on any projects 
 * (HINT: NOT IN OPERATOR)
 * 
 * IMPORTANT NOTE: This question must be answered with a single SQL query. If
 *                 your answer involves more that one query, it will be marked
 *                 incorrect even if the output is correct.
 *
 */

-- START ANSWER 9 --

SELECT e.full_name,
	   2022 - EXTRACT(YEAR FROM e.dob) AS age,
	   s.skill_name
FROM employee e
JOIN emp_skill ON e.id = emp_skill.e_id
JOIN skills s ON s.id = emp_skill.s_id
WHERE e.id NOT IN (SELECT e_id FROM emp_project WHERE project_enddate IS NULL);



-- END ANSWER 9 --

-------------------------------------------------------------------------------

/*
 * QUESTION 10 (4 points)
 * ----------------------
 *
 * Write a table function named 'skills_needed_for' that returns all skills associated
 * with employees for the given project name. The function should not return a table with employees, just 
 * the project name and skills.
 *
 *
 */

-- START ANSWER 10 --

CREATE OR REPLACE FUNCTION skills_needed_for (project varchar(20))
	RETURNS TABLE (
		project_name varchar(20),
		skill_name varchar(20)) AS
	$$
		BEGIN
			RETURN QUERY
			SELECT p.project_name, s.skill_name
			FROM projects p
			JOIN emp_project ON p.id = emp_project.p_id
			JOIN emp_skill ON emp_project.e_id = emp_skill.e_id
			JOIN skills s ON emp_skill.s_id = s.id
			WHERE p.project_name = skills_needed_for.project;
		END
	$$
LANGUAGE plpgsql;


-- END ANSWER 10 --

-------------------------------------------------------------------------------



/*
 * QUESTION 11 (1 points)
 * ----------------------
 *
 * Write a query that uses the table function created above in the question-10. 
 *
 *
 */

-- START ANSWER 11 --

SELECT skills_needed_for('abc');

-- END ANSWER 11 --


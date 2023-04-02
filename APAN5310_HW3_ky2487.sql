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


-- HOMEWORK ASSIGNMENT 3 SOLUTIONS

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
 * QUESTION 1 (7 points: 1 point for each table plus 1 point for correct order
 *             of execution)
 * ----------------------------------------------------------------------------
 *
 * You are tasked to create a simplified database of a an office supply store database. 
 * Provide the SQL statements that create the six tables with data types of your design.
 * Implement integrity constraints (primary/foreign keys, NOT NULL) as needed.
 * Note: since underlining is not supported in this file format, primary keys
 * for each relation below are shown within '*'.
 *
 *   customer (*customer_id*, first_name, last_name, email, phone)
 *   customer_address(*address_id*, customer_id, address_type, street, city, state, zip)
 *   invoice(*invoice_num*, customer_id, date, billed_to, shipped
 *   vendor(*vendor_id*, v_name, email)
 *   invoice_line (*invoice_num*, *product_id*, quantity)
 *   product(*product_id*, vendor_id, name, description, price)
 *
 *
 * Type the CREATE TABLE statements in the order they have to be executed so
 * that there is no error in PostgreSQL. Expand the space between the START/END
 * tags to fit all of your CREATE TABLE statements.
 *
 * IMPORTANT: Make sure to implement the schema with exactly the provided
 *            relation and attribute names. Do not rename relations or
 *            attributes, either by accident (typos) or on purpose.
 *
 */
 
-- START ANSWER 1 --

CREATE TABLE customer (
	customer_id    varchar(10),
	first_name     varchar(20) NOT NULL,
	last_name      varchar(20) NOT NULL,
	email          varchar(250),
	phone          varchar(20),
	PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
	address_id     varchar(10),
	customer_id    varchar(10),
	address_type   varchar(10),
	street         varchar(20),
	city           varchar(10),
	state          varchar(10),
	zip            varchar(10),
	PRIMARY KEY (address_id),
	FOREIGN KEY (customer_id) REFERENCES customer
);

CREATE TABLE invoice (
	invoice_num    integer,
	customer_id    varchar(10),
	date           date,
	billed_to      varchar(20),
	shipped        varchar(20),
	PRIMARY KEY (invoice_num),
	FOREIGN KEY (customer_id) REFERENCES customer
);
	 
CREATE TABLE vendor (
	vendor_id    varchar(10),
	v_name       varchar(20) NOT NULL,
	email        varchar(250),
	PRIMARY KEY (vendor_id)
);

CREATE TABLE invoice_line (
	invoice_num    integer,
	product_id     varchar(10),
	quantity       integer,
	PRIMARY KEY (invoice_num, product_id),
	FOREIGN KEY (invoice_num) REFERENCES invoice
);
			 
CREATE TABLE product (
	product_id      varchar(10),
	vendor_id       varchar(10),
	name            varchar(20) NOT NULL,
	description     varchar(250),
	price           numeric(5, 2),
	PRIMARY KEY (product_id),
	FOREIGN KEY (vendor_id) REFERENCES vendor
);

-- END ANSWER 1 --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (4 points)
 * ---------------------
 *
 * Provide detailed reasoning on your selection of each one of the data types
 * above as well as your implementation of any/all integrity constraints. Include
 * any additional assumptions you made beyond the provided schema description.
 * Explain relationships and cardinalities. Type your answers as plain text
 * within the START/END tags. Expand your answer in as many lines as you need.
 *
 */

-- START ANSWER 2 --

/*
For table customer, 
I choose the data type of customer_id as varchar(10), since I think it should be 
variable length character strings with maximum length 10 because we don't know whether
all the customers have the same length of customer_id or not. Also, we select customer_id 
as our primary key by provided descriptions.
Then, I choose both first_name and last_name as varchar(20), because I think it should be 
variable length character strings with maximum length 20 because the names usually have 
different length. I also declare first_name and last_name to be NOT NULL.
Moreover, for the variable email, I choose varchar(250) since we have no control about the length
of email address, so I set maximum length 250. It should be enough for email address.
For the attribute phone, I choose integer since the phone number are all numbers.


For table customer_address,
I choose the data type of address_id as varchar(10), since I think it should be 
variable length character strings with maximum length 10 because we don't know whether
all the address_ids have the same length or not. Also, we select address_id as our primary 
key by provided descriptions.
Then, for customer_id, we consider it as foreign key because it references the primary key
attribute from customer table.
For street, we set the data types as variable length character strings with maximum length 20, 
because some street names may be longer than 10, but mostly less than 20.
For the rest attributes address_type, city, state and zip, we set the data types as variable length
character strings with maximum length 10, since the lengths of these attributes are mostly within 10.


For table invoice, 
I choose the data type of invoice_num as integer, because it is a number. Also, we select 
invoice_num as our primary key by provided descriptions.
Then, for customer_id, we consider it as foreign key because it references the primary key
attribute from customer table.
Moreover, date is belong to the date type date.
For the attributes billed_to and shipped, we set the data types as variable length
character strings with maximum length 20, which I believe it is long enough to include the value.

	 
For table vendor, 
I choose the data type of vendor_id as varchar(10), since I think it should be 
variable length character strings with maximum length 10 because we don't know whether
all the vendors have the same length of vendor_id or not. Also, we select vendor_id as our 
primary key by provided descriptions.
Then, I choose v_name as varchar(20), because I think it should be variable length character 
strings with maximum length 20 because the names usually have different length. 
I also declare v_name to be NOT NULL.
Moreover, for the variable email, I choose varchar(250) since we have no control about the length
of email address, so I set maximum length 250. It should be enough for email address. I didn't 
link email with table customer, because this email is from vendor, different with the customer.

For table invoice_line, 
I choose the data type of invoice_num as integer, because it is a number. Also, we select 
invoice_num as our primary key by provided descriptions. And, we consider it as foreign key 
because it references the primary key attribute from invoice table.
Then, I select the data type of product_id as varchar(10), I think it should be 
variable length character strings with maximum length 10 because we don't know whether
all the products have the same length of product_id or not. Also, we select product_id as 
our primary key by provided descriptions.
Moreover, for the attribute quantity, it should be a integer.
		 
For table product,
I select the data type of product_id as varchar(10), the same as table invoice_line. Also, 
we select product_id as our primary key by provided descriptions.
Then, for vendor_id, we consider it as foreign key because it references the primary key
attribute from vendor table.
Moreover, I choose name as varchar(20), because I think it should be variable length character 
strings with maximum length 20 because the names usually have different length. 
I also declare v_name to be NOT NULL.
For the variable description, I choose varchar(250) since we have no control about the length
of description, so I set maximum length 250. It should be enough for description.
Last but not least, I select price as numeric(5, 2). I also declare price to be NOT NULL.
*/

-- END ANSWER 2 --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (6 points)
 * ----------------------
 *
 * Draw the ER diagram for the schema detailed in Question 1 using any
 * notation as in your textbook / what we presented in the slides and 
 * lecture for this module. Pay close attention in properly
 * defining relationships and cardinalities. Points may be deducted for
 * incorrect relationship and/or incorrect cardinalities.
 * You may draw the ER diagram in any software you prefer. 
 * Hand drawn diagrams will not be accepted. 
 * Upload the ER diagram as a separate file.
 *
 */

-- No START/END tags here. Your answer is a separate PDF submitted along with
-- this SQL file.


-------------------------------------------------------------------------------

/* * QUESTION 4 (3 point) 
* -------------------- * 
* Provide the SQL statement that returns the vendor id, name, email and price  
* of the lowest priced item for each vendor. (hint: use GROUP BY)

* */-- START ANSWER 4 --

SELECT vendor.vendor_id, 
	   product.name,
	   vendor.email,
	   min(product.price) as lowest_price
FROM vendor
JOIN product ON product.vendor_id = vendor.vendor_id
GROUP BY vendor.vendor_id, product.name


-- END ANSWER 4 --
-------------------------------------------------------------------------------------------------


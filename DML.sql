/**
	Insert - add a row to the database. If you don't specify a column, it gets valued to NULL.
	INSERT INTO awards VALUES (7, 'Laziest Person');  Insert a value to the same column its position refers to. Not clear.
	INSERT INTO awards(award_desc, award_id) VALUES ('Laziest Person', 7); --Positional notation - specify the columns. Provides clarity.
	Bulk insert. Have to have the same named columns.
	INSERT INTO emails_copy SELECT * FROM emails;

	Update - changing the data that's already in the table. Should always have a limiting condition, if not then all of the columns gets updated.
	UPDATE addresses SET street_address = '123 Town Road' WHERE employee_id = 10;
	UPDATE addresses SET street_adress = '123 Blabla Bla', city = 'McBlablastein' WHERE employee_id = 10;
	
	Delete - remove a row from the table. Should have a limiting condition, otherwise deletes everything.
	DELETE FROM employees WHERE employee_id = 5;

	Truncate - deletes all of the data in one swoop. Delete removes one row at a time. Use it to delete every row in a table.
	TRUNCATE TABLE emails_copy;

	COMMIT command commits a data transaction. Makes the change of data real and visible to other users.
	ROLLBACK rolls back the entire transaction. DML(insert, update, delete) statements can be rolled back, but DDL(create table, drop table etc.) cannot be rolled back.
	SAVEPOINT gives a place to roll back to. ROLLBACK TO savepoint_name - to roll back to a save point.

	SQL can be divided into parts:
		DML	data manipulation language 		- insert, update, delete
		DDL data definition language 		- creation of database objects
		TCL transaction control language 	- commit, rollback
		DCL	data control language 			- security, permissions

	Database objects - persistently stored in database.
		Table - basic unit of storage. Data physically stored in segment, presented in a table.
		Index - structure used to speed queries. Puts key values and row location into tree structure.
		Sequence - generates values for a primary key. Generate sequential numbers.
		Views - encapsulates a query as an object. Reduces complexity. Data hiding.
		Snyonyms - provides alternative naming for objects. linkedup.employees becomes employees.
	
	CHAR(5) data type takes up the room you specify and adds place holders to the empty places.
	VARCHAR2(5) takes up only the length of your input, does not specify placeholders.
	NUMBER(p, s) - p is precision, how many digits can be in it. s is scale or how many digits can be to the right of the decimal point. NUMBER(5, 2) would be _ _ _._ _
	DATE - 7 bytes of data that store the time since "Epoch". Epoch is time passed since Jan 1, 4712 BC.

	Create table - used to create a new table to contain data.
	CREATE TABLE blogs_copy (
		blog_id NUMBER(10, 0), --column_name data_type
		blog_url VARCHAR2(250)
	);
	Create table as a copy lets us create a new table as a copy of another table. Inherits its structure.
	CREATE TABLE blogs_copy AS SELECT * from blogs;

	Alter table - change the table structure.
	ALTER TABLE blogs_copy ADD (blog_favourites VARCHAR2(200)); --Add new column to the table.
	ALTER TABLE blogs_copy ADD (blog_number NUMBER(5) DEFAULT 1); --Add a default value with the new column.
	ALTER TABLE blogs_copy MODIFY (blog_favourites VARCHAR2(400)); --Modify the size of the column.
	ALTER TABLE blogs_copy DROP COLUMN blog_number; --Removes the specified column.
	ALTER TABLE blogs_copy SET UNUSED (blog_favourites); --Makes the column invisible to queries. Idea is to specify it unused during the day and then drop it during the night when people wouldn't be affected.

	Not null - constraint to prevent the creation of NULLs.
	CREATE TABLE test_table (
		column_one VARCHAR2(5) NOT NULL
	);

	Primary key - doesn't allow null, no duplicates allowed, optionally paired with a foreign key.
	CREATE TABLE test_primary_key (
		column_one NUMBER(5) PRIMARY KEY,
		column_two VARCHAR2(10)
	);
	CREATE TABLE test_primary_key ( --Create a pair for primary key.
		column_one NUMBER(5),
		column_two VARCHAR2(10),
		CONSTRAINT pair_key PRIMARY KEY (column_one, column_two)
	);
	
	Foreign key - must be paired with a primary key.
	CREATE TABLE test_foreign_key (
		column_one NUMBER(5) PRIMARY KEY,
		column_two VARCHAR2(10),
		column_three NUMBER(5),
		CONSTRAINT foreign_key FOREIGN KEY (column_three) REFERENCE test_primary_key (column_one)
	);
	INSERT INTO test_foreign_key VALUES (100, 'Hello', 14); --Parent key has to exist when inserting a foreign key.
	
	Unique constraint - like primary keys, except allows null values.
	...
		UNIQUE (column_name)
	...

	Check constraint - validate data. Add check on column and on insertion it will be validated against the check. For example with gender.
	... --Create table etc
		column_one NUMBER(5) CHECK (column_one > 0),
		column_two VARCHAR(5) CHECK (column_two IN('one', 'two', 'three'))
	... --End table create
**/
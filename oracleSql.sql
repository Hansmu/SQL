/**
Schema stores files from the same category.
Database has one or more schemas. A schema has one more tables.

Table is unique by name and schema.
Column characteristics: 
	type of data, 
	title of data, 
	relationships with other data.
Schema is a collection of database objects.

Basic data types: 
	character, 
	date, 
	number

NULL means no value at all. Not empty string, not zero.
Primary key - uniquely identify each row in the table. Unique, not null.
Foreign key - refers to primary key from another table. Not unique, can be null.

Single line comment is --
Multi line comment is /***/
/**
SQL is not case-sensitive. Ignores whitespaces.

SELECT - retrieve data from DB. Use * to select all. SELECT * FROM employees.
FROM - table you're selecting from
	SELECT first_name, last_name FROM employees;

DESCRIBE - Get all the details of the structure of the table.
	DESCRIBE employee;

DISTINCT - eliminates duplicate results. Checks all the specified columns. Eg. first_name, last_name
	SELECT DISTINCT first_name, last_name FROM employees;

ORDER BY - sorting data. Can be used for character, number and date. Direction: ASC - ascending, DESC - descending
	SELECT first_name, last_name FROM employees ORDER BY first_name, last_name ASC; First uses the first parameter to sort, then second.

WHERE - used for filtering data. Extracts subset.
	SELECT first_name, last_name FROM employees WHERE salary = 2200;

=	Equal
<>	Not equal
!=	Not equal
<	Less than
<=	Less than or equal
>	Greater than
>=	Greater than or equal
	SELECT first_name FROM employees WHERE whire_date < '17/JAN/2003';
 
.. BETWEEN .. AND ..	Between two values
.. IS NULL 				Check if is null
NOT 					Negation
	SELECT first_name FROM employees WHERE salary NOT BETWEEN 2000 AND 3000;
	SELECT * FROM employees WHERE manager_id IS NOT NULL;

SQL has an internal converter that turns the value into the correct data type, so 2000 and '2000' are the same for a number column.

AND - when both conditions are met. 
OR - when at least one of the conditions are met. Use parenthesis to override natural order of comparison.
	SELECT * FROM employees WHERE (salary > 7000 OR first_name = 'Bob') AND last_name = 'Smith';

IN - specify multiple equality conditions in the same clause. Executes quicker than OR clause. NOT IN returns values other than listed.
	SELECT * FROM employees WHERE first_name IN('Bob', 'John');

LIKE - works only with text values. Operators: % - replace 1 or more characters or no characters at all, _ - replace only 1 character
	SELECT * FROM countries WHERE country_name LIKE '%land%'; Returns all the countries that has land in it.
	SELECT * FROM countries WHERE country_name LIKE 'S%'; Returns all countries that start with a capital S.
	SELECT * FROM countries WHERE country_name LIKE '_____' Returns all the countries that have 5 letters.
	SELECT * from countries WHERE country_name LIKE '_an%'; Returns countries that has a letter before an. Ex. Canada.

LIKE takes longer querying for results. Don't use it if you have other options.

|| - operator is used to concatenate strings. Same as CONCAT(). Preferred to use ||.
	SELECT employee_id, first_name || ' ' || last_name FROM employees;
	SELECT employee_id, CONCAT(first_name, ' ', last_name) FROM emploees;

Mathematical operators: +, -, *, /
	SELECT employee_id, salary / 30 FROM employees WHERE salary * 12 > 25000;

Aliases can be used to rename tables when you use several tables. Use "" to use the table name in the exact form you want so instead of TABLE_NAME, can use "Table name"
	SELECT emp.id id, ct.name FROM employees emp, countries ct; Cannot use aliases in the WHERE clause for the SELECT values.

DUAL - dummy tables used for testing purposes has 1 row, 1 column, used to check a calculation value.
SYSDATE - current date
SYSTIMESTAMP - current date with fractions of seconds. Unique value.
	SELECT 4 + 5 * 10 FROM DUAL;

Functions can be used in SELECT and WHERE. SQL have built in functions. Can nest functions.
	Text manipulation:
	TO_NUMBER() - Convert text to number
	TRIM()   - removes spaces before and after text
	RTRIM()  - Remove spaces after text.
	LTRIM()  - remove spaces before text.
	UPPER()  - all to uppercase.
	LOWER()  - all to lowercase.
	LENGTH() - number of chars in text.
		SELECT * FROM countries WHERE LENGTH(country_name) = 5;

	Date manipulation (Takes in format and value):
	TO_DATE() - converts text to date.
	TO_CHAR() - date or number value to text.
		SELECT TO_CHAR(hire_date, 'DD-MM-YYYY');
		SELECT TO_CHAR(SYSDATE, 'DAY');
		SELECT TO_DATE(hire_date) FROM employees;

	Numeric manipulation:
	ABS() - absolute value
	SIN(), COS(), TAN() - Trigonometric values
	SQRT() - square root
	POWER() - X to the power of Y
	EXP() - exponential value
	ROUND() - rounds up a value
		SELECT SIN(30) FROM DUAL;
		SELECT POWER(3, 2) FROM DUAL; Value is 9
		SELECT ROUND(19.612) FROM DUAL; Value is 20.
		SELECT ROUND(19.612, 2) FROM DUAL: Value is 19.61

	Aggregate functions are to summarize data without returning all records. Good for reporting and subqueries.
	AVG() - average value
	COUNT() - rows in column
	MAX() - highest value in column. With text returns last value.
	MIN() - lowest value in column. With text returns first entered value.
	SUM() - sum of values in a column
		SELECT AVG(salary) FROM employees WHERE manager_id = 100;
**/
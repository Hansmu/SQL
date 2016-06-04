/**
	Subqueries
	SELECT first_name, last_name FROM employees WHERE login_count > 
		(SELECT avg(login_count) FROM employees);
	Scalar subquery is a query which has to return a single value. Same as above.
	SELECT project_id, avg(login_count) FROM employees GROUP BY project_id HAVING avg(login_count) >
		(SELECT avg(login_count) FROM employees WHERE gender = 'M');


	Do operations between select statements. Use SET operators.
	Multiple SQL statements can be combined together. They are costly. Have to have the same amount of columns.

	UNION - combine the results of two queries. Does not accept duplicates. Does not return twice the same value.
	UNION ALL - same but accept duplicates.
	INTERSECT - get records shown in both queries.
	MINUS - operator subtracts records in second query from record of first query.

	UNION:

	INTERSECT: Returns all of the common values
	SELECT branch_id FROM branches INTERSECT
	SELECT branch_id FROM employees;

	MINUS: Takes all of the data from one set and subtracts it from the other set.
	SELECT branch_id FROM branches INTERSECT
	SELECT branch_id FROM employees;

**/
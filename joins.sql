/** Tables are joined using foreign and primary keys. Both tables have the same column ex employee_id and join on it. 
	There are two ways to write joins:
	1) Implicit: Uses WHERE clause - WHERE employees.project_id = projects.project_id
	2) Explicit: Uses "natural language". Frees up use of the WHERE clause - JOIN USING (project_id)
	
	Cartesian join(cross join, cross product, cartesian product): Every row from one table is joined to every row in the other table. Rather useless join.
	Row amount is a * b, where a is the amount of rows in the first table and b in the second table.
	Implicit: SELECT project_name, award_desc FROM projects, awards;
	Explicit: SELECT branch_name, blog_url FROM branches CROSS JOIN blogs;

	Equijoin: Foundation of the relational database. Two DBs can be linked together based on a common column. Any query that uses = is an equijoin.
	Implicit: SELECT first_name, last_name, street_address FROM employees emp, addresses ad WHERE emp.employee_id = ad.employee_id;
	Explicit: SELECT first_name, last_name, message_text FROM employees JOIN messages USING (employee_id);

	Outer join: NULL values can cause us to lose data. Equijoin could cause us to lose data because the NULL values fall out.
	The example is a LEFT OUTER JOIN because the null values are on the left side, if you put the plus on the right, then that means to include the NULLs on the left.
	Place the sign on the opposite side to where the NULLs are.
	Implicit: SELECT first_name, last_name, project_name FROM employees e, projects p WHERE e.project_id = p.project_id(+);
	LEFT OUTR JOIN looks at the table list so the FROM clause
	Explicit: SELECT first_name, last_name, project_name FROM employees e LEFT OUTER JOIN projects p ON (p.project_id = e.project_id);
	
	Ambigious join(natural join): Join without specifying which table is the owner of the joining column.
	Implicit: SELECT first_name, last_name, start_date, email_address FROM employees, emails WHERE employee_id = employee_id; --Doesn't work because it doesn't know which employee_id is which.
	Explicit: SELECT first_name, last_name, start_date, email_address FROM employees NATURAL JOIN emails;

	Fully specified join: 
	Implicit: SELECT first_name, last_name, branch_name FROM employees, branches WHERE employees.branch_id = branches.branch_id;
	Explicit: SELECT first_name, last_name, branch_name FROM employees e JOIN branches b ON(e.branch_id = b.branch_id);

	Self-joins: Joining back to itself
	Implicit: e2.first_name, e2.last_name, e2.project_id FROM employees e1, employees e2 WHERE e1.project_id = e2.project_id;

	Non-equijoins: Not using = operator.
	Implicit: SELECT employee_id, first_name, last_name, project_name FROM employees e, projects p WHERE e.project_id <> p.project_id;

	Multi table joins: N - 1 join conditions
	Implicit: SELECT first_name, award_desc FROM employees, employee_awards, awards WHERE employees.employee_id = employee_awards.employee_id AND employee_awards.award_id = awards.award_id;
	Implicit: SELECT first_name, award_desc FROM employees NATURAL JOIN employee_awards NATURAL JOIN awards;

**/
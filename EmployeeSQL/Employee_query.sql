-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
CREATE TABLE question1 AS

SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no;

SELECT * FROM question1;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE TABLE question2 AS

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date >= '01/01/1986' AND employees.hire_date <= '12/31/1986';

SELECT * FROM question2;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE TABLE question3 AS

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

SELECT * FROM question3;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE TABLE question4 AS 

SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no;

SELECT * FROM question4;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE TABLE question5 AS

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

SELECT * FROM question5;

-- List each employee in the Sales department, including their employee number, last name, and first name.
CREATE TABLE question6 AS

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees, departments
WHERE departments.dept_name = 'Sales';

SELECT * FROM question6;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE TABLE question7 AS

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, departments
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

SELECT * FROM question7;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE TABLE question8 AS
SELECT employees.last_name, COUNT(*) AS frequency
FROM employees
GROUP BY employees.last_name
Order BY frequency DESC;

SELECT * FROM question8;
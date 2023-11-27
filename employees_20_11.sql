use employees;

SELECT emp.emp_no, emp.first_name, emp.last_name, sal.salary
FROM employees emp
inner join salaries sal on emp.emp_no = sal.emp_no
where to_date = '9999-01-01'
order by first_name, last_name



use employees;

SELECT emp.emp_no, emp.first_name, emp.last_name, max(sal.salary)
FROM employees emp
inner join salaries sal on emp.emp_no = sal.emp_no
where emp.emp_no < 10005
group by emp_no, first_name, last_name
order by first_name, last_name
limit 50;

use employees;

select emp.emp_no, emp.first_name, emp.last_name, 
		dep.dept_no, dep.dept_name
from employees emp
inner join dept_emp de on emp.emp_no = de.emp_no
inner join departments dep on dep.dept_no = de.dept_no
order by dep.dept_no
/* Zoek van welk geslacht er meer dan 150.000 medewerkers zijn, 
we willen slechts 1 lijn als resultaat zien */

SELECT count(*) as total, gender
FROM employees.employees
group by gender
having total > 150000;

/*
Toon mij welke departementen meer dan 30000 medewerkers hebben (we houden geen rekening met de 
datum)
*/
select dep.dept_no, dep.dept_name, count(emp.emp_no) as employee_count
from employees emp
inner join dept_emp de on de.emp_no = emp.emp_no
inner join departments dep on dep.dept_no = de.dept_no
group by dep.dept_no
having employee_count > 30000
order by employee_count desc;

/* Doe hetzelfde maar hou nu rekening met de datum */
select dep.dept_no, dep.dept_name, count(emp.emp_no) as employee_count
from employees emp
inner join dept_emp de on de.emp_no = emp.emp_no
inner join departments dep on dep.dept_no = de.dept_no
where de.to_date = '9999-01-01'
group by dep.dept_no
having employee_count > 30000
order by employee_count desc;


																		
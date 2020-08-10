-- 1. List the following details of each employee:
--    employee number, last name, first name, sex, and salary.
select id, l_name, f_name, gender, salary from employee
join salary on employee.id = salary.emp_id;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select f_name, l_name, hire_date from employee
where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department with the following information:
--    department number, department name, the manager's employee number, last name, first name.
select d.dept_id, d.dept_name, dm.emp_id, l_name, f_name from dept_manager as dm
join employee on dm.emp_id = employee.id
join dept as d on dm.dept_id = d.dept_id;

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.
select id, l_name, f_name, d.dept_name from dept_employee as de
join dept as d on de.dept_id  = d.dept_id
join employee as e on de.emp_id = e.id;

-- 5. List first name, last name, and sex for employees whose first name is
--    "Hercules" and last names begin with "B."
select f_name, l_name, gender from employee
where f_name = 'Hercules'
and l_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number,
--    last name, first name, and department name.
select id, l_name, f_name, d.dept_name from employee as e
join dept_employee as de on e.id = emp_id
join dept as d on d.dept_id = de.dept_id
where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their
--    employee number, last name, first name, and department name.
select id, l_name, f_name, d.dept_name from employee as e
join dept_employee as de on e.id = emp_id
join dept as d on d.dept_id = de.dept_id
where d.dept_name in ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.
select l_name, count(l_name) from employee
group by l_name
order by count(l_name) desc;

-- Find out which name I am (just curious - not part of assignment)
select * from employee
where id = 499942;
create view emp as 
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees as e
FULL OUTER JOIN salaries as s 
ON (e.emp_no=s.emp_no);
select count(*) from employees -- To check for the no. of employees in the employee table
select count(*) from emp   -- To check for the no. of employees after JOIN,to verify tables are correctly joined

--------------------------------------------------------------------
select * from employees
select first_name,last_name,hire_date from employees
where EXTRACT(YEAR from hire_date) = 1986; --https://www.postgresqltutorial.com/postgresql-extract/

---------------------------------------------------------------------
select m.dept_no,m.emp_no,d.dept_name,e.last_name,e.first_name from
(dep_manager as m JOIN departments as d
ON (m.dept_no = d.dept_no))
JOIN 
employees as e ON 
(e.emp_no = m.emp_no);
------------------------------------------------------------------
create view Emp_Dep_view AS
select e.emp_no,e.last_name,e.first_name,d.dept_name from
 	(employees as e JOIN employee_dep as ed 
 		ON 
 			e.emp_no = ed.emp_no ) JOIN departments as d
 			ON 
 				ed.dept_no = d.dept_no;
select * from Emp_Dep_view
 ----------------------------------------------------------------
 select first_name,last_name,sex from employees 
 WHERE
 (first_name = 'Hercules' and last_name LIKE 'B%');
 ------------------------------------------------------------------
 --- Employee details of sales department--------
 select  emp_no, last_name,first_name,dept_name from Emp_Dep_View  -----Used above created view Emp_Dep_View----
 WHERE dept_name = 'Sales' ;
 
 ------------------------------------------------------------------
  --- Employee details of Sales & Development department--------
 select  emp_no, last_name,first_name,dept_name from Emp_Dep_View  -----Used above created view Emp_Dep_View----
 WHERE dept_name = 'Sales' or dept_name = 'Development' ;
 ------------------------------------------------------------------
 ----List of count of employees who share last name-----
 select last_name,count(last_name) as "Frequency_count" from employees
 Group by last_name
 order by "Frequency_count" desc;

 
 
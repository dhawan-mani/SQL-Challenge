---- Creating Table Schema for each csv file --------
create table departments(
	dept_no varchar,            ---- Defining data types-----
	dept_name varchar
);
select * from departments;
ALTER TABLE departments
    ADD CONSTRAINT students_pk PRIMARY KEY (dept_no);  --Setting the primary key--
--------------------------------------------------------------------
drop table employee_dep;
create table employee_dep(
	emp_no int not null,
	dept_no varchar(4) not null,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),    ---Definiing the primary keys--
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
select * from employee_dep;
--------------------------------------------------------------------
create table dep_manager(
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no)
);

ALTER TABLE dep_manager
ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
select * from dep_manager;
--------------------------------------------------------------------
create table employees(
	emp_no int,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar(1),
	hire_date date,
	PRIMARY KEY (emp_no));
	
ALTER TABLE employees 
	ADD  Foreign key (emp_title_id) REFERENCES titles(title_id);
	
select * from employees;
--------------------------------------------------------------------
drop table salaries;
create table salaries(
	emp_no int not null,
	salary int,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES  employees(emp_no));
select * from salaries;
--------------------------------------------------------------------
create table Titles(
	title_id varchar(5),
	title varchar,
	PRIMARY KEY (title_id)
 );
 select * from Titles;
 
-- Drop table if it already exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

--Create a table for employees
CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

--Create a table for salaries
CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL
);

--Create a table for department manager
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" int NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

--Create table for departments associated with the employees
CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" VARCHAR(20) NOT NULL
);

--Create a table for titles
CREATE TABLE "titles" (
    "title_id" VARCHAR(5) NOT NULL,
    "title" VARCHAR(20) NOT NULL
);

--Create a table for departments
CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR(20) NOT NULL
);

--Alter the table and add contraints for the Primary and Foreign Keys
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM departments;

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM dept_emp;

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM dept_manager;

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM employees;

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM titles;

-- Import data for each csv file
-- View the table and ensure all data is imported correctly
SELECT * FROM salaries;

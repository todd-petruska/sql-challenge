-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

--Create a table for employees
CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR   NOT NULL,
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
    "dept_no" VARCHAR NOT NULL,
    "emp_no" int NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

--Create table for departments associated with the employees
CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" VARCHAR NOT NULL
);

--Create a table for titles
CREATE TABLE "titles" (
    "title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL
);

--Create a table for departments
CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL
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
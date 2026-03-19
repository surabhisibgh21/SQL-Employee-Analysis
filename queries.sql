#Create Database
CREATE DATABASE company_db;

#Use Database
USE company_db;

#Create Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Aman', 'HR', 40000, 25, 'Delhi', '2021-06-15'),
(2, 'Riya', 'IT', 70000, 28, 'Mumbai', '2020-03-10'),
(3, 'Karan', 'Finance', 50000, 30, 'Delhi', '2019-08-20'),
(4, 'Neha', 'IT', 80000, 26, 'Bangalore', '2022-01-12'),
(5, 'Arjun', 'HR', 45000, 27, 'Delhi', '2021-11-05'),
(6, 'Simran', 'Finance', 60000, 29, 'Mumbai', '2020-07-23'),
(7, 'Rohit', 'IT', 75000, 31, 'Delhi', '2018-05-19'),
(8, 'Priya', 'HR', 42000, 24, 'Bangalore', '2022-09-30');


 #QUERIES


#1. View all data
SELECT * FROM employees;

#2. Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

#3. Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

#4. Employee count per city
SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;

#5. Highest salary in each department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

#6. Departments with average salary > 50000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

#7. Top earning department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

#8. Employees earning above department average
SELECT name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

#9. Count employees per department (sorted)
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;

#10. Employees joined after 2020
SELECT *
FROM employees
WHERE joining_date > '2020-01-01';
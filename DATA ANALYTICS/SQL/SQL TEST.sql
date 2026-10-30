USE company_db;
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
first_name  VARCHAR(50),
department  VARCHAR(50),
salary      DECIMAL(10,2)
);

INSERT INTO employee VALUES
(101,' Anil','Sales',55000),
(102,'Divya ', 'Marketing',48000),
(103, 'Rahul', 'Sales',62000),
(104, 'Meera', 'IT', 45000),
(105, 'Priya', 'IT', 47000),
(106,' Anil', 'Sales', 55000),
(107,' ', NULL, NULL),
(108, NULL, 'Marketing', 40000),
(109, 'Kiran', ' ',52000),
(110,'Neha','HR',NULL);

SELECT first_name,department,salary
FROM employee;

#2.Display the details of employees whose salary is greater than ₹50,000.
SELECT first_name,department,salary
FROM employee
WHERE salary>50000;


#3. Display all unique department names, excluding NULL values.
SELECT DISTINCT department 
FROM employee
WHERE department!='NULL';

#4. Display all employees sorted by salary in descending order.
SELECT first_name,salary
FROM employee
ORDER BY salary DESC;

#5. Find the total number of employees in each department. Exclude records where the department is NULL.
SELECT department,
      COUNT(*)AS employee_count
FROM employee
GROUP BY department
HAVING department!='NULL';

#6.Display departments that have more than one employee, excluding NULL departments.
SELECT department,
     COUNT(*)AS total_employee
FROM employee
GROUP BY department
HAVING COUNT(*)>1 AND department!='NULL';

#7.Calculate the average salary of all employees, ignoring NULL salary values.
SELECT salary,
	AVG(salary)AS avg_salary
FROM employee
GROUP BY salary
HAVING salary!='NULL';

#8.Classify employees into salary categories based on the following conditions. Display first_name, salary, and salary_category.
SELECT first_name,salary,
   CASE
       WHEN salary>=60000 THEN 'High'
       WHEN salary>=45000 THEN 'Medium'
       WHEN salary<45000  THEN 'Low'
       ELSE 'Unknown'
	END AS salary_category
FROM employee;    

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
course VARCHAR(50),
city VARCHAR(50),
marks INT);

INSERT INTO students VALUES
(201,'Amina', 'Data Science', 'Malappuram', 85),
(202, 'Rahul', 'Python', 'Calicut', 72),
(203, 'Neha', 'Data Science', 'Kochi',90),
(204,'', 'Python', 'Malappuram', 65),
(205,'Arjun','SQL','Calicut', NULL),
(206, 'Amina', 'Data Science', 'Malappuram', 85),
(207,NULL, 'Python', 'Kochi', 78),
(208,'Sana ', ' ' ,'Calicut', 88),
(209,'Vishnu', NULL,NULL,70),
(210,'','Data Science',' Malappuram',NULL);

#9. Count the number of NULL values in each of the columns student_name, course, city, and marks.
SELECT
   SUM(student_name IS NULL)AS student_name_nulls,
   SUM(course IS NULL)AS course_nulls,
   SUM(city IS NULL)AS city_nulls,
   SUM(marks IS NULL)AS marks_nulls
FROM students;

#10. Identify records where student_name is either an empty string or contains only spaces.
SELECT 
     SUM(student_name='')AS empty_student_name
FROM students;

#11.Identify duplicate records based on the combination of student_name, course, city, and marks.Display each repeated combination and its number of occurrences.
SELECT COUNT(*) AS duplicate_count
FROM( 
	SELECT student_name,course,city,marks
    FROM students
    GROUP BY student_name,course,city,marks
    HAVING COUNT(*)>1
)AS deplicates;

#12. Display each student's original name alongside the cleaned name after removing leading and trailing spaces. Do not modify the original table.
SELECT student_name AS orginal_name,
      TRIM(student_name) AS trim_result
FROM students;

#13. Display student_id, student_name, and marks, replacing NULL marks with 0 in the output without changing the original table.
SELECT student_id,student_name,marks,
   COALESCE (marks,0) AS marks_zero
FROM students;

#14. Write an SQL query to display all student records with student_name and course cleaned using TRIM(). Display the student_id along with the cleaned values without modifying the original table.
SELECT student_id,student_name,course,
        TRIM(student_name)AS trim_student_name,
        TRIM(course)AS trim_course
FROM students;

#15. Write an SQL query to delete records where course is NULL. Before deleting, write a SELECT query to identify the records that will be affected.
SELECT course
FROM students
WHERE course IS NULL ;

SET SQL_safe_updates=0;

DELETE FROM students
WHERE course IS NULL;

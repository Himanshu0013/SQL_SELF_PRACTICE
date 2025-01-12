-- 1) List all students along with their courses.
use self_practice;
SELECT 
    student_name AS name, course
FROM
    students;

-- 2) Retrieve the names of students who live in "Delhi". 

SELECT 
    student_name, city
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
WHERE
    city = 'Delhi';
    
-- 3) Find all students along with their city and department details. 

SELECT 
    student_name, city, department
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id;
    
-- 4) Display the salary details of all employees. 

SELECT 
    student_name AS employee, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id;
    
-- 5) List the cities where students belong to specific departments (e.g., HR or Development). 

SELECT 
    student_name, city, department
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    department = 'HR'
        OR department = 'Development';
	
-- 6. Find the name, city, and salary of students working in the "Software Engineering" department. 

SELECT 
    student_name AS name, city, sellary, Department
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    department = 'software Engineering';

-- 7) Retrieve a list of students whose city names start with the letter "A".

SELECT 
    student_name, city
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
WHERE
    city LIKE 'A%';
    
-- 8) List the students along with their courses, cities, and salaries.

SELECT 
    student_name, course, city, sellary
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id;

-- 9) Find the students who are enrolled in "Btech" and sellary= 130000

SELECT 
    student_name, course, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    course = 'Btech' AND sellary = 130000;
    
-- 10) Retrieve the city name and salary of students who work in the "HR" department. 

SELECT 
    city, sellary
FROM
    city
        LEFT JOIN
    sallary ON city.city_id = sallary.employee_id
WHERE
    department = 'HR';

-- 11) Retrieve all students whose salary is greater than 60,000.

SELECT 
    student_name, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary > 60000;

-- 11) List students whose city is either "Noida" or "Gurgoan".

SELECT 
    student_name, city
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
WHERE
    city = 'Gurgoan' OR city = 'Noida';

-- 13) Find all students enrolled in a course with "Fashion" in its name.

SELECT 
    student_name, course
FROM
    students
WHERE
    course LIKE 'Fashion%';

-- 14) Display students working in "Testing" with salaries less than 50,000.

SELECT 
    student_name, department, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    department = 'Testing'
        AND sellary < 50000;
	
-- 15) Find students whose salary is in the range of 30,000 to 70,000.

SELECT 
    student_name, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary BETWEEN 30000 AND 70000;

-- 16) What is the total salary of all employees? 

SELECT 
    SUM(sellary)
FROM
    sallary;

-- 17.	What is the average salary of employees working in the "Software Engineering" department? 

SELECT 
    AVG(sellary)
FROM
    sallary
WHERE
    department = 'Software Engineering';
    
-- 18) How many students are enrolled in "Bcom"? 

SELECT 
    COUNT(id)
FROM
    students
WHERE
    course = 'Bcom';

-- 19) Find the department with the highest average salary.

SELECT 
    AVG(sellary), department
FROM
    sallary
GROUP BY department
ORDER BY AVG(sellary) DESC
LIMIT 1;

-- 20) Count the number of students living in each city.

SELECT 
    COUNT(city_id)
FROM
    city
GROUP BY city;

-- 21) Group students by course and count how many students are enrolled in each. 

SELECT 
    COUNT(id)
FROM
    students
GROUP BY course;

-- 22) List cities and their respective highest-paid employees. 

select max(sellary)
from students left join city
on students.id=city.city_id
left join sallary on
students.id=sallary.employee_id
group by city
order by max(sellary) desc;

-- 23) Sort students by salary in descending order and display their details. 

SELECT 
    *
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
ORDER BY sellary DESC;

-- 24) Group employees by department and calculate the average salary for each department.

SELECT 
    AVG(sellary), department
FROM
    sallary
GROUP BY department;

-- 25.	List the top 5 highest-paid employees and their details.

SELECT 
    *
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
ORDER BY sellary DESC
LIMIT 5;

-- 26) Find the name of the student who earns the highest salary. 

SELECT 
    student_name, sellary
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
ORDER BY sellary DESC
LIMIT 1;

-- 27) Retrieve all students who earn more than the average salary of the "HR" department.

SELECT 
    student_name, sellary
FROM
    students
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary > (SELECT 
            AVG(sellary)
        FROM
            sallary
        WHERE
            department = 'HR');
            

-- 28) List students whose salary is higher than that of the student living in "Delhi". 

SELECT 
    student_name, sellary, city
FROM
    students
        LEFT JOIN
    city ON students.id = city.city_id
        LEFT JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary > (SELECT 
            sellary
        FROM
            sallary
                LEFT JOIN
            city ON sallary.employee_id = city.city_id
        WHERE
            city = 'Delhi');

-- 30) Retrieve the departments where the minimum salary is greater than 40,000.

SELECT 
    department
FROM
    sallary
GROUP BY department
HAVING MIN(sellary) > 40000;

-- 31) Find students who live in the same city and work in the same department.

SELECT 
    s1.id AS Student1_ID,
    s1.student_name AS Student1_Name,
    s2.id AS Student2_ID,
    s2.student_name AS Student2_Name,
    c1.city AS City,
    sal1.department AS Department
FROM students s1
JOIN city c1 ON s1.id = c1.city_id
JOIN sallary sal1 ON s1.id = sal1.employee_id
JOIN students s2 ON s1.id < s2.id
JOIN city c2 ON s2.id = c2.city_id
JOIN sallary sal2 ON s2.id = sal2.employee_id
WHERE c1.city = c2.city
  AND sal1.department = sal2.department;
  
-- 32) List all departments where at least 3 students are employed.

SELECT 
    department
FROM
    sallary
GROUP BY department
HAVING COUNT(employee_id) >= 3;

-- 33) Retrieve students who have duplicate salaries.

SELECT 
    student_name, employee_id, sellary, department
FROM
    students
        JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary IN (SELECT 
            sellary
        FROM
            sallary
        GROUP BY sellary
        HAVING COUNT(*) > 1);

-- 34) Find employees who live in "Kanpur" and have a salary greater than the average salary of all employees.

SELECT 
    student_name, city, sellary
FROM
    students
        JOIN
    city ON students.id = city.city_id
        JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    city = 'Kanpur'
        AND sellary > (SELECT 
            AVG(sellary)
        FROM
            sallary);

-- 35) Display students whose courses and departments are the same (e.g., "Btech" and "Software Engineering").

SELECT 
    s1.student_name, s1.course, sal1.department
FROM
    students s1
        JOIN
    students s2 ON s1.id = s2.id
        JOIN
    sallary sal1 ON s1.id = sal1.employee_id
        JOIN
    sallary sal2 ON sal1.employee_id = sal2.employee_id
WHERE
    s1.course = s2.course
        OR sal1.department = sal2.department;
        
-- 36) Check if any employee_id in the sallary table does not exist in the students table.

SELECT 
    employee_id
FROM
    sallary
WHERE
    employee_id NOT IN (SELECT 
            id
        FROM
            students);

-- 37) Verify if all cities in the city table have corresponding city_id in the students table.

SELECT 
    city_id
FROM
    city
WHERE
    city_id NOT IN (SELECT 
            id
        FROM
            students);

-- 38) Find students who are referenced in the sallary table but not in the city table. 

SELECT 
    s.id, s.student_name
FROM
    students s
        JOIN
    sallary sa ON s.id = sa.employee_id
        LEFT JOIN
    city c ON s.id = c.city_id
WHERE
    c.city_id IS NULL;

-- 39) Are there any students who do not have a salary assigned in the sallary table? 

SELECT 
    id, student_name
FROM
    students
        JOIN
    sallary ON students.id = sallary.employee_id
WHERE
    sellary IS NULL;

-- 40) List cities where no students are currently employed in any department.

SELECT 
    city
FROM
    city
        JOIN
    sallary ON city.city_id = sallary.employee_id
WHERE
    department IS NULL;

-- 41) Add a new student and assign their city and salary.

insert into students
values
('A22','Kanha','BA');

insert into city
values ('A22','Bajna');

insert into sallary
values('A22','Income Tax',100000);

SELECT 
    *
FROM
    sallary;

-- 42) Update the salary of the student living in "Mathura" by 10%.

UPDATE sallary 
SET 
    sellary = sellary * 1.10
WHERE
    employee_id = (SELECT 
            city_id
        FROM
            city
        WHERE
            city = 'Mathura');

-- 43) Delete all students whose salary is below 30,000. 

DELETE FROM students
WHERE id IN (
    SELECT employee_id 
    FROM sallary 
    WHERE sellary < 30000
);

-- 44) Change the department of a student to "Research and Development" if they are working in "Testing".

UPDATE sallary 
SET 
    department = 'Research and Development'
WHERE
    department = 'Testing';

;

-- 45) Find the city with the maximum number of students.

SELECT 
    COUNT(city) AS student_count
FROM
    city
GROUP BY city
ORDER BY student_count DESC
LIMIT 1;

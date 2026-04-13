-- 1. write a SQL query to find customers who are either from the city 'NewYork' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.
-- select * from customer where city = 'New York' and grade <= 100;

-- 2. write a SQL query to find all the customers in ‘New York’ city who have agradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id.
-- select * from customer where city ='New York' and grade > 100;

-- 3. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50%of thetarget value of 6000.
-- select ord_no, purch_amt, (purch_amt/6000)*100 as achieved_percentage,100-((purch_amt/6000)*100)as unachieved_percentage from orders where purch_amt > 3000;

-- 4. write a SQL query to calculate the total purchase amount of all orders. Returntotal purchase amount
--  select sum(purch_amt)as total_purchase_amount from orders;

-- 5. write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.
-- SELECT customer_id, MAX(purch_amt) FROM orders GROUP BY customer_id;

-- 6. write a SQL query to calculate the average product price. Return average product price.
-- select avg(pro_price) from item_mast;

-- 7. write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID
-- SELECT e.first_name, e.last_name, e.employee_id, e.job_id FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN locations l ON d.location_id = l.location_id WHERE l.city = 'Toronto';

-- 8. write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of the Jobtitle‘MK_MAN’. Return employee ID, first name, last name, job ID.
-- SELECT employee_id, first_name, last_name, job_id FROM employees WHERE salary < (SELECT MIN(salary) FROM employees WHERE job_id = 'MK_MAN')AND job_id = 'MK_MAN';

-- 9. write a SQL query to find all those employees who work in department ID80or40. Return first name, last name, department number and department name.
-- select e.first_name,e.last_name,e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id where e.department_id in (80,40);

-- 10. write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. Return department name, averagesalary and number of employees
-- SELECT d.department_name,AVG(e.salary) AS average_salary, COUNT(e.commission_pct) AS number_of_employees FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY d.department_name;

-- 11. write a SQL query to find out which employees have the same designationas the employee whose ID is 169. Return first name, last name, department IDandjobID.
-- SELECT first_name, last_name, department_id, job_id FROM employees WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 169 ) AND employee_id <> 169;

-- 12. write a SQL query to find those employees who earn more than the averagesalary. Return employee ID, first name, last name
-- select employee_id,first_name,last_name,salary from employees where salary>(select avg(salary) from employees);

-- 13. write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.
-- select d.department_id,d.department_name,e.job_id,e.first_name from departments d join employees e on d.department_id = e.department_id where d.department_name='finance';

-- 14. From the following table, write a SQL query to find the employees whoearnlessthan the employee of ID 182. Return first name, last name and salary.
-- select first_name,last_name,salary from employees where salary < (select salary from employees  where employee_id = 182);

-- 15. Create a stored procedure CountEmployeesByDept that returns the number of employees in each department
-- DELIMITER //  CREATE PROCEDURE countemployeesbydept() BEGIN SELECT d.department_name, COUNT(e.employee_id) AS total_employees FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY d.department_name; END// DELIMITER ;

-- 16. Create a stored procedure AddNewEmployee that adds a new employee to the database.
-- DELIMITER // CREATE PROCEDURE addnewemployee(IN p_employee_id INT,IN p_first_name VARCHAR(20),IN p_last_name VARCHAR(25),IN p_email VARCHAR(25), IN p_phone_number VARCHAR(20),IN p_hire_date DATE,IN p_job_id VARCHAR(10),IN p_salary DECIMAL(8,2),IN p_commission_pct DECIMAL(2,2), IN p_manager_id INT,IN p_department_id INT ) BEGIN INSERT INTO employees(employee_id,first_name,last_name,email, phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)VALUES( p_employee_id,p_first_name,p_last_name,p_email, p_phone_number,p_hire_date,p_job_id,p_salary, p_commission_pct,p_manager_id,p_department_id); END// DELIMITER ; 

-- 17. Create a stored procedure DeleteEmployeesByDept that removes all employeesfrom a specific department
-- DELIMITER // CREATE PROCEDURE deleteemployeesbydept(IN p_department_id INT ) BEGIN DELETE FROM employees WHERE department_id = p_department_id; END// DELIMITER ;

-- 18. Create a stored procedure GetTopPaidEmployees that retrieves the highest-paidemployee in each department.
-- DELIMITER // create procedure gettoppaidemployees() begin select e.employee_id,e.first_name,e.last_name,e.department_id,e.salary from employees e where e.salary = (select max(salary) from employees where department_id = e.department_id); END// DELIMITER ;

-- 19. Create a stored procedure PromoteEmployee that increases an employee’s salaryand changes their job role.
-- DELIMITER // create procedure promoteemployee( in p_employee_id int, in p_new_job_id varchar(10), in p_salary_increase decimal(8,2)) begin update employees set job_id = p_new_job_id, salary = salary + p_salary_increase where employee_id = p_employee_id; END// DELIMITER ;

-- 20. Create a stored procedure AssignManagerToDepartment that assigns a newmanager to all employees in a specific department
-- DELIMITER // CREATE PROCEDURE AssignManagerToDepartment(IN p_department_id INT, IN p_manager_id INT ) BEGIN UPDATE employees SET manager_id = p_manager_id WHERE department_id = p_department_id; END// DELIMITER ;













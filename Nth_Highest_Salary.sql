create Database students;

use students;
CREATE TABLE sales
(
employee VARCHAR(50),
"date" DATE, 
sale INT
);

INSERT INTO sales VALUES ('odin', '2017-03-01', 200),
                         ('odin', '2017-04-01', 300),
                         ('odin', '2017-05-01', 400),
                         ('thor', '2017-03-01', 400),
                         ('thor', '2017-04-01', 300),
                         ('thor', '2017-05-01', 500);

select * from sales;

SELECT employee, SUM(sale) FROM sales GROUP BY employee;

SELECT employee, date, sale, SUM(sale) OVER (PARTITION BY employee) AS sum FROM sales;

select len('123456778912345678912345678912');

use students;
CREATE TABLE Employee
(
emp_id int,
employee_name VARCHAR(50),
salary INT,
dept_id int
);

INSERT INTO Employee VALUES (1111, 'SAKET', 200,12),
							(1112, 'RAJ', 400,13),
							(1113, 'PREETI', 800,14),
							(1114, 'SHUBHAM', 1000,15),
							(1115, 'DEEPA', 1500,16),
							(1116, 'NISHA', 3000,17),
							(1117, 'PAPU', 1580,18);

select * from Employee order by salary desc;

select * from Employee where salary = (select max(salary) from Employee);

--Option1-----Using Corelated SubQuery--
select * from Employee EMP1
where 2 = (select count(distinct salary) from Employee EMP2 where EMP2.salary >= EMP1.salary);

--Option2--Using Dense Rank Functions..

select employee_name,salary from (
select employee_name,salary,DENSE_RANK() over(order by salary desc) as Ranking from Employee) as A
where Ranking = 2;--Same thing we need to do for all salary like 3rd highset and 4th highest salary. 

---Option3---Using top clause--

select top 1 employee_name,salary from ( select distinct top 2 employee_name,salary from Employee order by salary desc) A
order by salary ASC ;




#Usecase1:
create database employee_payroll_service;
show databases;
use employee_payroll_service;

#Usecase2:
create table employee_payroll_service(
    -> id               INT unsigned NOT NULL AUTO_INCREMENT,
    -> name             VARCHAR(150) NOT NULL,
    -> salary           Double NOT NULL,
    -> start            DATE NOT NULL,
    -> PRIMARY KEY      (id)
    -> );
describe employee_payroll_service;

#Usecase3:
insert into employee_payroll_service(name, salary, start) VALUES
    -> ('BILL', 1000000.00, '2019-08-11'),
    -> ('Aniket', 2000000.00, '2019-11-08'),
    -> ('Sanket', 30000000.00, '2019-12-13');

#Usecase4:
select * from employee_payroll_service;

#Usecase5:
select salary from employee_payroll_service where name = 'Aniket';
select salary from employee_payroll_service where start between cast('2019-12-13' as date) and date(NOW());
select * from employee_payroll_service where start between cast('2019-08-11' as date) and date(NOW());

#Usecase6:
alter table employee_payroll_service add gender char(1) after name;
select * from employee_payroll_service;
update employee_payroll_service  set gender = 'M' where name = 'Aniket';
update employee_payroll_service  set gender = 'M' where name = 'BILL' OR name = 'Sanket';
select * from employee_payroll_service;
describe employee_payroll_service;

#Usecase7:
insert into employee_payroll_service(name, gender, salary, start) VALUES
    -> ('Deepika', 'F',2500000.00,'2018-12-11');
select * from employee_payroll_service;
select gender, AVG(salary) from employee_payroll_service group by gender;
select gender, SUM(salary) from employee_payroll_service group by gender;
select gender, COUNT(salary) from employee_payroll_service group by gender;
select gender, MIN(salary) from employee_payroll_service group by gender;
select gender, MAX(salary) from employee_payroll_service group by gender;
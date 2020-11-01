--Usecase1:
create database employee_payroll_service;
show databases;
use employee_payroll_service;

--Usecase2:
create table employee_payroll_service(
    -> id               INT unsigned NOT NULL AUTO_INCREMENT,
    -> name             VARCHAR(150) NOT NULL,
    -> salary           Double NOT NULL,
    -> start            DATE NOT NULL,
    -> PRIMARY KEY      (id)
    -> );
describe employee_payroll_service;

--Usecase3:
insert into employee_payroll_service(name, salary, start) VALUES
    -> ('BILL', 1000000.00, '2019-08-11'),
    -> ('Aniket', 2000000.00, '2019-11-08'),
    -> ('Sanket', 30000000.00, '2019-12-13');

--Usecase4:
select * from employee_payroll_service;

--Usecase5:
select salary from employee_payroll_service where name = 'Aniket';
select salary from employee_payroll_service where start between cast('2019-12-13' as date) and date(NOW());
select * from employee_payroll_service where start between cast('2019-08-11' as date) and date(NOW());

--Usecase6:
alter table employee_payroll_service add gender char(1) after name;
select * from employee_payroll_service;
update employee_payroll_service  set gender = 'M' where name = 'Aniket';
update employee_payroll_service  set gender = 'M' where name = 'BILL' OR name = 'Sanket';
select * from employee_payroll_service;
describe employee_payroll_service;

--Usecase7:
insert into employee_payroll_service(name, gender, salary, start) VALUES
    -> ('Deepika', 'F',2500000.00,'2018-12-11');
select * from employee_payroll_service;
select gender, AVG(salary) from employee_payroll_service group by gender;
select gender, SUM(salary) from employee_payroll_service group by gender;
select gender, COUNT(salary) from employee_payroll_service group by gender;
select gender, MIN(salary) from employee_payroll_service group by gender;
select gender, MAX(salary) from employee_payroll_service group by gender;

--Usecase8:
alter table employee_payroll_service add phone numeric(10) after name;
alter table employee_payroll_service add address varchar(250) after phone;
alter table employee_payroll_service add department varchar(150) NOT NULL after address;
alter table employee_payroll_service alter address SET DEFAULT 'TBD';

--Usecase9:
alter table employee_payroll_service RENAME COLUMN salary to basic_pay;
alter table employee_payroll_service add deductions double NOT NULL after basic_pay;
alter table employee_payroll_service add taxable_pay double NOT NULL after deductions;
alter table employee_payroll_service add tax double NOT NULL after taxable_pay;
alter table employee_payroll_service add net_pay double NOT NULL after tax;

--Usecase10: to check the conflicts for Deepika
update employee_payroll_service set department = 'Sales' where name = 'Deepika';
insert into employee_payroll_service(name,department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) 
                             values ('Deepika','Marketing','F',3000000,1000000,2000000,500000,1500000,'2018-12-11');

--Usecase12:
alter table employee_payroll_service rename to employee;
alter table employee rename column id to employeeId;
alter table employee add payroll_id int not null after gender;
create table department (employeeId int not null, departmentName varchar(100) not null,
                         foreign key (employeeId) references employee(employeeId));
create table payroll ( payroll_id int not null, basic_pay double not null, deductions double not null,
                      taxable_pay double not null, tax double not null, net_pay double not null, primary key (payroll_id));

alter table employee add foreign key(payroll_id) payroll(payroll_id);
create table phone_numbers (employeeId int not null, phone numeric(10) not null,
                            foreign key (employeeId) references employee(employeeId));
alter table employee drop column basic_pay, drop column deductions, drop column taxable_pay, drop column tax, drop column net_pay;

--Usecase13:
select employee.employeeId, employee.name, phone_numbers.phone, employee.address, department.departmentName, employee.gender,
payroll.basic_pay, payroll.deductions, payroll.taxable_pay, payroll.tax, payroll.net_pay, employee.start
from employee 
inner join phone_numbers on employee.employeeId = phone_numbers.employeeId 
inner join employee_dept on employee.employeeId = department.employeeId
inner join payroll on employee.payroll_id = payroll.payroll_id;
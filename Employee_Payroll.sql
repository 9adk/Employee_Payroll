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

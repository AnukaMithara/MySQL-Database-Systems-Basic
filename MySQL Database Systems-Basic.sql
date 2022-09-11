create database lab01_054;

use lab01_054;

-- 1
CREATE TABLE Employee
(Fname VARCHAR(15) NOT NULL, 
Minit CHAR,
Lname VARCHAR(15) NOT NULL, 
Ssn CHAR(9) NOT NULL, 
Bdte DATE, 
Address VARCHAR(30), 
Sex CHAR, 
Salary DECIMAL(10,2), 
Super_ssn CHAR(9),
Dno INT NOT NULL,
PRIMARY KEY (Ssn)
); 

-- create DEPARTMENT table
CREATE TABLE DEPARTMENT
( Dname VARCHAR(25) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR (9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber),
UNIQUE (Dname), 
FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn) 
); 


-- create DEPT_LOCATIONS table
CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation CHAR (20) NOT NULL,
PRIMARY KEY (Dnumber,Dlocation),
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) 
); 


-- create PROJECT table
CREATE TABLE PROJECT
( Pname VARCHAR(25) NOT NULL,
Pnumber INT NOT NULL,
Plocation CHAR (25),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
UNIQUE (Pname), 
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) 
);


-- create WORKS_ON table
CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn,Pno),
FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) 
);

-- create DEPENDENT table
CREATE TABLE DEPENDENT
( Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(25) NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(15),
PRIMARY KEY (Essn,Dependent_name),
FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);

-- 2
INSERT INTO Employee values
('Sachira', 'B', 'Heshan', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 3),
('Mihiri', 'T', 'Priyabhashini', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'F', 40000,  '888665555', 1),
('Dilinuwan', 'A', 'Induwara', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'M', 24000, '333445555', 2),
('Hiruni', 'K', 'Sandunika', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'F', 38000, '333445555', 4);

INSERT INTO DEPARTMENT values
('Computer Engineering', 1, '123456789', '2016-01-09'),
('Civil Engineering', 2, '333445555', '2016-03-09'),
('Mechanical Engineering', 3, '453453453', '2017-01-09'),
('Electrical Engineering', 4, '666884444', '2015-01-09');


INSERT INTO DEPT_LOCATIONS values
(1, 'Iranamadu'),
(2, 'Kilinochchi'),
(3, 'Murukandi'),
(4, 'Ariviyal Nagar');

INSERT INTO PROJECT values
('DBMS Project', 1, 'Wennappuwa', 1),
('Waste Management', 2, 'Colombo', 2),
('Design and prototype', 3, 'Ariviyal Nagar', 3),
('Signal Analaysis project', 4, 'Iranamadu', 4);

INSERT INTO WORKS_ON values
('123456789', 1, 48.5),
('333445555', 2, 18.5),
('453453453', 3, 15.3),
('666884444', 4, 10.7);

INSERT INTO DEPENDENT values
('333445555', 'Chamath', 'F', '2020-12-14', 'Fathter'),
('123456789', 'Pathum', 'F', '1997-11-24', 'Son'),
('453453453', 'Ruvindya', 'M','2019-03-30', 'Sister'),
('333445555', 'Chamod', 'F', '1998-04-09', 'Grand Father');

-- 5
-- a
select * from Employee where Ssn like '453453453';

-- b
select Fname, Address from Employee where Employee.Salary > 35000;

-- c
select DEPARTMENT.Dname, DEPT_LOCATIONS.Dlocation from DEPARTMENT
join DEPT_LOCATIONS on DEPARTMENT.Dnumber = DEPT_LOCATIONS.Dnumber;

-- d
select DEPT_LOCATIONS.Dlocation from DEPARTMENT
join DEPT_LOCATIONS on DEPARTMENT.Dnumber = DEPT_LOCATIONS.Dnumber
join Employee on Employee.Dno = DEPARTMENT.Dnumber
where Ssn like '453453453';

-- e
select concat(Employee.Fname,' ',Employee.lname) as EMPLOYEE_NAME  from DEPARTMENT 
join Employee on Employee.Ssn = DEPARTMENT.Mgr_ssn;

-- f
SELECT CONCAT(Employee.Fname,' ',Employee.lname) AS EMPLOYEE_NAME, DEPENDENT.Relationship, DEPENDENT.Dependent_name FROM Employee
JOIN DEPENDENT ON Employee.Ssn = DEPENDENT.Essn;

-- g
select Fname, Address from Employee where Employee.Salary > 25000 and Employee.Salary < 50000;

-- h
 select DEPARTMENT.Dname, DEPARTMENT.Mgr_start_date  from DEPT_LOCATIONS
 join DEPARTMENT on DEPARTMENT.Dnumber = DEPT_LOCATIONS.Dnumber
 where Dlocation like 'Kilinochchi';
 
 -- i
 select DEPARTMENT.Dname, DEPARTMENT.Dnumber  from PROJECT
 join DEPARTMENT on  PROJECT.Dnum = DEPARTMENT.Dnumber
 where Pnumber like '2';
 -- where Pname like 'Waste%';
 
 -- j
 select * from Employee
 join DEPARTMENT on  DEPARTMENT.Mgr_ssn = Employee.ssn
 where Sex like 'F';
 











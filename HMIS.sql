-- creating database 
create database HMIS;

-- using the database
use HMIS; 



/***********************************  CREATING TABLES  ***********************************/

-- creating the 1st table(employee)
create table employee(
	employee_id varchar(10) primary key,
    employee_firstname varchar(20) not null,
    employee_lastname varchar(20) not null, 
    employee_dateofbirth date not null,
    employee_dateofjoining date not null, 
    employee_address varchar(50),
    employee_phoneno bigint not null, 
    employee_gender varchar(20) not null,
    employee_email varchar(50),
    employee_title varchar(30),
    employee_dateofleaving date
);


-- creating the 2nd table (department)
create table department(
	department_id varchar(10) primary key,
    doctor_id varchar(10), 
    department_name varchar(50) not null,
    roomno varchar(20) not null
);


-- creating the 3rd table (doctor_details)
create table doctor_details(
	department_id varchar(10),
    doctor_id varchar(10) primary key, 
    doctor_firstname varchar(20) not null, 
    doctor_lastname varchar(20) not null, 
    doctor_dateofbirth date not null, 
    doctor_dateofjoining date not null, 
    doctor_specialization varchar(50) not null, 
    doctor_address varchar(50) not null,
    doctor_phoneno bigint not null,
    doctor_gender varchar(20) not null, 
    doctor_email varchar(50) not null, 
    doctor_qualification varchar(50) not null,
    foreign key(department_id)references department(department_id)
);


-- creating the 4th table(out_patient)
create table out_patient(
	out_patient_id varchar(10) primary key, 
    patient_firstname varchar(30) not null,
    patient_lastname varchar(30) not null, 
    patient_dateofbirth date,
    patient_address varchar(50),
    patient_phoneno bigint not null, 
    patient_gender varchar(20) not null, 
    out_patient_issue varchar(200), 
    appointment_id varchar(10),
    patient_age int not null 
);


-- creating the 5th table(appointment)
create table appointment(
	appointment_id varchar(10) primary key, 
    doctor_id varchar(10), 
    department_id varchar(10), 
    out_patient_id varchar(10), 
    date_of_appointment date not null, 
    roomno varchar(20),
    appointment_fee varchar(20),
    foreign key(doctor_id) references doctor_details(doctor_id),
    foreign key(department_id) references department(department_id),
    foreign key(out_patient_id) references out_patient(out_patient_id)
);


-- creating the 6th table(in_patient)
create table in_patient(
	in_patient_id varchar(10) primary key, 
    out_patient_id varchar(10), 
    patient_weight varchar(10) not null, 
    patient_height varchar(10) not null, 
    patient_bloodgroup varchar(10),
    payment_status varchar(20),
    patient_email varchar(50), 
    patient_addmittedon date not null, 
    patient_dischargeon date, 
    patient_wardno varchar(20) not null, 
    foreign key(out_patient_id) references out_patient(out_patient_id)
);



/************************************ LINKING THE TABLES *********************************/

-- linking the department and doctor_details table
alter table department add foreign key(doctor_id)references doctor_details(doctor_id);

-- linking the out_patient and appointment table
alter table out_patient add foreign key(appointment_id)references appointment(appointment_id);



/**************************** CHECKING THE STRUCTURE OF THE TABLES*************************/
desc employee;
desc department;
desc doctor_details;
desc out_patient;
desc appointment;
desc in_patient;  



/*************************** INSERTING THE DATA INTO THE TABLES ***************************/

-- Insert data into employee table
insert into employee values
	('E001', 'John', 'Doe', '1985-04-12', '2015-03-15', '123 Street A', 9876543210, 'Male', 'john.doe@example.com', 'Receptionist', NULL),
	('E002', 'Jane', 'Smith', '1990-06-25', '2018-01-10', '456 Street B', 9876543211, 'Female', 'jane.smith@example.com', 'Nurse', '2022-08-20'),
	('E003', 'Robert', 'Williams', '1987-11-30', '2016-05-22', '789 Street C', 9876543212, 'Male', 'robert.williams@example.com', 'Warden', NULL),
	('E004', 'Emily', 'Johnson', '1992-03-14', '2019-09-08', '101 Street D', 9876543213, 'Female', 'emily.johnson@example.com', 'Cleaner', '2023-07-12'),
	('E005', 'Michael', 'Brown', '1989-12-21', '2017-07-16', '234 Street E', 9876543214, 'Male', 'michael.brown@example.com', 'Receptionist', NULL),
	('E006', 'Sarah', 'Davis', '1988-08-18', '2016-04-11', '345 Street F', 9876543215, 'Female', 'sarah.davis@example.com', 'Nurse', NULL),
	('E007', 'David', 'Miller', '1991-02-13', '2020-10-22', '567 Street G', 9876543216, 'Male', 'david.miller@example.com', 'Cleaner', '2021-10-23'),
	('E008', 'Sophia', 'Garcia', '1993-09-02', '2021-03-19', '678 Street H', 9876543217, 'Female', 'sophia.garcia@example.com', 'Warden', NULL),
	('E009', 'James', 'Martinez', '1986-07-17', '2014-12-30', '789 Street I', 9876543218, 'Male', 'james.martinez@example.com', 'Receptionist', '2023-01-20'),
	('E010', 'Anna', 'Rodriguez', '1994-10-07', '2022-01-25', '890 Street J', 9876543219, 'Female', 'anna.rodriguez@example.com', 'Nurse', NULL);


-- Insert data into department table
insert into department (department_id, doctor_id, department_name, roomno) values
	('D001', NULL, 'Cardiology', '101A'),
	('D002', NULL, 'Neurology', '102B'),
	('D003', NULL, 'Orthopedics', '103C'),
	('D004', NULL, 'Dermatology', '104D'),
	('D005', NULL, 'Pediatrics', '105E'),
	('D006', NULL, 'Gynecology', '106F'),
	('D007', NULL, 'Oncology', '107G'),
	('D008', NULL, 'Radiology', '108H'),
	('D009', NULL, 'Pathology', '109I'),
	('D010', NULL, 'Psychiatry', '110J');


-- Insert data into doctor_details table
insert into doctor_details values
	('D001', 'DR001', 'William', 'Smith', '1975-03-04', '2005-06-15', 'Cardiology', '123 Doctor Street', 9123456780, 'Male', 'william.smith@hospital.com', 'MD Cardiology'),
	('D002', 'DR002', 'Linda', 'Jones', '1980-05-16', '2008-09-20', 'Neurology', '234 Doctor Lane', 9123456781, 'Female', 'linda.jones@hospital.com', 'MD Neurology'),
	('D003', 'DR003', 'Michael', 'Taylor', '1979-10-25', '2007-04-10', 'Orthopedics', '345 Doctor Ave', 9123456782, 'Male', 'michael.taylor@hospital.com', 'MD Orthopedics'),
	('D004', 'DR004', 'Jennifer', 'Brown', '1982-02-18', '2010-08-25', 'Dermatology', '456 Doctor Blvd', 9123456783, 'Female', 'jennifer.brown@hospital.com', 'MD Dermatology'),
	('D005', 'DR005', 'Charles', 'Anderson', '1976-12-14', '2004-11-05', 'Pediatrics', '567 Doctor Dr', 9123456784, 'Male', 'charles.anderson@hospital.com', 'MD Pediatrics'),
	('D006', 'DR006', 'Barbara', 'Thomas', '1983-06-29', '2012-07-12', 'Gynecology', '678 Doctor Way', 9123456785, 'Female', 'barbara.thomas@hospital.com', 'MD Gynecology'),
	('D007', 'DR007', 'Daniel', 'Jackson', '1977-08-30', '2006-03-18', 'Oncology', '789 Doctor St', 9123456786, 'Male', 'daniel.jackson@hospital.com', 'MD Oncology'),
	('D008', 'DR008', 'Patricia', 'Lee', '1981-09-15', '2009-05-19', 'Radiology', '890 Doctor Rd', 9123456787, 'Female', 'patricia.lee@hospital.com', 'MD Radiology'),
	('D009', 'DR009', 'James', 'Wilson', '1984-07-07', '2011-11-08', 'Pathology', '901 Doctor Cir', 9123456788, 'Male', 'james.wilson@hospital.com', 'MD Pathology'),
	('D010', 'DR010', 'Maria', 'Lopez', '1978-11-27', '2003-01-30', 'Psychiatry', '101 Doctor Ln', 9123456789, 'Female', 'maria.lopez@hospital.com', 'MD Psychiatry');


-- removing foreign key to insert data into table 
alter table out_patient modify appointment_id varchar(10) null;
alter table out_patient drop foreign key out_patient_ibfk_2;


-- Insert data into out_patient table
insert into  out_patient (out_patient_id, patient_firstname, patient_lastname, patient_dateofbirth, patient_address, patient_phoneno, patient_gender, out_patient_issue, appointment_id, patient_age)
values
	('OP001', 'Adam', 'Harris', '1995-03-15', '12 Main St', 9234567890, 'Male', 'Fever', NULL, 28),
	('OP002', 'Olivia', 'Martinez', '1988-06-19', '45 Oak Rd', 9234567891, 'Female', 'Headache', NULL, 35),
	('OP003', 'Ethan', 'Walker', '1990-01-22', '78 Pine Ave', 9234567892, 'Male', 'Back Pain', null, 34),
	('OP004', 'Ava', 'Young', '1992-08-30', '90 Cedar St', 9234567893, 'Female', 'Skin Rash', null, 32),
	('OP005', 'Isabella', 'King', '1985-10-01', '23 Maple Blvd', 9234567894, 'Female', 'High Fever', null, 39),
	('OP006', 'Mason', 'Scott', '1983-11-17', '56 Birch Dr', 9234567895, 'Male', 'Bone Fracture', null, 41),
	('OP007', 'Charlotte', 'Torres', '1978-12-21', '34 Elm Cir', 9234567896, 'Female', 'Lung Issue', null, 46),
	('OP008', 'Amelia', 'Hughes', '1999-05-05', '101 Cypress Ln', 9234567897, 'Female', 'Flu', null, 24),
	('OP009', 'Noah', 'Rivera', '2001-09-13', '88 Willow Ave', 9234567898, 'Male', 'Mental Health', null, 22),
	('OP010', 'Lucas', 'Morgan', '1976-07-04', '76 Ash Rd', 9234567899, 'Male', 'Arthritis', null, 48);


-- adding foreign key after inserting data 
alter table out_patient add constraint out_patient_ibfk_2 foreign key (appointment_id) references appointment (appointment_id);

-- Insert data into appointment table
insert into appointment (appointment_id, doctor_id, department_id, out_patient_id, date_of_appointment, roomno, appointment_fee)
values
('A001', 'DR001', 'D001', 'OP001', '2024-10-01', '101A', '100'),
('A002', 'DR002', 'D002', 'OP002', '2024-10-02', '102B', '150'),
('A003', 'DR003', 'D003', 'OP003', '2024-10-03', '103C', '200'),
('A004', 'DR004', 'D004', 'OP004', '2024-10-04', '104D', '120'),
('A005', 'DR005', 'D005', 'OP005', '2024-10-05', '105E', '130'),
('A006', 'DR006', 'D006', 'OP006', '2024-10-06', '106F', '110'),
('A007', 'DR007', 'D007', 'OP007', '2024-10-07', '107G', '140'),
('A008', 'DR008', 'D008', 'OP008', '2024-10-08', '108H', '160'),
('A009', 'DR009', 'D009', 'OP009', '2024-10-09', '109I', '170'),
('A010', 'DR010', 'D010', 'OP010', '2024-10-10', '110J', '180');


-- Insert data into in_patient table
insert into in_patient values
('IP001', 'OP001', '70', '170', 'A+', 'Paid', 'adam.harris@example.com', '2024-09-01', '2024-09-10', 'W101'),
('IP002', 'OP002', '68', '165', 'B+', 'Unpaid', 'olivia.martinez@example.com', '2024-09-02', NULL, 'W102'),
('IP003', 'OP003', '80', '180', 'O-', 'Paid', 'ethan.walker@example.com', '2024-09-03', '2024-09-15', 'W103'),
('IP004', 'OP004', '58', '160', 'AB+', 'Paid', 'ava.young@example.com', '2024-09-04', '2024-09-20', 'W104'),
('IP005', 'OP005', '72', '175', 'A-', 'Unpaid', 'isabella.king@example.com', '2024-09-05', NULL, 'W105'),
('IP006', 'OP006', '75', '170', 'B-', 'Paid', 'mason.scott@example.com', '2024-09-06', '2024-09-22', 'W106'),
('IP007', 'OP007', '60', '155', 'O+', 'Unpaid', 'charlotte.torres@example.com', '2024-09-07', '2024-09-18', 'W107'),
('IP008', 'OP008', '67', '167', 'A+', 'Paid', 'amelia.hughes@example.com', '2024-09-08', NULL, 'W108'),
('IP009', 'OP009', '85', '185', 'AB-', 'Unpaid', 'noah.rivera@example.com', '2024-09-09', '2024-09-24', 'W109'),
('IP010', 'OP010', '77', '175', 'B+', 'Paid', 'lucas.morgan@example.com', '2024-09-10', '2024-09-28', 'W110');



/**************************** checking the data ****************************/
select * from employee;
select * from department;
select * from doctor_details;
select * from employee;
select * from out_patient;
select * from appointment;
select * from in_patient;


/********* updating the table column data **********/

-- Update department table with valid doctor_id values
update department set doctor_id = 'DR001' where department_id = 'D001';
update department set doctor_id = 'DR002' where department_id = 'D002';
update department set doctor_id = 'DR003' where department_id = 'D003';
update department set doctor_id = 'DR004' where department_id = 'D004';
update department set doctor_id = 'DR005' where department_id = 'D005';
update department set doctor_id = 'DR006' where department_id = 'D006';
update department set doctor_id = 'DR007' where department_id = 'D007';
update department set doctor_id = 'DR008' where department_id = 'D008';
update department set doctor_id = 'DR009' where department_id = 'D009';
update department set doctor_id = 'DR010' where department_id = 'D010';


-- Update out_patient table with valid appointment_id values
update out_patient set appointment_id = 'A001' where out_patient_id = 'OP001';
update out_patient set appointment_id = 'A002' where out_patient_id = 'OP002';
update out_patient set appointment_id = 'A003' where out_patient_id = 'OP003';
update out_patient set appointment_id = 'A004' where out_patient_id = 'OP004';
update out_patient set appointment_id = 'A005' where out_patient_id = 'OP005';
update out_patient set appointment_id = 'A006' where out_patient_id = 'OP006';
update out_patient set appointment_id = 'A007' where out_patient_id = 'OP007';
update out_patient set appointment_id = 'A008' where out_patient_id = 'OP008';
update out_patient set appointment_id = 'A009' where out_patient_id = 'OP009';
update out_patient set appointment_id = 'A010' where out_patient_id = 'OP010';



-- Re-add foreign key constraint to out_patient
alter table out_patient add constraint out_patient_ibfk_2 
foreign key (appointment_id) references appointment (appointment_id);

-- You may also want to ensure the doctor_id in department has a foreign key constraint
alter table department add constraint department_ibfk_1 
foreign key (doctor_id) references doctor_details (doctor_id);



/********************************** Queries on data **************************************/

-- 1. Retrieve all details of employees
select * from employee; 

-- 2.Get all doctors' details, including their department names
select d.doctor_id, d.doctor_firstname, d.doctor_lastname, d.doctor_specialization, dept.department_name
from doctor_details d
join department dept on d.department_id = dept.department_id;

-- 3.List all outpatients along with their appointment details
SELECT op.out_patient_id, op.patient_firstname, op.patient_lastname, a.date_of_appointment, a.appointment_fee
FROM out_patient op
JOIN appointment a ON op.appointment_id = a.appointment_id;

-- 4. Retrieve all employees who joined before 2017
SELECT * FROM employee
WHERE employee_dateofjoining < '2017-01-01';

-- 5.Get details of in-patients who have not yet been discharged
SELECT * FROM in_patient
WHERE patient_dischargeon IS NULL;

-- 6. Find all doctors specializing in "Cardiology"
SELECT * FROM doctor_details
WHERE doctor_specialization = 'Cardiology';

-- 7. List all employees ordered by their joining date (earliest to latest)
SELECT * FROM employee
ORDER BY employee_dateofjoining;

-- 8. Display all outpatients sorted by age in descending order
SELECT * FROM out_patient
ORDER BY patient_age DESC;

-- 9. Count the number of employees
SELECT COUNT(*) AS total_employees FROM employee;

-- 10. Find the average age of outpatients
SELECT AVG(patient_age) AS avg_age FROM out_patient;

-- 11. Get the total appointment fees collected for all departments
SELECT SUM(CAST(appointment_fee AS DECIMAL)) AS total_fees FROM appointment;

-- 12.Find the number of employees in each title (e.g., receptionist, nurse, etc.)
SELECT employee_title, COUNT(*) AS count_per_title
FROM employee
GROUP BY employee_title;

-- 13. List the total number of appointments per department
SELECT d.department_name, COUNT(a.appointment_id) AS total_appointments
FROM appointment a
JOIN department d ON a.department_id = d.department_id
GROUP BY d.department_name;

-- 14. Retrieve all appointments along with the doctor's and patient's names
SELECT a.appointment_id, d.doctor_firstname AS doctor_name, op.patient_firstname AS patient_name, a.date_of_appointment
FROM appointment a
JOIN doctor_details d ON a.doctor_id = d.doctor_id
JOIN out_patient op ON a.out_patient_id = op.out_patient_id;

-- 15. Get all in-patients along with their corresponding out-patient details
SELECT ip.in_patient_id, op.patient_firstname, op.patient_lastname, ip.patient_weight, ip.patient_height
FROM in_patient ip
JOIN out_patient op ON ip.out_patient_id = op.out_patient_id;

-- 16. List all employees who are also doctors
SELECT * FROM employee
WHERE employee_id IN (SELECT doctor_id FROM doctor_details);

-- 17. Find employees who joined after the average joining date of all employees
SELECT * FROM employee
WHERE employee_dateofjoining > (SELECT AVG(employee_dateofjoining) FROM employee);

-- 18. Update an employee's phone number
UPDATE employee
SET employee_phoneno = 9876540000
WHERE employee_id = 'E001';

-- 19. Set all in-patients who have been admitted for over 30 days as "Long Stay"
UPDATE in_patient
SET payment_status = 'Long Stay'
WHERE DATEDIFF(CURDATE(), patient_addmittedon) > 30;

-- 20. Remove a record of an employee who has left
DELETE FROM employee
WHERE employee_dateofleaving IS NOT NULL;

-- 21. Delete an out-patient record where the patient has been admitted as an in-patient
DELETE FROM out_patient
WHERE out_patient_id IN (SELECT out_patient_id FROM in_patient);

-- 22. List all doctors and the number of outpatients they have treated
SELECT d.doctor_firstname, d.doctor_lastname, COUNT(a.out_patient_id) AS total_patients
FROM doctor_details d
LEFT JOIN appointment a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;

-- 23. Get the department with the highest number of appointments
SELECT d.department_name, COUNT(a.appointment_id) AS appointment_count
FROM department d
JOIN appointment a ON d.department_id = a.department_id
GROUP BY d.department_id
ORDER BY appointment_count DESC
LIMIT 1;




















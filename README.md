# SQL Analysis | HMIS

## 📌 Project Overview  
This project involves designing and analyzing a **Hospital Management Information System (HMIS)** using SQL. It focuses on **database design, constraints, and query optimization** to maintain data integrity and extract meaningful insights for better healthcare management.  

## 📂 Features  
✔️ Designed and implemented relational database tables for HMIS.  
✔️ Applied **primary keys, foreign keys, and constraints** to ensure data integrity.  
✔️ Utilized advanced **SQL functions**, including `GROUP BY`, `JOIN`, `HAVING`, and `subqueries`.  
✔️ Developed **optimized queries** to handle complex data retrieval tasks.  
✔️ Extracted meaningful **insights for patient management, appointments, billing, and more**.  

## 🛠️ Technologies Used  
- **SQL** (Structured Query Language)  
- **MySQL / PostgreSQL / SQL Server** *(whichever is applicable to your project)*  
- **Database Design Principles**  

## 📊 Sample Queries  
Below are some key SQL queries used in the project:  

```sql
-- Example: Retrieve total appointments per doctor
SELECT doctor_id, COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id;

-- Example: Join patients with their billing details
SELECT p.patient_name, b.amount, b.payment_status
FROM patients p
JOIN billing b ON p.patient_id = b.patient_id;

-- Example: Identify patients with unpaid bills
SELECT patient_id, amount FROM billing WHERE payment_status = 'Pending';

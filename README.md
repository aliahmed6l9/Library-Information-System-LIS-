# 📚 Library Information System (LIS)

> **Introduction to Database Systems Project**  
> A complete relational database solution for managing library operations, including book inventory, member records, borrowing transactions, fines, and reporting queries.

---

## 📖 Project Overview

The **Library Information System (LIS)** is a database-driven application designed to streamline the management of library resources and services. The system maintains records of books, authors, publishers, library members, staff, borrowing activities, returns, and fines.

The project demonstrates the practical implementation of database design concepts including:

- Entity Relationship Modeling (ERD)
- Relational Schema Design
- Normalization
- Primary and Foreign Keys
- Data Integrity Constraints
- SQL Data Manipulation
- Complex Business Queries

---

## 🎯 Project Objectives

- Maintain a centralized library database.
- Track book inventory and availability.
- Manage member registrations.
- Record borrowing and return transactions.
- Calculate and manage fines.
- Generate useful business reports through SQL queries.
- Ensure data consistency and integrity.

---

## ✨ Features

### Member Management
- Register library members
- Store member details
- Track borrowing history

### Book Management
- Maintain book records
- Store ISBN information
- Track multiple book copies
- Categorize books

### Author Management
- Store author information
- Support books with multiple authors

### Publisher Management
- Maintain publisher records

### Staff Management
- Store librarian/staff information

### Borrowing System
- Issue books
- Return books
- Track due dates
- Monitor overdue books

### Fine Management
- Calculate fines
- Store payment information
- Track unpaid fines

### Reporting & Analytics
- Most borrowed books
- Active members
- Overdue books
- Fine summaries
- Inventory reports

---

## 🏗 Database Schema Description

The database consists of the following major entities:

| Entity | Description |
|----------|------------|
| Members | Stores library member information |
| Staff | Stores librarian/staff information |
| Authors | Stores author details |
| Publishers | Stores publisher details |
| Categories | Book categories and genres |
| Books | Main book information |
| Book_Copies | Physical copies of books |
| Shelves | Storage locations |
| Borrow_Transactions | Borrowing records |
| Returns | Returned book records |
| Fines | Fine information |

---

## 🔗 Entity Relationship Diagram (ERD)

### ERD Placeholder

Insert your final ERD diagram here.

```text
+-----------+
|  Members  |
+-----------+
      |
      |
      v
+--------------------+
| Borrow_Transaction |
+--------------------+
      |
      |
      v
+------------+
| Book_Copy  |
+------------+
      |
      |
      v
+---------+
|  Books  |
+---------+
   /   \
  /     \
 v       v
Author  Publisher
```

### ERD Screenshot

```markdown
![ERD Diagram](Screenshots/Library Information System (LIS) EER Diagram.jpeg)
```

---

## 📂 Project Structure

```text
Library-Information-System-DB/
│
├── README.md
├── Schema_Design.sql
├── Data_Population.sql
├── Business_Queries.sql
│
└── screenshots/
    ├── 3NF Relational Schema.png
    ├── Library Information System (LIS) EER Diagram.jpeg
    ├── Query 1.png
    ├── Query 2.png
    ├── Query 3.png
    ├── Query 4.png
    ├── Query 5.png
    ├── Query 6.png
    ├── Query 7.png
    ├── Query 8.png
    ├── Query 9.png
    └── Query 10.png
```

---

## 🛠 Technologies Used

- SQL
- Relational Database Management System (RDBMS)
- Database Design Principles
- ER Modeling
- Normalization

### Recommended Platforms

- MySQL
- Oracle Database Express Edition (XE)
- Microsoft SQL Server Express

---

## 🚀 Installation & Setup

### Step 1: Create Database

```sql
CREATE DATABASE LibraryDB;
```

### Step 2: Execute Schema Script

Run:

```text
Schema_Design.sql
```

This script creates:

- Tables
- Constraints
- Relationships
- Primary Keys
- Foreign Keys

### Step 3: Populate Sample Data

Run:

```text
Data_Population.sql
```

This script inserts sample records into all tables.

### Step 4: Execute Business Queries

Run:

```text
Business_Queries.sql
```

The file contains analytical and operational queries used for reporting and decision-making.

---

## 📊 Sample Business Queries

### Available Books

```sql
SELECT *
FROM Books;
```

### Overdue Books

```sql
SELECT *
FROM Borrow_Transactions
WHERE Due_Date < CURRENT_DATE;
```

### Most Active Members

```sql
SELECT Member_ID, COUNT(*)
FROM Borrow_Transactions
GROUP BY Member_ID;
```

### Fine Summary

```sql
SELECT *
FROM Fines;
```

---



## 🔒 Database Constraints

The system enforces:

- Primary Key Constraints
- Foreign Key Constraints
- NOT NULL Constraints
- UNIQUE Constraints
- Referential Integrity
- Data Validation Rules

These constraints ensure database reliability and consistency.

---

## 📚 Learning Outcomes

This project demonstrates understanding of:

- Relational Database Design
- Entity Relationship Modeling
- Database Normalization
- SQL DDL Commands
- SQL DML Commands
- SQL Joins
- Aggregate Functions
- Subqueries
- Business Intelligence Queries

---

## 👥 Team Members

| Student ID |Names | Role |
|------------|------|------|
| 004381 | M Taha Amir | Database Design |
| 004346 | Danish Ali | Schema Development |
| 004362 | Ali Ahmed | Data Population |
| 004369 | Abdul Ahad Bahir | Query Development |

---

## 🎓 Course Information

**Course:** Introduction to Database Systems (IDS) 
**Project:** Library Information System (LIS)  
**Semester:** Fall 2025 (4th Semester)  
**Department:** Software Wngineering  
**University:** *International Islamic University Islamabad*

---

## 📄 License

This project is submitted for **academic and educational purposes only**.

---

## Repository Description

A relational database project for managing library resources, borrowing transactions, fines, and analytical reporting using SQL.

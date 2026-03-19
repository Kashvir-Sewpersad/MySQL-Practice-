# 📊 MySQL Learning Playground

A collection of SQL practice scripts covering database basics → advanced concepts.  
Created as a personal learning / reference repo while following a MySQL beginner-to-intermediate course.

Everything is written and executed manually (no AI-generated code for core logic).

## 📑 Table of Contents

- [Overview](#overview)
- [Topics Covered](#topics-covered)
- [Database Structure](#database-structure)
- [How to Use This Repo](#how-to-use-this-repo)
- [Quick Start](#quick-start)
- [Important Notes](#important-notes)

## 🌐 Overview

This repository contains a long, sequential SQL script that walks through almost every major concept taught in a typical beginner-to-intermediate MySQL course.

It starts with very basic commands (CREATE DATABASE, simple tables) and gradually moves into:

- Constraints (UNIQUE, NOT NULL, CHECK, DEFAULT)
- Primary keys & auto-increment
- Foreign keys & referential actions (ON DELETE CASCADE)
- Joins (INNER, LEFT, RIGHT)
- Aggregate functions + GROUP BY + HAVING + ROLLUP
- Subqueries
- Views
- Indexes
- String functions (CONCAT, LIKE, wildcards)
- Procedures
- Transactions (COMMIT, ROLLBACK)
- UNION / UNION ALL
- Self-joins
- …and many small gotchas & common mistakes

Most examples use fun/spongebob-themed data (employees, customers, transactions, products).

## ✨ Topics Covered

- Database creation / selection / dropping / read-only
- Table creation, renaming, column add/drop/modify/rename/reorder
- Basic CRUD (INSERT, SELECT, UPDATE, DELETE)
- WHERE clause + operators (=, !=, >, <, BETWEEN, IN, IS NULL)
- LIKE + wildcards (% _)
- ORDER BY + LIMIT + OFFSET
- Aggregate functions: COUNT, SUM, AVG, MIN, MAX
- GROUP BY, HAVING, WITH ROLLUP
- JOINs: INNER · LEFT · RIGHT · self-join
- Subqueries (scalar, IN)
- UNION / UNION ALL
- Views (CREATE / SELECT / DROP)
- Indexes (CREATE / SHOW / DROP)
- Constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT
- Auto-increment & setting starting value
- Date/time functions (CURRENT_DATE, NOW, etc.)
- String functions (CONCAT, LOWER)
- Stored procedures (CREATE, CALL, parameters, DROP)
- Transactions (autocommit, COMMIT, ROLLBACK)
- Safe updates mode (SQL_SAFE_UPDATES)

## 🗄️ Database Structure (at the end of the script)

Main tables used:

- **employees**  
  employee_id (PK), first_name, last_name, hourly_rate, hire_date, job, supervisor_id

- **customers**  
  customer_id (PK auto_increment), first_name, last_name, referral_id, email

- **transactions**  
  transaction_id (PK auto_increment), amount, customer_id (FK), order_date

- **products** (briefly used)  
  product_id, product_name (UNIQUE), price (DEFAULT 0)

Many temporary / demo tables are created and dropped during the script (test, income, expenses, etc.).

## 🚀 How to Use This Repo

1. **Option A – Run everything at once** (not recommended)  
   Copy-paste the whole script into your favorite MySQL client → execute → watch it go.

2. **Option B – Learn section by section** (recommended)  
   - Open in VS Code, DBeaver, MySQL Workbench, phpMyAdmin, etc.  
   - Highlight and run small blocks (usually separated by /* … */ comments)  
   - Read the comment before each block to understand what concept is being demonstrated  
   - Observe the SELECT * FROM … results after each change

3. **Reset everything**  
   Just drop the database and re-run from the top:

```sql
DROP DATABASE IF EXISTS myDB;

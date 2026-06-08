# Travel Expense & Information Modeling System

## Overview
This repository contains a comprehensive data modeling project that demonstrates the conceptual, logical, and physical design of a **Travel Expense Reimbursement System** and an **Employee Management Database**. The project explores multiple database paradigms, progressing from standard Relational Database Management Systems (RDBMS) to Logic Programming and Graph Databases.

## Methodology

### 1. Relational Modeling (SQL)
- Designed normalized relational schemas for managing Travelers, Travel Vendors, Authorizations, Expense Reports, Items, and Reimbursement Payments.
- Implemented robust DDL scripts with primary/foreign key constraints and generated extensive mock data for system testing.

### 2. Logic Programming (Datalog / AnsProlog)
- Created a declarative logic programming model (`COMPANY-2.lp`) to represent the Employee database as logical facts.
- Implemented complex relational queries using logic rules to deduce relationships without traditional SQL overhead, demonstrating alternative data retrieval techniques.

### 3. Graph Database Modeling (Neo4j)
- Designed a graph-based data model to optimize the querying of highly interconnected data (e.g., tracing an Expense Item back to a Traveler and their Supervisor).
- Explored node and edge relationships to replace multi-join SQL queries with efficient graph traversals.

## Repository Structure

- `/project/phase 2/`: Contains the core relational database schema (`group-ph2-schema.sql`), DDL scripts, and mock data inserts for the Travel Expense System.
- `/project/phase 3/`: Contains graph modeling representations (e.g., `graph.png`) for the Neo4j implementation.
- `employee_db.sql`: The foundational SQL script that creates the Employee database.
- `sad.sql`: Supplemental SQL queries testing constraints and basic retrieval on the Employee schema.
- `COMPANY-2.lp`: The AnsProlog/Datalog logic program implementing the Employee schema.
- `*.svg`, `ER diagram.jpeg`, `travel.drawio`: Conceptual Entity-Relationship models and diagrams visually mapping the systems.

## Key Findings
- **Relational vs. Graph**: While SQL provided strict consistency for financial reimbursement records, Neo4j graph models simplified the visualization and querying of complex hierarchical data (like multi-tier approvals).
- **Declarative Logic**: Datalog proved to be a powerful tool for deductive database queries, particularly in inferring indirect supervisor-subordinate relationships and multi-project associations.

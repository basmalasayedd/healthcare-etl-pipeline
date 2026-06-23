Healthcare ETL Pipeline

Overview

An end-to-end ETL pipeline built using Python, Pandas, and PostgreSQL to process healthcare data. The pipeline extracts raw data from CSV files, performs data cleaning and transformation, loads the processed data into a relational database using psycopg3, and generates analytical insights through SQL queries.

Tech Stack

Python
Pandas
PostgreSQL
SQL
psycopg3
Git & GitHub

ETL Workflow

Extract

Imported healthcare data from CSV files using Pandas.

Transform

Performed data quality assessment and cleaning.
Removed duplicate records.
Standardized patient and doctor names.
Converted admission and discharge dates.
Extracted patient titles.
Normalized data into relational entities.
Created primary and foreign key relationships.

Load

Connected to PostgreSQL using psycopg3.
Loaded transformed data using PostgreSQL's COPY command for efficient bulk insertion.
Database Design

The database was normalized into four main tables:

Patient
Doctor
Hospital
Visit

The schema includes appropriate primary and foreign key relationships to ensure data integrity.

SQL Analytics

Implemented analytical SQL queries using:

Aggregations
Ranking functions
Window functions (RANK(), AVG() OVER(), SUM() OVER())

Sample Insights

Average billing amount by medical condition.
Top doctors by patient volume.
Most prescribed medication for each condition.
Monthly admission trends.
Cumulative billing analysis over time.

Skills Demonstrated

ETL Development
Data Cleaning & Transformation
Data Modeling
Relational Database Design
PostgreSQL
Advanced SQL
Window Functions
Data Loading Optimization

Future Enhancements

Apache Airflow orchestration
Automated ETL scheduling
Docker containerization
Power BI / Tableau dashboards

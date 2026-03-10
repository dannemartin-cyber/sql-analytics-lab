# SQL Analytics Lab

Intermediate SQL portfolio project demonstrating practical analytics, reporting, and data engineering patterns.

## What this project covers
- joins and aggregations
- common table expressions (CTEs)
- window functions
- cohort and retention analysis
- data quality checks
- indexing and performance thinking

## Project structure
```text
sql-analytics-lab/
  README.md
  schema/
    00_create_tables.sql
    01_constraints_indexes.sql
  queries/
    01_basics_refresh.sql
    02_joins_grouping.sql
    03_window_functions.sql
    04_cte_recursion.sql
    05_data_quality.sql
    06_performance.sql
  case_studies/
    retail_kpis/
      README.md
      kpis.sql
      cohort_retention.sql

## Goal
Show intermediate SQL ability that goes beyond basic SELECT statements and proves practical business and data value.

## Business scenario
This project uses a retail-style dataset with customers, products, orders, and order items to answer common business questions such as:
- monthly revenue
- top customers
- product performance
- customer retention
- data quality issues

## Highlights
- business KPI reporting
- customer retention logic
- ranking and running totals
- quality control queries
- performance-minded schema design

## Tech
SQL using PostgreSQL-style syntax

## Status
In progress — being expanded into a full analytics lab with documented case studies.

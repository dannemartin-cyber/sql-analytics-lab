# SQL Analytics Lab

Intermediate SQL portfolio project demonstrating practical analytics, reporting, and data engineering patterns.

---

## What this project covers

* joins and aggregations
* common table expressions (CTEs)
* window functions
* cohort and retention analysis
* data quality checks
* indexing and performance thinking

---

## Project structure

```
sql-analytics-lab/
  README.md
  schema/
    00_create_tables.sql
    01_seed_data.sql
    02_constraints_indexes.sql
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
```

---

## Goal

Show intermediate SQL ability that goes beyond basic `SELECT` statements and proves practical business and data value.

---

## Business Scenario

This project uses a retail-style dataset with customers, products, orders, and order items to answer common business questions such as:

* monthly revenue
* top customers
* product performance
* customer retention
* data quality issues

---

## Highlights

* business KPI reporting
* customer retention logic
* ranking and running totals
* quality control queries
* performance-minded schema design

---

## How to use this repo

1. Run `schema/00_create_tables.sql`
2. Run `schema/01_seed_data.sql`
3. Run `schema/02_constraints_indexes.sql`
4. Explore the files in `queries/`
5. Review the case study in `case_studies/retail_kpis/`

---

## Tech

SQL using PostgreSQL-style syntax

---

## Status

In progress — expanding with additional case studies and more advanced reporting patterns.

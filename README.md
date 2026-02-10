# Mobility Warehouse SQL Project

This project is a beginner-friendly **Data Engineering** pipeline built with **PostgreSQL** and **Docker**.  
It demonstrates a typical warehouse structure using layered modeling:

raw → staging → marts

The goal of this project is to simulate how real data pipelines are organized and validated.

---

## Architecture

The project follows a standard data engineering workflow:

1. **Raw layer**
   - Stores ingested data in its original format.

2. **Staging layer**
   - Cleans and converts data types.
   - Adds derived columns.

3. **Marts layer**
   - Aggregated tables ready for analytics.

4. **Data Quality Tests**
   - SQL tests to validate data consistency.

---

## Technologies Used

- PostgreSQL
- Docker
- SQL

---

## Project Structure

mobility-warehouse-sql/
│
├── docker-compose.yml
├── README.md
│
└── sql/
    ├── 01_schemas.sql
    ├── 02_raw.sql
    ├── 03_seed.sql
    ├── 04_stg.sql
    ├── 05_marts.sql
    └── 06_tests.sql


---

## How to Run the Project

### 1. Start PostgreSQL

```bash
docker compose up -d
```

### 2. Run the Pipeline

docker exec -i mobility_pg psql -U postgres -d mobility < sql/01_schemas.sql
docker exec -i mobility_pg psql -U postgres -d mobility < sql/02_raw.sql
docker exec -i mobility_pg psql -U postgres -d mobility < sql/03_seed.sql
docker exec -i mobility_pg psql -U postgres -d mobility < sql/04_stg.sql
docker exec -i mobility_pg psql -U postgres -d mobility < sql/05_marts.sql
docker exec -i mobility_pg psql -U postgres -d mobility < sql/06_tests.sql

### Example Query

To see aggregated results:
docker exec -it mobility_pg psql -U postgres -d mobility -c "SELECT * FROM marts.hourly_demand;"

### Data Quality

The project includes SQL tests that verify:

  . Valid trip duration

  . Non-negative distances

  . Valid payment types

  . Consistent totals

If all tests return 0 failed rows, the dataset passes validation.

### Purpose Of This Project

This project was created to practice:

  . SQL transformations

  . Data modeling

  . Layered architecture

  . Docker-based environments

  . Basic data validation

### Author: Rafael Onieva Molina


---

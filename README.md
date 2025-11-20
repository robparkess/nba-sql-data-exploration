# NBA SQL Data Exploration
*A structured SQL project exploring the NBA database using PostgreSQL.*

## Overview
This project explores an NBA database using SQL.  
It covers schema inspection, data quality checks, descriptive statistics, correlation analysis, and general exploratory queries commonly used in sports analytics.

The goal is to demonstrate strong SQL skills within a sports context — aligning with real workflows used by performance analysts, data engineers, and sports analytics teams.

---

## Database Structure
The database consists of four core tables:

- **games** – game-level information (teams, scores, dates, type)
- **players** – player information
- **player_statistics** – player stats for every game
- **teams** – team metadata

All queries were written in standard PostgreSQL.

---

## Objectives

### 1. Schema inspection
- Listing all tables  
- Inspecting columns and data types  
- Reviewing table constraints (PK, FK, CHECK)

### 2. Data quality checks
- Null analysis  
- Duplicate detection  
- Negative/invalid values  
- Abbreviation cleaning  

### 3. Descriptive analysis
- Summary counts  
- Most recent games  
- Unique game types  
- Scoring statistics (mean, median, stddev)

### 4. Performance insights
- Highest individual scoring performances  
- Correlation between minutes played and points  

---

## SQL Script
All queries are contained in:

`/sql/nba_data_exploration.sql`

---

## Key Findings (Examples)
A few highlights from the analysis:

- Strong correlation (0.741) between minutes played and points scored.  
- 161k+ missing minutes in the dataset — important for data cleaning.  
- Only 3,608 of 6,533 players have recorded statistics.  
- Negative values were detected (invalid), signalling data entry errors.  
- Highest individual game scoring performances can be identified through ordering logic.

---

## How to Run This Project
You can run the SQL on any PostgreSQL environment:

1. Create the `nba` schema  
2. Load the four base tables  
3. Run the queries in the order shown in the SQL script  

Tools used:

- DBeaver  
- PostgreSQL 15  

---

## Next Steps / Future Improvements
Potential enhancements include:

- Building visualisations in Python (Matplotlib / Plotly)  
- Adding player efficiency metrics  
- Building per-team summary reports  
- Creating stored procedures or views for commonly used queries  
- Automating the exploration using a Jupyter notebook  

---

## Author
**Rob Parkes**

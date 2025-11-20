-- NBA Database Exploration Project
-- Author: Rob Parkes
-- Description: A structured SQL exploration of the NBA database, including
-- schema inspection, data quality checks, descriptive statistics, and
-- exploratory analysis for player and game performance.

------------------------------------------------------------
-- 1. BASIC TABLE OVERVIEW
------------------------------------------------------------

-- List all tables in the NBA schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'nba'
ORDER BY table_name;

------------------------------------------------------------
-- 2. COLUMN INSPECTION
------------------------------------------------------------

-- View column names, data types and nullability for player_statistics
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'nba'
  AND table_name = 'player_statistics'
ORDER BY column_name;

------------------------------------------------------------
-- 3. CONSTRAINTS OVERVIEW
------------------------------------------------------------

-- List constraints (primary keys, foreign keys, checks) for every table
SELECT 
    table_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'nba'
ORDER BY table_name, constraint_type;

------------------------------------------------------------
-- 4. BASIC COUNTS & SUMMARY INFORMATION
------------------------------------------------------------

SELECT  
    (SELECT COUNT(*) FROM teams) AS total_teams,
    (SELECT COUNT(*) FROM players) AS total_players,
    (SELECT COUNT(*) FROM games) AS total_games,
    (SELECT COUNT(DISTINCT person_id) FROM player_statistics) AS unique_players_in_stats;

------------------------------------------------------------
-- 5. MOST RECENT GAMES
------------------------------------------------------------

SELECT 
    game_id,
    game_date,
    home_team_id,
    away_team_id,
    home_score,
    away_score
FROM games
ORDER BY game_date DESC
LIMIT 10;

------------------------------------------------------------
-- 6. UNIQUE GAME TYPES
------------------------------------------------------------

SELECT DISTINCT game_type
FROM games
WHERE game_type IS NOT NULL
ORDER BY game_type ASC;

------------------------------------------------------------
-- 7. NULL VALUE ANALYSIS
------------------------------------------------------------

SELECT 
    COUNT(*) FILTER (WHERE num_minutes IS NULL) AS null_num_minutes,
    COUNT(*) FILTER (WHERE points IS NULL) AS null_points,
    COUNT(*) FILTER (WHERE assists IS NULL) AS null_assists,
    COUNT(*) FILTER (WHERE rebounds_total IS NULL) AS null_rebounds_total
FROM player_statistics;

------------------------------------------------------------
-- 8. DUPLICATE RECORD CHECK
-- Check if any player appears more than once in the same game.
------------------------------------------------------------

SELECT  
    game_id,
    person_id,
    COUNT(*) AS occurrences
FROM player_statistics
GROUP BY game_id, person_id
HAVING COUNT(*) > 1;

------------------------------------------------------------
-- 9. TEAM ABBREVIATION CLEANING CHECK
------------------------------------------------------------

SELECT  
    LOWER(TRIM(team_abbrev)) AS team_abbrev_clean,
    COUNT(*) AS count
FROM teams
GROUP BY LOWER(TRIM(team_abbrev))
ORDER BY count DESC;

------------------------------------------------------------
-- 10. DESCRIPTIVE STATISTICS FOR PLAYER SCORING
------------------------------------------------------------

SELECT 
    COUNT(*) AS total_rows,
    MIN(points) AS min_points,
    MAX(points) AS max_points,
    AVG(points) AS mean_points,
    STDDEV(points) AS stddev_points,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY points) AS median_points
FROM player_statistics;

------------------------------------------------------------
-- 11. TOP INDIVIDUAL GAME PERFORMANCES (POINTS)
------------------------------------------------------------

SELECT 
    person_id,
    game_id,
    game_date,
    points
FROM player_statistics
WHERE points IS NOT NULL
ORDER BY points DESC;

------------------------------------------------------------
-- 12. CORRELATION ANALYSIS
-- Relationship between minutes played and points scored.
------------------------------------------------------------

SELECT CORR(num_minutes, points) AS correlation
FROM player_statistics;

------------------------------------------------------------
-- 13. DATA QUALITY CHECK: NEGATIVE VALUES
------------------------------------------------------------

SELECT *
FROM player_statistics
WHERE num_minutes < 0 OR points < 0;

-- schema.sql
-- Database schema for NBA SQL Data Exploration

CREATE SCHEMA IF NOT EXISTS nba;

-- =====================
-- Table: games
-- =====================
-- nba.games definition

-- Drop table

-- DROP TABLE nba.games;

CREATE TABLE nba.games (
	game_id int4 NOT NULL,
	game_date timestamp NULL,
	home_team_id int4 NULL,
	away_team_id int4 NULL,
	home_score int4 NULL,
	away_score int4 NULL,
	winner_team_id int4 NULL,
	game_type text NULL,
	attendance int4 NULL,
	arena_id int4 NULL,
	game_label text NULL,
	game_sublabel text NULL,
	series_game_number int4 NULL,
	person_id int4 NULL,
	first_name varchar(50) NULL,
	last_name varchar(50) NULL,
	birthdate varchar(50) NULL,
	last_attended varchar(50) NULL,
	country varchar(50) NULL,
	height int4 NULL,
	body_weight int4 NULL,
	guard bool NULL,
	"forward" bool NULL,
	center bool NULL,
	draft_year int4 NULL,
	draft_round int4 NULL,
	draft_number int4 NULL,
	win int4 NULL,
	home int4 NULL,
	num_minutes float4 NULL,
	points int4 NULL,
	assists int4 NULL,
	blocks int4 NULL,
	steals int4 NULL,
	field_goals_attempted int4 NULL,
	field_goals_mad int4 NULL,
	field_goals_percentage float4 NULL,
	three_pointers_attempted int4 NULL,
	three_pointers_made int4 NULL,
	three_pointers_percentage float4 NULL,
	free_throws_attempted int4 NULL,
	free_throws_made int4 NULL,
	free_throws_percentage float4 NULL,
	rebounds_defensive int4 NULL,
	rebounds_offensive int4 NULL,
	rebounds_total int4 NULL,
	fouls_personal int4 NULL,
	turnovers int4 NULL,
	plus_minus_points int4 NULL,
	CONSTRAINT games_pkey PRIMARY KEY (game_id)
);


-- nba.games foreign keys

ALTER TABLE nba.games ADD CONSTRAINT games_away_team_id_fkey FOREIGN KEY (away_team_id) REFERENCES nba.teams(team_id) ON UPDATE CASCADE;
ALTER TABLE nba.games ADD CONSTRAINT games_home_team_id_fkey FOREIGN KEY (home_team_id) REFERENCES nba.teams(team_id) ON UPDATE CASCADE;
ALTER TABLE nba.games ADD CONSTRAINT games_winner_team_id_fkey FOREIGN KEY (winner_team_id) REFERENCES nba.teams(team_id) ON UPDATE CASCADE;

-- =====================
-- Table: teams
-- =====================
-- nba.teams definition

-- Drop table

-- DROP TABLE nba.teams;

CREATE TABLE nba.teams (
	team_id int4 NOT NULL,
	team_city text NULL,
	team_name text NULL,
	team_abbrev text NULL,
	season_founded int4 NULL,
	season_active_till int4 NULL,
	league text NULL,
	CONSTRAINT teams_pkey PRIMARY KEY (team_id)
);

-- =====================
-- Table: players
-- =====================
-- nba.players definition

-- Drop table

-- DROP TABLE nba.players;

CREATE TABLE nba.players (
	person_id int4 NOT NULL,
	first_name text NULL,
	last_name text NULL,
	birthdate date NULL,
	last_attended text NULL,
	country text NULL,
	height text NULL,
	body_weight int4 NULL,
	guard bool NULL,
	"forward" bool NULL,
	center bool NULL,
	draft_year int4 NULL,
	draft_round int4 NULL,
	draft_number int4 NULL,
	CONSTRAINT players_pkey PRIMARY KEY (person_id)
);

-- =====================
-- Table: player_statistics
-- =====================
-- nba.player_statistics definition

-- Drop table

-- DROP TABLE nba.player_statistics;

CREATE TABLE nba.player_statistics (
	person_id int4 NOT NULL,
	game_id int4 NOT NULL,
	game_date timestamp NULL,
	game_type text NULL,
	game_label text NULL,
	game_sublabel text NULL,
	series_game_number int4 NULL,
	win bool NULL,
	home bool NULL,
	num_minutes float4 NULL,
	points int4 NULL,
	assists int4 NULL,
	blocks int4 NULL,
	steals int4 NULL,
	field_goals_attempted int4 NULL,
	field_goals_made int4 NULL,
	field_goals_percentage float4 NULL,
	three_pointers_attempted int4 NULL,
	three_pointers_made int4 NULL,
	three_pointers_percentage float4 NULL,
	free_throws_attempted int4 NULL,
	free_throws_made int4 NULL,
	free_throws_percentage float4 NULL,
	rebounds_defensive int4 NULL,
	rebounds_offensive int4 NULL,
	rebounds_total int4 NULL,
	fouls_personal int4 NULL,
	turnovers int4 NULL,
	plus_minus_points int4 NULL,
	field_goals_mad int4 NULL,
	CONSTRAINT player_statistics_pk PRIMARY KEY (game_id, person_id)
);


-- nba.player_statistics foreign keys

ALTER TABLE nba.player_statistics ADD CONSTRAINT player_statistics_game_id_fkey FOREIGN KEY (game_id) REFERENCES nba.games(game_id) ON UPDATE CASCADE;
ALTER TABLE nba.player_statistics ADD CONSTRAINT player_statistics_person_id_fkey FOREIGN KEY (person_id) REFERENCES nba.players(person_id) ON UPDATE CASCADE;

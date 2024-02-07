DROP DATABASE soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    assistant_ref_name VARCHAR NOT NULL,
    assistant_ref2_name VARCHAR NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    city VARCHAR NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    birthday DATE NOT NULL,
    height INTEGER NOT NULL,
    current_team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER NOT NULL REFERENCES teams,
    away_team_id INTEGER NOT NULL REFERENCES teams,
    location VARCHAR NOT NULL,
    match_date DATE NOT NULL,
    season_id INTEGER NOT NULL REFERENCES season,
    head_referee_id INTEGER NOT NULL REFERENCES referees,
    assistant_ref_id INTEGER NOT NULL REFERENCES referees,
    assistant_ref2_id INTEGER NOT NULL REFERENCES referees
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams,
    match_id INTEGER NOT NULL REFERENCES matches,
    result VARCHAR NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    match_id INTEGER NOT NULL REFERENCES matches
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    match_id INTEGER NOT NULL REFERENCES matches,
    team_id INTEGER NOT NULL REFERENCES teams
);

INSERT INTO referees (name, assistant_ref_name, assistant_ref2_name)
VALUES
('Bob Smith', 'Billy Joe Freeman', 'Sammy Davis Jr.'),
('Freddie Brown', 'Myron Jones', 'Ralph Steadman'),
('Burt Lancaster', 'Stanley Tucci', 'Brad Evans'),
('Saul Epstein', 'Fernando Jones', 'Bill Withers'),
('Michael Scott', 'Jim Halpert', 'Dwight Schrute');

INSERT INTO teams (name, city)
VALUES 
('Raleigh Raptors', 'Raleigh'),
('Charlotte Pansies', 'Charlotte'),
('Charleston Souvenirs', 'Charleston'),
('Boston Celtics', 'Boston'),
('Chicago Bulls', 'Chicago');

INSERT INTO season (start_date, end_date)
VALUES
('1995-01-01', '1995-06-01'),
('1996-01-01', '1996-06-01'),
('1997-01-01', '1997-06-06'),
('1998-01-01', '1998-06-06'),
('1999-01-01', '1999-06-06');

INSERT INTO players (name, birthday, height, current_team_id)
VALUES
('Brad Pitt', '1970-01-05', 72, 1),
('George Clooney', '1968-06-06', 70, 2),
('George Mason', '1974-08-15', 73, 3),
('Fred Astaire', '1980-07-17', 68, 4),
('Tiger Woods', '1985-10-16', 74, 5);

INSERT INTO matches (home_team_id, away_team_id, location, match_date, season_id, head_referee_id, assistant_ref_id, assistant_ref2_id)
VALUES
(1, 2, 'Raleigh', '1995-01-02', 1, 1, 1, 1),
(3, 4, 'Charleston', '1996-02-02', 2, 2, 2, 2),
(5, 1, 'Chicago', '1997-03-03', 3, 3, 3, 3),
(2, 3, 'Charlotte', '1998-04-04', 4, 4, 4, 4),
(4, 5, 'Boston', '1999-05-05', 5, 5, 5, 5);

INSERT INTO results (team_id, match_id, result)
VALUES 
(1, 1, 'W'),
(3, 2, 'W'),
(5, 3, 'W'),
(2, 4, 'W'),
(4, 5, 'W');

INSERT INTO goals (player_id, match_id)
VALUES 
(1, 1),
(2, 4),
(3, 2),
(4, 5),
(5, 3);

INSERT INTO lineups (player_id, match_id, team_id)
VALUES
(1, 1, 1),
(2, 4, 2),
(3, 2, 3),
(4, 5, 4),
(5, 3, 5);



DELETE DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    teamname TEXT NOT NULL,
    rank TEXT NOT NULL
);


INSERT INTO teams
(teamname, rank)
VALUES
('Philadelphia', 1),
('LAFC', 1),
('New York City', 3),
('Austin', 2),
('Cincinnati', 5),
('Inter Miami', 6),
('Real Salt Lake', 7),
('NY Red Bulls', 4),
('Toronto', 13),
('Orlando City', 7),
('Vancouver', 9);

CREATE TABLE games_league_dates
(
    id SERIAL PRIMARY KEY,
    game_date DATE NOT NULL
);

INSERT INTO games_league_dates
(game_date)
VALUES
('2022-10-01'),
('2022-10-02'),
('2022-10-05'),
('2022-10-09'),
('2022-10-15'),
('2022-10-16'),
('2022-10-17'),
('2022-10-20'),
('2022-10-23'),
('2022-10-30'),
('2022-11-05');

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

INSERT INTO players
(name, team_id)
VALUES
('Leon Flach', 1),
('Kwadwo Opoku', 2),
('Alexander Callens', 3),
('Sebastian Driussi', 4),
('Brandon Vazquez', 5),
('Ariel Lassiter', 6),
('Sergio Cordova', 7),
('Elias Monoel', 8),
('Lorenzo Insigne', 9),
('Robin Jansson', 10),
('Lucas Cavallini', 11);

CREATE TABLE ref_games
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    game_id INTEGER REFERENCES games_league_dates ON DELETE CASCADE
);

INSERT INTO ref_games
(name, game_id)
VALUES
('Ismail Elfath',1),
('ref 2',2),
('ref 3',3),
('ref 4',4),
('ref 5',5),
('Ismail Elfath',6),
('ref 3',7),
('ref 5',8),
('Ismail Elfath',9),
('ref 2',10),
('Ismail Elfath',11);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games_league_dates ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    number_th_goal TEXT NOT NULL
);

INSERT INTO goals 
(game_id,player_id,number_th_goal)
VALUES
(1,11,2),
(2,3,1),
(3,6,4),
(4,8,2),
(5,5,2),
(6,4,1),
(6,7,2),
(8,1,1),
(10,2,3);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games_league_dates ON DELETE CASCADE,
    team1 INTEGER REFERENCES teams ON DELETE CASCADE,
    team2 INTEGER REFERENCES teams ON DELETE CASCADE
    
);

INSERT INTO matches
(game_id,team1, team2 )
VALUES
(1,11,4),
(2,3,7),
(3,6,10),
(4,1,9),
(5,8,5),
(6,4,7),
(7,3,6),
(8,1,5),
(10,2,4),
(11,2,1);


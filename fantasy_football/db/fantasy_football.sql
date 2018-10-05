DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;

CREATE TABLE teams
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE players
(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  team_id INT4 references teams(id),
  position VARCHAR(255) not null,
  salary INT4 not null,
  injury VARCHAR(255) not null,
  goals INT4
)

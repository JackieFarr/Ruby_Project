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
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  team_id INT4 references teams(id),
  position VARCHAR(255),
  salary DECIMAL,
  injury VARCHAR(255),
  goals INT4
)

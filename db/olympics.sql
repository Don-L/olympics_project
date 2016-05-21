DROP TABLE participations;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;



CREATE TABLE nations(
id serial4 primary key,
nation_name VARCHAR(255)
);

CREATE TABLE athletes(
id serial4 primary key,
last_name VARCHAR(255),
first_name VARCHAR(255),
nation_id INT4 references nations(id) ON DELETE CASCADE
);

CREATE TABLE events(
id serial4 primary key,
event_name VARCHAR(255),
is_team BOOLEAN,
a_gold_id INT4 DEFAULT NULL references athletes(id) ON DELETE CASCADE,
a_silver_id INT4 DEFAULT NULL references athletes(id) ON DELETE CASCADE,
a_bronze_id INT4 DEFAULT NULL references athletes(id) ON DELETE CASCADE,
t_gold_id INT4 DEFAULT NULL references nations(id) ON DELETE CASCADE,
t_silver_id INT4 DEFAULT NULL references nations(id) ON DELETE CASCADE,
t_bronze_id INT4 DEFAULT NULL references nations(id) ON DELETE CASCADE
);

CREATE TABLE participations(
athlete_id INT4 references athletes(id) ON DELETE CASCADE,
event_id INT4 references events(id) ON DELETE CASCADE,
PRIMARY KEY (athlete_id, event_id)
);






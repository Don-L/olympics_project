DROP TABLE individual_event_results;
DROP TABLE team_event_results;
DROP TABLE participations;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;




CREATE TABLE nations(
id serial4 primary key,
nation_name VARCHAR(255)
);

ALTER TABLE nations ADD UNIQUE (nation_name);

CREATE TABLE athletes(
id serial4 primary key,
last_name VARCHAR(255),
first_name VARCHAR(255),
nation_id INT4 references nations(id) ON DELETE CASCADE
);

CREATE TABLE events(
id serial4 primary key,
event_name VARCHAR(255),
is_team BOOLEAN
);

ALTER TABLE events ADD UNIQUE (event_name);

CREATE TABLE participations(
id serial4 primary key,
athlete_id INT4 references athletes(id) ON DELETE CASCADE,
event_id INT4 references events(id) ON DELETE CASCADE
);

ALTER TABLE participations ADD UNIQUE (athlete_id, event_id);

CREATE TABLE team_event_results(
id serial4 primary key,
event_id INT4 references events(id) ON DELETE CASCADE,
gold_nation INT4 references nations(id) ON DELETE CASCADE CHECK(gold_nation != silver_nation),
silver_nation INT4 references nations(id) ON DELETE CASCADE CHECK(silver_nation != bronze_nation),
bronze_nation INT4 references nations(id) ON DELETE CASCADE CHECK(bronze_nation != gold_nation)
);

ALTER TABLE team_event_results ADD UNIQUE (event_id);

CREATE TABLE individual_event_results(
id serial4 primary key,
event_id INT4 references events(id) ON DELETE CASCADE,
gold_athlete INT4 references athletes(id) ON DELETE CASCADE CHECK(gold_athlete != silver_athlete),
silver_athlete INT4 references athletes(id) ON DELETE CASCADE CHECK(silver_athlete != bronze_athlete),
bronze_athlete INT4 references athletes(id) ON DELETE CASCADE CHECK(bronze_athlete != gold_athlete)
);

ALTER TABLE individual_event_results ADD UNIQUE (event_id);







-- Table Creation

CREATE TABLE cup_matches
(
  mid integer NOT NULL,
  round text,
  "year" integer,
  num_ratings integer,
  rating numeric,
  CONSTRAINT cup_matches_pkey PRIMARY KEY (mid)
)


CREATE TABLE played_in
(
  mid integer NOT NULL,
  "name" character varying NOT NULL,
  "year" integer,
  "position" integer,
  CONSTRAINT played_in_pkey PRIMARY KEY (mid, name),
  CONSTRAINT mid FOREIGN KEY (mid)
      REFERENCES cup_matches (mid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)


-- Data Insertion 

COPY cup_matches(round, year, num_ratings, rating) FROM 'Source Location' DELIMITER ',' CSV;

COPY played_in(mid, name, year, position) FROM 'Source Location' DELIMITER ',' CSV;


-- A.Q1

EXPLAIN ANALYZE SELECT * from played_in WHERE position=1;

-- A.Q3

CREATE INDEX a3 ON played_in(position);
EXPLAIN ANALYZE SELECT * from played_in WHERE position=1;

-- B.Q1

EXPLAIN ANALYZE SELECT * from played_in WHERE name like '%pele%';


-- B.Q3

CREATE INDEX B3 ON played_in(name);
EXPLAIN ANALYZE SELECT * from played_in WHERE name like '%pele%';

-- C.Q1

EXPLAIN ANALYZE SELECT * from cup_matches WHERE rating*3 > 20;

-- C.Q3

CREATE INDEX C3 ON cup_matches(rating);
EXPLAIN ANALYZE SELECT * from cup_matches WHERE rating*3 > 20

-- D.Q1

EXPLAIN ANALYZE SELECT * from cup_matches, played_in WHERE cup_matches.year=played_in.year;

-- D.Q2

CREATE INDEX d2 ON cup_matches(year) ;
EXPLAIN ANALYZE SELECT * from cup_matches, played_in WHERE cup_matches.year=played_in.year;


-- D.Q4

CREATE INDEX year_index_played_in ON played_in(year);
EXPLAIN ANALYZE SELECT * from cup_matches, played_in WHERE cup_matches.year=played_in.year;


-- E.Q1

Explain analyze SELECT * FROM cup_matches, played_in WHERE cup_matches.mid=played_in.mid; 
-- E.Q2

SET enable_hashjoin = OFF ;

EXPLAIN ANALYZE SELECT * FROM cup_matches, played_in WHERE cup_matches.mid=played_in.mid;

-- E.Q3

SET enable_mergejoin = OFF;

EXPLAIN ANALYZE SELECT * FROM cup_matches, played_in WHERE cup_matches.mid=played_in.mid;

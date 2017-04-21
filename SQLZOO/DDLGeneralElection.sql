--DDL General Election
--http://sqlzoo.net/wiki/DDL_General_Election

--2015 UK General Election using mysql: Import data on into mysql from CSV

DROP TABLE IF EXISTS ge;
CREATE TABLE ge(
  ons_id VARCHAR(10),
  ons_region_id VARCHAR(10),
  constituency_name VARCHAR(50),
  county_name VARCHAR(50),
  region_name VARCHAR(50),
  country_name VARCHAR(50),
  constituency_type VARCHAR(10),
  party_name VARCHAR(50),
  party_abbreviation VARCHAR(50),
  firstname VARCHAR(50),
  surname VARCHAR(50),
  gender VARCHAR(6),
  sitting_mp VARCHAR(3),
  former_mp VARCHAR(3),
  votes INT,
  `share` FLOAT,
  `change` VARCHAR(20),
  PRIMARY KEY(ons_id,firstname,surname)
);

LOAD DATA INFILE '/hocl-ge2015-results-full.csv' INTO TABLE ge COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SELECT COUNT(1) FROM ge WHERE gender = 'female'
SELECT surname,votes FROM ge WHERE constituency_name = 'Edinburgh South';

--2015 UK General Election Normalising Data: Create normalised tables

SELECT firstname,surname COUNT(1) FROM ge HAVING COUNT(1) > 1
SELECT firstname,surname,ons_id FROM ge GROUP BY firstname,surname,ons_id HAVING COUNT(1)>1;


DROP TABLE IF EXIST candidate;
DROP TABLE IF EXIST constituency;
DROP TABLE IF EXIST county;
DROP TABLE IF EXIST region;
DROP TABLE IF EXIST party;

CREATE TABLE party(
  party_id VARCHAR(50) PRIMARY KEY,
  party_name VARCHAR(50)
);

CREATE TABLE region(
  ons_region_id VARCHAR(10) PRIMARY KEY,
  region_name VARCHAR(50),
  country_name VARCHAR(50)
);

CREATE TABLE county(
  county_name VARCHAR(50) PRIMARY KEY,
  ons_region_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (ons_region_id) REFERENCES region(ons_region_id)
);

CREATE TABLE constituency(
  ons_id VARCHAR(10) PRIMARY KEY,
  constituency VARCHAR(50) NOT NULL UNIQUE,
  county_name VARCHAR(50) NOT NULL,
  contituency_type VARCHAR(10)
                   NOT NULL
                   CHECK (constituency_type IN ('county','borough')),
  FOREIGN KEY (county_name) REFERENCES county(county_name)
);

CREATE TABLE candidate(
  ons_id VARCHAR(10),
  firstname VARCHAR(50),
  surname VARCHAR(50),
  gender VARCHAR(10) NOT NULL,
  party_id VARCHAR(50) NULL,
  sitting_mp VARCHAR(3) NOT NULL CHECK (sitting_mp IN ('Yes','No')),
  former_mp VARCHAR(3) NOT NULL CHECK (former_mp IN ('Yes','No')),
  votes INT  NOT NULL,
  share FLOAT NOT NULL,
  `change` FLOAT NULL,
  PRIMARY KEY (ons_id,firstname,surname),
  FOREIGN KEY (ons_id) REFERENCES constituency(ons_id),
  FOREIGN KEY (party_id) REFERENCES party(party_id)
);

INSERT INTO constituency

SELECT DISTINCT ons_id, constituency_name, county_name, constituency_type
FROM ge;

INSERT INTO candidate
SELECT ons_id, firstname, surname, gender, NULLIF(party_abbreviation,'Ind'),
         sitting_mp,former_mp,votes,share,NULLIF(`change`,'')
FROM ge;
DROP TABLE ge;



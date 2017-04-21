--DDL General Election

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

LOAD DATA INFILE '/tmp/hocl-ge2015-results-full.csv' INTO TABLE ge COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
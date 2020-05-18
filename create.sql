CREATE DATABASE pans;
USE pans;

SET SQL_MODE="EMPTY_STRING_IS_NULL,STRICT_TRANS_TABLES";

CREATE TABLE data (
  id tinyint(3) NOT NULL AUTO_INCREMENT,
  name tinytext,
  warranty tinyint(3) NOT NULL DEFAULT 4,
  cost DECIMAL(5,2) NOT NULL,
  yearCost DECIMAL(3,1),
  url tinytext,
  key id (id)
);

LOAD DATA LOCAL INFILE '/home/seirra/Documents/pans/data.csv'
INTO TABLE data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE data SET warranty = DEFAULT WHERE warranty = 0;

UPDATE data SET yearCost = cost / warranty;

SELECT * from data ORDER BY yearCost;
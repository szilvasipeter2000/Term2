DROP SCHEMA IF EXISTS term2;
CREATE SCHEMA term2;

USE term2;

DROP TABLE IF EXISTS meteorite_landings;
CREATE TABLE meteorite_landings (
    name VARCHAR(255),
    id INT NOT NULL,
    nametype VARCHAR(255) DEFAULT NULL,
    recclass VARCHAR(255),
    mass_g INT DEFAULT NULL,
    fall VARCHAR(255),
    year INT,
    reclat DECIMAL(10,6) DEFAULT NULL,
    reclong DECIMAL(10,6) DEFAULT NULL,
    geolocation VARCHAR(255) DEFAULT NULL
);


-- load data into term2.meteorite_landings
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Meteorite_Landings.csv' 
INTO TABLE meteorite_landings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(@name, @id, @nametype, @recclass, @mass_g, @fall, @year, @reclat, @reclong, @geolocation)
SET
  name = nullif(@name, ''),
  id = @id,
  nametype = nullif(@nametype,''),
  recclass = nullif(@recclass,''),
  mass_g = nullif(@mass_g, ''),
  fall = nullif(@fall,''),
  year = nullif(@year, ''),
  reclat = nullif(@reclat, ''),
  reclong = nullif(@reclong, ''),
  geolocation = nullif(@geolocation, '');
  
  
  SELECT * FROM METEORITE_LANDINGS;
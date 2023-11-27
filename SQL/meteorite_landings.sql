DROP SCHEMA IF EXISTS term2;
CREATE SCHEMA term2;

USE term2;

DROP TABLE IF EXISTS meteorite_landings;
CREATE TABLE meteorite_landings (
    name VARCHAR(45),
    id INT NOT NULL,
    nametype VARCHAR(45),
    recclass VARCHAR(45),
    mass_gramms VARCHAR(255),
    mass_gramms_numeric FLOAT,
    fall VARCHAR(255),
    year INT,
    reclat FLOAT,
    reclong FLOAT,
    geolocation VARCHAR(45),
    states VARCHAR(45),
    counties VARCHAR(45),
    PRIMARY KEY(id)
);

-- load data into term2.meteorite_landings
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Meteorite_Landings.csv' 
INTO TABLE meteorite_landings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(@name, @id, @nametype, @recclass, @mass_grams, @fall, @year, @reclat, @reclong, @geolocation)
SET
  name = @name,
  id = @id,
  nametype = @nametype,
  recclass = @recclass,
  mass_gramms = REPLACE(@mass_grams, ',', ''),
  mass_gramms_numeric = NULLIF(REPLACE(@mass_grams, ',', ''), ''), -- Use NULLIF to handle empty strings
  fall = @fall,
  year = nullif(@year, ''),
  reclat = nullif(@reclat, ''),
  reclong = nullif(@reclong, ''),
  geolocation = nullif(@geolocation, '');
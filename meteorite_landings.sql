DROP SCHEMA IF EXISTS term2;
CREATE SCHEMA term2;

USE term2;

CREATE TABLE meteorite_landings
(name VARCHAR(45) NOT NULL,
id INT,
nametype VARCHAR(45) NOT NULL,
recclass VARCHAR(16) NOT NULL,
mass_gramms FLOAT NOT NULL,
fall VARCHAR(255),
year DATE NOT NULL,
reclat FLOAT NOT NULL,
reclong FLOAT NOT NULL,
geolocation VARCHAR(45) NOT NULL,
states VARCHAR(45) NOT NULL,
counties VARCHAR (45) NOT NULL,
PRIMARY KEY(id));

-- load data into term2.meteorite_landings
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\categories.csv' 
INTO TABLE categories
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;



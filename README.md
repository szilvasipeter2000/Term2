# Term2
Data Engineering 1 - Term Project 2
Team 5: Alain Merceron, Arbash Malik, Balint Thaler, Jo Kudo, Peter Szilvasi

https://ceu-economics-and-business.github.io/ECBS-5146-Different-Shapes-of-Data/term2/index.html


## Running the workflow
The steps to run the whole ETL are the following:
1. Run the data dumping SQL script to load the meteorites and GDP per capita data into MySQL.
2. Open the Knime workflow and connect to MySQL in Node 1 (MySQL connector) with the correct user and password to the instance where the data was loaded into in step 1.
3. Run the workflow
   Please note that due to the large volume of the data and the monthly limit on the APIs, we have inputed and limiter in Node 3 which takes a random subset of 100 from the meteorites data. This way the whole workflow (especially the API calls run significantly faster and one can test if the workflow performs as intended. If it is necessary to run the workflow for the full dataset, one only needs to delete this part from the configuration of Node 3.)

## Folder Contents
1. Final Files : Contains all the final files for the Term Project 2
   
2. Work Files : Contains all the work files that eventually resulted in the final view for our project<br>
   a. GRAPHS:<br>
      This folder contains all the graphs supporting the analysis between meteorite discoveries, population density and GDP.<br><br>
   b. MONGO DB SCREENSHOTS<br>
      A couple of screenshot from MongoDB Compass to execute simple queries (cleaning and date selection).<br><br>
   c. JSON GEOJSON FILES<br>
      All the JSON files produced with MongoDB and the associated GeoJSON files.<br><br>
   d. 2D MAPS BY TIME FRAME<br>
      A selection of 2D screenshots with various time frames showing how the numbers of discoveries increase over time and   how the geography evolves (e.g. no landing in Oman prior to 1950, early findings somehow in populated areas (Japan, Indian subcontinent, Europe... and farless so in recent years (deserts, antarctica)).<br>

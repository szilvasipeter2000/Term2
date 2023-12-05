# Term Project 2　

(The brackets are the parts we have to revise)

## Background and goals

For our analysis we were inspired by a data visualisation created by Milan Janosov on meteorite landings (https://www.linkedin.com/posts/milan-janosov_30daymapchallenge-gis-datascience-activity-7125409941577695232-s4oi/?utm_source=share&utm_medium=member_desktop). His map shows where the different meteorites have landed and posits that there seem to be more meteorites in areas with higher population density. We further check if a similar connection is existing between the countries' economic development and meteorite spottings - building on the assumption that richer countries have more budget to spend on scientific equipment that may aid them in this endeavour. 

## Data

1. The dataset on meteorites is downloaded from the website of NASA and then loaded into SQL. The dataset contains more than 45 thousand observations. The table contains information (among others) on the id, name and mass of the meteorite, its size (measured in weight in grams), the year when it was found and the exact coordinates of its location in longitude and latitude. The exact structure of the table is visible on the EER diagram. There are no missing values in the table, however the location columns include 0 values. The data was loaded into MySQL.
 https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh

2. For population density we are using the dataset of the World Bank which we access through and API (which we describe later) in the Knime workflow. This data includes the country name, the country code and the population density value.
3. For GDP per capita we are also using the World Bank database containing again country name, country code and the GDP per capita value in USD. This data was also loaded into MySQL.


## The ETL workflow

We have created the ETL workflow using KNIME Analytics. 

5. BigDataCloud api for geocoding

   It is used to change the geology into the another information such as the name of countries.
   
   (link)

6. GDP per capita for 2007 which is the average year of observations after 2000

    https://opencagedata.com/api

   
## Procedure (more concisely)
 
### 1. Meteorites and population density

The procedure was following: 
- Use random subset excluding any rows where the latitude value is smaller than -60 to exclude Antarctica as it has loads of meteorites but population is 0. 
- Clean the data from missing values and filtering out some columns that are not needed.
- Use a geocoding API that converts coordinates of longitude and latitude to a country name
    -  API that can "decode" geodata with longitudes and latitudes to country name merge the 2 datasets on country and year
- get the data in a JSON with the API
- use the worldbank API to get the data of populatipon density and countries
- create a bar chart of the number of meteorites based on population density


### 2. Meteorites and GDP per capita 
- get the data of  GDP per capita by country for 2007 from WorldBank data and make MySQL file
- connect the GDP/capita data from MySQL in knime
- connect GDP/capita and number of meteorites to create histogram
- clean country name in GDP per capita dataset
- query and Joined gdpcapita and meteorite dataset in Knime
- create a bar chart of the number of meteorites based on GDP per capita


## Critital method for this analysis
- a random subset of 100 is used to speed up knime.
- (other things if any)


## Data model (ER diagram for RDBMS)
(entity relation for RDBMS)

## Analytics and/or visualization (needs explananion of x, y axis, and some suggestions from results)

The following graphs shows the number of meteorites based on population density and GDP per capita. 

### The number of meteorites based on GDP per capita

![GDP_per_capita_all](images/GDP_per_capita_all.png)

### The number of meteorites based on GDP per capita excluding Oman

![images/GDP_per_capita_Oman-excludedb](images/GDP_per_capita_Oman-excluded.png)

### The number of meteorites based on population density

![pop_density_all](images/pop_density_all.png)

### The number of meteorites based on population density excluding Oman

![pop_density_Oman-excluded](images/pop_density_Oman-excluded.png)

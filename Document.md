# Term Project 2　

(The brackets are the parts we have to revise)

## Background
According to the article written by Milan Janosov, it turns out that 35% of the meteorites were recorded after 2000 and 98% after 1899. The question is that, do meteors observations really target areas with higher population density? Or do the meteoros landing have been observed where the country has more developed economy?　

The link: https://www.linkedin.com/posts/milan-janosov_30daymapchallenge-gis-datascience-activity-7125409941577695232-s4oi/?utm_source=share&utm_medium=member_desktop

## Goal

1. Checking a connection between the number of meteorites and the population density

2. Another assumption is that more developed countries are better at spotting meteorites due to more spending on fancy equipment. Thus the relation between meteorites and GDP per capita is also checked.

## Data

1. meteorite data as dataset:

    This comprehensive data set from The Meteoritical Society contains information on all of the known meteorite landings. The Fusion Table is collected by Javier de la Torre and we've also provided an XLS  file that consists of 34,513 meteorites and includes the following fields:
    1. place
    2. type_of_meteorite
    3. mass_g
    4. fell_found
    5. year
    6. database
    7. coordinate_1
    8. coordinates_2
    9. cartodb_id
    10. created_at
    11. updated_at
    12. year_date
    13. longitude
    14. latitude
    15. geojson


    https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh


2. data from worldbank with country and population density data by year:

   This can be filtered for observations after 2000. And the average year of 2010 is selected.

   http://api.worldbank.org/v2/country/usa/indicator/EN.POP.DNST?date=2010

3. BigDataCloud api for geocoding

   It is used to change the geology into the another information such as the name of countries.
   
   (link)

5. GDP per capita for 2007 which is the average year of observations after 2000

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

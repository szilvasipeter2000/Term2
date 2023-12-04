# Term Project 2　(The brackets are the parts we have to revise)


## Goal

1. Checking a connection between the number of meteorites and the population density

2. Another assumption is that more developed countries are better at spotting meteorites due to more spending on fancy equipment. Thus the relation between meteorites and GDP per capita is seen.

(add: why it makes sense, why we think of a possible connection between the variables)

### Data


1. meteorite data as dataset:
    
    (add: what is it about, how it looks like, what it contains, what the source)


    https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh


2. data from worldbank with country and population data (including area and population to calculate pop density) as dataset 2: 

    (add: what is it about, how it looks like, what it contains, what the source)

    http://api.worldbank.org/v2/country/usa/indicator/EN.POP.DNST?date=2010 

   (Using the year and the country to pull in population density with this API. This can be filtered for observations after 2000.)

3. GDP per capita for 2007 which is the average year of observations after 2000

    (add what is it about, how it looks like, what it contains, what the source)

    (the API of worldbank)


## Technical choices (more concisely)

### 1. Meteorites and population density

The procedure afterwards was following: 
- Use random subset excluding any rows where the latitude value is smaller than -60 to exclude Antarctica as it has loads of meteorites but population is 0. 
- clean( the data from missing values
- filter out some columns that are not needed
- convert the numerical values to strings (as the API needs a string input)
- use another geocoding API that converts coordinates of longitude and latitude to a country name
    -  API that can "decode" geodata with longitudes and latitudes to country name merge the 2 datasets on country and year
    
        https://opencagedata.com/api 
- get the data in a JSON with the API
- use the worldbank API
- create a bar chart (The number of meteorites based on population density)



### 2. Meteorites and GDP per capita 
- input GDP per capita to MySQL for 2007 from WorldBank data
- connect the GDP/capita data in knime
- connect GDP/capita and number of meteorites to create histogram
- clean country name in gdpcapita dataset
- query and Joined gdpcapita and meteorite dataset in Knime
- create a bar chart (AVG meteorite value by country)

## Data model (ER diagram for RDBMS)
(entity relation for RDBMS)

## Procedure
- use a random subset of 100 to speed up knime

## Analytics and/or visualization (needs explananion of x, y axis)

### The number of meteorites based on GDP per capita

![GDP_per_capita_all](images/GDP_per_capita_all.png)

### The number of meteorites based on GDP per capita excluding Oman

![images/GDP_per_capita_Oman-excludedb](images/GDP_per_capita_Oman-excluded.png)

### The number of meteorites based on population density

![pop_density_all](images/pop_density_all.png)

### The number of meteorites based on population density excluding Oman

![pop_density_Oman-excluded](images/pop_density_Oman-excluded.png)

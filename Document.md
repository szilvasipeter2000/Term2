# Term Project 2　

(The brackets are the parts we have to revise)

## Background and goals

For our analysis we were inspired by a data visualisation created by Milan Janosov on meteorite landings (https://www.linkedin.com/posts/milan-janosov_30daymapchallenge-gis-datascience-activity-7125409941577695232-s4oi/?utm_source=share&utm_medium=member_desktop). His map shows where the different meteorites have landed and posits that there seem to be more meteorites in areas with higher population density. We further check if a similar connection is existing between the countries' economic development and meteorite spottings - building on the assumption that richer countries have more budget to spend on scientific equipment that may aid them in this endeavour. 

## Data

1. The dataset on meteorites is downloaded from the website of NASA and then loaded into SQL. The dataset contains more than 45 thousand observations. The table contains information (among others) on the id, name and mass of the meteorite, its size (measured in weight in grams), the year when it was found and the exact coordinates of its location in longitude and latitude. The exact structure of the table is visible on the EER diagram. There are no missing values in the table, however the location columns include 0 values. The data was loaded into MySQL.
 https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh

2. For population density we are using the dataset of the World Bank which we access through and API (which we describe later) in the Knime workflow. This data includes the country name, the country code and the population density value.
3. For GDP per capita we are also using the World Bank database containing again country name, country code and the GDP per capita value in USD. This data was downloaded and also loaded into MySQL.
4. To connect the meteorite dataset and the country related data we will use the API of BigDataCloud to convert the coordinates to country codes and names. 

## Assumptions for the ETL and the analysis
Upon first inspection of the dataset we see that it contains a large number of observations in Antarctica. The GDP values and the population density values are likely to be extreme as well, and Antarctica is a huge scientific hub where we assume the meteorite spottings are incredibly overrrepresented compared to a country with a similar size, we will drop this continent from our analysis. We will do this by filtering out any observation where the latitude coordinates are smaller than -60.
Furthermore, we will focus on meteorites that have been observed in or after 2000. This will make the data density much higher, as older data points are more likely to have missing data for GDP per capita and/or population density. Furthermore, country borders are more likely to have changed as we go longer back in time, which the reverse geocoding API would not be able to reflect, therefore further skewing our dataset. After applying both filters, we have ~4500 observations left to analyse.
Lastly, to make the analysis somewhat simpler for the GDP per capita values we will use a singular year's results (which is 2007). 2007 is the average of the meteorite spotting years in the subset of our data with observations in or after 2000 only. This again is a simplification but we are less interested in the absolute figures of GPD per capita but rather their relative position. We assume that the year 2007 will be more or less similar to each observations respective year's data for both GDP per capita.


## The ETL workflow

We have created the ETL workflow using KNIME Analytics. Once the meteorite data and the GDP per capita data is loaded in MySQL, we connect to them in Knime. Once loaded we drop the unnecessary columns and filter the meteorite data of values where the longitude variable is 0 leaving only observations with valid location data in the table. We then combine the year, longitude and latitude variables to create the https format API for the reverse geocoding. The API calls have a delay of 100ms to ensure that they are not blocked. As we are using a free API, it has a limit of 50,000 calls per month. The API is then called which returns us a JSON file. We then extract the country and country code data into the table. We drop values where the API was unable to find the necessary values and drop columns with unneded data. Then we create the next https API format for the World Bank API using the country code and the year. This API again returns a JSON from which we extract the necessary data for population density and input it into the table.
Paralel to this part of the workflow, we also read in the GPD per capita data from MySQL, we clear it of missing values and merge it with the other table with the enriched meteorite table. This results in a total of ~4300 observations. We then use this data table to create two histograms and check for correlations. 

## The results
Upon first inspection of the histograms we observed a strange extreme value both in the GDP per capita and population density. Upon inspecting the data table, we spot that there are a huge number of observations for one single country: Oman, mostly in the same year (2001). We have conducted a quick research to understand this phenomenon, and have found that the administration of Oman has created a program in 2001 that has a campaign like scientific program which includes the search for meteorites in the country. Its success is clearly visible in the data, as this country has more around 2500 observations from our table which is more than half of the table. As this program is clearly a unique thing, we have decided that it destroys our analysis and we need to drop Oman from the table. The newly created histograms show a mixed picture. To get a more quantitative feel on the connection between our variables, we created a correlation matrix, which tells us that there is a weak positive correlation between both meteorite numbers and population density (r = 0.1251) as well as between meteorite numbers and GDP per capita (r = 0.1391). This means that our initial assumptions seem to be true in this dataset.


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

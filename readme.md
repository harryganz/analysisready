## analysisready - A package in R for producing analysis ready RVC data ##
This package is really intended as a tool for data managers at UM-RSMAS to produce analysis ready csv files

## Installation ##
### From Source File ###
To install the latest compiled version of analysis ready.

1. Download the binary package zip file located in the root of this repository. It is named something like analysisready\_0.1.1.zip
 * Click on the file, then click on the RAW button to download it
2. Use the install.packages command to install the package in R
 * Open R
 * Enter the following
 
 ```
 ## Replace path_to_source_file with the directory location
 ## of the binary source zip file you just downloaded
 install.packages('path_to_source_file/analysisready_0.1.1.zip', repos = NULL)
 ```

3. To check that it is installed try to load it

```
library(analysisready)
```

If it is installed properly that should not return any errors

### Using devtools package ###
If you don't have devtools installed, you can install it by entering the following in R

```
install.packages('devtools')
```

To install the latest development version of the analysisready package, just type the following in R

```
require(devtools)
devtools::install_github('harryganz/analysisready/analysisready')
```

## Using this package ##
This package contains only one public function: toAr2. It does pretty much what you would think, convert AR1.0 data to AR2.0 data. 
The following example should demonstrate how to use it:
```
## Read in 1.0 data
fk2008_1.0  <- read.csv('fk2008_1.csv');

# Variables names should be uppercase
names(fk2008_1.0) <- toupper(names(fk2008_1.0));

## Load lookup table of species which are to be kept
## if seen after 10 minutes. This data.frame should
## contain at least two columns. One called
## SPECIES_CD with the species codes and one
## called KEEP_10MIN with a 1 if the species is 
## to be kept if seen after 10 minutes and a 0
## otherwise
keep10  <- read.csv('keep10.csv');

## Run the conversion
fk2008_2.0  <- toAr2(fk2008_1.0, region = "FLA KEYS",
  lookup = keep10);

## Save the results
write.csv(fk2008_2.0, 'fk2008_2.csv', row.names = FALSE);
```
Use the help file for toAr2 if you need more information. 

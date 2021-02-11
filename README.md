## List of small functions
### - fersource
#### Description
Source functions from any of my repositories.
Copy and run this at the begining of your code:<br />

###### source('https://raw.githubusercontent.com/FerAguate/SmallRFunctions/master/fersource.R')

#### Usage
fersource(myfunction)
#### Arguments
myfunction = character or string of characters with function names. If myfunction == 'all', all functions will be sourced.


### - load_get
#### Description
Load one object from a RData file.
#### Usage
load_get(f, ...)
#### Arguments
f = a connection or a character string giving the name of the file to load.<br />
index = integer indicating the position of the object to load. By default = 1 (reference to the first object in the RData file).

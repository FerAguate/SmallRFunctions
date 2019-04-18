## List of small functions
### - fersource
#### Description
Source functions from any of my repositories.
#### Usage
fersource(myfunction)
#### Arguments
myfunction = a vector with functions names.

### - create_color_vector
#### Description
Creates a vector of colors matching each category of the imput vector.
#### Usage
create_color_vector(vector, ...)
#### Arguments
vector = a vector of numbers or characters with more than one category.<br />
colors = colors for each category in increasing order.
#### Details
Function useful when adding colors by category in the base function 'plot'.
#### Example
```R
x <- rnorm(1000)
plot(x, col = create_color_vector(x > 0))
```

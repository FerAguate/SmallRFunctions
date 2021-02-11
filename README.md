### Small functions to make your life easier

Copy and run this at the begining of your code:<br />
```r
source('https://raw.githubusercontent.com/FerAguate/SmallRFunctions/master/aguatesource.R')
```
Use this function to source any (or all) small functions.

```r
aguatesource(myfunction)
```

The argument of this function is: 
myfunction = character or string of characters with function names. If myfunction == 'all', all functions in the repository will be loaded.


### List of functions:

```r
create_color_vector()
load_from_rdata()
mybiplot()
grow_tree()
add_legend()
```


hcandersenr
===========

An R Package for H.C. Andersens fairy tales
-------------------------------------------

This package contains (most) the complete texts of 157 fairy tales of H.C. Andersen, in a number of different languages. formatted to be convenient for text analysis. Where each text is formatted to elements of about 80 characters. The package contains:

-   `hcandersen_da`: 139 out of the 157 Fairy tales in Danish
-   `hcandersen_de`: 156 out of the 157 Fairy tales in Danish
-   `hcandersen_en`: 157 out of the 157 Fairy tales in Danish
-   `hcandersen_es`: 157 out of the 157 Fairy tales in Danish
-   `hcandersen_fr`: 61 out of the 157 Fairy tales in Danish
-   `EK`: dataframe with ID, names and publishing dates

There is also a function `hca_fairytales()` that returns a tidy data frame of fairy tales in the package.

Avaliable fairytales
--------------------

``` r
library(hcandersenr)
library(tidyverse)
hca_fairytales() %>% 
  select(book, language) %>% 
  unique() %>% 
  ggplot(aes(language, book)) + 
  geom_raster(alpha = 0.3) +
  scale_x_discrete(position = "top")
```

![](README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-1.png)

Installation
------------

To install the development version from Github:

``` r
library(devtools)
install_github("EmilHvitfeldt/hcandersenr")
library(hcandersenr)
```

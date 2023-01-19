# An introduction to pipeline tools

This half-day course explains why pipeline tools such as [make](https://www.gnu.org/software/make/), [snakemake](https://snakemake.readthedocs.io/en/stable/tutorial/short.html) and [targets](https://books.ropensci.org/targets/) are indispensible tools in (reproducible) data analyses.

There is a short lecture [here](presentations/pipeline_tools.html).

Applied example: there are two folders:

- [this](r_project_blank_slate/) contains a blank R project along with the data in a subdirectory, which can be a starting point for developing a reproducible data analysis
- [this](r_project_done/) contains a completed R project along with the required `_targets.R` file 

## Steps of analysis

1. Get and clean data
2. Fit a model: `ozone ~ temperature`
3. Plot the model's fit versus data
4. Diagnose any issues with model fit; if necessary, change the model and rerun the above steps

## Applied target steps

1. clone repo and double click on the `r_project_blank_slate.Rproj` icon to launch `RStudio`
2. install `targets` package via `install.packages("targets")`
3. type `use_targets()` in the console, which should create an `_targets.R` file
4. add `tidyverse` as a package under the `package` item in the `_targets.R` file
5. comment out `tar_source`
6. remove the list of example targets that have been generated in the `_targets.R` file (but keep the `list` which has these targets within it)
7. create a folder called `scripts` that has in it a file called `clean_data.R`
8. in `clean_data.R` write a function that takes the `data\raw\airquality.csv` file, renames the columns using only lowercase letters and removes any rows that have `NA` values in them
9. in the `_targets.R` file, add a target for the cleaned data via `tar_target(data_airquality_cleaned, clean_data(filename))`
10. in the `_targets.R` file, create a leaf target for the file itself via `tar_target(filename, "data\raw\airquality.csv", format="file")`
11. visualise the network via `tar_visnetwork(names=data_airquality_cleaned)`
12. clean the data using `tar_make()`
13. revisualise the network to check that everything is up to date
14. type `tar_read(data_airquality_cleaned)` in the console to view the cleaned data
14. continue with this methodology to create a full data analysis

## Prerequisites

- basic R skills (although not essential)
- some experience of having done data analysis

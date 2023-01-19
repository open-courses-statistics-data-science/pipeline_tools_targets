# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tidyverse"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
# tar_source()
source("scripts/clean_data.R") # Source other scripts as needed. # nolint
source("scripts/fit_model.R")
source("scripts/plot_model.R")

# Replace the target list below with your own:
list(
  tar_target(filename_airquality, "data/raw/airquality.csv",
             format = "file"),
  tar_target(data_cleaned_airquality, clean_data(filename_airquality)),
  tar_target(model, fit_model(data_cleaned_airquality)),
  tar_target(graph, plot_model(data_cleaned_airquality, model)),
  tar_target(file_graph, {
    ggsave("outputs/temp_vs_ozone.pdf", graph);
    "outputs/temp_vs_ozone.pdf"
  })
)

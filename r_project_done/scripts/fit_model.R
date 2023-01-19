
fit_model <- function(data_cleaned_airquality) {
    lm(ozone ~ temp + I(temp^2), data_cleaned_airquality)
}
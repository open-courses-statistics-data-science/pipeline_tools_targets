
plot_model <- function(data_cleaned_airquality, model) {
  
  # predict ozone
  ozone_pred <- predict(model)
  df_pred <- tibble(temp=data_cleaned_airquality$temp,
                    ozone=ozone_pred,
                    type="simulated")
  
  ggplot(data_cleaned_airquality, aes(x = temp, y = ozone)) +
    geom_point() +
    geom_line(data=df_pred)
}
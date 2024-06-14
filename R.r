options(repos = c(CRAN = "https://cloud.r-project.org"))
library(lubridate)
library(ggplot2)
library(viridis) 
data <- read.csv("/Users/riyarox/Downloads/MSDS-Orientation-Computer-Survey(in).csv")
data$Timestamp <- as.character(data$Timestamp)
data$datetime <- mdy_hm(data$Timestamp)
data$hour <- hour(data$datetime)
hist <- ggplot(data, aes(x = hour)) +
  geom_histogram(binwidth = 1, fill = viridis(1), color = "black") + 
  labs(title = "Survey Submissions by Hour of Day (disregarding date or year)",
       x = "Hour of Day in Military Time",
       y = "Number of Submissions") +
  theme_minimal() +
  theme(axis.text = element_text(size = 20),plot.title = element_text(size = 20, face = "bold"))

print(hist)

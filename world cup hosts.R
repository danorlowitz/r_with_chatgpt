library(tidyverse)

dates <- c("1994", "1998", "2002", "2006", "2010", "2014", "2018")
hosts <- c("USA", "France", "Japan-South Korea", "Germany", "South Africa", "Brazil", "Russia")
attendance <- c(100, 200, 500, 200, 250, 300, 500)

df <- data.frame(dates, hosts, attendance)

ggplot(df, aes(x = dates, y = attendance)) +
  geom_col() +
  labs (x = "World Cup", y = "Attendance", fill = hosts)
# Load necessary libraries
library(ggplot2)
library(dplyr)

# Create example data frame with movie release dates in the U.S. and Japan
movie_releases <- data.frame(
  movie = c("Star Wars: Episode I - The Phantom Menace", "Star Wars: Episode II - Attack of the Clones", "Star Wars: Episode III - Revenge of the Sith", "Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode VI - Return of the Jedi", "Star Wars: Episode VII - The Force Awakens", "Star Wars: Episode VIII - The Last Jedi", "Star Wars: Episode IX - The Rise of Skywalker", "Rogue One: A Star Wars Story", "Solo: A Star Wars Story"),
  us_release = c("1999-05-19", "2002-05-16", "2005-05-19", "1977-05-25", "1980-06-20", "1983-05-25", "2015-12-18", "2017-12-15", "2019-12-20", "2016-12-16", "2018-05-25"),
  japan_release = c("1999-07-10", "2002-07-13", "2005-07-09", "1978-06-30", "1980-06-28", "1983-07-02", "2015-12-18", "2017-12-15", "2019-12-20", "2016-12-16", "2018-06-29")
)

# Convert movie release dates to Date objects
movie_releases <- movie_releases %>%
  mutate(
    us_release = as.Date(us_release),
    japan_release = as.Date(japan_release)
  )

# Calculate the difference in release dates between the U.S. and Japan
movie_releases <- movie_releases %>%
  mutate(
    release_diff = japan_release - us_release
  )

# Create a horizontal box plot showing the difference in release dates between the U.S. and Japan
ggplot(movie_releases, aes(x = release_diff, y = movie)) +
  geom_boxplot(orientation = "h") +
  xlab("Release date difference (U.S. - Japan)") +
  ylab("Movie") +
  # Sort movies in chronological order
  coord_flip(ylim = c("Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode VI - Return of the Jedi", "Star Wars: Episode I - The Phantom Menace", "Star Wars: Episode II - Attack of the Clones", "Star Wars: Episode III - Revenge of the Sith", "Rogue One: A Star Wars Story", "Star Wars: Episode VII - The Force Awakens", "Star Wars: Episode VIII - The Last Jedi", "Solo: A Star Wars Story", "Star Wars: Episode IX - The Rise of Skywalker"))

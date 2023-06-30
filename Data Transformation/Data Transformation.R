The provided R code performs web scraping on the IMDb website to extract information about the top 50 action TV shows sorted by popularity. Here's a summary of the techniques used in the code:

1.Libraries: The code begins by loading the required libraries for web scraping and data manipulation, namely rvest, tidyverse, and stringr.

2.URL: The URL for the IMDb webpage containing the desired TV show information is assigned to the variable url.

3.Web Scraping:

  3.1 TV Show Names: The read_html() function from the rvest library is used to read the HTML content of the webpage specified by the url variable. The html_nodes() function is then used to extract the HTML nodes corresponding to the TV show names (located within the <h3> tags with class "lister-item-header"). The html_text2() function is applied to extract the text content of the selected nodes, and the results are stored in the tv_show_name variable.
  3.2 Ratings: Similar to the TV show names, the code extracts the HTML nodes containing the ratings for each TV show.
  3.3 Votes: The code extracts the HTML elements containing the number of votes for each TV show.

4.Data Frame Creation:
The data.frame() function is used to create a data frame called imdb_df with three columns: tv_show_name, ratings, and votes. The previously extracted information is assigned to these columns.
Data Cleaning:

5.The str_remove() function from the stringr library is used to remove the "Votes: " text from the votes column in the imdb_df data frame.

#Homework 1: IMDB web scraping
library(rvest)
library(tidyverse)
library(stringr)

#Top 50 Action TV shows sorted by popularity (desc)
url <- "https://www.imdb.com/search/title/?title_type=tv_series,tv_miniseries&genres=action"


tv_show_name <- url %>%
  read_html() %>%
  html_nodes("h3.lister-item-header a") %>%
  html_text2()

ratings <- url %>%
  read_html() %>%
  html_nodes("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

votes <- url %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2()

# Apply to data frame 
imdb_df <- data.frame(tv_show_name, ratings, votes)


# Remove the column names from votes columns
imdb_df$votes <- str_remove(imdb_df$votes, "Votes: ")


View(imdb_df)


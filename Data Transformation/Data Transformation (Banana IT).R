The provided R code performs web scraping on the IMDb website to extract information about the top 50 action TV shows sorted by popularity. Here's a summary of the techniques used in the code:

1.Libraries: The code begins by loading the required libraries for web scraping and data manipulation, namely rvest, tidyverse, and stringr.

2.URL: The URL for the IMDb webpage containing the desired TV show information is assigned to the variable url.

3.Web Scraping:

  3.1 TV Show Names: The read_html() function from the rvest library is used to read the HTML content of the webpage specified by the url variable. The html_nodes() function is then used to extract the HTML nodes corresponding to the TV show names (located within the <h3> tags with class "lister-item-header"). The html_text2() function is applied to extract the text content of the selected nodes, and the results are stored in the tv_show_name variable.
  3.2 Ratings: Similar to the TV show names, the code extracts the HTML nodes containing the ratings for each TV show.
  3.3 Votes: The code extracts the HTML elements containing the number of votes for each TV show.

4.Data Frame Creation:
The data.frame() function is used to create a data frame called imdb_df with three columns: tv_show_name, ratings, and votes. The previously extracted information is assigned to these columns.

5.Data Cleaning:
The str_remove() function from the stringr library is used to remove the "Votes: " text from the votes column in the imdb_df data frame.

# Homework 2: Best Seller Product ON Febury2023[Banana IT]

# Load libraries
library(rvest)
library(tidyverse)
library(stringr)

# Load database
url <- "https://www.bnn.in.th/th/mkt/best-seller"
page <- read_html(url)

product_names <- page %>%
  html_elements("div.product-name") %>%
  html_text2()


product_prices <- page %>%
  html_nodes("div.product-price") %>%
  html_text2()

# Combine the data into a data frame
best_seller_df <- data.frame(product_names, product_prices)

# Print the resulting data frame
View(best_seller_df)

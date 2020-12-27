library(quanteda)
library(readtext)

#https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/blob/master/en
con <- file("profane words.txt","r")
profane_words_list <- readLines(con,n=-1,encoding="UTF-8")
close(con)

tokenization <- function(filename)
{
  file_tokens <- readtext(file = filename,encoding = "UTF-8") %>% corpus() %>% tokens()
  file_tokens
}

remove_profane_words <- function(file_tokens)
{
  tokens_remove(file_tokens,pattern = profane_words_list)
}
# install.packages("tm")
# install.packages("SnowballC")
library(tm)
str(sms_spam)
sms_spam$type <- as.factor(sms_spam$type)
str(sms_spam)

sms_corpus <- VCorpus(VectorSource((sms_spam$text)))
print(sms_corpus)

inspect(sms_corpus[1:2])

as.character(sms_corpus[[1]])

lapply(sms_corpus[1:2], as.character)

sms_corpus_clean <- tm_map(sms_corpus, content_transformer(tolower))
as.character(sms_corpus[[1]])
as.character(sms_corpus_clean[[1]])

sms_corpus_clean <- tm_map(sms_corpus_clean, removeNumbers)
as.character(sms_corpus[[100]])
as.character(sms_corpus_clean[[100]])

stopwords()

sms_corpus_clean <- tm_map(sms_corpus_clean, removeWords, stopwords())
as.character(sms_corpus[[100]])
as.character(sms_corpus_clean[[100]])

# sms_corpus_clean <- tm_map(sms_corpus_clean, removePunctuation)
# replaceFunctuation <- function(x) {
#   gsub()
# }
library(SnowballC)
wordStem(c("learn", "learning", "learned"))


# sms_corpus_clean <- tm.map(sms_corpus_clean, stripWhitespace())
library(rjson)
source('sentimo/get_sentiments.R')

#Initial the configuration
config <- fromJSON(file='config.json')

url <- config$url
pid <- config$token
timeout <- config$timeout

response <- retrieve_sentiment(dataIds = '165571,23452', token = pid, domain='general,company-eval',url = url)
print(response)

response <- retrieve_sentimo(dataIds = 165571, token = pid, domain='general,company-eval', url = url)
print(response)

response <- retrieve_sentimo_set(dataId=165571, token = pid, domain='general,company-eval', url = url)
print(response)

response <- retrieve_sentiment_set(dataId = 165571, token = pid, url = url)
print(response)


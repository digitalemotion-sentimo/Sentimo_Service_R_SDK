library(rjson)
source('sentimo/secured_upload.R')

#Initial the configuration
config <- fromJSON(file='config.json')

url <- config$url
pid <- config$token

fld = '{"data":[{"post_id":"x0004","source":"DummySource1","user_id":"user1","post_time":"2016-02-08-19-03-01","content":"Love my new phone! Only that the battery runs out very fast"},{"post_id":"x0003","source":"DummySource2","user_id":"user2","post_time":"2016-02-08-19-03-02","content":"Trains are very crowded today."}]}'
response <- secured_upload(token = pid, dataset = fld, url = url)
print(response)
library(rjson)
source('sentimo/analyze_on_the_fly.R')

#Initial the configuration
config <- fromJSON(file='config.json')

base_url <- config$url
pid <- config$token
timeout <- config$timeout

dataset = '[{"title":"-","type":"string","user_id":"123456","screen_name":"123456","userjoindate":0,"postcount":"1", "post_time":"2017-03-08T19:03:01.002Z","post_id":"x0004","content":"I love frozen yogurt, although I do not like regular yogurt","reply_to_post_id":"-","reply_to_uid":"123456","msg_from":"dee","likes":0,"url":"string","source":"123456"}]'
res <- analyze_sentiment_on_the_fly(token = pid, data = dataset,  target='sir,flight,kid,ship,car', domain = 'general', url = base_url)
print(res)

flds = '[{"title":"-","type":"string","user_id":"123456","screen_name":"123456","userjoindate":0,"postcount":"1", "post_time":"2017-03-08T19:03:01.002Z","post_id":"x0004","content":"I love frozen yogurt, although I do not like regular yogurt","reply_to_post_id":"-","reply_to_uid":"123456","msg_from":"dee","likes":0,"url":"string","source":"123456"}]'
res <- analyze_sentimo_on_the_fly(token = pid, data = flds,  target='sir,flight,kid,ship,car', domain = 'general', url = base_url)
print(res)


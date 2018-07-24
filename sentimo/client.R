library(httr)
library(RCurl)

#' Core HTTP logic for Sentimo Webservice API
#' 
#' Used for users and the core method for calling api IN THE package
#' 
#' @param url the based url for the target server
#' @param token authentication token (pid) string
#' @param path function path of target API in target server
#' @param method one of {"GET"} OR {"POST"}
#' @param body data passed to {"POST"} method
#' 
#' @return response information from server
#' 
api = function(
  token = NULL, path = NULL, 
  method = c('GET', 'POST'),
  body =NULL, url = NULL
){
  
  if(is.null(token))
    stop('token must be provided')
  
  headers = c(
    'pid'=token,
    'accept' = 'application/json',
    'content-type' = 'application/json'
  )
  
  switch(method,
        GET = {
          getURL(url = path, httpheader = headers, ssl.verifypeer = FALSE)
        },
        POST = {
          postForm(path, 
                   .opts=list(httpheader=headers, postfields=body, ssl.verifypeer = FALSE))
        }
  )
  
}

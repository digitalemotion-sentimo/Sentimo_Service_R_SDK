source('sentimo/client.R')



#' Immediate general sentiment analysis
#' 
#' @param token header parameter to authenticate
#' @param domain OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)
#' @param targets Multiple Target objects, up to 5 targets can be defined.
#' 
#' @param data An array containing the elements below
#'             title        REQUIRED  string
#'             type         REQUIRED  string
#'             user_id      REQUIRED  string
#'             screen_name  REQUIRED  string
#'             userjondate  REQUIRED  integer
#'             postcount    REQUIRED  string
#'             post_time    REQUIRED  Time in the format "YYYY-MM-DDThh:mm:ss.sTZD"
#'             post_id      REQUIRED  string
#'             content      REQUIRED  string
#'        reply_to_post_id  REQUIRED  string
#'          reply_to_uid    REQUIRED  string
#'             msg_from     REQUIRED  string
#'             likes        REQUIRED  integer
#'             url          REQUIRED  string
#'             source       REQUIRED  string   
#'             
#'  @param url the based url for the target server            
#' 
analyze_sentiment_on_the_fly = function(token = NULL, data = NULL, target=NULL, domain=NULL, url =NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(data)) stop('Data is not available.')

  path <- '/aoa/sentiment/analyze'
  if(!is.null(target)){
    if(grepl(',', target)){
      target = gsub(',', '%2C', target)
    }
    path<-paste0(path, '/', target)
  }
  if(!is.null(domain)){
    if(grepl(',' , domain)){
      domain = gsub(',', '%2C', domain)
    }
    path <- paste0(path, '?domain=', domain)
  }
  req = api(token = token, path = paste0( url,  path), method = 'POST', body = data)

  return(req)
}


#' Immediate fine-grained emotion analysis
#' 
#' @param token header parameter to authenticate
#' @param domain OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)
#' @param targets OPTIONAL Multiple Target objects, up to 5 targets can be defined.
#' 
#' @param data An array containing the elements below
#'             title        REQUIRED  string
#'             type         REQUIRED  string
#'             user_id      REQUIRED  string
#'             screen_name  REQUIRED  string
#'             userjondate  REQUIRED  integer
#'             postcount    REQUIRED  string
#'             post_time    REQUIRED  Time in the format "YYYY-MM-DDThh:mm:ss.sTZD"
#'             post_id      REQUIRED  string
#'             content      REQUIRED  string
#'        reply_to_post_id  REQUIRED  string
#'          reply_to_uid    REQUIRED  string
#'             msg_from     REQUIRED  string
#'             likes        REQUIRED  integer
#'             url          REQUIRED  string
#'             source       REQUIRED  string   
#'             
#'  @param url the based url for the target server            
#' 
analyze_sentimo_on_the_fly = function(token = NULL, data = NULL, target=NULL, domain= NULL, url =NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(data)) stop('Data is not available.')

  path <- '/aoa/sentimo/analyze'
  if(!is.null(target)){
    if(grepl(',', target)){
      target = gsub(',', '%2C', target)
    }
    path<-paste0(path, '/', target)
  }
  if(!is.null(domain)){
    if(grepl(',' , domain)){
      domain = gsub(',', '%2C', domain)
    }
    path <- paste0(path, '?domain=', domain)
  }
  req = api(token = token, path = paste0( url,  path), method = 'POST', body = data)
  
  return(req)
}

source('sentimo/client.R')

#' Retrieve general Sentiment Analysis
#' 
#' @param url the based url for the target server 
#' @param token header parameter to authenticate
#' @param dataIds Multiple Data IDs to be separated by comma (ex. id1, id2, ...)
#'           Maximum number of ID is 5
#' @param Domain OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)
#'           Maximum number of domain is 5
#'
retrieve_sentiment = function (url =NULL, token = NULL, dataIds = NULL, domain = NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(dataIds)) stop('Object ID is not available.')

  path <- paste0('ar/sentiment', '/', dataIds)

  if(!is.null(domain)){
    if(grepl(',', domain)){
      domain = gsub(',', "%2C", domain)
    }
    if(grepl(',', dataIds)){
      dataIds = gsub(',', '%2C', dataIds)
    }
    path <- paste0('ar/sentimo/', domain, '/',dataIds)
  }

  req = api(token = token, path = paste0( url, '/', path), method = 'GET')

  return(req)
  
}




#' Retrieve the general sentiment data set
#' 
#' @param url the based url for the target server 
#' @param token header parameter to authenticate
#' @param dataId ID in database
#' @param domain  OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)
#' @param num the maximum number cannot exceed 100
#' 
retrieve_sentiment_set = function (url =NULL, token = NULL, dataId = NULL, domain = NULL, num = NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(dataId)) stop('Object ID is not available.')
  if(is.character(dataId)){
    if(grep(',', dataId)) stop('Only acceptable to one ID.')
  }

  path <- paste0('ar/sentiment', '/', dataId)

  if(!is.null(domain)){
    if(grepl(',', domain)){
      domain = gsub(',', "%2C", domain)
    }
    path <- paste0('ar/sentimo/', domain, '/start/',dataId)
  }

  if(!is.null(num)){
    path <- paste0(path, '?max=' , num)
  }

  req = api(token = token, path = paste0( base_url, '/', path), method = 'GET')

  return(req)
  
}

  
#' Retrieve fine-grained Emotion
#' 
#' @param url the based url for the target server   
#' @param token header parameter to authenticate
#' @param dataId Multiple Data IDs to be separated by comma (ex. id1, id2, ...)
#'           Maximum number of ID is 5
#' @param domain OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)    
#' 
#' 
retrieve_sentimo = function(url =NULL, dataIds=NULL, token = NULL, domain = NULL) {
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(dataIds)) stop('Object ID is not available.')

  path <- paste0('ar/sentimo', '/', dataIds)

  if(!is.null(domain)){
    if(grepl(',', domain)){
      domain = gsub(',', "%2C", domain)
    }
    if(is.character(dataIds)){
      if(grepl(',', dataIds)){
        dataIds = gsub(',', '%2C', dataIds)
      }
    }
    path <- paste0('ar/sentimo/', domain, '/',dataIds)
  }

  req = api(token = token, path = paste0( url, '/', path), method = 'GET')

  return(req)
}

#' Retrieve the fine-grained emotion data set
#' 
#' @param url the based url for the target server 
#' @param token header parameter to authenticate
#' @param dataIds ID in database
#' @param domain  OPTIONAL Multiple domains to be separated by comma (ex. domain1, domain 2, ...)
#' @param num the maximum number cannot exceed 100
#' 
retrieve_sentimo_set = function (url =NULL, token = NULL, dataIds = NULL, domain = NULL, num = NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(dataIds)) stop('Object ID is not available.')
  if(is.character(dataIds)){
    if(grep(',', dataIds)) stop('Only acceptable to one ID.')
  }
  
  path <- paste0('ar/sentimo', '/', dataIds)
  
  if(!is.null(domain)){
    if(grepl(',', domain)){
      domain = gsub(',', "%2C", domain)
    }
    path <- paste0('ar/sentimo/', domain, '/start/', dataIds)
  }
  
  if(!is.null(num)){
    path <- paste0(path, '?max=' , num)
  }
  
  req = api(token = token, path = paste0( url, '/', path), method = 'GET')
  
  return(req)
  
}

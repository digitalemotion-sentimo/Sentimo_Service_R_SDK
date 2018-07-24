source('sentimo/client.R')

#' This function serves to upload data to server
#' 
#' @param token REQUIRED, header parameter to authenticate
#' 
#' @param dataset An array containing elements below:
#'               post_id The domain name under which set of data was produced
#'               source  source of data
#'               user_id User ID of poster data
#'               post_time Time when post was uploaded
#'               content Main content of data
#' @param url the based url for the target server 
#' 
secured_upload = function ( url =NULL, token = NULL, dataset = NULL){
  
  if(is.null(token)) stop('No available authentication key.')
  if(is.null(dataset)) stop('Data is not available.')
  
  path <- 'upload'
  
  req = api(token = token, path = paste0( url, '/', path), method = 'POST', body = dataset)
  
  return(req)
  
}
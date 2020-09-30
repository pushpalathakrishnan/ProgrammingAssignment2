rm(list=ls())
getwd()
install.packages("httr")
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "75ffc4989df8001de43a",
                   secret = "389877827ca7031f4586a37206816ec5152088dc")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
datashare

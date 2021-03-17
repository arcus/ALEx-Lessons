library(stringr)
library(rsconnect)
library(rmarkdown)

# not sure if this will work but at least catch errors...
whoops <- function() {
  print("Whoops!")
}

deploy <- function(folder) {
  # what's my R Markdown here?  I assume just one.
  md <- list.files(path=folder, pattern = "\\.[Rr][Mm][Dd]$",
                   full.names = TRUE)
  # Look in the yaml at the top to get the title
  title <- yaml_front_matter(md)$title
  # remove old preferences in the rsconnect folder
  unlink(paste(folder,"/rsconnect", sep=""), recursive = TRUE)
  # deploy to shinyapps.  We assume the connection is already set up.
  deployApp(appDir = folder, 
            appName = folder,
            appTitle = title,
            appFiles = NULL, # include all by specifying NULL
            account = "chop-arcus",
            forceUpdate = TRUE,
            on.failure = whoops())
  
}


deploy_all <- function() {
  # look in each folder.
  for (folder in (list.dirs(full.names = FALSE, recursive = FALSE))) {
  # If there's an R Markdown, deploy it, 
 if (length(list.files(path=folder, pattern = "\\.[Rr][Mm][Dd]$")) > 0 ) 
   {
deploy(folder)
 }
  # otherwise, skip ahead.
  else next
  }
}



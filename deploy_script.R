library(stringr)
library(rsconnect)
library(rmarkdown)

# not sure if this will work but at least catch errors...
whoops <- function() {
  print("Whoops!")
}

# Consider adding shiny functionality for split files (UI / server)
# error check folder name or do URL encode
deploy <- function(folder) {
  # To do: check if folder exists!
  folder_match <- dir(pattern = paste("^",folder,"$", sep = ""))
  if (length(folder_match) != 1) {
    return("Hoo boy, can't find that one!")
  } 
  # there are two possibilities: an R Markdown learnr tutorial,
  # or a traditional shiny app.R file.
  if (length(list.files(path=folder, pattern = "\\.[Rr][Mm][Dd]$")) > 0 )
  {
    # what's my R Markdown here?  I assume just one.
    md <- list.files(path=folder, pattern = "\\.[Rr][Mm][Dd]$",
                     full.names = TRUE)
    # Look in the yaml at the top to get the title
    title <- yaml_front_matter(md)$title
    # remove old preferences in the rsconnect folder
  }
  else if (length(list.files(path=folder, pattern = "app\\.R")) > 0) {
    title = folder
  }
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
    # If there's an R Markdown or an app.R, deploy it, 
    if (length(list.files(path=folder, pattern = "\\.[Rr][Mm][Dd]$")) > 0 |
        length(list.files(path=folder, pattern = "app\\.R")) > 0) 
    {
      deploy(folder)
    }
    
    # otherwise, skip ahead.
    else next
  }
}

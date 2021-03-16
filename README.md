# Arcus Learning Exchange (ALEx)

## Intent of this Repo

This repo contains Shiny applications in the form of `learnr` tutorials.  It also contains instructions for deploying these applications once they are updated.

To add a new lesson, create a new top-level directory with a lower-case-and-dashes naming convention that describes the lesson topic or aim.  The lesson will contain the following:

* An R Markdown file that constitutes the `learnr` tutorial
* Any required files (e.g. data in the form of a .csv)
* A folder with .css styling (copy the `www` directory from an existing lesson)

When you work in this repo on your own computer, additional types of files may appear, such as the `rsconnect` directory or `.DS_Store`.  Do not commit these to the repository (they should be successfully in the `.gitignore`, but just in case).

In order to deploy to Shinyapps, you have to connect your RStudio to the chop-arcus account.  See a member of the Arcus Data Education team for more details or to be added.

To deploy an app (new or updated), it is highly recommended to do the following:

* Run the app locally to ensure it works
* Run the `deploy_script.R` file, which includes helper functions.
* Then issue the command `deploy(directory_name)`, substituting the directory name of the app you want to deploy.

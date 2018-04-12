# Set up NATDB to work on your computer

# First make sure to close R and then open R without any packages loaded.
# As you are installing these packages, make sure that they are installing correctly. 
# You will get errors if a package dependency does not load. R will tell you which package it is.
# Install that package and then try again to install the package that gave you an error.

if(FALSE){
# first install these packages
install.packages("devtools")
install.packages("curl")
install.packages("reshape2")
install.packages("digest")
install.packages("gdata")
install.packages("readxl")

# now load devtools
require(devtools)

# install these packages (these are the packages that may give you an error that I described above)
install_github("willpearse/fulltext")
install_github("willpearse/suppdata")
install_github("ropensci/testdat")
install_github("willpearse/natdb")

# Note if you still have a failure installing natdb, R will give you a warning of the package 
# that you need to install, so install that package that R tells you to install and then again 
# try to install natdb 

# load the natdb package
# note that R will ask to make a directory where it will store the database that it builds. If you want
# the directory to be the default ans. Y and if not ans. n
}

#-----------------------------------------
# Load NATDB and other required packages

library(natdb)
library(tidyverse)
library(suppdata)
library(fulltext)
# you can see all the data sets that the package currently downloads here
# https://docs.google.com/spreadsheets/d/1RSK-CUOtDo9kTrVcTAgl0NwOdn-gUYqEUa5A-tK3tbo/edit#gid=0

# It takes a long time to download all of the trait data, so I do not recommend that you do it.
# instead you can download a handful of data sets to see how natdb puts them all together.
# Also, because this is just the Beta version of the NATDB package, you may not be able to download all the datasets as some functions only work on Linux.

mydats <- c(".albouy.2015", ".anderson.2015",".artacho.2015",".augspurger.2016a",".bengtsson.2016")

# Make sure to tell NATDB where you want to store all of the files. REPLACE WITH YOUR DIRECTORY
mydir <-"REPLACE WITH THE DIRECTORY WHERE YOU WANT TO STORE DOWNLODED NATDB FILES"
dat <- natdb(cache = mydir, datasets = mydats)
# it then helps to run a cleaner function on the dataset, this makes the data a bit easier to wrangle
clean.data <- clean.natdb(dat)

#-------------------------------------------
# Make a plot of the number of traits per species
t_dat <- tibble(species = clean.data$numeric$species, trait = clean.data$numeric$variable)

# the unique() removes duplicates, that is, species that have been sampled for the same trait multiple times.
trait_spp <- t_dat %>% group_by(species) %>% unique()
trait_spp <- trait_spp %>% group_by(species) %>% summarise(nTrats = n()) %>% mutate(log_nTrats = log(nTrats))

# majority of species only have a few traits, but some have >10 traits
trait_spp  %>% ggplot(aes(x = nTrats)) + geom_histogram(binwidth = 1)
#--------------------------------------------
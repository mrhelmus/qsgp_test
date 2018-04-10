# First make sure to close R and then open R without any packages loaded.
# As you are installing these packages, make sure that they are installing correctly. 
# You will get errors if a package dependency does not load. R will tell you which package it is.
# Install that package and then try again to install the package that gave you an error.

# first install these packages
install.packages("devtools")
install.packages("curl")
install.packages("reshape2")
install.packages("digest")
install.packages("gdata")
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
library(natdb)
library(suppdata)
library(gdata)
library(fulltext)
# you can see all the data sets that the package currently downloads here
# https://docs.google.com/spreadsheets/d/1RSK-CUOtDo9kTrVcTAgl0NwOdn-gUYqEUa5A-tK3tbo/edit#gid=0

# it takes a really long time to download all of the trait data, so I do not recommend that you do it.
# instead you can download a handful of data sets to see how natdb puts them all together.

mydats  <- c(".artacho.2015", ".vanier.2013", ".aubret.2012b")
mydats  <- c(".aubret.2012b")
dat <- natdb(cache = "../.Rcache",datasets = mydats)
mydats  <- c(".artacho.2015", ".vanier.2013")
dat <- natdb(cache = "../.Rcache",datasets = mydats)


k <- "C:/Users/matth/AppData/Local/Temp/RtmpSoPhtG/10.5061_dryad.14cr5345_Aubret%2053172.xlsx"

I am unable to download a lot of the data sets on my PC. I think the error is coming from fulltext::ft_get_si 

Example Code: 
  mydats  <- c(".artacho.2015", ".vanier.2013", ".aubret.2012b")
dat <- natdb(cache = ".Rcache",datasets = mydats)

Here is the error:
  Error in findPerl(verbose = verbose) : 
  perl executable not found. Use perl= argument to specify the correct path.
Error in file.exists(tfn) : invalid 'file' argument


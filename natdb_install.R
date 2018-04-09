# first install the package devtools
install.packages("devtools")

# then load devtools
require(devtools)

#then install curl
install.packages("curl")

#then install suppdata
install_github("willpearse/suppdata")

# then you need to install the testdat package
install_github("ropensci/testdat")

# then you install the package natdb
install_github("willpearse/natdb")

#Note if you still have a failure R will give you a warning of the package that you need to install, so install that package that R tells you to install and then again try to install natdb 
install_github("willpearse/natdb")


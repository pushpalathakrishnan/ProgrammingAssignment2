##Question 1
f<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv";
dest<-"~/R/ProgrammingAssignment2/fss.csv";
download.file(f, dest)
d <- read.csv("~/R/ProgrammingAssignment2/fss.csv")
d
sum(d$VAL == 24, na.rm = TRUE)
date_var <- date()
date_var


##Question 3
library(xlsx)
c <- 7:15
r <- 18:23
##Download the Excel spreadsheet on Natural Gas Aquisition Program here:
url_xl<-"C:/Users/srm.MCA-01/Documents/R/ProgrammingAssignment2/getdata_data_DATA.gov_NGAP.xlsx";

##Read rows 18-23 and columns 7-15 into R and assign the result to a variable called dat
dat <- read.xlsx(url_xl, sheetIndex=1, colIndex = c, rowIndex = r)
dat
sum(dat$Zip*dat$Ext, na.rm=T)


##Question 4
##Read the XML data on Baltimore restaurants from here:
install.packages("XML");
library("XML")
library("methods")
xm<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml";
dxm<- xmlParse(file = xm)
dxm
##How many restaurants have zipcode 21231?
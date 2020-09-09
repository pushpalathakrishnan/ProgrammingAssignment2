f<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv";
dest<-"~/R/ProgrammingAssignment2/fss.csv";
download.file(f, dest)
d <- read.csv("~/R/ProgrammingAssignment2/fss.csv")
sum(d$VAL == 24, na.rm = TRUE)
date_var <- date()
date_var
library(xlsx)
c <- 7:15
r <- 18:23
url_xl<-"C:\Users\srm.MCA-01\Documents\R\ProgrammingAssignment2/getdata_data_DATA.gov_NGAP.xlsx";
d_xl <- read.xlsx(url_xl, sheetIndex=1, colIndex = c, rowIndex = r)
d_xl
sum(d_xl$Zip*d_xl$Ext, na.rm=T)
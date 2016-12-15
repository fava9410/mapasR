library(maps)

unemp <- read.csv('Unemployment2.csv',header=TRUE, stringsAsFactors=FALSE,)

unemp$mpname <- tolower(paste(state.name[match(sub("^.*([A-Z][A-Z])$","\\1",unemp$Area_name,fixed=FALSE),state.abb)],
                              sub("^(.*) (County|[Cc]ity|Parish), ..$","\\1", unemp$Area_name),sep=","))

unemp$u2007 <- as.numeric(cut(unemp$Unemployment_rate_2007,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2007, na.rm = TRUE))))
unemp$u2008 <- as.numeric(cut(unemp$Unemployment_rate_2008,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2008, na.rm = TRUE))))
unemp$u2009 <- as.numeric(cut(unemp$Unemployment_rate_2009,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2009, na.rm = TRUE))))
unemp$u2010 <- as.numeric(cut(unemp$Unemployment_rate_2010,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2010, na.rm = TRUE))))
unemp$u2011 <- as.numeric(cut(unemp$Unemployment_rate_2011,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2011, na.rm = TRUE))))
unemp$u2012 <- as.numeric(cut(unemp$Unemployment_rate_2012,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2012, na.rm = TRUE))))
unemp$u2013 <- as.numeric(cut(unemp$Unemployment_rate_2013,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2013, na.rm = TRUE))))
unemp$u2014 <- as.numeric(cut(unemp$Unemployment_rate_2014,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2014, na.rm = TRUE))))
unemp$u2015 <- as.numeric(cut(unemp$Unemployment_rate_2015,c(seq(0,10,by=2),max(unemp$Unemployment_rate_2015, na.rm = TRUE))))

#cols <- c("#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", "#980043")
cols <- c("#99E474","#88BA6F", "#8FB77B","#75DC41", "#43C900", "#339800")

mp <- map("county", plot=FALSE,namesonly=TRUE)
map("county", col=cols[unemp[match(mp,unemp$mpname),]$u2009],fill=TRUE)
legend("bottomright",legend = c(1:6), pt.bg = cols,pch = 22)
title(main = "Desempleo por condados en Estados Unidos en el año 2009")


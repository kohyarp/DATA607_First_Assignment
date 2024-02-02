#Written by Koohyar Pooladvand
#Semister Spring 2024
#what: First assignment for DATA607, 

#Run the follwing command in case, function are not found  
#install.packages("RCurl")
#install.packages("tidyverse")
#install.packages("data.table")

library(RCurl)
library(tidyverse)
library(data.table)

#load forcast
Int_data_handle <- getURL("https://projects.fivethirtyeight.com/soccer-api/international/2022/wc_forecasts.csv")
Forcast_data<-data.frame(read.csv(text=Int_data_handle, header=TRUE))

print("The size of Forcast dataframen and let's take a look at it using glimpse")
dim(Forcast_data)
glimpse(Forcast_data)
#change column name, I want to change of the column spi to soccer_power_index
colnames(Forcast_data)[4] <- "soccer_power_index"

#find the countries that made it to the final match for worldcup semi-final and plot their SPI.
world_cup_semi <- Match_data[c(dim(Match_data)[1]-1,dim(Match_data)[1]),c(seq(4,7,1))]

barplot(c(world_cup_semi$spi1,world_cup_semi$spi2),
        names.arg=c(world_cup_semi$team1,world_cup_semi$team2),
        main = "Worldcup semi final team Soccer Power Index (SPI)", 
        xlab = "Country", ylab = "SPI", col = "blue")



# load the match data 
Int_data_handle <- getURL("https://projects.fivethirtyeight.com/soccer-api/international/2022/wc_matches.csv")
Match_data<-data.frame(read.csv(text=Int_data_handle, header=TRUE))
print("The size of Match dataframe, and let's take a look at it using glimpse")
dim(Match_data)
glimpse(Match_data)



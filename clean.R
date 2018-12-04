
library(maps)
library(ggplot2)
library(ggmap)
dfStates <- raw_data
dfStates
cleandataframe <- function(dfStates) #function declaration
{
dfStates <- dfStates[-1,]#removes the summary
dfStates <- dfStates[-52,]#removes puerto rico
dfStates
dfStates <- dfStates[,-1]#removes the unwanted columns
dfStates <- dfStates[,-1]#removes the unwanted columns
dfStates <- dfStates[,-1]#removes the unwanted columns
dfStates <- dfStates[,-1]#removes the unwanted columns
colnames(dfStates)<- c("Statename", "population", "popOver18", "percentOver18")#renames the columns
  return(dfStates) #function body
}

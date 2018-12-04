
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
df <- cleandataframe(dfStates)
df

arrests <- USArrests
arrests$Statename <- rownames(arrests)
arrests

# Create a merge dataFrame
merge_df <- merge(arrests,df,by="Statename")
merge_df

# 2)	Add the area of each state, and the center of each state, to the merged dataframe,
#   using the 'state.center', 'state.center' and 'state.name' vectors
Statename <- state.name
Statearea <- state.area
Statecenter <- state.center
newFrame<-data.frame(Statename,Statearea,Statecenter)

merge_df<-merge(merge_df,newFrame)
merge_df

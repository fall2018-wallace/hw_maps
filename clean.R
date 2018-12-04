

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

merge_df$Statename <- tolower(merge_df$Statename)
us<-map_data("state")

#3) color coded map, based on the area of the state 
colormap<- ggplot(merge_df, aes(map_id=Statename)) + geom_map(map=us, aes(fill=state.area)) + expand_limits(x= us$long, y= us$lat) + coord_map()+ ggtitle(" Map of USA")


#4) color coded map, based on the murderrate of the state 
colormap2<- ggplot(merge_df, aes(map_id=Statename)) + geom_map(map=us, aes(fill=Murder)) + expand_limits(x= us$long, y= us$lat) + coord_map()+ ggtitle(" State population Map of USA") 

#5) showing population as circle per state
colormap3<- ggplot(merge_df, aes(map_id=Statename)) + geom_map(map=us, aes(fill=state.area)) + expand_limits(x= us$long, y= us$lat) + coord_map()+ ggtitle(" Map of USA") + geom_point(aes(x = x, y = y, size=population))


#6) only show the states in the north east
latlon <- geocode(source = "dsk","nyc,new york,ny")
latlon
colormap4 <- color_map3+ xlim(-84,-64)+ ylim(30,50)


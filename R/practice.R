library(ggmap)
practicetableread <- read.delim(file = 'accessions.tsv')
View(practicetableread)


newdataframe <- practicetableread[practicetableread$Latitude != '' & practicetableread$Latitude != 'unknown',]
View(newdataframe)

newdataframe$Latitude <- as.numeric(newdataframe$Latitude)
newdataframe$Longitude <- as.numeric(newdataframe$Longitude)



#these specific coordinates belong to Peru (-81.356, -18.348, -68.673, -0.057)
mymap <- get_map(location = c(-81.356, -18.348, -68.673, -0.057), source = "stamen", maptype = "toner", crop = FALSE)
ggmap(mymap) + 
  geom_point(aes(x = Longitude, y = Latitude), data = newdataframe, alpha = .5, color="darkred", size = 3)


#separate the coordinate data from the rest of the data in newdataframe
#tom.coords.df <- data.frame(Latitude = newdataframe$Latitude, Longitude = newdataframe$Longitude, Location = newdataframe$Collecting_locality)

#lat <- tom.coords.df$Latitude
#lon <- tom.coords.df$Longitude
 
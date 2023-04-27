library(ggmap)
accessionstable <- read.delim(file = 'accessions.tsv')
View(accessionstable)

newaccessions <- accessionstable[accessionstable$Latitude != '' & accessionstable$Latitude != 'unknown',]
View(newdataframe)

newaccessions$Latitude <- as.numeric(newaccessions$Latitude)
newaccessions$Longitude <- as.numeric(newaccessions$Longitude)


# Larger map, spanning from Mexico to Peru 
tomato.map <- get_map(location = c(-120, -20, -90, 30), source = "stamen", maptype = "toner", crop = FALSE, zoom = 4)
ggmap(tomato.map) + 
  geom_point(aes(x = Longitude, y = Latitude, color = species), data = newaccessions, alpha = .5, size = 4) +
  scale_color_manual(values = c(lycopersicum = "#cc444b", pimpinellifolium = "#55a630")) + 
  labs(title = "Tomato Accessions", x = "Longitude", y = "Latitude")


#creates a table with any missing values that were left out of the previous line of code 
missing_value <- newaccessions[is.na(newaccessions$Longitude) | is.na(newaccessions$Latitude), ]


#color points based on country, adjust color = Country in geom_point 
    #scale_color_manual(values = c(NIC = "#907ad6", MEX = "#cc444b", PER = "#219ebc", ECU = "#02c39a", CRI = "#ffafcc", HND = "#fb8500", COL = "#ffc300", SLV = "#003f88", GTM = "#55a630"))

#these specific coordinates belong to Peru (-81.356, -18.348, -68.673, -0.057)
   #tomato.map <- get_map(location = c(-81.356, -18.348, -68.673, -0.057), source = "stamen", maptype = "toner", crop = FALSE)
       #ggmap(tomato.map) + 
       #geom_point(aes(x = Longitude, y = Latitude), data = newaccessions, alpha = .5, color="darkred", size = 3) 


 
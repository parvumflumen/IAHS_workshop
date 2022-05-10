library(sf)

catchment <- st_read(dsn = "stationbasins.geojson")
plot(st_geometry(catchment))

library(leaflet)

leaflet() %>% 
  addTiles() %>% 
  addPolygons(data= catchment)
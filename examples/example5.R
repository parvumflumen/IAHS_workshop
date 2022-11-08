library(raster)

raster::stack(x = "example.nc4")

watergap <- raster::stack("example.nc4")

names(watergap) <- 1901:2016

watergap.1901 <- watergap$X1901

plot(watergap.1901)
raster::values(watergap.1901) <- log(raster::values(watergap.1901))
plot(watergap.1901)
plot(st_geometry(catchment), add=TRUE)

kongo.discharge <- raster::crop(watergap, catchment)

plot(kongo.discharge$X1901)
plot(st_geometry(catchment), add=TRUE)

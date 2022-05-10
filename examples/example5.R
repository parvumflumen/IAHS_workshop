library(raster)

url = "ftp://ftp.bafg.de/pub/REFERATE/GRDC/internal_use/example.nc4"
download.file(url, destfile = "example.nc4")
raster::stack(x = "example.nc4")

watergap <- raster::stack("example.nc4")

names(watergap) <- 1901:2016

watergap.jan1901 <- watergap$X1901

plot(watergap.jan1901)
raster::values(watergap.jan1901) <- log(raster::values(watergap.jan1901))
plot(watergap.jan1901)
plot(st_geometry(catchment), add=TRUE)

kongo.discharge <- raster::crop(watergap, catchment)

plot(kongo.discharge$X1901)
plot(st_geometry(catchment), add=TRUE)

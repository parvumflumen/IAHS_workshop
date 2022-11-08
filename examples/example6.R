cell <- raster::cellFromXY(kongo.discharge, xy = c(15.3,-4.3))

kinshasa.cell <- kongo.discharge[cell]


watergap.kinshasa.yearlymean <- hydts::hydtsReg(startDate = as.POSIXct("1901-01-01", tz="GMT"),
                                             timestep = "1 year",
                                             data = unname(kinshasa.cell[1,]))

plot(watergap.kinshasa.yearlymean)
lines(kongo.yearlymean,col="blue")

names(watergap.kinshasa.yearlymean) <- "kinshasa model"
names(kongo.yearlymean) <- "kinshasa obs"
ts <- merge(watergap.kinshasa.yearlymean, kongo.yearlymean)

plot(ts)
dygraphs::dygraph(ts)

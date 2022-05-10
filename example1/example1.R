library(hydts)

# load example data (some air temperature data from German Weather Service)
data(dwd_tmean)

# find out the type of the object
str(dwd_tmean)

# show all methods available for this S4 object
showMethods(class="hydtsReg")

# show all values of the timeseries
values(dwd_tmean)

# show the timestep
get_timestep(dwd_tmean)

# show metadata
meta(dwd_tmean)

# simple plot
plot(dwd_tmean$Zugspitze)


years <- hydts::get_year(dwd_tmean$Zugspitze)
Zugspitze.yavg <- hydts::aggregate(dwd_tmean$Zugspitze,
                                   by = years,
                                   FUN = mean)
Zugspitze.yavg <- Zugspitze.yavg[32:148,]
Zugspitze.yavg$Group.1 <- as.numeric(Zugspitze.yavg$Group.1) 
plot(Zugspitze.yavg, xlab="year", ylab = "T_mean [°C]")
abline(lm(Zugspitze.yavg$Zugspitze ~ Zugspitze.yavg$Group.1))
lm(Zugspitze.yavg$Zugspitze ~ Zugspitze.yavg$Group.1)


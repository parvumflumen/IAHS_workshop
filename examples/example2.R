library(hydts)

kongo.data <- read.csv("examples/1147010_Q_Day.Cmd.txt",
                       header = TRUE,
                       sep = ";",
                       skip = 36)


kongo.ts <- hydts::hydtsReg(timestamps = as.POSIXct(kongo.data$YYYY.MM.DD,
                                        tz = "GMT"),
                            data=kongo.data$Value)

hydts::statnames(kongo.ts) <- "Kinshasa"

kongo.ts$Kinshasa

hydts::plot(kongo.ts$Kinshasa)



by <- hyddate::beginOfMonth(kongo.ts)
values <- aggregate(kongo.ts,
                    by = by,
                    FUN = mean)

kongo.monthlymean <- hydtsReg(startDate = as.POSIXct("1903-01-01", tz = "GMT"),
                              timestep = "1 month",
                              data = values$Kinshasa)
plot(kongo.monthlymean, xlab="year", ylab="Q [m³/s]", main="Discharge Kongo River, Kinshasa Station (monthly mean)")

by <- hyddate::beginOfYear(kongo.ts)
values <- aggregate(kongo.ts,
                    by = by,
                    FUN = mean)

kongo.yearlymean <- hydtsReg(startDate = as.POSIXct("1903-01-01", tz = "GMT"),
                              timestep = "1 year",
                              data = values$Kinshasa)

hydts::statnames(kongo.yearlymean) <- "Kinshasa"

plot(kongo.yearlymean, xlab="year", ylab="Q [m³/s]", main="Discharge Kongo River, Kinshasa Station (yearly mean)")

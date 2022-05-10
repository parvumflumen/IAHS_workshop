# Run example 2 first!

library(trend)

# Pettitt-Test for single breakpoint
trend::pettitt.test(values(kongo.yearlymean$Kinshasa))

# Mann-Kendall-Test for monotonic trend
trend::mk.test(values(kongo.yearlymean$Kinshasa))
trend::mk.test(values(kongo.yearlymean$Kinshasa[60:100]))

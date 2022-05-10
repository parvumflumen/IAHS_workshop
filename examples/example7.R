library(hydroGOF)
hydroGOF::KGE(sim=hydts::as.ts(ts$`kinshasa model`), obs=hydts::as.ts(ts$`kinshasa obs`))


ts.kge <- sapply(1903:1986, FUN = function(x) {
  ts.sub <- hydts::window(ts,x,x+30)
  hydroGOF::KGE(sim=hydts::as.ts(ts.sub$`kinshasa model`), 
                obs=hydts::as.ts(ts.sub$`kinshasa obs`))
})

plot(ts.kge)

ts.nse <- sapply(1903:1986, FUN = function(x) {
  ts.sub <- hydts::window(ts,x,x+30)
  hydroGOF::NSE(sim=hydts::as.ts(ts.sub$`kinshasa model`), 
                obs=hydts::as.ts(ts.sub$`kinshasa obs`))
})

plot(ts.nse)

cleanEVTYPE <- function(df) {
    # unfactor the EVTYPE
    df$EVTYPE <- as.character(df$EVTYPE)
    
    srch <- c("WETNESS|STREAM|PRECIPITATION|SHOWER|TIDE|RAIN|DROWNING|FLOOD|SURF|STORM|WAVE|WATER|CURRENTS|WATERSPOUT|MARINE|SEA|SWELL|STREAM FLD|CURRENT",
              "AVAL",
              "ICE|SNOW|BLIZZARD|FREEZ|FROST|HAIL|HYPOTHERMIA|COLD|LOW TEMPERATURE|SLEET|ICY|HYPERTHERMIA|WINTRY|WINTER",
              "DUST|WIND|TYPHOON|TORNADO|HURRICANE|FUNNEL|DRY MICROBURST",
              "FOG|DENSE SMOKE",
              "HEAT|WARM|HOT|DROUGHT",
              "FIRE",
              "LIGHTING|LIGHTNING|TSTM",
              "MUD|LANDSLIDES|EROSION|ROCK SLIDE",
              "MIXED PRECIP|APACHE COUNTY")
    
    repl <- c("WATER",
              "AVALANCHE",
              "WEATHER-COLD",
              "WIND",
              "FOG",
              "WEATHER-HOT",
              "FIRE",
              "LIGHTING",
              "LANDSLIDE",
              "OTHER")
    
    for (i in 1:length(srch)) {
        x <- grepl(srch[i], df$EVTYPE, ignore.case = TRUE)
        df[x, "EVTYPE"] <- repl[i]
    }
    
    df$EVTYPE <- as.factor(df$EVTYPE)
    return (df)
}

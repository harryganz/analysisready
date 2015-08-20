# Calculate number of ssus per psu
calculateM  <- function(x){
  # Find max station number for each combination of 
  # YEAR, REGION, STRAT, PRIMARY_SAMPLE_UNIT
  match  <- with(x,aggregate(list(m = STATION_NR), 
                             by = list(YEAR=YEAR, REGION=REGION, 
                                       STRAT=STRAT, 
                                       PRIMARY_SAMPLE_UNIT=PRIMARY_SAMPLE_UNIT),
                             FUN = max));
  # Merge match with x
  out  <- merge(x, match);
  
  return(out)
}
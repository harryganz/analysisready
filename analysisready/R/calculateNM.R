## Calculates the total number of SSUs per
## stratum
calculateNM  <- function(x){
  # Get each unique PSU
  psus  <- unique(x[c("YEAR","REGION","STRAT",
                      "PRIMARY_SAMPLE_UNIT","m")]);
  # get the total number of SSUs per stratum
  match  <- with(psus, aggregate(list(nm = m),
                                 list(YEAR=YEAR, REGION=REGION,
                                      STRAT=STRAT),
                                 FUN = sum));
  # merge with original data
  out  <- merge(x, match);
  
  return(out);
  
}
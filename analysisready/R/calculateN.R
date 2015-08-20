## Calculate number of primary sample units per
## stratum
calculateN  <- function(x){
  #Get each unique PSU
  psus  <- unique(x[c("YEAR", "REGION", "STRAT",
                      "PRIMARY_SAMPLE_UNIT")]);
  # Calculate the number per STRATUM
  match  <- with(psus, aggregate(list(n = PRIMARY_SAMPLE_UNIT),
                                 list(YEAR=YEAR, REGION=REGION,
                                      STRAT=STRAT),
                                 FUN = length))
  # Merge back with the original
  out  <- merge(x, match);
  
  return(out);
}
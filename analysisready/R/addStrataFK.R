# Adds strata for Dry Tortugas region
# @inheritParams addStrata
# @return 
# A data.frame with the original AR2.0 data with
# a STRAT column added containing the stratum to
# which a record belongs
addStrataFK  <- function(x){
  ## Add AVG_PSU_DEPTH, to be dropped later
  
  
  ## Drop records before april in 2004 and 2005
  f1  <- function(d){
    return(subset(d, !(YEAR>=2004 & YEAR<=2005 & MONTH<4)));
  }
  
  ## Logic for formation of STRATA
  f2  <- function(d){
    d$STRAT  <- ifelse(
      HABITAT_CD == "SPGR_HR",
      "HRRF",
      ifelse(
        ZONE_NR < 4,
        ifelse(
          YEAR == 1994 || YEAR == 1996,
          "MCPR",
          ifelse(
            ZONE_NR == 2,
            "MCPR",
            ifelse(
              ZONE_NR == 1,
              "INPR",
              "OFPR"
              )
            )
          ),
        ifelse(
          AVG_PSU_DEPTH < 18,
          
          )
        )
      )
  }
}
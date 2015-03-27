#' Adds strata for Florida Keys region
#' @inheritParams addStrata
#' @return 
#' A data.frame with the original AR2.0 data with
#' a STRAT column added containing the stratum to
#' which a record belongs
addStrataFK  <- function(x){
  ## Add AVG_PSU_DEPTH, to be dropped later
  d  <- addAvgPsuDepth(x);
  ## Drop records before april in 2004 and 2005
  d  <- subset(d, YEAR >= 2004 & YEAR <= 2005 & MONTH < 4);
  
  ## Assigning Strata divided into 3 branches ##
  
  ## branch 1
  branch1  <- function(){
    ifelse(
      HABITAT_CD == "SPGR_HR",
      "HRRF",
      ifelse(
        ZONE_NR < 4,
        branch2(),
        ifelse(
          AVG_PSU_DEPTH < 18,
          branch3(),
          ifelse(
            PROT == 1,
            "FMLR",
            ifelse(
              YEAR < 2001,
              "FMLR",
              "FDLR"
              )
            )
          )
        )
      )
  }
  ## Branch 2: if ZONE_NR < 4
  branch2  <- function(){
    ifelse(
      YEAR == 1994 || YEAR == 1996 || ZONE_NR == 2,
      "MCPR",
      ifelse(
        ZONE_NR == 1,
        "INPR",
        "OFPR"
        )
      )
  }
  ## Branch 3: if ZONE_NR == 4 & AVG_PSU_DEPTH >= 18m
  branch3  <- function(){
    ifelse(
      AVG_PSU_DEPTH >= 6,
      "FMLR",
      ifelse(
        YEAR == 1994 || YEAR == 1996 || 
          (YEAR == 1998 & PROT == 1),
        "FMLR",
        "FSLR"
        )
      )
    ## Assign STRAT column
    d$STRAT  <- with(d, branch1());
    ## Drop AVG_PSU_DEPTH
    drop  <- names(d) == "AVG_PSU_DEPTH"
    out  <- d[-drop];
    
    return(out)
  }
}
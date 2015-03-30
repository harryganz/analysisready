#' Adds strata for Florida Keys region
#' @inheritParams addStrata
#' @return 
#' A data.frame with the original AR2.0 data with
#' a STRAT column added containing the stratum to
#' which a record belongs
addStrataFK  <- function(x){
  ## Add AVERAGE_PSU_DEPTH, to be dropped later
  d  <- addAvgPsuDepth(x);
  ## Drop records before april in 2004 and 2005
  d  <- subset(d, !(YEAR >= 2004 & YEAR <= 2005 & MONTH < 4));

  ## Assign STRAT column
  d$STRAT  <-  with(d,
                    ifelse(
    HABITAT_CD == "SPGR_HR",
    "HRRF",
    ifelse(
      ZONE_NR < 4,
      ifelse(
        YEAR == 1994 | YEAR == 1996 | ZONE_NR == 2,
        "MCPR",
        ifelse(
          ZONE_NR == 1,
          "INPR",
          "OFPR"
        )
      ),
      ifelse(
        AVERAGE_PSU_DEPTH < 18,
        ifelse(
          AVERAGE_PSU_DEPTH >= 6,
          "FMLR",
          ifelse(
            YEAR == 1994 | YEAR == 1996 | 
              (YEAR == 1998 & PROT == 1),
            "FMLR",
            "FSLR"
          )
        ),
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
  )
  ## Drop AVERAGE_PSU_DEPTH
  keep  <- names(d)[names(d) != "AVERAGE_PSU_DEPTH"]
  out  <- d[keep];
  return(out)
}
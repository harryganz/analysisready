#' Adds strata for Dry Tortugas region
#' @inheritParams addStrata
#' @return 
#' A data.frame with the original AR2.0 data with
#' a STRAT and REGION column added
addStrataDT  <- function(x){
  ## Drop SUBREGIONS that aren't 3 or 4
  out  <- subset(x, SUBREGION_NR == 3 | SUBREGION_NR == 4);
  ## Add strata to output
  out$STRAT  <- with(
    out,
    ifelse(
      SUBREGION_NR == 4,
      ifelse(
        HABITAT_CD == "RUBB_LR", 
        "ISOL_LR",
        as.character(HABITAT_CD)
             ),
      ifelse(
        HABITAT_CD == "CONT_MR",
        "CONT_HR",
        ifelse(
          HABITAT_CD == "SPGR_LR",
          "ISOL_MR",
          ifelse(
            YEAR > 2000 & PROT == 0 & HABITAT_CD == "ISOL_HR",
            "ISOL_MR",
            as.character(HABITAT_CD)
            )
          )
        )
    )
  );
    
  ## Add REGION to output
  out$REGION  <- rep("DRTO", nrow(out));
    
  return(out)
}

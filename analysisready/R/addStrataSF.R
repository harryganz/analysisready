#' Adds strata for Southeast(SEFCRI) region
#' @inheritParams addStrata
#' @return 
#' A data.frame with the original AR2.0 data with
#' a STRAT and REGION column added
addStrataSF  <- function(x){
  ## If HABITAT_CD is SAND or OTHER drop
  out  <- subset(x, !(HABITAT_CD == "SAND"
                      | HABITAT_CD == "OTHER"));
  ## Add average PSU depth (remove later)
  out  <- addAvgPsuDepth(out);
  ## Set the STRAT variable
  out$STRAT  <- with(out,
    ifelse(
    HABITAT_CD == "APRD" | HABITAT_CD == "PTCH" |
      HABITAT_CD == "SCRS",
    ifelse(
      AVERAGE_PSU_DEPTH < 20,
      "PTSH",
      "PTDP"
      ),
    ifelse(
      HABITAT_CD == "CPSH" | HABITAT_CD == "RGSH",
      "NEAR",
      ifelse(
        HABITAT_CD == "LIRI",
        "INNR",
        ifelse(
          HABITAT_CD == "LIRM",
          "MIDR",
          ifelse(
            HABITAT_CD %in% c("LIRO","CPDP","SPGR") |
              (HABITAT_CD == "RGDP" & SUBREGION_NR < 16),
            "OFFR",
            ifelse(
              HABITAT_CD == "RGDP" & SUBREGION_NR >= 16,
              "RGDP",
              "DPRC"
              )
            )
          )
        )
      )
    )
    );
  ## If STRAT is PTSH change RUGOSITY_CD to 2
  ## Combined 0 and 1 for PTSH
  out$RUGOSITY_CD  <- with(out, 
                     ifelse(STRAT == "PTSH", 2, RUGOSITY_CD));
  ## Paste rugosity to calculate final strata
  out$STRAT  <- paste(out$STRAT, out$RUGOSITY_CD, sep = "");
  ## Add Region column
  out$REGION  <- rep("SEFCRI",nrow(out));
  ## Remove AVERAGE_PSU_DEPTH
  keep  <- names(out) != "AVERAGE_PSU_DEPTH";
  out  <- out[keep];
  
  return(out)
}
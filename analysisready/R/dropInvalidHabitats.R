#' Drops records with invalid habitats
#' @param x
#' A data.frame containing AR1.0 data 
#' with a column named HABITAT_CD
#' @param invalid_habs
#' A character vector of all the invalid habitat 
#' codes
#' @return A data.frame with records
#' from invalid habitats removed
dropInvalidHabitats  <- function(x, invalid_habs = c("ARTF_NA", "SAND_NA", "SGRS_NA", "UCHB_LR")){
  out  <- subset(x, !(HABITAT_CD %in% invalid_habs));
  return(out)
}
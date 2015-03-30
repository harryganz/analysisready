#' Drops rows from AR1.0 data based on TIME_SEEN
#' @export
#' @description
#' Drops records from AR1.0 data with TIME_SEEN
#' > 2 or based on information from a lookup table
#' @param x
#' A data.frame containing AR1.0 data with, at least,
#' a column named SPECIES_CD containing species codes
#' and a column named TIME_SEEN containing the times
#' in which the data was recorded
#' @param lookup
#' A data.frame containing a column named SPECIES_CD
#' with species codes and KEEP_10MIN containing
#' a 1 if the species should be included after 10
#' minutes (TIME_SEEN > 2) and a zero otherwise.
#' If NULL function just drops all records
#' with TIME_SEEN > 2
#' @return A data.frame of the AR1.0 data with
#' records collected after 10 minutes or 
#' whatever was specified in the lookup table
#'  dropped
dropTimeSeen  <- function(x, lookup = NULL){
  ## Make a list of species to keep
  keep  <- NULL;
  if (!is.null(lookup)){
    keep  <- with(
      lookup,
      SPECIES_CD[KEEP_10MIN == 1] 
    );
  }
  ## Unless matched in lookup, subset data 
  ## by timeseen <= 2
  out  <- subset(x, SPECIES_CD %in% keep | 
                   TIME_SEEN <= 2);
  
  ## Return trimmed data
  return(out)
}
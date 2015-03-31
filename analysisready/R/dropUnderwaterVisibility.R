#' Drops rows from data based on visibility
#' @description Drop rows from AR1.0 data with 
#' UNDERWATER_VISIBILITY below cutoff value and 
#' return a data.frame
#' @param x
#' A data.frame containing AR1.0 data with a column
#' called UNDERWATER_VISIBILITY
#' @param cutoff
#' A numeric value of visibility (in meters)
#' below which to drop records. Default 
#' value is 3 meters
#' @return A data.frame of AR1.0 data subset to exclude
#' visibility values below the cutoff
dropUnderwaterVisibility  <- function(x, cutoff = 3){
  out  <- subset(x, UNDERWATER_VISIBILITY >= cutoff);
  return(out)
}
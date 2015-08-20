#' Converts AR1.0 data to AR2.0 data
#' @export
#' @description
#' Takes AR1.0 data and converts it to AR2.0 data
#' @param x 
#' a data.frame of AR1.0 data
#' @inheritParams addStrata
#' @inheritParams dropTimeSeen
#' @inheritParams dropUnderwaterVisibility
#' @return A data.frame of AR2.0 data
toAr2  <- function(x, region, lookup = NULL, cutoff = 3){
  ## Turn var names to capitals
  names(x)  <- toupper(names(x));
  
  out  <- removeZeroes(
    calculateN(
    calculateNM(
    calculateM(
    addStrata(
    dropInvalidHabitats(
    addProtectedStatus(
    dropUnderwaterVisibility(
    dropTimeSeen(x, lookup),
    cutoff
    ))),
    region
    )))));
  return(out)
}

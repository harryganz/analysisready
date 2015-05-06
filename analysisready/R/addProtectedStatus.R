#' Generates a column of protected statuses
#' @description
#' Generates a column, PROT, with the protected
#' status of each record given a data.frame of 
#' AR1.0 data
#' @param x
#' A data.frame containing AR1.0 data which
#' contains columns called MPA_NR, and SUBREGION_NR 
#' @return 
#' A data.frame of the original data with a PROT
#' column added
addProtectedStatus  <- function(x){
  out  <- x;
  out$PROT  <- with(out,
                    ifelse( 
                      YEAR < 1998, 0,
                      ifelse(
                        SUBREGION_NR == 4 | (SUBREGION_NR == 3 & YEAR <= 2000),
                        2,
                        ifelse(
                          MPA_NR > 0,
                          1,
                          0
                          )
                        )
                      )
                    );
  return(out)
}
#' Adds AVERAGE_PSU_DEPTH to a data.frame 
#' @export
#' @param x
#' A data.frame containing the columns DEPTH, STATION_NR,
#' and PRIMARY_SAMPLE_UNIT
#' @return a data.frame with AVERAGE_PSU_DEPTH column added
addAvgPsuDepth  <- function(x){
  ## Drop duplicate station numbers and depths
  d1  <- unique(x[c("PRIMARY_SAMPLE_UNIT","STATION_NR","DEPTH")]);
  ## Aggregates and takes mean of depth by primary sample unit
  d2  <- aggregate(DEPTH ~ PRIMARY_SAMPLE_UNIT, data = d1,
                  FUN = mean);
  names(d2)[names(d2)=="DEPTH"]  <- "AVERAGE_PSU_DEPTH"
  
  ## Add AVERAGE_PSU_DEPTH to original data
  out  <- merge(x,d2, by = c("PRIMARY_SAMPLE_UNIT"));
  
  return(out)
  
}
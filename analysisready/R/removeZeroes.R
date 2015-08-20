## Remove all zeroes from the data
removeZeroes <- function(x){
  return(subset(x, NUM > 0));
}
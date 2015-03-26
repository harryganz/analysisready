context("testing addAvgPsuDepth")
## Create a data.frame to which add average psu depth
d  <- data.frame(STATION_NR = c(1,1,2),
                 PRIMARY_SAMPLE_UNIT = rep("001u",3),
                 DEPTH = c(1,1,2));
## Test normal case
expect_equal(addAvgPsuDepth(d)[,4], rep(1.5,3))
## Test case where input column is missing
expect_error(addAvgPsuDepth(d[1:2]))
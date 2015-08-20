context("testing calculateM function");
d  <- data.frame(YEAR = rep(2011, 6),
                 REGION = c(rep("DRTO",3), rep("FLA KEYS", 3)),
                 STRAT = rep(c("FMLR", "FMLR", "INPR"), 2),
                 PRIMARY_SAMPLE_UNIT = rep(c("A", "A", "B"),2),
                 STATION_NR = rep(c(1,2,1), 2),
                 NUM = 1:6
                 );
## Test that m is calculated properly
expect_equal(calculateM(d)$m, c(2,2,1,2,2,1));
## Make sure all the column names are correct
expect_equal(names(calculateM(d)), c("YEAR", "REGION", "STRAT",
                                     "PRIMARY_SAMPLE_UNIT", "STATION_NR",
                                     "NUM", "m"))
context("tests calculateNM function");
d  <- data.frame(
  YEAR = rep(2011, 10),
  REGION = c(rep("DRTO",5), rep("FLA KEYS",5)),
  STRAT = c(rep("SPGR_HR",5), rep("HRRF",5)),
  PRIMARY_SAMPLE_UNIT = c("A","A","A","B","B", "A","A", "B", "B", "C"),
  m = c(3,3,3,2,2,2,2,1,1,1)
  );
# Test that nm is calculated correctly
expect_equal(calculateNM(d)$nm, c(rep(5,5),rep(4,5)));
## Make sure all the column names are correct
expect_equal(names(calculateNM(d)), c("YEAR", "REGION", "STRAT",
                                     "PRIMARY_SAMPLE_UNIT", "m", "nm"))
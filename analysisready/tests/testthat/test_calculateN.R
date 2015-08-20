context("tests calculateN function");
d  <- data.frame(
  YEAR = rep(2011, 10),
  REGION = c(rep("DRTO",5), rep("FLA KEYS",5)),
  STRAT = c(rep("SPGR_HR",5), rep("HRRF",5)),
  PRIMARY_SAMPLE_UNIT = c("A","A","A","B","B", "A","A", "B", "B", "C")
  );
# Test that n is calculated correctly
expect_equal(calculateN(d)$n, c(2,2,2,2,2,3,3,3,3,3));
## Make sure all the column names are correct
expect_equal(names(calculateN(d)), c("YEAR", "REGION", "STRAT",
                                     "PRIMARY_SAMPLE_UNIT", "n"))
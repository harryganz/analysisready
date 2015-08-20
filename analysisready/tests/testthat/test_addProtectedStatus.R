context("testing addProtectedStatus")
d  <- data.frame(YEAR = rep(2000,3), SUBREGION_NR = c(4,3,3), 
                 MPA_NR = c(2,1,0));
# Test that it adds proper PROT values
expect_equal(addProtectedStatus(d)[,3], c(2,1,0));
# Test that it gives an error if column missing
expect_error(addProtectedStatus(d[,-1]))

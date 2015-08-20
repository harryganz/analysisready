context("testing dropInvalidHabitats")
d  <- data.frame(
  HABITAT_CD = c("ARTF_NA", "SAND_NA", "SPGR_LR"),
  DUMMY = c(1,1,1)
  );
# Test that it drops invalid habitat and keeps valid habitat
expect_equal(as.character(dropInvalidHabitats(d)$HABITAT_CD),
             "SPGR_LR");
# Test that it keeps other columns
expect_equal(dim(dropInvalidHabitats(d)), c(1,2))
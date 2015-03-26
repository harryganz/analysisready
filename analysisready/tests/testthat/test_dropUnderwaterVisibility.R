context("testing dropUnderwaterVisibility")
d  <- data.frame(UNDERWATER_VISIBILITY = c(2,4),
                 DUMMY = c(1,3));
# test that correct ro is dropped
expect_equal(dropUnderwaterVisibility(d)$DUMMY, 3);
# test that missing underwater vis returns an error
expect_error(dropUnderwaterVisibility(d[,-1]));
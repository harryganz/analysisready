context("test removeZeroes function");
d  <- data.frame(
  A = c(1,2,3,4,5,6),
  NUM = c(0,1,1,0,1,1)
  );
expect_equal(removeZeroes(d), d[-c(1,4),]);
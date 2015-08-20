context("testing dropTimeSeen")
lookup  <- data.frame(
  SPECIES_CD = c("LUT GRIS","EPI MORI","MYC BONA"),
  KEEP_10MIN = c(0,0, 1))
data  <- data.frame(
  SPECIES_CD = c("EPI MORI", "EPI MORI","MYC BONA", "MYC BONA",
                 "LUT GRIS", "LUT GRIS"),
  TIME_SEEN = c(3, 2, 3, 2, 3, 2),
  NUM = rep(1, 6)
  );
expect_equal(dropTimeSeen(data, lookup)$NUM,
             c(0,1,1,1,0,1))
expect_true(dropTimeSeen(data, lookup)$SPECIES_CD[3] == "MYC BONA")
expect_error(dropTimeSeen())

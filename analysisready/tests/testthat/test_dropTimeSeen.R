context("testing dropTimeSeen")
lookup  <- data.frame(
  SPECIES_CD = c("EPI MORI","MYC BONA"),
  KEEP_10MIN = c(0, 1))
data  <- data.frame(
  SPECIES_CD = c("EPI MORI", "EPI MORI","MYC BONA", "MYC BONA",
                 "LUT GRIS", "LUT GRIS"),
  TIME_SEEN = c(3, 2, 3, 2, 3, 2)
  )

expect_equal(dropTimeSeen(data, lookup)$TIME_SEEN,
             c(2,3,2,2))
expect_equal(dropTimeSeen(data)$TIME_SEEN,
             c(2,2,2))
expect_true(dropTimeSeen(data, lookup)$SPECIES_CD[2] == "MYC BONA")
expect_error(dropTimeSeen())

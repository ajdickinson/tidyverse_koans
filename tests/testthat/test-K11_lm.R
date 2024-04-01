K11 <- read_file("../../R/K11_lm.R")

test_that("K11: Question 1", {
  skip_incomplete(K11, "01")
  r <- parse_eval(str_match_q(K11, "01"))
  expect_equal(r[[2, 1]], "log(gdpPercap)")
})

test_that("K11: Question 2", {
  skip_incomplete(K11, "02")
  r <- parse_eval(str_match_q(K11, "02"))
  expect_equal(round(r[[1, 1]], digits = 1), .7)
})

test_that("K11: Question 3", {
  skip_incomplete(K11, "03")
  r <- parse_eval(str_match_q(K11, "03"))
  expect_equal(round(r[[1, 1]], digits = 2), .05)
})

test_that("K11: Question 4", {
  skip_incomplete(K11, "04")
  r <- parse_eval(str_match_q(K11, "04"))
  expect_equal(round(r[[1, 2]], digits = 3), .003)
})

test_that("K11: Question 5", {
  skip_incomplete(K11, "05")
  r <- parse_eval(str_match_q(K11, "05"))
  expect_equal(round(r[[3, 2]], digits = 1), .2)
})

test_that("K11: Question 6", {
  skip_incomplete(K11, "06")
  r <- parse_eval(str_match_q(K11, "06"))
  expect_equal(round(r[[6, 2]], digits = 1), 18.1)
})

test_that("K12: Question 7", {
  skip_incomplete(K11, "07")
  r <- parse_eval(str_match_q(K11, "07"))
  expect_equal(round(r[[1, 2]], digits = 1), 53.7)
})

K06b <- read_file("../../R/K06b_lm.R")

test_that("K06b: Question 1", {
  skip_incomplete(K06b, "01")
  r <- parse_eval(str_match_q(K06b, "01"))
  expect_true(grepl("qplot\\(data = gapminder, x = gdpPercap, y = lifeExp", deparse(r)))
})

test_that("K06b: Question 2", {
  skip_incomplete(K06b, "02")
  r <- parse_eval(str_match_q(K06b, "02"))
  expect_equal(r$call,
               expr(lm(formula = lifeExp ~ gdpPercap, data = gapminder)))
})

test_that("K06b: Question 3", {
  skip_incomplete(K06b, "03")
  r <- parse_eval(str_match_q(K06b, "03"))
  r <- r[[1]] # Assuming the result is the first element in a list
  expect_equal(names(r[[2, 1]]), "gdpPercap")
  expect_true(r[[2, 5]] < 0.01) # Checking if p-value < 0.01
})

test_that("K06b: Question 4", {
  skip_incomplete(K06b, "04")
  r <- parse_eval(str_match_q(K06b, "04"))
  expect_equal(names(r), "r.squared")
})

test_that("K06b: Question 5", {
  skip_incomplete(K06b, "05")
  r <- parse_eval(str_match_q(K06b, "05"))
  expect_equal(length(r), 1704)
})

test_that("K06b: Question 6", {
  skip_incomplete(K06b, "06")
  r <- parse_eval(str_match_q(K06b, "06"))
  expect_equal(length(r), 1704)
})

test_that("K06b: Question 7", {
  skip_incomplete(K06b, "07")
  r <- parse_eval(str_match_q(K06b, "07"))
  expect_true(is.numeric(r)) # Check if 'rss' is a numeric value
})

test_that("K06b: Question 8", {
  skip_incomplete(K06b, "08")
  r <- parse_eval(str_match_q(K06b, "08"))
  expect_true(is.numeric(r)) # Assuming the result is a prediction
})

test_that("K06b: Question 9", {
  skip_incomplete(K06b, "09")
  r <- parse_eval(str_match_q(K06b, "09"))
  expect_true(grepl("qplot\\(data = gapminder, x = gdpPercap, y = lifeExp", deparse(r$call))) &&
    grepl("geom_smooth\\(method = \"lm\"", deparse(r$call))
})

test_that("K06b: Question 10", {
  skip_incomplete(K06b, "10")
  r <- parse_eval(str_match_q(K06b, "10"))
  expect_equal(r[[2, 1]], "pop")
})

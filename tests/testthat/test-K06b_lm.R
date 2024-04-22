K06b <- read_file("../../R/K06b_lm.R")

test_that("K06b: Question 1", {
  skip_incomplete(K06b, "01")
  r <- parse_eval(str_match_q(K06b, "01"))  # This should be checked if it actually returns a ggplot object.

  expect_true(inherits(r, "gg")) # Check if 'r' is a ggplot object
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
  print(str(r))
  # expect_equal(r$term[2], "gdpPercap")
  expect_true(r$p.value[2] < 0.01)
})

test_that("K06b: Question 4", {
  skip_incomplete(K06b, "04")
  r <- parse_eval(str_match_q(K06b, "04"))
  r$r.squared %>% between(0.34, 0.35) %>% expect_true()
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
  expect_true(between(r, 187335, 187336))
})

test_that("K06b: Question 8", {
  skip_incomplete(K06b, "08")
  r <- parse_eval(str_match_q(K06b, "08"))
  expect_true(is.numeric(r)) # Assuming the result is a prediction
})

test_that("K06b: Question 9", {
  skip_incomplete(K06b, "09")
  r <- parse_eval(str_match_q(K06b, "09"))
  is_geom_smooth <- r$layers[[2]]$geom |> class() |> str_detect("GeomSmooth")

  # Now accessing the first element
  result <- is_geom_smooth[[1]]

  expect_true(result)
})

test_that("K06b: Question 10", {
  skip_incomplete(K06b, "10")
  r <- parse_eval(str_match_q(K06b, "10"))
  expect_true(r$term[3] == "pop")
})

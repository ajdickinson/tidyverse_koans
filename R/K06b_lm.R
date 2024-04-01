#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                 Koan #11: lm()
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn how to use lm() to estimate models with:

#   * log transformations,
#   * a squared term,
#   * no intercept,
#   * categorical variables (called "factors"),
#   * and interactions between variables.

# Run this code to get started:
library(tidyverse)
library(gapminder)

# Read the qelp docs on lm():
?qelp::lm

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#             ----- Visualizing the Relationship Between Variables -----

# 1. Before you ever run a regression, one should always try to visualize the relationship in the data. One wonderful too to do this is a scatterplot. Use `qplot` to visualize GDP per capita on the x-axis and life expectancy on the y-axis.

#01@

# qplot(data = gapminder, x = gdpPercap, y = lifeExp)

# You should see a scatter plot showing the relationship between GDP per capita and life expectancy.

#@01

#             ----- Estimates, Standard Errors, and R-Squared -----

# 2. Simple Regression: How much can a $1 increase to a country's GDP per ------
# capita be expected to boost that country's life expectancy?
# Recall the lm() syntax is: lm(y ~ x, data = gapminder)

#02@

# lm(__)

# A $1 increase to a country's GDP per capita can be associated with a __ year
# increase in life expectancy.

#@02


# lm() prints very limited information. Usually we'd at least want to know the
# standard errors along with the coefficients. Practice piping the lm() call
# into `broom::tidy(conf.int = TRUE)` to get a tidied results table that shows
# you standard errors, test statistics, p-values, and even 95% confidence
# intervals.

# 3. Pipe the simple regression from question 1 into ---------------------------
# `broom::tidy(conf.int = TRUE)`. Is the coefficient on `gdpPercap` greater
# than 0 at the 1% level?

#03@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

# The coefficient on `gdpPercap` __ greater than 0 at the 1% level.
# (In the blank above, write "is" or "is not".)

#@03


# 4. To see the regression's r-squared, pipe the lm() call into ----------------
# `broom::glance()`.

#04@

# lm(__) %>%
#   broom::glance()

# This model explains __% of the variation in lifeExp.

#@04

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#            ----- Fitted Values, Residuals, and Predict -----
#
# In this class, we'll sometimes need to access fitted values and residuals from
# an lm() call. You should use the functions fitted.values() and residuals() to
# do that.

# 5. Pipe the simple regression into fitted.values() to get a vector of --------
# length 1704 (the same length as the number of rows of gapminder).

#05@

# lm(__) %>%
#   __

#@05


# 6. Pipe the simple regression into residuals() to get another vector ---------
# of length 1704. Recall that the fitted values plus the residuals will be equal
# to the observed values for lifeExp.

#06@

# lm(__) %>%
#   __

#@06

# 7. Calculate the RSS of the regression. Recall that the RSS is the sum of squared residuals, which is the sum of the squared residuals. Expanding upon the residuals from the previous question, square each residual, sum them up, and store the result in a variable called `rss`.

#07@

# rss = lm(__) %>%
#   __ %>%
#   .^2 %>% # This squares the residuals
#   __

#@07

# 8. The newest country in the world, South Sudan, is not available in the gapminder dataset. Suppose South Sudan has a GDP per capita of $1,000 USD. According to our model, what is the predicted life expectancy of South Sudan?

#08@

# south_sudan = tibble(gdpPercap = 1000)

# lm(__) %>%
#   __

#@08

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#          ----- Plotting regression lines with qplot -----


# 9. Use qplot to plot the relationship between GDP per capita and life expectancy. To add a regression line, use the `geom_smooth` function. The `method` argument specifies the type of regression line. Use `method = "lm"` to add a linear regression line.

#09@

# qplot(data = gapminder, x = gdpPercap, y = lifeExp) +
#   geom_smooth(method = "lm", se = FALSE)

# You should see a scatter plot showing the relationship between GDP per capita and life expectancy, with a linear regression line.

#@09

# 10. Lastly, let's estimate a multiple regression model. Include both GDP per capita and population in the model. What is the coefficient on population?

# To estimate a mutlipe regression model, you can use the syntax lm(y ~ x1 + x2, data = gapminder). Adding independent variables is as simple as adding them to the formula with a plus sign.

#10@

# lm(__) %>%
#   broom::tidy(conf.int = TRUE)

# The coefficient on `pop` is __.

#@10

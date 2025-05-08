test_that("easy_barplot returns a ggplot object", {
  mtcars$cyl <- as.factor(mtcars$cyl)
  plot <- easy_barplot(mtcars, x = "cyl", y = "wt", stat = "identity", fill = "gear")
  expect_s3_class(plot, "ggplot")
})

test_that("easy_barplot errors when x is not in dataset", {
  expect_error(easy_barplot(mtcars, x = "nonexistent", y = "wt", stat = "identity"))
})

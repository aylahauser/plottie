## code to prepare `students` dataset goes here

students <- data.frame(
  favcolor_categorical = c('pink', 'red', 'blue', 'green', 'pink', 'purple', 'pink', 'blue', 'green', 'purple', 'red'),
  ids_numerical = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
  names_categorical = c("James", "Lucy", "John", "Maddie", "Liam", "Skylar", "Ben", "Amanda", "Alex", "Samantha", "Noah"),
  favorite_class_categorical = c("math", "science", "history", "math", "english", "science", "math", "english", "math", "english", "history"),
  female_logical = c(F, T, F, T, F, T, F, T, F, T, F),
  age_numerical = c(5, 6, 5, 7, 6, 5, 4, 5, 6, 6, 5)
)

usethis::use_data(students, overwrite = TRUE)

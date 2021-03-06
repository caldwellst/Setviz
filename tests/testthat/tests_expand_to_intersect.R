# is_in_test_dir<-(getwd() %>% gsub("\\/$","",.) %>% strsplit("/") %>% .[[1]] %>% last)=="unit_tests"
# if(!is_in_test_dir){setwd("./internal/R/unit_tests/")}
# setwd(dirname(rstudioapi::getActiveDocumentContext()$path));

setwd("./../..")

context("Unit tests for set intersection")
print(getwd())
source("./tests/testthat/test_utilities.R")


example<-load.example("example1",F)
data <- example$data
data_not_num <- sapply(data,as.character)
good_vector <- example$names_good
bad_vector <- example$names_bad
good_vector_bad_sign <- example$names_good_bad_sign


test_that("expand_to_set_intersections inputs correct",{
expect_error(expand_to_set_intersections(example$data, bad_vector))
expect_error(expand_to_set_intersections(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
expect_error(expand_to_set_intersections(example$data_no_num, good_vector), "data.frame")
expect_is(expand_to_set_intersections(example$data, good_vector), "data.frame")
  })


# test_that("make_set_percentages inputs correct",{
#   expect_error(make_set_percentages(example$data, bad_vector, example$weight_var))
#   expect_error(make_set_percentages(example$data, good_vector, example$random_var))
#   expect_error(make_set_percentages(example$data, good_vector_bad_sign, example$weight_var), "can't have the '&' sign in your variable names, it will mess everything up!")
#   expect_error(make_set_percentages(example$data_no_num, good_vector))
#   expect_is(make_set_percentages(example$data, good_vector, example$weight_var), "vector")
# })
#
# test_that("make_set_percentages outputs correct",{
#   expect_equal(as.numeric(make_set_percentages(example$data, good_vector[c(1:2)], example$weight_var)), 0.03639461)
#   expect_error(make_set_percentages(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
#   expect_error(make_set_percentages(example$data_no_num, good_vector), "data.frame")
#   expect_is(make_set_percentages(example$data, good_vector, example$weight_var), "numeric")
# })


# test_that("set_intersection_plot inputs correct",{
#   expect_error(set_intersection_plot(example$data, bad_vector))
#   expect_error(set_intersection_plot(example$data, good_vector_bad_sign), "can't have the '&' sign in your variable names, it will mess everything up!")
#   expect_error(set_intersection_plot(example$data_no_num, good_vector), "data.frame")
#   expect_is(set_intersection_plot(example$data, good_vector), "data.frame")
# })

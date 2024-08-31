## Test list_available_datasets() function ----

test_that("list_available_datasets(): graceful errors", {
  skip_on_cran()

  # Test that the function displays a diagnostic message instead of a hard error.
  expect_message(list_available_datasets(area = 'health and medicin'))
  expect_message(list_available_datasets(filter = 'abc'))
  expect_message(list_available_datasets(search = ''))

})

test_that("list_available_datasets(): Graceful errors with bad connection", {
  skip_on_cran()

  with_mocked_bindings(
    code = {
      # Check we ommit a diagnostic message instead of a hard error
      expect_message(result <- list_available_datasets(search = "toad"))

      # Verify empty variables data frame
      # (This indicates an empty/failed response)
      expect_equal(nrow(result), 0)
    },
    request = function(...) { stop("Error!") },
    .package = "httr2"
  )
})

test_that("list_available_datasets(): search", {
  skip_on_cran()

  df <- list_available_datasets(area = 'climate and environment')

  # Check that the function outputs text
  expect_output(print(df))

  # Check dataframe is present
  expect_s3_class(df, 'data.frame')

  # Check names of data frame output
  expect_equal(names(df), c('id', 'name', 'url'))

  # Check that the function outputs text when filter and area are set
  expect_output(print(list_available_datasets(filter = 'python', area = 'climate and environment')))

  # Check that the function outputs text when search and area are set
  expect_output(print(list_available_datasets(search = 'nino', area = 'climate and environment')))

})


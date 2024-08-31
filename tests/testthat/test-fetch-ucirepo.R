test_that("fetch_ucirepo(): Graceful errors", {
  skip_on_cran()

  with_mocked_bindings(
    code = {
      # Check we ommit a diagnostic message instead of a hard error
      expect_message(result <- fetch_ucirepo(id = -5))

      # Verify empty variables data frame
      # (This indicates an empty/failed response)
      expect_equal(nrow(result$variables), 0)
    },
    request = function(...) { stop("Error!") },
    .package = "httr2"
  )
})

test_that("fetch_ucirepo(): Nonexistent dataset", {
  skip_on_cran()
  expect_message(fetch_ucirepo(id = 2000))
})

test_that("fetch_ucirepo(): Unavailable dataset", {
  skip_on_cran()
  expect_message(fetch_ucirepo(id = 34))
})


test_that("fetch_ucirepo(): Download Heart Disease by Name", {
  skip_on_cran()

  # Download data
  heart_disease <- fetch_ucirepo(name = "heart disease")

  # Check data set properties
  expect_equal(dim(heart_disease$data$features), c(303, 13))
  expect_equal(dim(heart_disease$data$targets), c(303, 1))

})

test_that("fetch_ucirepo(): Download Heart Disease by ID", {
  skip_on_cran()

  # Download data
  heart_disease <- fetch_ucirepo(id = 45)

  # Check that the data is a list with appropriate metadata
  expect_equal(heart_disease$metadata$uci_id, 45)
  expect_equal(heart_disease$metadata$repository_url, 'https://archive.ics.uci.edu/dataset/45/heart+disease')

  # Attribute metadata should have been moved
  expect_null(heart_disease$metadata$variables)
  expect_null(heart_disease$attributes)

  # Dataset has no IDs
  expect_null(heart_disease$data$ids)

  # Check data set properties
  expect_equal(dim(heart_disease$data$features), c(303, 13))
  expect_equal(dim(heart_disease$data$targets), c(303, 1))

  # Check that the data variable information is correct
  expect_equal(heart_disease$variables[1, 'name'], 'age')
})

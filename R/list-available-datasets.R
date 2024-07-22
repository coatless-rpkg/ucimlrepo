#' List Available Datasets from UCI ML Repository
#'
#' Prints a list of datasets that can be imported via the \code{fetch_ucirepo} function.
#'
#' @param filter Character. Optional query to filter available datasets based on a label.
#' @param search Character. Optional query to search for available datasets by name.
#' @param area Character. Optional query to filter available datasets based on subject area.
#'
#' @return
#' Prints the list of available datasets.
#'
#' Invisibly returns a data frame containing the list of available datasets
#' with columns of:
#'
#' - **id**: Integer ID for the data set.
#' - **name**: Name of Dataset
#' - **url**: Download location of the data set
#'
#' @include constants.R
#' @export
#' @examples
#' list_available_datasets(search = "iris")
#' list_available_datasets(area = "social science")
#' list_available_datasets(filter = "python") # Required for now...
list_available_datasets <- function(filter, search, area) {

  # Validate filter input
  if (!missing(filter)) {
    if (!is.character(filter)) {
      stop('Filter must be a string')
    }
    filter <- tolower(filter)
  }

  # Validate search input
  if (!missing(search)) {
    if(!is.character(search) ) {
      stop('Search query must be a string')
    }
    search <- tolower(search)
  }

  # Construct endpoint URL
  query_params <- list()
  if (!missing(filter)) {
    query_params$filter <- filter
  } else {
    query_params$filter <- 'python'  # default filter should be 'r', but python for now.
  }

  if (!missing(search)) {
    query_params$search <- search
  }
  if (!missing(area)) {
    query_params$area <- area
  }

  # Fetch list of datasets from API
  response <- tryCatch({
    httr2::request(API_LIST_URL) |>
      httr2::req_url_query(!!!query_params) |>
      httr2::req_perform()
  }, error = function(e) {
    message('Error connecting to server')
    message(e)
    return()
  })

  # Convert body to JSON
  # Avoid enforcing the application/json format response
  data <- response |> httr2::resp_body_json(check_type = FALSE) |> {\(x) x$data}()

  if (response$status_code != 200) {
    message('Error fetching datasets with status code: ', response$status_code)
    return()
  }

  if (length(data) == 0) {
    message('No datasets found')
    return()
  }

  # Create and return a table of data
  table_of_data <- as.data.frame(do.call(rbind, data))

  # Add attributes to the data frame
  attr(table_of_data, 'filter') <- if(!missing(filter)) filter else NULL
  attr(table_of_data, 'search') <- if(!missing(search)) search else NULL
  attr(table_of_data, 'area') <-  if(!missing(area)) area else NULL

  # Add class to the data frame to allow for customized print
  class(table_of_data) <- c('ucimlrepo_list_of_available_datasets', 'data.frame')

  return(table_of_data)
}

#' @export
print.ucimlrepo_list_of_available_datasets <- function(x, ...) {

  # Create separate data frame to operate on...
  x2 <- x

  # Unpack
  filter <- attr(x, 'filter')
  search <- attr(x, 'search')
  area <- attr(x, 'area')

  # Nullify
  attr(x2, 'filter') <- NULL
  attr(x2, 'search') <- NULL
  attr(x2, 'area') <- NULL
  class(x2) <- 'data.frame'

  # Print table title
  title <- paste0(
    'The following ', if (!is.null(filter)) paste0(filter, ' ') else '',
    'datasets are available',
    if (!is.null(search)) paste0(' for search query "', search, '"') else '', ':'
  )

  cat(paste(rep('-', nchar(title)), collapse = ''), fill = TRUE)
  cat(title, fill = TRUE)
  if (!is.null(area)) {
    cat(paste0('For subject area: ', area), fill = TRUE)
  }
  cat(paste(rep('-', nchar(title)), collapse = ''), fill = TRUE)


  # Print the table
  print(x2[, c('name', 'id')], row.names = FALSE, right = FALSE)

  cat(fill = TRUE)
  invisible(x)
}

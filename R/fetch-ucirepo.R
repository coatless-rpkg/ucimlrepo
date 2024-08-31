#' Empty Fetch Response
#'
#' Internal function to create an empty fetch response.
#'
#' @return
#' A list containing dataset metadata, dataframes, and variable info in its properties.
#'
#' @seealso
#' [`fetch_ucirepo()`]
#'
#' @keywords internal
empty_fetch_response <- function() {
  list(
    data = list(
      ids = data.frame(),
      features = data.frame(),
      targets = data.frame(),
      original = data.frame(),
      headers = character()
    ),
    metadata = list(
      uci_id = integer(),
      name = character(),
      repository_url = character(),
      data_url = character(),
      abstract = character(),
      area = character(),
      tasks = list(),
      characteristics = list(),
      num_instances = integer(),
      num_features = integer(),
      feature_types = list(),
      demographics = list(),
      target_col = list(),
      index_col = NULL,
      has_missing_values = character(),
      missing_values_symbol = character(),
      year_of_dataset_creation = integer(),
      last_updated = character(),
      dataset_doi = character(),
      creators = list(),
      intro_paper = list(
        title = character(),
        authors = character(),
        published_in = character(),
        year = integer(),
        url = character(),
        doi = NULL
      ),
      additional_info = list(
        summary = character(),
        purpose = NULL,
        funded_by = NULL,
        instances_represent = NULL,
        recommended_data_splits = NULL,
        sensitive_data = NULL,
        preprocessing_description = NULL,
        variable_info = character(),
        citation = NULL
      )
    ),
    variables = data.frame(
      name = character(),
      role = character(),
      type = character(),
      demographic = character(),
      description = character(),
      units = character(),
      missing_values = character(),
      stringsAsFactors = FALSE
    )
  )
}


#' Fetch UCI ML Repository Dataset
#'
#' Loads a dataset from the UCI ML Repository, including the dataframes and
#' metadata information.
#'
#' @param name Character. Dataset name, or substring of name.
#' @param id Integer. Dataset ID for UCI ML Repository.
#'
#' @return
#' A list containing dataset metadata, dataframes, and variable info in its properties.
#'
#' - **data**: Contains dataset matrices as pandas dataframes
#'   - **ids**: Dataframe of ID columns
#'   - **features**: Dataframe of feature columns
#'   - **targets**: Dataframe of target columns
#'   - **original**: Dataframe consisting of all IDs, features, and targets
#'   - **headers**: List of all variable names/headers
#' - **metadata**: Contains metadata information about the dataset.
#'    - **uci_id**: Unique dataset identifier for UCI repository
#'    - **name**: Name of dataset on UCI repository
#'    - **repository_url**: Link to dataset webpage on the UCI repository
#'    - **data_url**: Link to raw data file
#'    - **abstract**: Short description of dataset
#'    - **area**: Subject area e.g. life science, business
#'    - **tasks**: Associated machine learning tasks e.g. classification, regression
#'    - **characteristics**: Dataset types e.g. multivariate, sequential
#'    - **num_instances**: Number of rows or samples
#'    - **num_features**: Number of feature columns
#'    - **feature_types**: Data types of features
#'    - **target_col**: Name of target column(s)
#'    - **index_col**: Name of index column(s)
#'    - **has_missing_values**: Whether the dataset contains missing values
#'    - **missing_values_symbol**: Indicates what symbol represents the missing entries (if the dataset has missing values)
#'    - **year_of_dataset_creation**: Year that data set was created
#'    - **dataset_doi**: DOI registered for dataset that links to UCI repo dataset page
#'    - **creators**: List of dataset creator names
#'    - **intro_paper**: Information about dataset's published introductory paper
#'    - **external_url**: URL to external dataset page. This field will only exist for linked datasets i.e. not hosted by UCI
#'    - **additional_info**: Descriptive free text about dataset
#'      - **summary**: General summary
#'      - **purpose**: For what purpose was the dataset created?
#'      - **funded_by**: Who funded the creation of the dataset?
#'      - **instances_represent**: What do the instances in this dataset represent?
#'      - **recommended_data_splits**: Are there recommended data splits?
#'      - **sensitive_data**: Does the dataset contain data that might be considered sensitive in any way?
#'      - **preprocessing_description**: Was there any data preprocessing performed?
#'      - **variable_info**: Additional free text description for variables
#'      - **citation**: Citation Requests/Acknowledgements
#' - **variables**: Contains variable details presented in a tabular/dataframe format
#'   - **name**: Variable name
#'   - **role**: Whether the variable is an ID, feature, or target
#'   - **type**: Data type e.g. categorical, integer, continuous
#'   - **demographic**: Indicates whether the variable represents demographic data
#'   - **description**: Short description of variable
#'   - **units**: Variable units for non-categorical data
#'   - **missing_values**: Whether there are missing values in the variable's column
#'
#' @details
#'
#' Only provide name or id, not both.
#'
#'
#' @include constants.R
#' @export
#' @examples
#' # Access Data by Name
#' iris_dl <- fetch_ucirepo(name = "iris")
#'
#' # Access original data
#' iris_uci <- iris_dl$data$original
#'
#' # Access features and targets
#' iris_features <- iris_dl$data$features
#' iris_targets <- iris_dl$data$targets
#'
#' # Access Data by ID
#' iris_dl <- fetch_ucirepo(id = 53)
#'
fetch_ucirepo <- function(name, id) {
  # Check that only one argument is provided
  if (!missing(name) && !missing(id)) {
    stop('Only specify either dataset name or ID, not both')
  }

  # Validate types of arguments and add them to the endpoint query string

  # Construct endpoint URL
  query_params <- list()

  if (!missing(name)) {
    if (!is.character(name)) {
      stop('Name must be a string')
    }
    query_params$name <- name
  } else if (!missing(id)) {
    if (!is.numeric(id)) {
      stop('ID must be an integer')
    }
    query_params$id <- id
  } else {
    # No arguments provided
    stop('Must provide a dataset name or ID')
  }

  # Fetch metadata from API
  response <- try({
    httr2::request(API_BASE_URL) |>
      httr2::req_url_query(!!!query_params) |>
      httr2::req_perform()
  })

  if (inherits(response, "try-error")) {
    message('Error connecting to server')
    return(invisible(empty_fetch_response()))
  }

  if (response$status_code != 200) {
    message('Dataset not found in repository')
    return(invisible(empty_fetch_response()))
  }

  data <- response |> httr2::resp_body_json(check_type = FALSE)

  # Extract ID, name, and URL from metadata
  metadata <- data$data
  if (missing(id)) {
    id <- metadata$uci_id
  } else if (missing(name)) {
    name <- metadata$name
  }

  data_url <- metadata$data_url

  # No data URL means that the dataset cannot be imported into R
  if (is.null(data_url)) {
    message(paste0('"', name, '" dataset (id=', id, ') exists in the repository, but is not available for import. Please select a dataset from this list: https://archive.ics.uci.edu/datasets?skip=0&take=10&sort=desc&orderBy=NumHits&search=&Python=true'))
    return(invisible(empty_fetch_response()))
  }

  # Parse into dataframe using read.csv
  df <- tryCatch({
    utils::read.csv(data_url, check.names = FALSE)
  }, error = function(e) {
    message(paste0('Error reading data csv file for "', name, '" dataset (id=', id, ').'))
    return(invisible(empty_fetch_response))
  })

  if (nrow(df) == 0) {
    message(paste0('Error reading data csv file for "', name, '" dataset (id=', id, ').'))
    return(invisible(empty_fetch_response()))
  }

  # Header line should be variable names
  headers <- colnames(df)

  # Feature information, class labels
  variables <- metadata$variables

  # Clear variable information from metadata
  metadata$variables <- NULL

  # Organize variables into IDs, features, or targets
  # First, ensure all roles are valid
  if (!all(sapply(variables, function(v) v$role %in% c("ID", "Feature", "Target", "Other")))) {
    stop('Role must be one of "ID", "Feature", "Target", or "Other".')
  }

  # Create the list of variables by role
  variables_by_role <- lapply(
    c("ID", "Feature", "Target", "Other"),
    function(role) {
      trimws(sapply(variables[sapply(variables, function(v) v$role == role)], `[[`, "name"))
    }
  )

  # Name the list elements
  names(variables_by_role) <- c("ID", "Feature", "Target", "Other")

  # Extract dataframes for each variable role
  ids_df <- if (length(variables_by_role$ID) > 0) df[ , unlist(variables_by_role$ID), drop = FALSE] else NULL
  features_df <- if (length(variables_by_role$Feature) > 0) df[ , unlist(variables_by_role$Feature), drop = FALSE] else NULL
  targets_df <- if (length(variables_by_role$Target) > 0) df[ , unlist(variables_by_role$Target), drop = FALSE] else NULL

  # Place all varieties of dataframes in data object
  data <- list(
    ids = ids_df,
    features = features_df,
    targets = targets_df,
    original = df,
    headers = headers
  )

  # Function to replace NULL with NA
  replace_nulls <- function(x) {
    lapply(x, function(y) if (is.null(y)) NA else y)
  }

  # Convert variables from JSON structure to tabular structure for easier visualization
  variables <- do.call(rbind, lapply(variables, function(x) as.data.frame(replace_nulls(x))))


  # Make nested metadata fields accessible via list notation
  metadata$additional_info <- if (!is.null(metadata$additional_info)) metadata$additional_info else NULL
  metadata$intro_paper <- if (!is.null(metadata$intro_paper)) metadata$intro_paper else NULL

  # Construct result object
  result <- list(
    data = data,
    metadata = metadata,
    variables = variables
  )

  return(result)
}

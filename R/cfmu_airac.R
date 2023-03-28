#' The CFMU epoch date for AIRAC numbering scheme
#'
#' @return the epoch date for CFMU AIRAC numbering scheme
#' @keywords internal
#' @family airac
#'
cfmu_airac_epoch <- function() {
  lubridate::ymd("1984-09-27", tz = "UTC")
}

#' The CFMU epoch number for AIRAC numbering scheme
#'
#' @return the epoch number for CFMU AIRAC numbering scheme
#' @keywords internal
#' @family airac
#'
cfmu_airac_epoch_number <- function() {
  0
}

#' return the CFMU AIRAC cycle number for a date
#'
#' @param date a date
#'
#' @return a number indicating the AIRAC cycle according to CFMU scheme
#' @family airac
#' @export
#'
#' @examples
#' cfmu_airac('2019-01-30')
#'
cfmu_airac <- function(date) {
  d <- lubridate::ymd(date, tz = "UTC")
  num_cycles <- lubridate::interval(cfmu_airac_epoch(), d) %/% lubridate::ddays(28)
  # or alternatively
  # num_cycles <- as.integer((as.integer(d) - as.integer(cfmu_airac_epoch())) / 2419200)
  num_cycles + cfmu_airac_epoch_number()
}

#' The interval of dates for a CFMU AIRAC number
#'
#' @param cfmu_airac a CFMU AIRAC number
#'
#' @return an interval of dates (28 days)
#' @family airac
#' @export
#'
#' @examples
#' cfmu_airac_interval(441)
#'
cfmu_airac_interval <- function(cfmu_airac) {
  airac_beg <- cfmu_airac_epoch() +
    lubridate::ddays( (cfmu_airac - cfmu_airac_epoch_number()) * 28)
  airac_end <- airac_beg + lubridate::ddays(28)
  lubridate::interval(airac_beg, airac_end)
}

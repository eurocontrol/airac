#' AIRAC epoch as from ICAO Doc 8126
#'
#' AIRAC epoch is defined in  section 2.6.2 b) of
#'  \href{https://www.icao.int/NACC/Documents/Meetings/2014/ECARAIM/REF09-Doc8126.pdf}{ICAO Doc 8126}.
#'
#' @return the AIRAC epoch according to ICAO scheme
#' @family airac
#' @export
#'
#' @examples
#' airac_epoch()
#'
airac_epoch <- function() {
  lubridate::ymd("1998-01-29", tz = "UTC")
}

#' Return the ICAO AIRAC id for a date
#'
#' @param date a date (or a representation of it understood by [lubridate::ymd()])
#'
#' @return the ICAO AIRAC id
#' @family airac
#' @export
#'
#' @examples
#' airac('2019-01-30')
#'
airac <- function(date) {
  d <- lubridate::ymd(date, tz = "UTC")
  extra_days <- ( lubridate::interval(cfmu_airac_epoch(), d) %/% lubridate::days(1)) %%     28
  d <- d - lubridate::days(extra_days)
  y_beg <- lubridate::floor_date(d, "year")
  num_cycles <- ((lubridate::interval(y_beg, d) %/% lubridate::days(1)) %/% 28) + 1
  cy <- sprintf("%02d", num_cycles)
  yy <- format(d, "%y")
  paste0(yy, cy)
}


#' Return the effective date of the first AIRAC for year `year`
#'
#' @param year a year (as integer)
#'
#' @return the WEF date for the first AIRAC of the year `year`
#' @family airac
#' @export
#'
#' @examples
#' airac_year_epoch(2018)
#'
airac_year_epoch <- function(year) {
  y_beg <- lubridate::ymd(paste0(year, "-01-01"), tz = "UTC")
  # days since last effective date
  extra_days <- lubridate::interval(airac_epoch(), y_beg) %/% lubridate::days(1) %% 28
  y_beg - lubridate::days(extra_days) + lubridate::days(28)
}


#' The interval of dates for an (ICAO) AIRAC
#'
#' @param airac the ICAO AIRAC, i.e. "1603" for the 3rd AIRAC of 2016
#'
#' @return an interval of (28) days covered by the AIRAC `airac`
#' @family airac
#' @export
#'
#' @examples
#' airac_interval("1603")
#'
airac_interval <- function(airac) {
  year <- lubridate::ymd(
    paste0(substr(airac, 1, 2), "-01-01"),
    tz = "UTC")
  year <- lubridate::year(year)
  cycle <- as.integer(substr(airac, 3, 4))
  y_epoch <- airac_year_epoch(year)
  a_beg <- y_epoch + lubridate::ddays( (cycle - 1) * 28)
  # TODO: check for correct `airac`
  # stopifnot(airac(a_beg) != airac)
  a_end <- a_beg + lubridate::ddays(28)
  lubridate::interval(a_beg, a_end)
}

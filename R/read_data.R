#'
#' Read Oxford University Equity and Inclusivity in Research Funding dataset
#' 
#' @param path File path to downloaded dataset
#' @param type Type of dataset to read from the Oxford University Equity and
#'   Inclusivity in Research Funding dataset. Should be one of the following:
#'   *analysis* for the funding scheme analysis, *code* for the code sheet for
#'   the scheme analysis, or *fgd* for the focus group discussion themes.
#'   Default is *analysis*.
#' 
#' @returns A data.frame of specified dataset to read
#' 
#' @examples
#' read_ox_equity_dataset(path = "data-raw/combined-analysis-final.xlsx")
#' 
#' @export
#' 

read_ox_equity_dataset <- function(path, type = c("analysis", "code", "fgd")) {
  sheet <- switch(type, analysis = 2, code = 3, fgd = 4)

  .range <- switch(type, analysis = "A4:M37", code = "A2:A37", fgd = "A3:J16")

  readxl::read_xlsx(path = path, sheet = sheet, range = .range)
}
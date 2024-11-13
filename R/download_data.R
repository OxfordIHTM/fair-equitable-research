#'
#' Download Oxford University Equity and Inclusivity in Research Funding dataset
#' 
#' @param path File path to download dataset to
#' 
#' @returns File path to downloaded dataset 
#' 
#' @examples
#' download_ox_equity_dataset(path = ""data-raw/combined-analysis-final.xlsx"")
#' 
#' @export
#' 

download_ox_equity_dataset <- function(url, path) {
  download.file(url = url, destfile = path)

  path
}


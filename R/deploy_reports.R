#'
#' Deploy reports to GitHub pages
#' 
#' @param report_links A vector of file paths to the various generated report
#'   outputs. This is usually provided by targets produced by calls to \
#'   `tar_render()` or `tar_quarto()`.
#' 
#' @returns URL to deployed report
#' 

deploy_report <- function(report_links) {
  to <- dirname(report_links) |> basename() |> unique()

  file.copy(from = report_links, to = to, recursive = TRUE)

  
  file.path("https://oxford-ihtm.io/fair-equitable-research", file_name)
}
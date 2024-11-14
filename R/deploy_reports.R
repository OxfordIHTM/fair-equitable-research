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
  report_links <- stringr::str_detect(report_links, "Rmd|qmd", negate = TRUE) |>
    (\(x) report_links[x])()

  directory_name <- dirname(report_links) |> basename() |> unique()

  file_name <- basename(report_links)

  to <- file.path("docs", directory_name)

  dir.create(path = to, showWarnings = FALSE)

  file.copy(from = report_links, to = to, recursive = TRUE)

  
  file.path(
    "https://oxford-ihtm.io/fair-equitable-research", 
    directory_name, file_name
  )
}
#'
#' Render quarto reports
#' 
#' @param input The input file or project directory to be rendered.
#' 
#' @returns File path to rendered report
#' 

render_quarto_report <- function(input) {
  quarto::quarto_render(input = input)

  file_names <- paste(
    tools::file_path_sans_ext(basename(input)), 
    c("html", "pdf"), sep = "."
  )

  file.path(dirname(input), "docs", file_names)
} 
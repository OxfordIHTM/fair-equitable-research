################################################################################
#
# General Targets Workflow
#
################################################################################

## Load libraries and custom functions -----------------------------------------
suppressPackageStartupMessages(source("packages.R"))
for (f in list.files(here::here("R"), full.names = TRUE)) source (f)

## Create targets and list targets objects -------------------------------------

### Data targets
data_targets <- tar_plan(
  tar_target(
    name = ox_equity_diversity_funding_dataset_url,
    command = "https://researchsupport.admin.ox.ac.uk/sitefiles/combined-analysis-final.xlsx"
  ),
  tar_target(
    name = ox_equity_diversity_funding_dataset_file,
    command = download_ox_equity_dataset(
      url = ox_equity_diversity_funding_dataset_url,
      path = "data-raw/combined-analysis-final.xlsx"
    ),
    format = "file"
  ),
  tar_target(
    name = ox_equity_diversity_funding_dataset,
    command = read_ox_equity_dataset(
      path = ox_equity_diversity_funding_dataset_file,
      type = "analysis"
    )
  ),
  tar_target(
    name = ox_equity_diversity_funding_dataset_codes,
    command = read_ox_equity_dataset(
      path = ox_equity_diversity_funding_dataset_file,
      type = "codes"
    )
  ),
  tar_target(
    name = ox_equity_diversity_funding_dataset_fgd,
    command = read_ox_equity_dataset(
      path = ox_equity_diversity_funding_dataset_file,
      type = "fgd"
    )
  )
)


### Processing targets
processing_targets <- tar_plan(
  
)


### Analysis targets
analysis_targets <- tar_plan(
  
)


### Output targets
output_targets <- tar_plan(
  
)


### Reporting targets
report_targets <- tar_plan(
  # tar_quarto(
  #   name = ferc_scoping_review_report,
  #   path = "reports/scoping-review/ferc_scoping_review.qmd"
  # )
  tar_target(
    name = ferc_scoping_review_report,
    command = render_quarto_report(
      input = "reports/scoping-review/ferc_scoping_review.qmd"
    ),
    format = "file"
  )
)


### Deploy targets
deploy_targets <- tar_plan(
  tar_target(
    name = ferc_scoping_review_url,
    command = deploy_report(ferc_scoping_review_report)
  )
)


## List targets
all_targets()

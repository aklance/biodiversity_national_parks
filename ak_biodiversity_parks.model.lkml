connection: "lookerdata_publicdata"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: ak_biodiversity_national_parks_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ak_biodiversity_national_parks_default_datagroup

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.10
# NOTE: for BigQuery specific considerations

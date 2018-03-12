connection: "lookerdata_publicdata"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: biodiversity_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: biodiversity_default_datagroup

explore: species {
  label: "Parks and Species"
  join: parks {
    type: left_outer
    sql_on: ${parks.park_code} = ${species.park_code_id};;
    relationship: many_to_many
  }
}




# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.10
# NOTE: for BigQuery specific considerations

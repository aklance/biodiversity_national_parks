connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard"

datagroup: biodiversity_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: biodiversity_default_datagroup

explore: species {
  label: "Cities, Parks, & Species"

  join: parks {
    type: left_outer
    sql_on: ${parks.name} = ${species.park_name};;
    relationship: many_to_one
  }

  join: get_your_location {
    type:  cross
#     sql_on: ${get_your_location.state_id} = ${parks.state} ;;
    relationship: many_to_one
  }

}

explore: cities {
  hidden: yes
}


# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.10
# NOTE: for BigQuery specific considerations

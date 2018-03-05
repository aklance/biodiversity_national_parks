view: species {
  sql_table_name: biodiversity_in_parks.species ;;

  dimension: species_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Species_ID ;;
  }

  dimension: abundance {
    type: string
    sql: ${TABLE}.Abundance ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: common_names {
    type: string
    sql: ${TABLE}.Common_Names ;;
  }

  dimension: conservation_status {
    type: string
    sql: ${TABLE}.Conservation_Status ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.Family ;;
  }

  dimension: ignore_me {
    type: string
    sql: ${TABLE}.ignore_me ;;
  }

  dimension: nativeness {
    type: string
    sql: ${TABLE}.Nativeness ;;
  }

  dimension: occurrence {
    type: string
    sql: ${TABLE}.Occurrence ;;
  }

  dimension: order {
    type: string
    sql: ${TABLE}.Order ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.Park_Name ;;
  }

  dimension: record_status {
    type: string
    sql: ${TABLE}.Record_Status ;;
  }

  dimension: scientific_name {
    type: string
    sql: ${TABLE}.Scientific_Name ;;
  }

  dimension: seasonality {
    type: string
    sql: ${TABLE}.Seasonality ;;
  }

  measure: count {
    label: "Species Count"
    type: count
    approximate_threshold: 100000
    drill_fields: [species_id, scientific_name, park_name]
  }
}

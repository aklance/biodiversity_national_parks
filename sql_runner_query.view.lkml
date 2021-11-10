view: sql_runner_query {
  derived_table: {
    sql: SELECT
        (ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(parks.Park_Acres ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(parks.Park_Code  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(parks.Park_Code  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(parks.Park_Code  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(parks.Park_Code  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) / NULLIF(CAST(COUNT(DISTINCT CASE WHEN  parks.Park_Acres  IS NOT NULL THEN parks.Park_Code  ELSE NULL END) AS FLOAT64), 0.0)) AS parks_average,
        COUNT(*) AS species_count_of_species
      FROM biodiversity_in_parks.species  AS species
      LEFT JOIN biodiversity_in_parks.parks  AS parks ON parks.Park_Name = species.Park_Name

      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: parks_average {
    type: number
    sql: ${TABLE}.parks_average ;;
  }

  dimension: species_count_of_species {
    type: number
    sql: ${TABLE}.species_count_of_species ;;
  }

  set: detail {
    fields: [parks_average, species_count_of_species]
  }
}

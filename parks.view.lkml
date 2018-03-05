view: parks {
  sql_table_name: biodiversity_in_parks.parks ;;


## DIMENSIONS ##
  dimension: acres {
    type: number
    sql: ${TABLE}.Acres ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;

  }

  dimension: park_code {
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Park_Name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: region {
    case: {
      when: {
        sql: ${state} in ('WA','OR','CA','NV','UT','WY','ID','MT','CO','AK','HI', 'CA, NV', 'WY, MT, ID' ) ;;
        label: "West"
      }
      when: {
        sql: ${state} in ('AZ','NM','TX','OK') ;;
        label: "Southwest"
      }
      when: {
        sql: ${state} in ('ND','SD','IA','WI','MN','OH','IN','MO','NE','KS','MI','IL') ;;
        label: "Midwest"
      }
      when: {
        sql: ${state} in ('MD','DE','NJ','CT','RI','ME','NH','PA','NY','VT','DC', 'MA') ;;
        label: "Northeast"
      }
      when: {
        sql: ${state} in ('AR','LA','MS','AL','GA','FL','SC','NC','VA','TN','KY','WV', 'TN, NC') ;;
        label: "Southeast"
      }
      else: "Unknown"
    }
  }

  dimension: park_type {
    label: "* Park Type"
    sql: ${TABLE}.is_large_park AND ${TABLE}.is_small_park ;;
  }

  parameter: filter_on_park_type {
    label: "Park Type"
    type: string

    allowed_value: {
      label: "Large"
      value: "Large National Park"
    }
    allowed_value: {
      label: "Small"
      value: "Small National Park"
    }
  }

  dimension: is_large_park {
    group_label: "TEST"
    type: yesno
    sql: ${acres} >= 1000000 ;;
    label: "Large National Park"
    description: "Park has more than a million acres"
  }

  dimension:  is_small_park {
    group_label: "TEST"
    type:  yesno
    sql: ${acres} <= 100000 ;;
    label: "Small National Park"
    description: "Park has less than a hundred thousand acres"
  }

## MEASURES ##

  ## set:   {}


  measure: count {
    type: count
    drill_fields: [name, state, location]
  }
  measure: count_parks_per_state {
    type: count_distinct
    sql:  ${TABLE}.state ;;
  }

  ## insert measure total acres of national park/state

## density of nat park per state



}

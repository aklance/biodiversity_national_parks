view: parks {
  sql_table_name: biodiversity_in_parks.parks ;;


## DIMENSIONS ##
  dimension: acres {
    description: "Size of the park in acres"
    type: number
    sql: ${TABLE}.Park_Acres ;;
    drill_fields: [drill_parks*]
  }

  dimension: relative_size {
    description: "The amount of football fields that fit in this park"
    type: number
    sql: round(${acres}/1.32, 0) ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: location {
    description: "Location in lat,long coordinates"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    drill_fields: [drill_parks*]
    map_layer_name: us_states

  }

  dimension: distance2 {
    type: distance
    start_location_field: get_your_location.location
    end_location_field: location
    units: miles
    hidden: yes
  }

  dimension: distance {
    type: number
    sql: CAST(${distance2} AS INT64) ;;
  }


  dimension: park_code {
    description: "Size of the park in acres"
    primary_key: yes
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: name {
    description: "Official park name"
    type: string
    sql: ${TABLE}.Park_Name ;;
    html:
    {{ linked_value }}
    <a href="/dashboards/90?={{ value | url_encode }}&Park%20Name= {{ value }}" target="_new">
    <img src="/images/qr-graph-line@2x.png" height=20 width=20> </a>
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2d/Google-favicon-2015.png" height=15 width=15> </a> ;;
    }
#     link: {
#       label: "Google Search"
#       url: "https://www.google.com/search?q= {{ value }}"
#       icon_url: "data:image/png;base64,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"
#     }
#     link: {
#       label: "See Park Profile"
#       url: "/dashboards/90?Park%20Name= {{ value }}"
#     }

# https://productday.dev.looker.com/dashboards/90?Park%20Name=&I%20am%20a...=


  dimension: state {
    description: "The state in the US where the park is located"
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: region {
    description: "Region in the US where the park is located"
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

  drill_fields: [drill_parks*]

  }


  parameter: filter_on_park_size {
    label: "Park Size"
    type: string

    allowed_value: {
      label: "Large"
      value: "Large National Park"
    }
    allowed_value: {
      label: "Small"
      value: "Small National Park"
    }
    allowed_value: {
      label: "Medium"
      value: "Medium National Park"
    }
  }

  dimension: is_large_park {
    hidden:  yes
    group_label: "Park Size"
    type: yesno
    sql: ${acres} >= 1000000 ;;
    label: "Large National Park"
    description: "Park has more than a million acres"
  }

  dimension: is_medium_park {
    hidden:  yes
    group_label: "Park Size"
    type:  yesno
    sql:  ${acres} > 100000 AND ${acres} < 1000000;;
  }

  dimension:  is_small_park {
    hidden:  yes
    group_label: "Park Size"
    type:  yesno
    sql: ${acres} <= 100000 ;;
    label: "Small National Park"
    description: "Park has less than a hundred thousand acres"
  }

#   dimension: nps_logo {
#   html: <a <img src="https://www.nps.gov/common/commonspot/templates/images/logos/nps_social_image_02.jpg" height=15 width=15> </a> ;;
#   }
#   sql: ${count} ;;

## MEASURES ##
  measure: count {
    type: count
  }

  measure: total_acres {
    type: sum
    sql: ${acres} ;;
  }

  set: drill_parks {
    fields: [name, state, location, region, distance, acres]
    }




  ## insert measure total acres of national park/state
}

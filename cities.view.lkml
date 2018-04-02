view: cities {
  # # You can specify the table name if it's different from the view name:
  sql_table_name:biodiversity_in_parks.cities ;;

  dimension: city {
    type:  string
    sql: ${TABLE}.city ;;
  }

  dimension: state_id {
    type:  string
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type:  string
    sql: ${TABLE}.state_name ;;
  }

  dimension: latitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: longitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: location {
    description: "Location in lat,long coordinates"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
}

dimension: city_state {
  type:  string
  sql: CONCAT(${city}, ", ", ${state_id}) ;;
}



}

#   Acadia National Park ...  44.35,-68.21 ...
# 2 Arches National Park ...  38.68,-109.57 ...
# 3 Badlands National Park ...  43.75,-102.5 ...
# 4 Big Bend National Park ...  29.25,-103.25 ...
# 5 Biscayne National Park ...  25.65,-80.08 ...
# 6 Black Canyon of the Gunnison National Park ...  38.57,-107.72 ...
# 7 Bryce Canyon National Park ...  37.57,-112.18 ...
# 8 Canyonlands National Park ... 38.2,-109.93 ...
# 9 Capitol Reef National Park ...  38.2,-111.17 ...
# 10  Carlsbad Caverns National Park ...  32.17,-104.44 ...
# 11  Channel Islands National Park ... 34.01,-119.42 ...
# 12  Congaree National Park ...  33.78,-80.78 ...
# 13  Crater Lake National Park ... 42.94,-122.1 ...
# 14  Cuyahoga Valley National Park ... 41.24,-81.55 ...
# 15  Death Valley National Park ...  36.24,-116.82 ...
# 16  Denali National Park and Preserve ... 63.33,-150.5 ...
# 17  Dry Tortugas National Park ...  24.63,-82.87 ...
# 18  Everglades National Park ...  25.32,-80.93 ...
# 19  Gates Of The Arctic National Park and Preserve ...  67.78,-153.3 ...
# 20  Glacier Bay National Park and Preserve ...  58.5,-137.0 ...
# 21  Glacier National Park ... 48.8,-114.0 ...
# 22  Grand Canyon National Park ...  36.06,-112.14 ...
# 23  Grand Teton National Park ... 43.73,-110.8 ...
# 24  Great Basin National Park ... 38.98,-114.3 ...
# 25  Great Sand Dunes National Park and Preserve ... 37.73,-105.51 ...
# 26  Great Smoky Mountains National Park ... 35.68,-83.53 ...
# 27  Guadalupe Mountains National Park ... 31.92,-104.87 ...
# 28  Haleakala National Park ... 20.72,-156.17 ...
# 29  Hawaii Volcanoes National Park ...  19.38,-155.2 ...
# 30  Hot Springs National Park ... 34.51,-93.05 ...
# 31  Isle Royale National Park ... 48.1,-88.55 ...
# 32  Joshua Tree National Park ... 33.79,-115.9 ...
# 33  Katmai National Park and Preserve ... 58.5,-155.0 ...
# 34  Kenai Fjords National Park ...  59.92,-149.65 ...
# 35  Kobuk Valley National Park ...  67.55,-159.28 ...
# 36  Lake Clark National Park and Preserve ... 60.97,-153.42 ...
# 37  Lassen Volcanic National Park ... 40.49,-121.51 ...
# 38  Mammoth Cave National Park ...  37.18,-86.1 ...
# 39  Mesa Verde National Park ...  37.18,-108.49 ...
# 40  Mount Rainier National Park ... 46.85,-121.75 ...
# 41  North Cascades National Park ...  48.7,-121.2 ...
# 42  Olympic National Park ... 47.97,-123.5 ...
# 43  Petrified Forest National Park ...  35.07,-109.78 ...
# 44  Pinnacles National Park ... 36.48,-121.16 ...
# 45  Redwood National Park ... 41.3,-124.0 ...
# 46  Rocky Mountain National Park ...  40.4,-105.58 ...
# 47  Saguaro National Park ... 32.25,-110.5 ...
# 48  Sequoia and Kings Canyon National Parks ... 36.43,-118.68 ...
# 49  Shenandoah National Park ...  38.53,-78.35 ...
# 50  Theodore Roosevelt National Park ...  46.97,-103.45 ...
# 51  Voyageurs National Park ... 48.5,-92.88 ...
# 52  Wind Cave National Park ... 43.57,-103.48 ...
# 53  Wrangell - St Elias National Park and Preserve ...  61.0,-142.0 ...
# 54  Yellowstone National Park ... 44.6,-110.5 ...
# 55  Yosemite National Park ...  37.83,-119.5 ...
# 56  Zion National Park ...  37.3,-113.05 ...


# dimension: distance_from_city_to_park {
#   type: distance
#   start_location_field: location
#   end_location_field: location_of_selected_park
#   units:
#
# }


  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }


# view: cities {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
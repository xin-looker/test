connection: "thelook"

# include all the views
include: "*.view"
include: "test.dashboard"

datagroup: thelook_xin1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "6 hour"
}

case_sensitive: no

access_grant: user_age {
  allowed_values: ["abc"]
  user_attribute: advanced_string
}

map_layer: us_counties {
  url: "https://raw.githubusercontent.com/deldersveld/topojson/master/countries/united-states/us-albers-counties.json"
#   format: topojson
#   feature_key: "geometries"
  property_key: "name"
#   min_zoom_level: 100
#   projection: albers
}

test: userview {
  explore_source: users {
    column: user_count {
      field: users.count
    }
    expression_custom_filter: ${users.gender}="m";;
  }
  assert: over5000 {
    expression: ${users.count}<7000;;
  }
}

explore: test_filter {
  always_filter: {
    filters: {
      field: date_temp
      value: "today"
    }
  }
}

explore: events {
  persist_with: thelook_xin1_default_datagroup
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
#   always_filter: {
#     filters: {
#       field: dynamic_date_param
#     }
#   }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {

  # join: fips {
  #   relationship: many_to_one
  #   sql_on: ${users.city}=${fips.name} ;;
  # }
  # join: user_2 {
  #   fields: [user_2.count_distinct_30days_ago]
  #   type: left_outer
  #   sql_on: date_add(${user_2.created_date}, interval 30 day)=${users.created_date} ;;
  # }
}

explore: users_nn {}

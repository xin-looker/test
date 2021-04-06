connection: "thelook"

# include all the views
include: "*.view"
# include: "//thelook_xin/*.view"
include: "test.dashboard"

fiscal_month_offset: 1


named_value_format: std_eur {
  value_format: "#,##0.00 [$€-x-euro1]"
}
named_value_format: std_usd {
  value_format: "[$$-es-UY] #,##0.00"
}

datagroup: thelook_xin1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "6 hour"
}

datagroup: api_trigger {
  sql_trigger: select 1 ;;
}

case_sensitive: no

access_grant: user_age {
  allowed_values: ["xin.bao@looker.com"]
  user_attribute: email
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
  # sql_always_where: {% condition order_items.order_items_id %}${order_items.id}{% endcondition %} ;;
  aggregate_table: rollup__created_month {
    query: {
      dimensions: [users.state, orders.created_month]
      measures: [count]
      timezone: "UTC"
    }

    materialization: {
      persist_for: "24 hours"
    }
  }
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
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
  group_label: "1.General"
  aggregate_table: rollup__created_month {
    query: {
      dimensions: [users.state, orders.created_month]
      measures: [count]
      timezone: "UTC"
    }

    materialization: {
      persist_for: "24 hours"
    }
  }
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

explore: order_items_calendar_vieww {
  view_name: order_items
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }
  join: calendar_table {
    type: inner
    relationship: one_to_one
    sql_on: ${calendar_table.calendar_date}>=${orders.created_date} AND
    ${calendar_table.calendar_date}<=${order_items.returned_date};;
  }
}

explore: users {
  # access_filter: {
  #   field: country
  #   user_attribute: company
  # }
}

explore: users123 {
  from: users
  access_filter: {
    field: country
    user_attribute: company
  }
  required_access_grants: [user_age]
}


explore: users_nn {}

explore: calendar_table {}

explore: fips {}

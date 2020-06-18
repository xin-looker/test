view: test_filter {
  derived_table: {
    sql: SELECT
        COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders

      WHERE
        orders.created_at > {% date_start date_temp %} and orders.created_at < {% date_end date_temp %}
      LIMIT 500
       ;;
  }

  filter: date_temp {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [orders_count]
  }
}

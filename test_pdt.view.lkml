view: test_pdt {
  derived_table: {
    datagroup_trigger: api_trigger
    sql:
            SELECT
              DATE(date_add(orders.created_at, interval 3 year) ) AS `orders.created_date`,
              COUNT(*) AS `orders.count`
            FROM (select * from demo_db.orders)  AS orders

            WHERE
              (((date_add(orders.created_at, interval 3 year) ) >= ((DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/Los_Angeles')),INTERVAL -6 day))) AND (date_add(orders.created_at, interval 3 year) ) < ((DATE_ADD(DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/Los_Angeles')),INTERVAL -6 day),INTERVAL 7 day)))))
            GROUP BY 1
            ORDER BY DATE(date_add(orders.created_at, interval 3 year) ) DESC
            LIMIT 500
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_created_date {
    type: date
    sql: ${TABLE}.`orders.created_date` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [orders_created_date, orders_count]
  }
}

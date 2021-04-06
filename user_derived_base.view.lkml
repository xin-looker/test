explore: user_derived_test {}

view: user_derived_base {
  derived_table: {
    sql: SELECT
          `state` AS `users.state`,
          COUNT(*) AS `users.count`
      FROM
          `demo_db`.`users` AS `users`
      GROUP BY
          1
      ORDER BY
          COUNT(*) DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [users_state, users_count]
  }
}


view: user_derived_test {
  derived_table: {
    sql: SELECT
          `users.state` AS `users.state`,
      FROM
          ${user_derived_base.SQL_TABLE_NAME}
      GROUP BY
          1
      LIMIT 500
       ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  # dimension: users_count {
  #   type: number
  #   sql: ${TABLE}.`users.count` ;;
  # }

  # set: detail {
  #   fields: [users_state, users_count]
  # }
}

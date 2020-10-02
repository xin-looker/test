explore: test_max_without_subquery {
  sql_always_where: ${created_date} > ${test} ;;
}

view: test_max_without_subquery {
  derived_table: {
    sql: {% assign my_array = max_user_date._parameter_value | remove: "'" %}
    select * from demo_db.orders where created_at > date({{my_array}});;
  }

  dimension: test {
    type: string
    sql: {% assign my_array = max_user_date._parameter_value | remove: "'" %}
    date({{my_array}})
    ;;
  }

  parameter: max_user_date {
    type: string
    suggest_explore: users
    suggest_dimension: users.max_user_created_date
    suggest_persist_for: "0 seconds"
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}.created_at ;;
  }
  }

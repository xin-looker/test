view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
    sql: date_add(${TABLE}.created_at, interval 1 year) ;;
  }

  dimension: created_text {
    type: string
    sql: ${created_date} ;;
    html: <a href="https://www.google.ie" target="_blank">{{value}}</a> ;;

  }

  parameter: timeframe {
    type: unquoted
    allowed_value: {
      value: "month"
      label: "MoM"
    }
    allowed_value: {
      value: "week"
      label: "WoW"
    }
  }

  measure: this_month {
    type: count
    filters: {
      field: created_month
      value: "10 month ago for 1 months"
    }
  }

  measure: last_month {
    type: count
    filters: {
      field: created_month
      value: "11 months ago for 1 months"
    }
  }

  measure: this_week {
    type: count
    filters: {
      field: created_week
      value: "20 weeks ago for 1 week"
    }
  }

  measure: last_week {
    type: count
    filters: {
      field: created_week
      value: "21 weeks ago for 1 week"
    }
  }


  measure: this_period {
    type: number
    sql: {% if timeframe._parameter_value == 'month' %}
    ${this_month}
    {% else %}
    ${this_week}
    {% endif %};;
  }

  measure: last_period {
    type: number
    sql: {% if timeframe._parameter_value == 'month' %}
          ${last_month}
          {% else %}
          ${last_week}
          {% endif %};;
  }

  dimension: period_over_period {

  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count_status {
    type: number
    sql: count(distinct ${status}) ;;
  }

  measure: avg {
    type: number
    sql: ${count}/${count_status} ;;
    value_format_name: decimal_1
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: status_number {
    type: number
    sql: case when ${status}='cancelled' then 2 else 3 end ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }

  measure: total {
    type: number
    sql: ${status_number}*${count} ;;
  }
}

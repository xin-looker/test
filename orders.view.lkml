view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: test {
    type: string
    sql: "a" ;;
    html: {{_user_attributes['advanced_string']}} ;;
    suggest_explore: covid_combined
    suggest_dimension: covid_combined.country

  }

  dimension: created_year_styled {
    type: date_year
    sql: ${created_date} ;;
    html: {% if value == 2019 %}
    <p>this year</p>
    {% else %}
    {{value}}
    {% endif %};;
  }

  dimension_group: created_hahahah {
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
    sql: date_add(${TABLE}.created_at, interval 7 year) ;;
#     html: {% if created_day_of_week_index._value == 4 OR created_day_of_week_index._value == 5 %}
#     <div style="background-color:lime">{{value}}</div>
#     {% else %}
#     {{value}}
#     {% endif %};;
    drill_fields: []
#     html: {% assign order_date=value | %s %}
#     {% assign user_date=users.created_date | %s %}
#     {% if order_date > user_date %}
#     <div style="background-color: yellow">{{value}}<div>
#     {% else %}
#     {{value}}
#     {% endif %};;
  }

  parameter: days_ago {
    type: number
  }

  dimension: x_days_ago {
    type: string
    sql: case when ${created_date}>date_add(CURDATE(), interval -{% parameter days_ago %} day) and
    ${created_date}<=CURDATE() then 'last {% parameter days_ago %} days'
    when ${created_date} >date_add(CURDATE(), interval -2*{% parameter days_ago %} day) and
    ${created_date}<date_add(CURDATE(), interval -{% parameter days_ago %} day) then 'previous {% parameter days_ago %} days'
    else null end;;
  }

  dimension: created_date_1 {
    type: date
    sql: ${TABLE}.created_at ;;
    html: {% assign order_date=value | date:'%s' %}
    {% assign user_date=users.created_date._value | date:'%s' %}
    {% if order_date > user_date %}
    <div style="background-color: yellow">{{rendered_value}}<div>
    {% else %}
    {{value}}
    {% endif %};;
  }

  filter: month_filter {
    type: date
  }

  dimension: monthly_running_total {
    type: string
    sql: case when ${created_date}<{% date_start month_filter %} then 'pre'
    when ${created_date}>{% date_end month_filter %} then null
    else cast(${created_month} as char) end;;
  }

  filter: date_temp {
    type: date
  }

  dimension_group: duration_year {
    type: duration
    sql_start: ${users.created_date} ;;
    sql_end: ${created_date} ;;
  }

  dimension: duration_year_number {
    type: number
    sql: ${years_duration_year} ;;
  }

  parameter: dynamic_date_param {
    type: date
#     default_value: "today"
  }

  dimension: dynamic_month_filter {
    type: yesno
    hidden: yes
    sql:
    {% if dynamic_date_param._is_filtered %}
    (((date_add(orders.created_at, interval 1 year) ) >= ({{dynamic_date_param._parameter_value}})
    AND (date_add(orders.created_at, interval 1 year) ) < ((DATE_ADD({{dynamic_date_param._parameter_value}},INTERVAL 12 month)))))
    {% else %}
    true
    {% endif %};;
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.sales ;;
    filters: {
      field: dynamic_month_filter
      value: "yes"
    }
    required_fields: [dynamic_date_param]
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
    html: {% if value == "complete" %}
      <div style="background-color: #123456">{{ value }}</div>
    {% elsif value == "cancelled" %}
      <div style="background-color:#654321">{{ value }}</div>
    {% else %}
      <div style="background-color: red">{{ value }}</div>
    {% endif %};;
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
    drill_fields: [id, users.first_name, users.last_name, users.this_field_does_not_exist, order_items.count]
  }


  measure: count_12months {
    type: count
    filters: {
      field: dynamic_month_filter
      value: "yes"
    }
  }

  ################dynamic conditional formatting################

  parameter: red {
    type: number
  }

  parameter: green {
    type: number
  }

  parameter: yellow {
    type: number
  }

  dimension: red_dim {
    type: number
    hidden: yes
    sql: {{red._parameter_value}} ;;
  }

  dimension: yellow_dim {
    type: number
    hidden: yes
    sql: {{yellow._parameter_value}} ;;
  }

  dimension: green_dim {
    type: number
    hidden: yes
    sql: {{green._parameter_value}} ;;
  }

  measure: count_colored {
    type: count
    html:
    {% if value < red_dim._value %}
    <div style="background-color:red"><font color="white">{{value}}</font></div>
    {% elsif value < yellow_dim._value  %}
    <div style="background-color:yellow">{{value}}</div>
    {% else %}
    <div style="background-color:lime">{{value}}</div>
    {% endif %};;
  }



  ##############################################################


}

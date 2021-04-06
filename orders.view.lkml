view: orders {
  sql_table_name: (select * from demo_db.orders) ;;

  dimension: order_id {
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

  dimension: test2 {
    type: string
    sql: "a" ;;
    html: {{_user_attributes['advanced_string']}} ;;
    suggest_explore: covid_combined
    suggest_dimension: covid_combined.country

  }

  filter: gender_filter {
    type: string
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month,
      day_of_week,
      day_of_week_index,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: date_add(${TABLE}.created_at, interval 3 year) ;;
    convert_tz: no
#     html: {% if created_day_of_week_index._value == 4 OR created_day_of_week_index._value == 5 %}
#     <div style="background-color:lime">{{value}}</div>
#     {% else %}
#     {{value}}
#     {% endif %};;
    # drill_fields: []
#     html: {% assign order_date=value | %s %}
#     {% assign user_date=users.created_date | %s %}
#     {% if order_date > user_date %}
#     <div style="background-color: yellow">{{value}}<div>
#     {% else %}
#     {{value}}
#     {% endif %};;
    drill_fields: []
  }

  dimension: year_dup {
    type: date_year
    sql: date_add(${TABLE}.created_at, interval 3 year) ;;
    convert_tz: no
  }

#   measure: max_date {
#     type: date
#     sql: max(${created_hahahah_date}) ;;
#   }

  # dimension: max_date {
  #   type: string
  #   sql: max(${created_date}) OVER (PARTITION BY `users.id`);;
  # }

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
      value: "1 months ago"
    }
  }

  measure: same_date_one_year_ago {
    type: count
    filters: [created_date: "1 year ago for 1 day"]
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
    # html: {% if value == "complete" %}
    #   <div style="background-color: #123456">{{ value }}</div>
    # {% elsif value == "cancelled" %}
    #   <div style="background-color:#654321">{{ value }}</div>
    # {% else %}
    #   <div style="background-color: red">{{ value }}</div>
    # {% endif %};;
  }

  measure: count_status {
    type: number
    sql: count(distinct ${status}) ;;
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
    # drill_fields: [id, users.first_name, users.last_name, users.this_field_does_not_exist, order_items.count]
    link: {
      label: "relative link"
      url: "../dashboards/821jJUH9IAz1YdlE4z229I"
    }
    link: {
      label: "absolute link"
      url: "https://dcleu.eu.looker.com/dashboards/821jJUH9IAz1YdlE4z229I"
    }
    link: {
      label: "external link"
      url: "www.google.ie"
    }
    value_format_name: decimal_0
  }

  measure: count_plus {
    type: number
    sql: ${count}+800 ;;
    html: {{count._rendered_value}} ;;
  }

  measure: decimal_number {
    type: number
    sql: ${count}*.123 ;;
    value_format_name: decimal_0
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




  #period over period#

  filter: current_date_range {
    type: date
    view_label: "_PoP"
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
  }

  dimension: period_2_start {
    # hidden:  yes
    view_label: "_PoP"
    description: "Calculates the start of the previous period"
    type: date
    sql: DATE_ADD({% date_start current_date_range %}, interval -1 month);;
    convert_tz: no
  }

  dimension: period_2_end {
    # hidden:  yes
    view_label: "_PoP"
    description: "Calculates the end of the previous period"
    type: date
    sql: DATE_ADD({% date_end current_date_range %}, interval -1 month);;
  }

  dimension: day_in_period {
    # hidden: yes
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
    {% if current_date_range._is_filtered %}
        CASE
        WHEN {% condition current_date_range %} ${created_raw} {% endcondition %}
        THEN TIMESTAMPDIFF(DAY, DATE({% date_start current_date_range %}), ${created_date}) + 1
        WHEN ${created_date} between ${period_2_start} and ${period_2_end}
        THEN TIMESTAMPDIFF(DAY, ${period_2_start}, ${created_date}) + 1
        END
    {% else %} NULL
    {% endif %}
    ;;
  }

  dimension: order_for_period {
    hidden: yes
    type: number
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${created_raw} {% endcondition %}
            THEN 1
            WHEN ${created_date} between ${period_2_start} and ${period_2_end}
            THEN 2
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Current Period"
    type: time
    sql: DATE_ADD(DATE({% date_start current_date_range %}, interval ${day_in_period} - 1 DAY )) ;;
    view_label: "_PoP"
    timeframes: [
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month,
      month_name,
      month_num,
      year]
  }

  dimension: period {
    view_label: "_PoP"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    order_by_field: order_for_period
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${created_raw} {% endcondition %}
            THEN 'This {% parameter compare_to %}'
            WHEN ${created_date} between ${period_2_start} and ${period_2_end}
            THEN 'Last {% parameter compare_to %}'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }

## ---------------------- TO CREATE FILTERED MEASURES ---------------------------- ##

  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${created_raw} {% endcondition %} THEN 'this'
            WHEN ${created_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

# Filtered measures

  measure: current_period_count {
    view_label: "_PoP"
    type: count
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_count {
    view_label: "_PoP"
    type: count
    filters: [period_filtered_measures: "last"]
  }

  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_count} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_count} / NULLIF(${previous_period_count} ,0)) - 1 END ;;
    value_format_name: percent_2
  }





}

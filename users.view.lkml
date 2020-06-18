view: users {
  sql_table_name: demo_db.users;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  filter: date_filter {
    type: date
  }

  dimension: static_sql {
    type: string
    sql: 'case when age>20 then \'hello 20\' else @variable end' ;;
  }

  dimension: test_get_sql_from_value {
    type: string
    sql: substr(${static_sql},1);;
  }

  dimension: diff_date_filter {
    type: duration_day
    sql_start: {% date_start date_filter %} ;;
    sql_end: {% date_end date_filter %}  ;;
  }

  dimension: age {
    type: number
    label: "user_age"
#     required_access_grants: [user_age]
    sql: ${TABLE}.age ;;
  }

  dimension: email_yesno {
    type: yesno
    sql: ${TABLE}.email = '{{_user_attributes['email']}}' ;;
  }

  measure: test_running_total {
    type: running_total
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    map_layer_name: us_counties
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    html: <p style="background-color: red">{{value}}</p> ;;
  }

  dimension: country_2 {
    type: string
    map_layer_name: countries
    sql: case when ${TABLE}.state = 'California' then 'USA'
    when ${TABLE}.state = 'New York' then 'Japan'
    when ${TABLE}.state = 'Texas' then 'China'
    when ${TABLE}.state = 'Illinois' then 'Australia'
    when ${TABLE}.state = 'Florida' then 'Japan'
    when ${TABLE}.state = 'Ohio' then 'France'
    when ${TABLE}.state = 'Arizona' then 'UK'
    else null
    end
    ;;
  }

  dimension: red {
    type: string
    sql: 'red' ;;
    html: {{country._rendered_value}} ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      minute30,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  measure: max_date {
    type: date
    sql: max(${created_date}) ;;
    convert_tz: no
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  parameter: country_param {
    type: unquoted
    suggest_dimension: state
  }

  dimension: is_m {
    type: yesno
    label: "Attribute - {{_filters['users.state']}}"
    sql: ${gender}='m' ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: 30days_offset{
    type: yesno
    sql: {% condition created_date %} date_add(${created_date}, interval 30 day){% endcondition %};;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
#     html: {% if value == count_distinct._value %}
#     <div style="background-color:yellow">{{rendered_value}}</div>
#     {% endif %};;



#     link: {
#       url: "{{link}}&f['derived_table_view_name.last_available_date']={{last_available_date._value}}"
#       label: "See the companies for the last available date"
#     }

#     link: {
#       url: "{{link}}&_filters['users.last_name']={{value}}"
#       label: "See the companies for the last available date"
#     }
#     link: {
#       url: "{{link}}"
#       label: "See the companies for the last available date"
#     }
  }

  measure: count_distinct {
    type: count_distinct
    view_label: "Users"
    sql: ${id} ;;
  }

  measure: negative_count {
    type: number
    sql: ${count_distinct}*-1 ;;
#     value_format: "[>=1000]$0.00,\"K\";\$0.0"
    value_format: "[>1000]$#.0,\"K\";[<=-1000]-$#.0,\"K\";$#.0"
  }

  measure: count_30daysago {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: 30days_offset
      value: "yes"
    }
  }

  filter: state_f {
    type: string
  }

  filter: first_name_f {
    type: string
  }

  dimension: circular_test {
    type: string
#     sql:  {% if state_f._is_filtered AND _filters['state_f'] == state._value %}
#     ${state}
#     when {% condition first_name_f %}${first_name}{% endcondition %}
#     then ${last_name}
#     else ${country}
#     end;;

   sql: case when false then 1 else 2 end
  ;;
  }

#   measure: max_date {
#     type: date
#     sql: max(${created_date}) ;;
#   }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}

view: user_2 {
  extends: [users]

  measure: count_distinct_30days_ago {
    type: count_distinct
    view_label: "Users"
    sql: ${id} ;;
  }
}

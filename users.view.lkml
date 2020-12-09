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

  parameter: attri {
    type: string
    allowed_value: {
      label: "first_name"
      value: "first_name"
    }
    allowed_value: {
      label: "last_name"
      value: "last_name"
    }
  }

  dimension: max_user_created_date {
    type: string
    sql: (select max(${created_date}) from demo_db.users) ;;
  }

  dimension: test_suggest_liquid {
    type: string
    sql: {% if attri._parameter_value == "'first_name'" %}
    ${first_name}
    {% else %}
    ${last_name}
    {% endif %};;
    suggest_persist_for: "0 seconds"
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
    html: <video width="560" height="315" controls="controls" class="video-stream" x-webkit-airplay="allow" src="https://www.youtube.com/jFeBaV2hFb4">
</video> ;;
    # html: <iframe width="420" height="315"
    # src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1&mute=1">
    # </iframe> ;;
  }

  dimension: age_50 {
    type: yesno
    sql: ${age}>50 ;;
  }

  dimension: test_liquid {
    type: string
    sql: {% if age_50 == false %}
    'under 50'
    {% else %}
    'over 50'
    {% endif %};;
  }

  # dimension: test_constant_array {
  #   type: string
  #   sql:
  #   {% assign array=@{an_array2} | split: "," %}
  #   '{{array[0]}}' ;;
  # }

  dimension: age_yesno {
    type: number
    sql: ${age_50} ;;
  }

  dimension: yesno_icon {
    type: string
    sql: ${gender} ;;
    html: <div style="border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; background: #eaf1fe; height: 200px; text-align: center; margin-bottom: 10px;">
  <div>
    <img style="height: 60px; margin-top: 30px;" src="https://looker.com/assets/img/images/logos/looker_black.svg"/>
    <h1 style="font-size: 28px;">Business Pulse</h1>
  </div>
<nav style="font-size: 18px; position: absolute; bottom: 0; text-align: center;">
  <a style="padding: 5px; line-height: 40px; font-weight: bold;" href="#home">
    <svg style="height: 16px; fill: #4285F4;" class="svg-icon" viewBox="0 0 20 20">
              <path d="M17.431,2.156h-3.715c-0.228,0-0.413,0.186-0.413,0.413v6.973h-2.89V6.687c0-0.229-0.186-0.413-0.413-0.413H6.285c-0.228,0-0.413,0.184-0.413,0.413v6.388H2.569c-0.227,0-0.413,0.187-0.413,0.413v3.942c0,0.228,0.186,0.413,0.413,0.413h14.862c0.228,0,0.413-0.186,0.413-0.413V2.569C17.844,2.342,17.658,2.156,17.431,2.156 M5.872,17.019h-2.89v-3.117h2.89V17.019zM9.587,17.019h-2.89V7.1h2.89V17.019z M13.303,17.019h-2.89v-6.651h2.89V17.019z M17.019,17.019h-2.891V2.982h2.891V17.019z"></path>
            </svg>
          Pulse</a>
  <a style="padding: 5px; line-height: 40px;" href="#news">
    <svg style="height: 16px; fill: #4285F4;" class="svg-icon" viewBox="0 0 20 20">
              <path d="M12.075,10.812c1.358-0.853,2.242-2.507,2.242-4.037c0-2.181-1.795-4.618-4.198-4.618S5.921,4.594,5.921,6.775c0,1.53,0.884,3.185,2.242,4.037c-3.222,0.865-5.6,3.807-5.6,7.298c0,0.23,0.189,0.42,0.42,0.42h14.273c0.23,0,0.42-0.189,0.42-0.42C17.676,14.619,15.297,11.677,12.075,10.812 M6.761,6.775c0-2.162,1.773-3.778,3.358-3.778s3.359,1.616,3.359,3.778c0,2.162-1.774,3.778-3.359,3.778S6.761,8.937,6.761,6.775 M3.415,17.69c0.218-3.51,3.142-6.297,6.704-6.297c3.562,0,6.486,2.787,6.705,6.297H3.415z"></path>
            </svg>
          Demographics</a>
  <a style="padding: 5px; line-height: 40px;" href="#contact">
  <svg  style="height: 16px; fill: #4285F4;" class="svg-icon" viewBox="0 0 20 20">
              <path d="M17.237,3.056H2.93c-0.694,0-1.263,0.568-1.263,1.263v8.837c0,0.694,0.568,1.263,1.263,1.263h4.629v0.879c-0.015,0.086-0.183,0.306-0.273,0.423c-0.223,0.293-0.455,0.592-0.293,0.92c0.07,0.139,0.226,0.303,0.577,0.303h4.819c0.208,0,0.696,0,0.862-0.379c0.162-0.37-0.124-0.682-0.374-0.955c-0.089-0.097-0.231-0.252-0.268-0.328v-0.862h4.629c0.694,0,1.263-0.568,1.263-1.263V4.319C18.5,3.625,17.932,3.056,17.237,3.056 M8.053,16.102C8.232,15.862,8.4,15.597,8.4,15.309v-0.89h3.366v0.89c0,0.303,0.211,0.562,0.419,0.793H8.053z M17.658,13.156c0,0.228-0.193,0.421-0.421,0.421H2.93c-0.228,0-0.421-0.193-0.421-0.421v-1.263h15.149V13.156z M17.658,11.052H2.509V4.319c0-0.228,0.193-0.421,0.421-0.421h14.308c0.228,0,0.421,0.193,0.421,0.421V11.052z"></path>
            </svg>
          Web Analytics</a>
</nav>
</div>;;

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
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    # html: <p style="background-color: red">{{value}}</p> ;;
    drill_fields: [state, city, gender, created_year, count]
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

  dimension: last_day_of_month {
    type: yesno
    sql: ${created_date}=last_day(${created_date}) ;;
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
    tags: ["segment_group_id"]
  }

  dimension: state_form {
    type: string
    sql: ${state} ;;
    action: {
      label: "test state form"
      url: "https://test12345567788.com"
      form_param: {
        name: "state tags"
        type: select
        required: yes
        option: {
          name: "test1"
          label: "test1"
        }
        option: {
          name: "test2"
          label: "test2"
        }
      }
      user_attribute_param: {
        user_attribute: first_name
        name: "first_name_tag"
      }
    }
  }

  dimension: state2 {
    type: string
    sql: ${TABLE}.state ;;
    tags: ["user_id"]
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
    html:  <b>{{value}}</b>;;
  }

  measure: count2 {
    type: count
    drill_fields: [detail*]
  }


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

  parameter: attri {
    type: string
    # allowed_value: {
    #   label: "first_name"
    #   value: "first_name"
    # }
    # allowed_value: {
    #   label: "last_name"
    #   value: "last_name"
    # }
    allowed_value: {
      label: "mid_name"
      value: "mid_name"
    }
  }
}

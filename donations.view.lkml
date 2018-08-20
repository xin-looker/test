view: donations {
  sql_table_name: `donorschoose-data-analytics.donorschoose.donations` ;;

  dimension: donation_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Donation_ID ;;
  }

  measure: donation_amount {
    type: sum
    sql: ${TABLE}.Donation_Amount ;;
#     value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  dimension: donation_included_optional_donation {
    type: yesno
    sql: ${TABLE}.Donation_Included_Optional_Donation ;;
  }

  dimension_group: donation_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Donation_Received_Date ;;
    convert_tz: yes
  }

  dimension: donor_cart_sequence {
    type: number
    sql: ${TABLE}.Donor_Cart_Sequence ;;
  }

  dimension: donor_id {
    type: string
    sql: ${TABLE}.Donor_ID ;;
    link: {
      label: "hello"
      url: "http://www.google.com/search?q={{ value }}&f[donations.donation_included_optional_donation]={{ _filters['donations.donation_included_optional_donation'] || yes }}
      &f[donations.donor_id]={{ donations.donation_included_optional_donation._rendered_value}}"
    }
  }

  dimension: project_id_mdf {
    type: string
#     sql: ${TABLE}.Project_ID ;;
    sql: if(( '{{ (_user_attributes['first_name']) }}'= 'Xin' OR '{{ (_user_attributes['last_name']) }}' = 'Xin'), CAST(${TABLE}.project_id AS STRING), '123' );;
  }



  dimension: project_id {
    type: string
    sql: ${TABLE}.Project_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [donation_id]
  }
}

view: donations {
  sql_table_name: `donorschoose-data-analytics.donorschoose.donations` ;;

  dimension: donation_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Donation_ID ;;
  }

  dimension: donation_amount {
    type: number
    sql: ${TABLE}.Donation_Amount ;;
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

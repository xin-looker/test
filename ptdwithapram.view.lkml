view: pdtwithparam {
  derived_table: {
    sql: SELECT
        donations.Donation_ID  AS donations_donation_id,
        donations.Donation_Received_Date AS donations_donation_received_time,
        COALESCE(SUM(donations.Donation_Amount ), 0) AS donations_donation_amount
      FROM `donorschoose-data-analytics.donorschoose.donations`  AS donations

      GROUP BY 1,2
      ORDER BY 2 DESC
       ;;
  }

  parameter: timeframe {
    type: unquoted
    allowed_value: {
      label: "half hour"
      value: "donations_donation_received_time_minute30"
    }

    allowed_value: {
      label: "hour"
      value: "donations_donation_received_time_hour"
    }

    allowed_value: {
      label: "date"
      value: "donations_donation_received_time_date"
    }

    allowed_value: {
      label: "month"
      value: "donations_donation_received_time_month"
    }

    allowed_value: {
      label: "year"
      value: "donations_donation_received_time_year"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donations_donation_id {
    type: string
    sql: ${TABLE}.donations_donation_id ;;
  }



  dimension_group: donations_donation_received_time {
    type: time
    timeframes: [minute30,hour,hour2,date,week,month,year]
    sql: ${TABLE}.donations_donation_received_time ;;
  }

  measure: donations_donation_amount {
    type: average
    sql: ${TABLE}.donations_donation_amount ;;
  }

  set: detail {
    fields: [donations_donation_id, donations_donation_received_time_date, donations_donation_amount]
  }
}

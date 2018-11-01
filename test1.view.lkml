view: test1 {
  derived_table: {
    sql: SELECT
        donations.Donation_Included_Optional_Donation
       AS donations_donation_included_optional_donation,
        donors.Donor_ID  AS donors_donor_id,
        donors.Donor_State  AS donors_donor_state,
        COALESCE(SUM(donations.Donation_Amount ), 0) AS donations_donation_amount
      FROM `donorschoose-data-analytics.donorschoose.donations`  AS donations
      LEFT JOIN `luminous-style-213120.donorschoose_test.donors`  AS donors ON donations.Donor_ID=donors.Donor_ID
      GROUP BY 1,2,3
      ORDER BY 4 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donations_donation_included_optional_donation {
    type: yesno
    sql: ${TABLE}.donations_donation_included_optional_donation ;;
  }

  dimension: donors_donor_id {
    type: string
    sql: ${TABLE}.donors_donor_id ;;
  }

  dimension: donors_donor_state {
    type: string
    sql: ${TABLE}.donors_donor_state ;;
  }

  measure: donations_donation_amount {
    type: average
    sql: ${TABLE}.donations_donation_amount ;;
  }

  set: detail {
    fields: [donations_donation_included_optional_donation, donors_donor_id, donors_donor_state, donations_donation_amount]
  }
}

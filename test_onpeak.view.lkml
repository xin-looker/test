view: test_onpeak {
  derived_table: {
    sql: WITH test1 AS (SELECT donations.Donation_Included_Optional_Donation AS donations_donation_included_optional_donation,
        donors.Donor_ID  AS donors_donor_id,
        donors.Donor_State  AS donors_donor_state,
        COALESCE(SUM(donations.Donation_Amount ), 0) AS donations_donation_amount
      FROM `donorschoose-data-analytics.donorschoose.donations`  AS donations
      LEFT JOIN ${donorid.SQL_TABLE_NAME}  AS donors ON donations.Donor_ID=donors.Donor_ID
      WHERE donors.donor_state = 'California'
      GROUP BY 1,2,3
      ORDER BY 4 DESC
       ),
       test2 AS (SELECT donations.Donation_Included_Optional_Donation AS donations_donation_included_optional_donation,
        donors.Donor_ID  AS donors_donor_id,
        donors.Donor_State  AS donors_donor_state,
        COALESCE(SUM(donations.Donation_Amount ), 0) AS donations_donation_amount
      FROM `donorschoose-data-analytics.donorschoose.donations`  AS donations
      LEFT JOIN ${donorid.SQL_TABLE_NAME}  AS donors ON donations.Donor_ID=donors.Donor_ID
      where donations.Donation_Included_Optional_Donation
      GROUP BY 1,2,3
      ORDER BY 4 DESC
       )

SELECT
  donors.Donor_ID  AS donors_donor_id,
  test2.donors_donor_state  AS test2_donors_donor_state,
  AVG(test3.donations_donation_amount ) AS test3_donations_donation_amount
FROM ${donorid.SQL_TABLE_NAME}  AS donors
LEFT JOIN test1 AS test2 ON donors.Donor_ID=test2.donors_donor_id
LEFT JOIN test1 AS test3 ON donors.Donor_ID=test3.donors_donor_id

GROUP BY 1,2
ORDER BY 3 DESC
 ;;
  }

  filter: donor_id_filter {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donors_donor_id {
    type: string
    sql: ${TABLE}.donors_donor_id ;;
  }

  dimension: test2_donors_donor_state {
    type: string
    sql: ${TABLE}.test2_donors_donor_state ;;
  }

  dimension: test3_donations_donation_amount {
    type: number
    sql: ${TABLE}.test3_donations_donation_amount ;;
  }

  set: detail {
    fields: [donors_donor_id, test2_donors_donor_state, test3_donations_donation_amount]
  }
}

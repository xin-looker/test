connection: "xin_test"

# include all the views
include: "*.view"

datagroup: test_multiple_database_connetion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# persist_with: test_multiple_database_connetion_default_datagroup



explore: donors {
  join: test2 {
    from: test1
    sql_on: ${donors.donor_id}=${test2.donors_donor_id} ;;
    sql_where: ${test2.donors_donor_state} = 'California';;
    relationship: one_to_one
  }

  join: test3 {
    from: test1
    sql_on: ${donors.donor_id}=${test3.donors_donor_id} ;;
    sql_where:  ${test3.donations_donation_included_optional_donation} = 'Yes' ;;
    relationship: one_to_one
  }
}

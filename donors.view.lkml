view: donors {
  sql_table_name: `luminous-style-213120.donorschoose_test.donors` ;;

  dimension: donor_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Donor_ID ;;
  }

  dimension: donor_city {
    type: string
    sql: ${TABLE}.Donor_City ;;
  }

  dimension: donor_is_teacher {
    type: yesno
    sql: ${TABLE}.Donor_Is_Teacher ;;
  }

  dimension: donor_state {
    type: string
    sql: ${TABLE}.Donor_State ;;
  }

  dimension: donor_zip {
    type: string
    sql: ${TABLE}.Donor_Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [donor_id]
  }
}

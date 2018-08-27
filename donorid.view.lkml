view: donorid {
  derived_table: {
    sql: SELECT * FROM `luminous-style-213120.donorschoose_test.donors` as donors where {% condition donor_id_filter  %} donors.donor_id {% endcondition %};;
  }

  filter: donor_id_filter {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donor_id {
    type: string
    sql: ${TABLE}.Donor_ID ;;
  }

  dimension: donor_city {
    type: string
    sql: ${TABLE}.Donor_City ;;
  }

  dimension: donor_state {
    type: string
    sql: ${TABLE}.Donor_State ;;
  }

  dimension: donor_is_teacher {
    type: string
    sql: ${TABLE}.Donor_Is_Teacher ;;
  }

  dimension: donor_zip {
    type: string
    sql: ${TABLE}.Donor_Zip ;;
  }

  set: detail {
    fields: [donor_id, donor_city, donor_state, donor_is_teacher, donor_zip]
  }
}

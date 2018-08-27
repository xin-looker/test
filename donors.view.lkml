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

  dimension: count_by_state {
    type: number
    sql: count(${donor_id}) OVER (PARTITION by ${donor_state}) ;;
  }

  dimension: donor_is_teacher {
    type: yesno
    sql: ${TABLE}.Donor_Is_Teacher ;;
  }

  dimension: donor_state {
    type: string
    sql: ${TABLE}.Donor_State ;;
    link: {
      label: "test"
      url: "https://dcleu.eu.looker.com/looks/57?&f[donors.donor_state]={{ _filters['donors.donor_state'] | url_encode }}&f[donations.donation_included_optional_donation]={{donations.donation_included_optional_donation._value}}"
    }
  }

  dimension: donor_zip {
    type: string
    sql: ${TABLE}.Donor_Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [donor_id]
  }

  dimension: state_filter {
    type: string
    sql: case when ${donor_state} not in ('California', 'New York') then 'Yes'
    when else 'No' end;;
  }

#   dimension: state_boolean {
#     type: yesno
#     sql:  ${donor_state} not in ('California', 'New York');;
#   }

  dimension: state_boolean {
    type: string
  }

   dimension: state_filter2 {
     type: string
     sql: {% if ${state_boolean} == "yes" %}
      ${donor_state}
     {% else %}
     case when ${donor_state} not in ('California', 'New York') then ${donor_state} else null
     {% endif %};;
   }
}

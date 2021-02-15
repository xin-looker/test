connection: "xin"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: donations {
  join: donors {
    type: left_outer
    sql_on: ${donations.donor_id}=${donors.donor_id} ;;
    relationship: many_to_one
  }
}

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

explore: pdtwithparam {
  view_name: donations
  from: donations
  extends: [donations]
  join: pdtwithparam {
    sql_on: ${donations.donation_id}=${pdtwithparam.donations_donation_id} ;;
    relationship: one_to_one
  }
}

explore: test1 {}

explore: test_onpeak {
  join: donorid {
    relationship: one_to_one
    sql_on: ${test_onpeak.donors_donor_id}=${donorid.donor_id};;
  }
}

explore: donorid {}

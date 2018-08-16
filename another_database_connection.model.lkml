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
#   access_filter: {
#     field: project_id
#     user_attribute: id
#   }
#
#   access_filter: {
#     field: project_id
#     user_attribute: test_id_attributes
#   }

  join: donors {
    type: left_outer
    sql_on: ${donations.donor_id}=${donors.donor_id} ;;
    relationship: many_to_one
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "thelook_xin1.model.lkml"
explore: running_total {}

view: running_total {
  derived_table: {
    explore_source: orders {
      column: created_date { field: users.created_date }
      column: created_month { field: users.created_month }
      column: created_quarter { field: users.created_quarter }
      column: created_time { field: users.created_time }
      column: created_week { field: users.created_week }
      column: created_year { field: users.created_year }
      column: id { field: users.id }
      column: count { field: users.count }
#       derived_column: monthly_running_total {
#         sql: running_total(${count}) over (partition by ${created_month} order desc);;
#       }
      expression_custom_filter: ${users.gender}="m";;
    }
  }
  dimension: created_date {
    type: date
  }
  dimension: created_month {
    type: date_month
  }
  dimension: created_quarter {
    type: date_quarter
  }
  dimension: created_time {
    type: date_time
  }
  dimension: created_week {
    type: date_week
  }
  dimension: created_year {
    type: date_year
  }
  dimension: count {
    type: number
  }
  dimension: id {
    type: number
  }
  dimension: monthly_running_total {}
}

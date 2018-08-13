connection: "xin_test"

# include all the views
include: "*.view"

datagroup: test_multiple_database_connetion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# persist_with: test_multiple_database_connetion_default_datagroup



explore: donors {}

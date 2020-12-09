view: calendar_table {
  derived_table: {
    sql: select * from
      (select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) gen_date from
       (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
       (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
       (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
       (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
       (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
      where gen_date between '2018-01-01' and '2024-12-31'
       ;;
  }

  dimension_group: calendar {
    type: time
    sql: ${TABLE}.gen_date ;;
    convert_tz: no
  }

  dimension: calendar_date_string {
    type: string
    sql: ${calendar_date} ;;
    suggest_persist_for: "0 seconds"
  }
}

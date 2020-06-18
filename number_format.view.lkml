explore: manual_data_entry {}

view: manual_data_entry {
  derived_table: {
    sql: select -1 as number
        union
        select 0 as number
        union
        select 1 as number
        union
        select 1000 as number
        union
        select 1000000 as number
        union
        select 1000000000 as number

        ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
#   value_format: "[>=1000000000]#,##0.0,,,"bn";[>=1000000]0.0,,"mn";[>=1000]#,##0;#"
#   value_format: "[>=1000000000]\£#.00,,,\"B\";[>=1000000]\£#.00,,\"M\";[>=1000]\£#.00,\"K\";[<=-1]-\£#.00\"\";\£#.00"
#   value_format:"[>=1000000]“0.00,” M";[<=-1000000]""-0.00," M";[>=1000]"“0.00,” K";"“0.00”"
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$#.00"
  }


  dimension: compare {
    type: number
    sql: ${TABLE}.number ;;
  }

}

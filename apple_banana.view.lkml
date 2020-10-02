explore: fruit {}

view: fruit {
  derived_table: {
    sql:
      SELECT
        100 AS user, 1 AS apple, 1 AS oranges, 1 AS banannas
      UNION ALL
      SELECT
        101 AS user, 0 AS apple, 1 AS oranges, 1 AS banannas
      UNION ALL
      SELECT
        102 AS user, 1 AS apple, 1 AS oranges, 0 AS banannas
      UNION ALL
      SELECT
        103 AS user, 1 AS apple, 0 AS oranges, 0 AS banannas
      UNION ALL
      SELECT
        104 AS user, 1 AS apple, 0 AS oranges, 1 AS banannas
      UNION ALL
      SELECT
        105 AS user, 0 AS apple, 1 AS oranges, 0 AS banannas
      UNION ALL
      SELECT
        106 AS user, 0 AS apple, 0 AS oranges, 0 AS banannas
      UNION ALL
      SELECT
        107 AS user, 1 AS apple, 1 AS oranges, 0 AS banannas
      UNION ALL
      SELECT
        108 AS user, 0 AS apple, 1 AS oranges, 1 AS banannas
      ;;
  }
  dimension: user {
    type: number
    sql: ${TABLE}.user ;;
    primary_key: yes
  }
  dimension: apple {
    type: number
    sql: ${TABLE}.apple ;;
  }
  dimension: oranges {
    type:number
    sql: ${TABLE}.oranges ;;
  }
  dimension: banannas {
    type: number
    sql: ${TABLE}.banannas ;;
  }
  dimension: is_apple {
    type: yesno
    sql: ${apple} = 1 ;;
  }
  dimension: is_orange {
    type: yesno
    sql: ${oranges} = 1 ;;
  }
  dimension: is_banana {
    type: yesno
    sql: ${banannas} = 1 ;;
  }
#   dimension: fruit {
#     type: string
#     sql: CASE  WHEN ${apple} =  1 Then "Apple"
#           WHEN ${banannas} =  1 Then "Banana"
#           WHEN ${oranges} =  1 Then "Orange"
#           END ;;
#   }

dimension: fruit {
  case: {
    when: {
      sql: 1=1 ;;
      label: "number"
    }
  }
}


  measure: count {
    type: count
  }
  measure: number_of_apples {
    type: sum
    sql: ${apple} ;;
  }
  measure: count_user {
    type: number
    sql: select ${user} count(*) from ${fruit.SQL_TABLE_NAME} ;;
  }
  measure: number_of_oranges {
    type: sum
    sql: ${oranges} ;;
  }
  measure: number_of_bananas {
    type: sum
    sql: ${banannas} ;;
  }
  measure: number_of_users {
    type: count_distinct
    sql: ${user} ;;
  }
#   measure: sum_users {
#     type: sum
#     sql: ${number_of_users} ;;
#   }
}

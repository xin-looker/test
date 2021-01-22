view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  filter: order_items_id {
    type: string
  }

  dimension: chinese_english {
    type: string
    sql: '火影忍者3 NARUTO S3' ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: date_add(${TABLE}.returned_at, interval 3 year) ;;
    convert_tz: no
  }

  dimension: date {
    type: string
    sql: ${returned_date} ;;
    suggest_persist_for: "0 seconds"
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
    # value_format: "[>=1000000000]0.0,,\" B\";
    # [>=1000000]0.0,,\" M\";
    # [>=1000]0.0,\" K\";
    # [<=-1000]0.0,\" K\";
    # 0"
    # value_format: "[>=1000000000]0.0,,,\" B\";
    # [>=1000000]0.0,,\" M\";
    # [>=1000]0.0,\" K\""
    html: {% if value >= 1000000 or value <= -1000000 %}
    {{ value | divided_by: 1000000.0 | round: 2 }} M
    {% elsif value >= 1000 or value <= -1000 %}
    {{ value | divided_by: 1000.0 | round: 2 }} K
    {% else %}
    {{ value }}
    {% endif %};;
  }

  dimension: number1 {
    type: number
    sql: '-2010' ;;
    value_format: "[>=1000000000]0.0,,\" B\";
    [>=1000000]0.0,,\" M\";
    [>=1000]0.0,\" K\";
    [>=0]0.0;
    [>=-1000]-0.0;
    -0.0,\" K\""
    # value_format: "0.0,\" K\";-0.0,\" K\""
  }
}

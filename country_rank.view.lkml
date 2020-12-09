explore: country_index_number {}

view: country_index_number {
  derived_table: {
    sql:
      SELECT
      2011 AS year, 'Singapore' AS country, 2 AS index_number
      UNION ALL
      SELECT
      2012 AS year, 'Singapore' AS country, 2 AS index_number
      UNION ALL
      SELECT
      2013 AS year, 'Singapore' AS country, 3 AS index_number
      UNION ALL
      SELECT
      2014 AS year, 'Singapore' AS country, 2 AS index_number
      UNION ALL
      SELECT
      2011 AS year, 'Japan' AS country, 3 AS index_number
      UNION ALL
      SELECT
      2012 AS year, 'Japan' AS country, 4 AS index_number
      UNION ALL
      SELECT
      2013 AS year, 'Japan' AS country, 2 AS index_number
      UNION ALL
      SELECT
      2014 AS year, 'Japan' AS country, 1 AS index_number
      UNION ALL
      SELECT
      2011 AS year, 'Sweden' AS country, 4 AS index_number
      UNION ALL
      SELECT
      2012 AS year, 'Sweden' AS country, 3 AS index_number
      UNION ALL
      SELECT
      2013 AS year, 'Sweden' AS country, 4 AS index_number
      UNION ALL
      SELECT
      2014 AS year, 'Sweden' AS country, 4 AS index_number
      UNION ALL
      SELECT
      2011 AS year, 'Switzerland' AS country, 1 AS index_number
      UNION ALL
      SELECT
      2012 AS year, 'Switzerland' AS country, 1 AS index_number
      UNION ALL
      SELECT
      2013 AS year, 'Switzerland' AS country, 1 AS index_number
      UNION ALL
      SELECT
      2014 AS year, 'Switzerland' AS country, 3 AS index_number

      ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: index_number {
    type: number
    sql: ${TABLE}.index_number ;;
  }

  measure: country_measure {
    type: string
    sql: ${country} ;;
    html: {% if value =='Japan' %}
    <img src='https://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/64/Japan-Flag-icon.png'></img>
    {% elsif value =='Singapore' %}
    <img src='https://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/64/Singapore-Flag-icon.png'></img>
    {% elsif value == 'Sweden' %}
    <img src='https://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/64/Sweden-Flag-icon.png'></img>
    {% else %}
    <img src='https://icons.iconarchive.com/icons/hopstarter/flag-borderless/64/Austria-icon.png'></img>
    {% endif %};;
  }

  measure: count {
    type: count
  }
}

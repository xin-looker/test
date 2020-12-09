- dashboard: i__looker
  title: i__looker
  layout: newspaper
  preferred_viewer: dashboards
  load_configuration: wait
  query_timezone: query_saved
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="alert alert-info vis">


      <p>hllo</p>


      </div>
    row: 0
    col: 17
    width: 7
    height: 6
  - title: faceted filter
    name: faceted filter
    model: thelook_xin1
    explore: order_items_calendar_vieww
    type: table
    fields: [calendar_table.calendar_date, order_items.id, orders.created_date, order_items.returned_date]
    filters: {}
    sorts: [calendar_table.calendar_date desc]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      order items id: order_items.id
      calendar date: calendar_table.calendar_date_string
    row: 0
    col: 0
    width: 8
    height: 6
  - name: merge result tile
    title: merge result tile
    merged_queries:
    - model: thelook_xin1
      explore: order_items_calendar_vieww
      type: table
      fields: [calendar_table.calendar_date, order_items.id, orders.created_date,
        order_items.returned_date]
      filters:
        order_items.id: ''
      sorts: [calendar_table.calendar_date desc]
      limit: 500
      column_limit: 50
      query_timezone: UTC
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
    - model: thelook_xin1
      explore: order_items
      type: table
      fields: [order_items.id, order_items.sale_price]
      limit: 500
      query_timezone: UTC
      join_fields:
      - field_name: order_items.id
        source_field_name: order_items.id
    type: table
    listen:
    - order items id: order_items.id
      calendar date: calendar_table.calendar_date_string
    - order items id: order_items.id
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: order items id
    title: order items id
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    model: thelook_xin1
    explore: order_items_calendar_vieww
    listens_to_filters: []
    field: order_items.id
  - name: calendar date
    title: calendar date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook_xin1
    explore: order_items_calendar_vieww
    listens_to_filters: [order items id]
    field: calendar_table.calendar_date_string

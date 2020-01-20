- dashboard: sort_by_table_calc_issue_lookml_dashboard
  title: sort by table calc issue lookml dashboard
  layout: newspaper
  elements:
  - name: New Tile (copy)
    title: New Tile (copy)
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.count, user.last_name]
      sorts: [history.count desc]
      limit: 500
      query_timezone: UTC
    - model: thelook_xin1
      explore: users
      type: table
      fields: [users.count, users.last_name]
      sorts: [users.count desc]
      limit: 500
      query_timezone: UTC
      join_fields:
      - field_name: users.last_name
        source_field_name: user.last_name
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      history.count:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [count, users, nothing]
    sorts: [nothing desc]
    dynamic_fields: [{table_calculation: nothing, label: nothing, expression: 'coalesce(${users.count},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 0
    col: 8
    width: 8
    height: 6
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.created_month, history.count]
      fill_fields: [history.created_month]
      sorts: [history.count asc]
      limit: 500
      query_timezone: UTC
    - model: thelook_xin1
      explore: users
      type: table
      fields: [users.created_month, users.count]
      fill_fields: [users.created_month]
      filters:
        users.created_month: 5 months
      sorts: [users.count desc]
      limit: 500
      dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'coalesce(${users.count},0)',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number, is_disabled: true}]
      query_timezone: UTC
      join_fields:
      - field_name: users.created_month
        source_field_name: history.created_month
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      history.count:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [count, users, nothing]
    sorts: [nothing asc]
    dynamic_fields: [{table_calculation: nothing, label: nothing, expression: 'if(${users.count}>500,
          "A", if(${users.count}>450, "B", if(${users.count}>400, "C", "D")))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: string}]
    row: 0
    col: 0
    width: 8
    height: 6

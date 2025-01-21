# The name of this view in Looker is "Comparison Table per State Usa Soy"
view: comparison_table_per_state_usa_soy {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `satyield-algo.SatYield_Test_database.comparison_table_per_state_usa_soy` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Predicted Area" in Explore.

  dimension: predicted_area {
    type: number
    description: "x1000"
    sql: ${TABLE}.`predicted_area` ;;
  }

  dimension: predicted_production {
    type: number
    sql: ${TABLE}.`predicted_production` ;;
  }

  dimension: predicted_yield {
    type: number
    sql: ${TABLE}.`predicted_yield` ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: prediction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`prediction_date` ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.`state` ;;
  }

  dimension: true_area {
    type: number
    description: "x1000"
    sql: ${TABLE}.`true_area` ;;
  }

  dimension: true_production {
    type: number
    description: "x1000"
    sql: ${TABLE}.`true_production` ;;
  }

  dimension: true_yield {
    type: number
    sql: ${TABLE}.`true_yield` ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.`year` ;;
  }

  dimension: yield_error {
    type: number
    description: "In %"
    sql: ${TABLE}.`yield_error` ;;
  }
  measure: count {
    type: count
  }
}

# The name of this view in Looker is "Brazil Soy"
view: brazil_soy {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_kiryl.brazil_soy` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Predicted Area" in Explore.

  dimension: predicted_area {
    type: number
    sql: ${TABLE}.`Predicted Area` ;;
  }

  dimension: predicted_production {
    type: number
    sql: ${TABLE}.`Predicted Production` ;;
  }

  dimension: predicted_yield {
    type: number
    sql: ${TABLE}.`Predicted Yield` ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: prediction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`Prediction Date` ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: true_area {
    type: number
    sql: ${TABLE}.`True Area` ;;
  }

  dimension: true_production {
    type: number
    sql: ${TABLE}.`True Production` ;;
  }

  dimension: true_yield {
    type: number
    sql: ${TABLE}.`True Yield` ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.Year ;;
  }

  dimension: yield_error {
    type: number
    sql: ${TABLE}.`Yield Error` ;;
  }
  measure: count {
    type: count
  }
}

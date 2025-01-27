view: summary_table {
  sql_table_name: `white-vortex-448513-e6.test_kiryl.summary_table` ;;

  dimension: crop_type {
    type: string
    sql: ${TABLE}.`Crop Type` ;;
  }
  dimension: predicted_area {
    type: number
    description: "x1000"
    sql: ${TABLE}.`Predicted Area` ;;
  }
  dimension: predicted_production {
    type: number
    description: "x1000"
    sql: ${TABLE}.`Predicted Production` ;;
  }
  dimension: predicted_yield {
    type: number
    sql: ${TABLE}.`Predicted Yield` ;;
  }
  dimension_group: prediction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`Prediction Date` ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: true_area {
    type: number
    description: "x1000"
    sql: ${TABLE}.`True Area` ;;
  }
  dimension: true_production {
    type: number
    description: "x1000"
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
    description: "%"
    sql: ${TABLE}.`Yield Error` ;;
  }
  measure: count {
    type: count
  }
  measure: total_true_area {
    type: sum
    sql: ${true_area} ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the total sum of true_area."
  }
  measure: total_predicted_area {
    type: sum
    sql: ${predicted_area} ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the total sum of predicted_area."
  }
  measure: total_true_yield {
    type: sum
    sql: ${true_yield} ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the total sum of true_yield."
  }
  measure: total_predicted_yield {
    type: sum
    sql: ${predicted_yield} ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the total sum of predicted_yield."
  }
  measure: weighted_average_yield {
    type: number
    sql: SUM(${true_area} * ${true_yield}) / SUM(${true_area}) ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the weighted average yield using true_area and true_yield."
  }
  measure: weighted_average_yield_predicted {
    type: number
    sql: SUM(${predicted_area} * ${predicted_yield}) / SUM(${predicted_area}) ;;
    value_format: "#,##0.00" # Optional: Format to two decimal places
    description: "Calculates the weighted average yield using predicted_area and predicted_yield."
  }
  dimension: crop_type_custom {
    type: string
    sql:
      CASE
      WHEN ${crop_type} = 'Corn' THEN '🌽 Corn'
      ELSE '🫘 Soy'
      END ;;
    label: "Crop Type Custom"}}

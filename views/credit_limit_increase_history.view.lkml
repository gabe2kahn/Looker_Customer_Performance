view: credit_limit_increase_history {
  sql_table_name: "CUSTOMER"."CREDIT_LIMIT_INCREASE_HISTORY" ;;

  dimension_group: cl_change {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CL_CHANGE_DATE" ;;
  }
  dimension: cl_change_order {
    type: number
    sql: ${TABLE}."CL_CHANGE_ORDER" ;;
  }
  dimension: cl_change_recency {
    type: number
    sql: ${TABLE}."CL_CHANGE_RECENCY" ;;
  }
  dimension: credit_limit_increase {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_INCREASE" ;;
  }
  dimension: galileo_payment_reference_number {
    type: string
    sql: ${TABLE}."GALILEO_PAYMENT_REFERENCE_NUMBER" ;;
  }
  dimension: new_credit_limit {
    type: number
    sql: ${TABLE}."NEW_CREDIT_LIMIT" ;;
  }
  dimension: original_credit_limit {
    type: number
    sql: ${TABLE}."ORIGINAL_CREDIT_LIMIT" ;;
  }

  dimension: primary_key {
    type: string
    sql: ${user_id}||${cl_change_date} ;;
  }

  dimension: time_since_cl_increase {
    type: number
    sql: DATEDIFF(DAYS,CASE WHEN ${cl_change_recency} = 1 THEN ${cl_change_date} END,${snapshot_pt.snap_date}) ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: average_time_since_last_cl_increase {
    type: average
    sql: ${time_since_cl_increase} ;;
    value_format_name: decimal_1
  }
}

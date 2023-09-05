view: account_closures {
  sql_table_name: "CUSTOMER"."ACCOUNT_CLOSURES" ;;

  dimension_group: account_closed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_CLOSED_DATE" ;;
  }
  dimension_group: account_open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_OPEN_DATE" ;;
  }
  dimension: close_reason {
    type: string
    sql: ${TABLE}."CLOSE_REASON" ;;
  }
  dimension: closed_credit_limit {
    type: number
    sql: ${TABLE}."CLOSED_CREDIT_LIMIT" ;;
  }
  dimension: starting_credit_limit {
    type: number
    sql: ${TABLE}."STARTING_CREDIT_LIMIT" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: closures {
    type: count_distinct
    sql: ${user_id} ;;
  }
}

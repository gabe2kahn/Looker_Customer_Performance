view: late_payment_responses {
  sql_table_name: "PRODUCT"."CUSTOMER_COMMUNICATIONS"."LATE_PAYMENT_RESPONSES" ;;

  dimension: current_days_overdue {
    type: number
    sql: ${TABLE}."CURRENT_DAYS_OVERDUE" ;;
  }

  dimension: current_level {
    type: string
    sql: ${TABLE}."CURRENT_LEVEL" ;;
  }

  dimension: currently_overdue_ind {
    type: yesno
    sql: ${TABLE}."CURRENTLY_OVERDUE_IND" ;;
  }

  dimension: days_overdue_at_time_of_response {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE_AT_TIME_OF_RESPONSE" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: level_at_time_of_response {
    type: string
    sql: ${TABLE}."LEVEL_AT_TIME_OF_RESPONSE" ;;
  }

  dimension_group: received {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RECEIVED_DATE" ;;
  }

  dimension: response_text {
    type: string
    sql: ${TABLE}."RESPONSE_TEXT" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${received_raw} ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: late_payment_responses {
    type: string
    sql: listagg(trim(response_text::string),' AND ALSO ') WITHIN GROUP (ORDER BY received_date DESC) ;;
  }
}

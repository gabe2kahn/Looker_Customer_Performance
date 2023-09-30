view: payments {
  sql_table_name: "CUSTOMER"."PAYMENTS" ;;
  drill_fields: [payment_id]

  dimension: payment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."PAYMENT_ID" ;;
  }

  dimension: auto_payment_schedule_id {
    type: string
    sql: ${TABLE}."AUTO_PAYMENT_SCHEDULE_ID" ;;
  }

  dimension: autopay_or_manual {
    type: string
    sql: ${TABLE}."AUTOPAY_OR_MANUAL" ;;
  }

  dimension: card_id {
    type: string
    sql: ${TABLE}."CARD_ID" ;;
  }

  dimension_group: last_status_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_STATUS_UPDATE_TS" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension_group: next_payment_due_dt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NEXT_PAYMENT_DUE_DT" ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}."PAYMENT_AMOUNT" ;;
  }

  dimension: payment_hold_days {
    type: number
    sql: ${TABLE}."PAYMENT_HOLD_DAYS" ;;
  }

  dimension_group: payment_initiated_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."PAYMENT_INITIATED_TS"  ;;
  }

  dimension: payment_order {
    type: number
    sql: ${TABLE}."PAYMENT_ORDER" ;;
  }

  dimension: payment_order_by_status {
    type: number
    sql: ${TABLE}."PAYMENT_ORDER_BY_STATUS" ;;
  }

  dimension_group: payment_posted_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."PAYMENT_POSTED_TS" ;;
  }

  dimension: payment_recency {
    type: number
    sql: ${TABLE}."PAYMENT_RECENCY" ;;
  }

  dimension: payment_scheduled_amount {
    type: number
    sql: ${TABLE}."PAYMENT_SCHEDULED_AMOUNT" ;;
  }

  dimension_group: payment_scheduled_at_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."PAYMENT_SCHEDULED_AT_TS" ;;
  }

  dimension_group: payment_scheduled_for_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."PAYMENT_SCHEDULED_FOR_TS" ;;
  }

  dimension: payment_source_id {
    type: number
    sql: ${TABLE}."PAYMENT_SOURCE_ID" ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}."PAYMENT_STATUS" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."PAYMENT_TYPE" ;;
  }

  dimension: processor {
    type: string
    sql: ${TABLE}."PROCESSOR" ;;
  }

  dimension: processor_payment_id {
    type: string
    sql: ${TABLE}."PROCESSOR_PAYMENT_ID" ;;
  }

  dimension_group: statement_end_dt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STATEMENT_END_DT" ;;
  }

  dimension: statement_index {
    type: number
    sql: ${TABLE}."STATEMENT_INDEX" ;;
  }

  dimension_group: statement_start_dt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STATEMENT_START_DT" ;;
  }

  dimension: statment_balance {
    type: number
    sql: ${TABLE}."STATMENT_BALANCE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: successful_payment_amount {
    type: sum
    sql: CASE WHEN ${payment_status} = 'succeeded' THEN ${payment_amount} END;;
  }

  measure: average_daily_payment_volume {
    type: number
    sql: ${successful_payment_amount}/${user_profile.total_account_age} ;;
  }

  measure: pending_payment_amount {
    type: sum
    sql: CASE WHEN ${payment_status} = 'pending' THEN ${payment_amount} ;;
  }

  measure: most_recent_successful_payment {
    type: max
    sql: CASE WHEN ${payment_status} = 'succeeded' THEN ${payment_initiated_ts_date} ;;
  }

  measure: most_recent_failed_payment {
    type: max
    sql: CASE WHEN ${payment_status} = 'failed' THEN ${payment_initiated_ts_date} ;;
  }

}

view: customer_streaks {
  sql_table_name: "PRODUCT"."LEARNING_SYSTEM"."CUSTOMER_STREAKS" ;;

  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }
  dimension: payment_due_date {
    type: string
    sql: ${TABLE}."PAYMENT_DUE_DATE" ;;
  }
  dimension_group: statement_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STATEMENT_END_DATE" ;;
  }
  dimension: statement_id {
    type: string
    sql: ${TABLE}."STATEMENT_ID" ;;
  }
  dimension: statement_min_pay {
    type: number
    sql: ${TABLE}."STATEMENT_MIN_PAY" ;;
  }
  dimension: statement_number {
    type: number
    sql: ${TABLE}."STATEMENT_NUMBER" ;;
  }
  dimension_group: streak_completed_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."STREAK_COMPLETED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: streak_created_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."STREAK_CREATED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: streak_failed_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."STREAK_FAILED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: streak_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."STREAK_ID" ;;
  }
  dimension_group: streak_last_updated_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."STREAK_LAST_UPDATED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: streak_number {
    type: number
    sql: ${TABLE}."STREAK_NUMBER" ;;
  }
  dimension: streak_number_order {
    type: number
    sql: ${TABLE}."STREAK_NUMBER_ORDER" ;;
  }
  dimension: streak_reward {
    type: number
    sql: ${TABLE}."STREAK_REWARD" ;;
  }
  dimension: streak_reward_given_ind {
    type: yesno
    sql: ${TABLE}."STREAK_REWARD_GIVEN_IND" ;;
  }
  dimension: streak_reward_version {
    type: number
    sql: ${TABLE}."STREAK_REWARD_VERSION" ;;
  }
  dimension: streak_sequence_recency {
    type: number
    sql: ${TABLE}."STREAK_SEQUENCE_RECENCY" ;;
  }
  dimension: streak_status {
    type: string
    sql: ${TABLE}."STREAK_STATUS" ;;
  }
  dimension: successful_payments_to_streak {
    type: string
    sql: ${TABLE}."SUCCESSFUL_PAYMENTS_TO_STREAK" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }
}

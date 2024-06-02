view: adjustment {
  sql_table_name: "CUSTOMER"."ADJUSTMENT" ;;

  dimension: act_type {
    type: string
    sql: ${TABLE}."ACT_TYPE" ;;
  }
  dimension: adjustment_amount {
    type: number
    sql: ${TABLE}."ADJUSTMENT_AMOUNT" ;;
  }
  dimension: adjustment_order {
    type: number
    sql: ${TABLE}."ADJUSTMENT_ORDER" ;;
  }
  dimension: adjustment_recency {
    type: number
    sql: ${TABLE}."ADJUSTMENT_RECENCY" ;;
  }
  dimension: auth_id {
    type: number
    sql: ${TABLE}."AUTH_ID" ;;
  }
  dimension_group: auth_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."AUTH_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: auth_type {
    type: string
    sql: ${TABLE}."AUTH_TYPE" ;;
  }
  dimension: description_memo {
    type: string
    sql: ${TABLE}."DESCRIPTION_MEMO" ;;
  }
  dimension: galileo_account_number {
    type: string
    sql: ${TABLE}."GALILEO_ACCOUNT_NUMBER" ;;
  }
  dimension: galileo_card_id {
    type: string
    sql: ${TABLE}."GALILEO_CARD_ID" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension_group: modified_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."MODIFIED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: open_to_buy {
    type: number
    sql: ${TABLE}."OPEN_TO_BUY" ;;
  }
  dimension: payment_reference_number {
    type: string
    sql: ${TABLE}."PAYMENT_REFERENCE_NUMBER" ;;
  }

  dimension: postgres_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."POSTGRES_ID" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }
  dimension: program_id {
    type: string
    sql: ${TABLE}."PROGRAM_ID" ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
  }
  dimension: transaction_type_detailed {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE_DETAILED" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: membership_fee_revenue {
    type: sum
    sql: CASE WHEN ${transaction_type} IN ('3426','0203') THEN ${adjustment_amount} END ;;
    value_format_name: usd
  }

  measure: late_fee_revenue {
    type: sum
    sql: CASE WHEN ${transaction_type} IN ('0001') THEN ${adjustment_amount} END ;;
    value_format_name: usd
  }

  measure: interest_revenue {
    type: sum
    sql: CASE WHEN ${transaction_type} IN ('IT') THEN ${adjustment_amount} END ;;
    value_format_name: usd
  }

}

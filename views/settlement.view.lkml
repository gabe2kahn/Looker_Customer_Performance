view: settlement {
  sql_table_name: "CUSTOMER"."SETTLEMENT" ;;

  dimension: act_type {
    type: string
    sql: ${TABLE}."ACT_TYPE" ;;
  }
  dimension: auth_id {
    type: string
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
  dimension: expired_auth_id {
    type: string
    sql: ${TABLE}."EXPIRED_AUTH_ID" ;;
  }
  dimension: galileo_account_number {
    type: string
    sql: ${TABLE}."GALILEO_ACCOUNT_NUMBER" ;;
  }
  dimension: galileo_card_id {
    type: string
    sql: ${TABLE}."GALILEO_CARD_ID" ;;
  }
  dimension: high_risk_mcc_ind {
    type: string
    sql: ${TABLE}."HIGH_RISK_MCC_IND" ;;
  }
  dimension: high_risk_merchant_type {
    type: string
    sql: ${TABLE}."HIGH_RISK_MERCHANT_TYPE" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: local_currency {
    type: number
    sql: ${TABLE}."LOCAL_CURRENCY" ;;
  }
  dimension: local_currency_amount {
    type: number
    sql: ${TABLE}."LOCAL_CURRENCY_AMOUNT" ;;
  }
  dimension: mcc_description {
    type: string
    sql: ${TABLE}."MCC_DESCRIPTION" ;;
  }
  dimension: merchant_category_code {
    type: number
    sql: ${TABLE}."MERCHANT_CATEGORY_CODE" ;;
  }
  dimension: merchant_location {
    type: string
    sql: ${TABLE}."MERCHANT_LOCATION" ;;
  }
  dimension: merchant_name {
    type: string
    sql: ${TABLE}."MERCHANT_NAME" ;;
  }
  dimension: merchant_number {
    type: string
    sql: ${TABLE}."MERCHANT_NUMBER" ;;
  }
  dimension_group: modified_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."MODIFIED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: network {
    type: string
    sql: ${TABLE}."NETWORK" ;;
  }
  dimension: network_interchange_fee {
    type: number
    sql: ${TABLE}."NETWORK_INTERCHANGE_FEE" ;;
  }
  dimension: open_to_buy {
    type: number
    sql: ${TABLE}."OPEN_TO_BUY" ;;
  }
  dimension: original_auth_id {
    type: string
    sql: ${TABLE}."ORIGINAL_AUTH_ID" ;;
  }
  dimension: outstanding_balance {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE" ;;
  }
  dimension: payment_reference_number {
    type: string
    sql: ${TABLE}."PAYMENT_REFERENCE_NUMBER" ;;
  }
  dimension_group: post {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."POST_DATE" ;;
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
  dimension: purchase_order {
    type: number
    sql: ${TABLE}."PURCHASE_ORDER" ;;
  }
  dimension: purchase_recency {
    type: number
    sql: ${TABLE}."PURCHASE_RECENCY" ;;
  }
  dimension: settle_detail_id {
    type: string
    sql: ${TABLE}."SETTLE_DETAIL_ID" ;;
  }
  dimension: settlement_amount {
    type: number
    sql: ${TABLE}."SETTLEMENT_AMOUNT" ;;
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
  measure: interchange {
    type: sum
    sql: ${settlement_amount}*.017 ;;
  }
}

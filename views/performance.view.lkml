view: performance {
  sql_table_name: "CUSTOMER"."PERFORMANCE" ;;

  dimension: available_credit {
    type: number
    sql: ${TABLE}."AVAILABLE_CREDIT" ;;
  }
  dimension: charged_off_account {
    type: number
    sql: ${TABLE}."CHARGED_OFF_ACCOUNT" ;;
  }
  dimension: closed_account {
    type: number
    sql: ${TABLE}."CLOSED_ACCOUNT" ;;
  }
  dimension: credit_limit_charged_off {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_CHARGED_OFF" ;;
  }
  dimension: credit_limit_closed {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_CLOSED" ;;
  }
  dimension: credit_limit_open {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_OPEN" ;;
  }
  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }
  dimension: fees_charged {
    type: number
    sql: ${TABLE}."FEES_CHARGED" ;;
  }
  dimension: gaco {
    type: number
    sql: ${TABLE}."GACO" ;;
  }
  dimension: guco {
    type: number
    sql: ${TABLE}."GUCO" ;;
  }
  dimension: interchange_amount {
    type: number
    sql: ${TABLE}."INTERCHANGE_AMOUNT" ;;
  }
  dimension: interchange_cost {
    type: number
    sql: ${TABLE}."INTERCHANGE_COST" ;;
  }
  dimension: interest_charged {
    type: number
    sql: ${TABLE}."INTEREST_CHARGED" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: net_purchase_volume {
    type: number
    sql: ${TABLE}."NET_PURCHASE_VOLUME" ;;
  }
  dimension: open_account {
    type: number
    sql: ${TABLE}."OPEN_ACCOUNT" ;;
  }
  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }
  dimension: prev_statement_balance {
    type: number
    sql: ${TABLE}."PREV_STATEMENT_BALANCE" ;;
  }
  dimension: prev_statement_fees_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_FEES_PAID" ;;
  }
  dimension: prev_statement_interest_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_INTEREST_PAID" ;;
  }
  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }
  dimension: statement_number {
    type: number
    sql: ${TABLE}."STATEMENT_NUMBER" ;;
  }

  dimension: statement_month {
    type: number
    sql: ${TABLE}."STATEMENT_MONTH" ;;
  }

  dimension: statement_recency {
    type: number
    sql: ${TABLE}."STATEMENT_RECENCY" ;;
  }
  dimension_group: stmt_end_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STMT_END_DATE" ;;
  }
  dimension: total_purchase_amount {
    type: number
    sql: ${TABLE}."TOTAL_PURCHASE_AMOUNT" ;;
  }
  dimension: total_refund_amount {
    type: number
    sql: ${TABLE}."TOTAL_REFUND_AMOUNT" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: count {
    type: count
  }
}

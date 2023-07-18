view: statements {
  sql_table_name: "CUSTOMER"."STATEMENTS" ;;
  drill_fields: [peach_statement_id]

  dimension: peach_statement_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."PEACH_STATEMENT_ID" ;;
  }
  dimension_group: account_open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_OPEN_DATE" ;;
  }

  dimension: account_status {
    type: string
    sql: CASE
      WHEN ${statement_balance} = 0 THEN 'Zero Balance'
      WHEN ${overdue_amount} > 0 THEN 'Overdue'
      WHEN ${minimum_amount_due} = 0 THEN 'No Balance Due'
      WHEN ${successful_payment_amount_to_statement} >= ${minimum_amount_due} THEN 'Minimum Payment Met'
      WHEN ${pending_payment_amount_to_statement} >= ${minimum_amount_due} THEN 'Minimum Payment Met - Pending'
      WHEN ${successful_payment_amount_to_statement} < ${minimum_amount_due} THEN 'Minimum Payment Unmet'
    END;;
  }


  dimension: adjustment_volume {
    type: number
    sql: ${TABLE}."ADJUSTMENT_VOLUME" ;;
  }
  dimension: apr {
    type: string
    sql: ${TABLE}."APR" ;;
  }
  dimension: available_credit {
    type: number
    sql: ${TABLE}."AVAILABLE_CREDIT" ;;
  }
  dimension: credit_limit {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT" ;;
  }
  dimension: credit_volume {
    type: number
    sql: ${TABLE}."CREDIT_VOLUME" ;;
  }
  dimension: days_in_billing_cycle {
    type: number
    sql: ${TABLE}."DAYS_IN_BILLING_CYCLE" ;;
  }
  dimension: fees_charged {
    type: number
    sql: ${TABLE}."FEES_CHARGED" ;;
  }
  dimension: fulfilled_amount {
    type: number
    sql: ${TABLE}."FULFILLED_AMOUNT" ;;
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
  dimension: minimum_amount_due {
    type: number
    sql: ${TABLE}."MINIMUM_AMOUNT_DUE" ;;
  }
  dimension: overdue_amount {
    type: number
    sql: ${TABLE}."OVERDUE_AMOUNT" ;;
  }
  dimension_group: payment_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."PAYMENT_DUE_DATE" ;;
  }
  dimension: payment_volume {
    type: number
    sql: ${TABLE}."PAYMENT_VOLUME" ;;
  }
  dimension: peach_loan_id {
    type: number
    sql: ${TABLE}."PEACH_LOAN_ID" ;;
  }

  dimension: pending_payment_amount_to_statement {
    type: number
    sql: ${TABLE}."PENDING_PAYMENT_AMOUNT_TO_STATEMENT" ;;
    value_format_name: usd
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
  dimension: prev_statement_principal_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_PRINCIPAL_PAID" ;;
  }
  dimension: prev_statement_total_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_TOTAL_PAID" ;;
  }
  dimension: principal_balance {
    type: number
    sql: ${TABLE}."PRINCIPAL_BALANCE" ;;
  }
  dimension: purchase_volume {
    type: number
    sql: ${TABLE}."PURCHASE_VOLUME" ;;
  }
  dimension: refund_volume {
    type: number
    sql: ${TABLE}."REFUND_VOLUME" ;;
  }
  dimension: remaining_amount {
    type: number
    sql: ${TABLE}."REMAINING_AMOUNT" ;;
  }
  dimension: returned_payment_volume {
    type: number
    sql: ${TABLE}."RETURNED_PAYMENT_VOLUME" ;;
  }
  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }
  dimension_group: statement_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."STATEMENT_CREATION_TS" ;;
  }

  dimension: statement_number {
    type: number
    sql: ${TABLE}."STATEMENT_NUMBER" ;;
  }

  dimension: statement_recency {
    type: number
    sql: ${TABLE}."STATEMENT_RECENCY" ;;
  }

  dimension_group: statement_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."STATEMENT_UPDATE_TS" ;;
  }
  dimension: statement_version {
    type: number
    sql: ${TABLE}."STATEMENT_VERSION" ;;
  }

  dimension: successful_payment_amount_to_statement {
    type: number
    sql: ${TABLE}."SUCCESSFUL_PAYMENT_AMOUNT_TO_STATEMENT" ;;
    value_format_name: usd
  }

  dimension_group: stmt_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STMT_END_DATE" ;;
  }
  dimension_group: stmt_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STMT_START_DATE" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }
}

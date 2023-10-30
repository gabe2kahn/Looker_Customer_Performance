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
      WHEN ${statement_balance} = 0 THEN 'a. Zero Balance'
      WHEN ${overdue_amount} > 0 THEN 'b. Overdue'
      WHEN ${minimum_amount_due} = 0 THEN 'c. No Balance Due'
      WHEN ${successful_payment_amount_to_statement} >= ${minimum_amount_due} THEN 'd. Minimum Payment Met'
      WHEN ${pending_payment_amount_to_statement} >= ${minimum_amount_due} THEN 'e. Minimum Payment Met - Pending'
      WHEN ${scheduled_payment_amount_to_statement} >= ${minimum_amount_due} THEN 'f. Minimum Payment Met - Scheduled'
      WHEN ${autopay_enabled_ind} = 'Enabled' THEN 'g. Autopay On'
      WHEN ${successful_payment_amount_to_statement} < ${minimum_amount_due} THEN 'h. Minimum Payment Unmet'
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

  dimension: autopay_enabled_ind {
    type: string
    sql: ${TABLE}."AUTOPAY_ENABLED_IND" ;;
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

  dimension: scheduled_payment_amount_to_statement {
    type: number
    sql: ${TABLE}."SCHEDULED_PAYMENT_AMOUNT_TO_STATEMENT" ;;
    value_format_name: usd
  }

  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }

  dimension: statement_balance_zero_ind {
    type: yesno
    sql: ${statement_balance} = 0 ;;
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
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: average_purchase_volume {
    type: average
    sql: ${purchase_volume} ;;
    value_format_name: usd
  }

  measure: average_credit_limit {
    type: average
    sql: ${credit_limit} ;;
    value_format_name: usd
  }

  measure: average_purchase_volume_utilization {
    type: number
    sql: ${average_purchase_volume}/${average_credit_limit} ;;
    value_format_name: percent_1
  }

  measure: users_with_autopay_enabled {
    type: count_distinct
    sql: CASE WHEN ${autopay_enabled_ind} = 'Enabled' THEN ${user_id} END ;;
  }

  measure: autopay_enablement_rate {
    type: number
    sql: ${users_with_autopay_enabled}/${users} ;;
    value_format_name: percent_0
  }

  measure: users_with_non_zero_prev_statement_balance {
    type: count_distinct
    sql: CASE WHEN ${prev_statement_balance} >0 THEN ${user_id} END;;
  }

  measure: users_paying_full_statement_balance {
    type: count_distinct
    sql: CASE WHEN ${prev_statement_total_paid} >= ${prev_statement_balance} THEN ${user_id} END;;
  }

  measure: percent_users_paying_full_statement_balance {
    type: number
    sql: ${users_paying_full_statement_balance} / ${users_with_non_zero_prev_statement_balance};;
    value_format_name: percent_1
  }

}
